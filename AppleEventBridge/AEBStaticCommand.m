//
//  AEBStaticCommand.m
//

#import "AEBStaticCommand.h"


/**********************************************************************/


@implementation AEBStaticCommand

+ (instancetype)commandWithAppData:(AEBAppData *)appData
                        eventClass:(AEEventClass)classCode
                           eventID:(AEEventID)code
                   directParameter:(id)directParameter
                       parentQuery:(AEMQuery *)parentQuery {
	AEBStaticCommand *command = [[self.class alloc] initWithAppData: appData
                                                         eventClass: classCode
                                                            eventID: code
                                                        parentQuery: parentQuery];
    if (directParameter != (__bridge id)kAEBNoDirectParameter) {
        [command setParameter: directParameter forKeyword: keyDirectObject];
    }
    return command;
}


- (instancetype)requestedClass:(AEBSymbol *)classConstant {
	[self setParameter: classConstant forKeyword: keyAERequestedType];
	return self;
}

- (instancetype)returnClass:(AEBSymbol *)classConstant {
	return [self returnType: classConstant.aebCode];
}

- (instancetype)returnListOfClass:(AEBSymbol *)classConstant {
	return [self returnListOfType: classConstant.aebCode];
}

// send

- (id)send {
	return [self sendWithError: nil];
}

// display formatting

- (NSString *)aebCommandName {
	return [NSString stringWithFormat: @"<%@%@>",
			AEMFormatOSType([(AEMType *)[self.aemEvent attributeForKeyword: keyEventClassAttr] code]),
			AEMFormatOSType([(AEMType *)[self.aemEvent attributeForKeyword: keyEventIDAttr] code])];
}

- (NSString *)aebParameterNameForCode:(DescType)code {
	return [NSString stringWithFormat: @"<%@>", AEMFormatOSType(code)];
}

- (NSString *)aebFormatObject:(id)obj appData:(id)appData {
	return AEMFormatObject(obj);
}


- (NSString *)description {
	NSString *result;
	// format command target and direct parameter, if any
	id subjectAttr = [self.aemEvent attributeForKeyword: keySubjectAttr];
	id directParam = [self.aemEvent parameterForKeyword: keyDirectObject];
    // TO DO: FIX: 'make' currently gets formatted as:
    //
    // [[[AEMApp make: (null)] new_: [TEConstant document]] ...]
    //
	if (subjectAttr && !([subjectAttr isEqual: AEMApp] || [subjectAttr isEqual: NSNull.null])) {
		result = [NSString stringWithFormat: @"[%@ %@: %@]",
						 					 subjectAttr,
											 [self aebCommandName],
											 [self aebFormatObject: directParam appData: self.aemEvent.codecs]];
	} else if ([directParam isKindOfClass: AEBSpecifier.class]) {
		result = [NSString stringWithFormat: @"[%@ %@]", directParam, [self aebCommandName]];
	} else if (directParam) {
		result = [NSString stringWithFormat: @"[%@ %@: %@]",
											 [self aebFormatObject: AEMApp appData: self.aemEvent.codecs],
											 [self aebCommandName],
											 [self aebFormatObject: directParam appData: self.aemEvent.codecs]];
	} else {
		result = [NSString stringWithFormat: @"[%@ %@]",
											 [self aebFormatObject: AEMApp appData: self.aemEvent.codecs],
											 [self aebCommandName]];
	}
    // format keyword parameters
	NSAppleEventDescriptor *desc = self.aemEvent.descriptor;
	for (int i = 1; i <= [desc numberOfItems]; i++) {
		DescType code = [desc keywordForDescriptorAtIndex: i];
		id value = [self.aemEvent parameterForKeyword: code];
		switch (code) {
			case keyDirectObject:
				continue;
			case keyAERequestedType:
				result = [NSString stringWithFormat: @"[%@requestedClass: %@]", result,
													 [self aebFormatObject: value appData: self.aemEvent.codecs]];
				break;
			default:
				result = [NSString stringWithFormat: @"[%@%@: %@]", result,
													 [self aebParameterNameForCode: code],
													 [self aebFormatObject: value appData: self.aemEvent.codecs]];
		}
	}
	// format attributes
	if (timeoutInSeconds != kAEDefaultTimeout) {
		result = [NSString stringWithFormat: @"[%@ timeout: %f]", result, timeoutInSeconds];
    }
	if (sendMode != (kAEWaitReply | kAECanSwitchLayer)) {
		if ((sendMode & ~(kAEWaitReply | kAEQueueReply | kAENoReply)) == kAECanSwitchLayer) {
			if (sendMode & kAENoReply)    result = [NSString stringWithFormat: @"[%@ ignoreReply]", result];
			if (sendMode & kAEQueueReply) result = [NSString stringWithFormat: @"[%@ queueReply]", result];
		} else {
			result = [NSString stringWithFormat: @"[%@ sendMode: %#08x]", result, sendMode];
        }
	}
	if (considsAndIgnoresFlags != kAECaseIgnoreMask) {
		result = [NSString stringWithFormat: @"[%@ considering: %#08x]", result, considsAndIgnoresFlags];
    }
	// format unpacking options
	AEMUnpackFormat format;
	DescType type;
	[self.aemEvent getUnpackFormat: &format type: &type];
	if (format == kAEMUnpackAsItem && type != typeWildCard) {
        result = [NSString stringWithFormat: @"[%@ returnType: '%@']", result, AEMFormatOSType(type)];
    }
	if (format == kAEMUnpackAsList) {
        if (type == typeWildCard) {
            result = [NSString stringWithFormat: @"[%@ returnList]", result];
        } else {
            result = [NSString stringWithFormat: @"[%@ returnListOfType: '%@']", result, AEMFormatOSType(type)];
        }
	} else if (format == kAEMDontUnpack) {
			result = [NSString stringWithFormat: @"[%@ returnDescriptor]", result];
	}
	return result;
}

@end


/**********************************************************************/


/*
 * improves formatting for getItem.../getList.../setItem...
 */
@implementation AEBGetSetItemCommand

- (NSString *)aebCommandName {
    return ([(AEBSymbol *)[self.aemEvent attributeForKeyword: keyEventIDAttr] aebCode] == kAEGetData) ? @"get" : @"set";
}

- (NSString *)aebParameterNameForCode:(DescType)code {
    return (code == keyAEData) ? @"to" : [super aebParameterNameForCode: code];
}


@end
