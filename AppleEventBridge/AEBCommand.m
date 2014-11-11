//
//  AEBCommand.m
//

#import "AEBCommand.h"


/**********************************************************************/


@implementation AEBCommand


- (instancetype)initWithAppData:(AEBAppData *)appData
                     eventClass:(AEEventClass)eventClass_
                        eventID:(AEEventID)eventID_
                    parentQuery:(id)parentQuery_ {
	self = [super init];
	if (!self) return self;
    eventClass = eventClass_;
    eventID = eventID_;
    directParameter = (__bridge id)kAEBNoDirectParameter;
    parentQuery = parentQuery_;
	sendMode = kAEWaitReply | kAECanSwitchLayer;
	timeoutInTicks = kAEDefaultTimeout;
	considsAndIgnoresFlags = kAECaseIgnoreMask;
	// if -targetWithError: fails, store NSError and return it when -sendWithError: is invoked
    NSError *err = nil;
	id target = [appData targetWithError: &err];
    // If process failed to launch, there's no point creating an AEMEvent instance as we don't have a valid kAEBTargetProcessID for
    // it. However, the error can't be reported immediately as there's no way to pass an NSError back to client code
    // from here. Instead, the NSError is temporarily stored, and will be returned to client when it finally calls
    // -sendWithError:. Until then, any calls to add parameters, set attributes, etc. are effectively ignored, since
    // they all operate on aemEvent, which remains nil.
    commandError = err;
	if (!target) return self;
	// if an application specified by path has quit/restart, its AEAddressDesc is no longer valid;
	// this code will automatically restart it (or not) according to client-specified auto-relaunch policy
	AEBRelaunchMode relaunchPolicy = appData.relaunchMode;
	if (relaunchPolicy != kAEBRelaunchNever && [target targetType] == kAEMTargetFileURL
			&& ![AEMApplication isApplicationRunningWithProcessID: [[target descriptor] int32Value]]) {
		if (relaunchPolicy == kAEBRelaunchAlways || (eventClass_ == kCoreEventClass && eventID_ == kAEOpenApplication)) {
			BOOL success = [target reconnectWithError: &err];
            // As above, if process failed to relaunch, store the NSError and return it on -sendWithError:.
            commandError = err;
			if (!success) return self; 
		}
	}
	// create new AEMEvent instance
	aemEvent = [target eventWithEventClass: eventClass_ eventID: eventID_ returnID: kAutoGenerateReturnID codecs: appData];
    return self;
}


- (NSString *)description {
    return [NSString stringWithFormat: @"<AEBCommand %@>", aemEvent];
}


- (AEMEvent *)AEMEvent {
	return aemEvent;
}


// set parameters

-(void)setParameter:(id)value forKeyword:(DescType)key {
    if (key == keyDirectObject) {
        directParameter = value; // note: this will leak if direct param is added more than once, but callers should never do that as all parameters in an event should have unique keys, so duplicate keys = undefined behavior
    } else if (!commandError) { // note: parameter packing will be skipped if an error has already occurred while constructing this command
        NSError *error = nil;
        if (![aemEvent setParameter: value forKeyword: key error: &error]) {
            commandError = error ?: AEMErrorWithInfo(errAEWrongDataType, @"Failed to pack parameter."); // TO DO: what code for unknown errors?
        }
    }
}

// set attributes

- (instancetype)considering:(UInt32)considsAndIgnoresFlags_ {
	considsAndIgnoresFlags = considsAndIgnoresFlags_;
	return self;
}

- (instancetype)sendMode:(AESendMode)flags {
	sendMode = flags;
	return self;
}

- (instancetype)waitForReply {
	sendMode = (sendMode & ~kAENoReply & ~kAEQueueReply) | kAEWaitReply;
	return self;
}


- (instancetype)ignoreReply {
	sendMode = (sendMode & ~kAEWaitReply & ~kAEQueueReply) | kAENoReply;
	return self;
}

- (instancetype)queueReply {
	sendMode = (sendMode & ~kAENoReply & ~kAEWaitReply) | kAEQueueReply;
	return self;
}

- (instancetype)timeout:(long)timeout_ {
	timeoutInTicks = timeout_ * 60;
	return self;
}

- (instancetype)defaultTimeout {
	timeoutInTicks = kAEDefaultTimeout;
	return self;
}

- (instancetype)noTimeout {
	timeoutInTicks = kNoTimeOut;
	return self;
}

- (instancetype)requestedType:(DescType)type {
    // note: apps may return typeBoolean keyAppHandledCoercion in reply event, indicating this coercion was performed (see AS 1.6 release notes); bridges that combine requestedType: and returnType: into one should probably customize AEMEvent to check for this and skip latter coercion if true
	[aemEvent setParameter: [NSAppleEventDescriptor descriptorWithTypeCode: type] forKeyword: keyAERequestedType];
	return self;
}

- (instancetype)returnType:(DescType)type {
	[aemEvent setUnpackFormat: kAEMUnpackAsItem type: type];
	return self;
}

- (instancetype)returnList {
	[aemEvent setUnpackFormat: kAEMUnpackAsList type: typeWildCard];
	return self;
}

- (instancetype)returnListOfType:(DescType)type {
	[aemEvent setUnpackFormat: kAEMUnpackAsList type: type];
	return self;
}

