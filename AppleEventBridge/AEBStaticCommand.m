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
	return [self returnType: classConstant.AEBCode];
}

- (instancetype)returnListOfClass:(AEBSymbol *)classConstant {
	return [self returnListOfType: classConstant.AEBCode];
}

// send

- (id)send {
	return [self sendWithError: nil];
}

// display formatting

- (NSString *)AEBCommandName {
	return [NSString stringWithFormat: @"<%@%@>",
			AEMFormatOSType([(AEMType *)[aemEvent attributeForKeyword: keyEventClassAttr] code]),
			AEMFormatOSType([(AEMType *)[aemEvent attributeForKeyword: keyEventIDAttr] code])];
}

- (NSString *)AEBParameterNameForCode:(DescType)code {
	return [NSString stringWithFormat: @"<%@>", AEMFormatOSType(code)];
}

- (NSString *)AEBFormatObject:(id)obj appData:(id)appData {
	return AEMFormatObject(obj);
}


- (NSString *)description {
	NSString *result;
	// format command target and direct parameter, if any
	id subjectAttr = [aemEvent attributeForKeyword: keySubjectAttr];
	id directParam = [aemEvent parameterForKeyword: keyDirectObject];
    // TO DO: FIX: 'make' currently gets formatted as:
    //
    // [[[AEMApp make: (null)] new_: [TEConstant document]] ...]
    //
	if (subjectAttr && !([subjectAttr isEqual: AEMApp] || [subjectAttr isEqual: NSNull.null])) {
		result = [NSString stringWithFormat: @"[%@ %@: %@]",
						 					 subjectAttr,
											 [self AEBCommandName],
											 [self AEBFormatObject: directParam appData: aemEvent.codecs]];
	} else if ([directParam isKindOfClass: AEBSpecifier.class]) {
		result = [NSString stringWithFormat: @"[%@ %@]", directParam, [self AEBCommandName]];
	} else if (directParam) {
		result = [NSString stringWithFormat: @"[%@ %@: %@]",
											 [self AEBFormatObject: AEMApp appData: aemEvent.codecs],
											 [self AEBCommandName],
											 [self AEBFormatObject: directParam appData: aemEvent.codecs]];
	} else {
		result = [NSString stringWithFormat: @"[%@ %@]",
											 [self AEBFormatObject: AEMApp appData: aemEvent.codecs],
											 [self AEBCommandName]];
	}
    // format keyword parameters
	NSAppleEventDescriptor *desc = aemEvent.descriptor;
	for (int i = 1; i <= [desc numberOfItems]; i++) {
		DescType code = [desc keywordForDescriptorAtIndex: i];
		id value = [aemEvent parameterForKeyword: code];
		switch (code) {
			case keyDirectObject:
				continue;
			case keyAERequestedType:
				result = [NSString stringWithFormat: @"[%@requestedClass: %@]", result,
													 [self AEBFormatObject: value appData: aemEvent.codecs]];
				break;
			default:
				result = [NSString stringWithFormat: @"[%@%@: %@]", result,
													 [self AEBParameterNameForCode: code],
													 [self AEBFormatObject: value appData: aemEvent.codecs]];
		}
	}
	// format attributes
	if (timeoutInTicks != kAEDefaultTimeout) {
		result = [NSString stringWithFormat: @"[%@ timeout: %li]", result, timeoutInTicks / 60];
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
	[aemEvent getUnpackFormat: &format type: &type];
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

- (NSString *)AEBCommandName {
    return ([(AEMType *)[aemEvent attributeForKeyword: keyEventIDAttr] code] == kAEGetData) ? @"get" : @"set";
}

- (NSString *)AEBParameterNameForCode:(DescType)code {
    return (code == keyAEData) ? @"to" : [super AEBParameterNameForCode: code];
}


@end