- (instancetype)returnDescriptor {
	[aemEvent setUnpackFormat: kAEMDontUnpack type: typeWildCard];
	return self;
}

// send

- (id)sendWithError:(NSError * __autoreleasing *)error {
	NSAppleEventDescriptor *considerAndIgnoreDesc, *ignoreListDesc;
	if (error) *error = nil;
    // if a relaunch error occurred back in -init..., it can now be reported via NSError** arg
    // TO DO: any other errors that should be reported here? (e.g. params that failed to pack)
	if (commandError && error) {
		NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary: commandError.userInfo];
		userInfo[kAEMErrorFailedEvent] = self;
		*error = [NSError errorWithDomain: [commandError domain] code: commandError.code userInfo: userInfo];
		return nil;
	}
    // set event's direct parameter (or `at` parameter, if it's `make` command) and/or subject attribute
    BOOL hasParentQuery = ![parentQuery isEqual: AEMApp];
    BOOL hasDirectParam = directParameter != (__bridge id)kAEBNoDirectParameter;
	if (hasDirectParam) { // if the command includes a direct parameter, pack that normally as its direct param
		if (![aemEvent setParameter: directParameter forKeyword: keyDirectObject error: error]) return nil;
	}
    if (hasParentQuery) { // if the command is called on an object specifier, decide what to do with that
        if (eventClass == kAECoreSuite && eventID == kAECreateElement) { // `make` command is a special case
            // it's a `make` command, so check for an existing `at` parameter; if not found, use parent objspec for that
            if (![aemEvent parameterForKeyword: keyAEInsertHere]) {
                // an error presumably means `make` command doesn't already have an `at` param, so use parent objspec for that
                if (![aemEvent setParameter: parentQuery forKeyword: keyAEInsertHere error: error]) return nil;
                if (![aemEvent setAttribute: NSNull.null forKeyword: keySubjectAttr error: error]) return nil;
            } else { // `make` command already has an `at` parameter, so pack parent objspec as subject attribute
                if (![aemEvent setAttribute: parentQuery forKeyword: keySubjectAttr error: error]) return nil;
            }
        } else { // for all other commands, check for an existing direct parameter; if not found, use parent objspec for that
            if (hasDirectParam) {
                if (![aemEvent setAttribute: parentQuery forKeyword: keySubjectAttr error: error]) return nil;
            } else {
                if (![aemEvent setParameter: parentQuery forKeyword: keyDirectObject error: error]) return nil;
                if (![aemEvent setAttribute: NSNull.null forKeyword: keySubjectAttr error: error]) return nil;
            }
        }
    } else { // command is called directly on 'app' (null) object, so pack that null as its subject attribute
		[aemEvent setAttribute: NSNull.null forKeyword: keySubjectAttr];
    }
   
	// pack considering/ignoring attributes
	considerAndIgnoreDesc = [[NSAppleEventDescriptor alloc] initWithDescriptorType: typeUInt32
																			 bytes: &considsAndIgnoresFlags
																			length: sizeof(considsAndIgnoresFlags)];
	[aemEvent setAttribute: considerAndIgnoreDesc forKeyword: enumConsidsAndIgnores];
	if (considsAndIgnoresFlags == kAECaseIgnoreMask) {
        static NSAppleEventDescriptor *defaultIgnore = nil;
        if (!defaultIgnore) {
            defaultIgnore = [NSAppleEventDescriptor listDescriptor];
            [defaultIgnore insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAECase] atIndex: 0];
        }
		[aemEvent setAttribute: defaultIgnore forKeyword: enumConsiderations];
	} else {
		ignoreListDesc = [NSAppleEventDescriptor listDescriptor];
		if (!(considsAndIgnoresFlags & kAECaseConsiderMask)) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAECase] 
									 atIndex: 0];
		}
        if (considsAndIgnoresFlags & kAEDiacriticIgnoreMask) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAEDiacritic] 
									 atIndex: 0];
		}
        if (considsAndIgnoresFlags & kAEWhiteSpaceIgnoreMask) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAEWhiteSpace] 
									 atIndex: 0];
		}
        if (considsAndIgnoresFlags & kAEHyphensIgnoreMask) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAEHyphens] 
									 atIndex: 0];
		}
        if (considsAndIgnoresFlags & kAEExpansionIgnoreMask) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAEExpansion] 
									 atIndex: 0];
		}
        if (considsAndIgnoresFlags & kAEPunctuationIgnoreMask) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kAEPunctuation] 
									 atIndex: 0];
        }
        if (considsAndIgnoresFlags & kASNumericStringsIgnoreMask) {
			[ignoreListDesc insertDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: kASNumericStrings] 
									 atIndex: 0];
        }
		[aemEvent setAttribute: ignoreListDesc forKeyword: enumConsiderations];
	}
	// send event
	NSError *eventError = nil;
	id result = [aemEvent sendWithMode: sendMode timeout: timeoutInTicks error: &eventError];
	if (eventError && error) {
		NSMutableDictionary *userInfo = [NSMutableDictionary dictionaryWithDictionary: eventError.userInfo];
		userInfo[kAEMErrorFailedEvent] = self;
		*error = [NSError errorWithDomain: eventError.domain code: eventError.code userInfo: userInfo];
	}
	return [result isEqual: NSNull.null] ? self.nullResult : result;
}

- (id)nullResult {
    return NSNull.null;
}

@end

