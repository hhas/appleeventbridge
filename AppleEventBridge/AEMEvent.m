//
//  AEMEvent.m
//

#import "AEMEvent.h"
#import "AEMApplication.h"

#import "NSAppleEventDescriptor+AEDescExtensions.h"
#import "NSAppleEventDescriptor+AEDescMoreExtensions.h"


/**********************************************************************/
// Attribute keys

typedef struct {
	char *name;
	OSType code;
}  AEMEventAttributeDef;


// All known Apple event attributes:
static AEMEventAttributeDef AttributeKeys[] = {
    // AEDataModel.h
	{"EventClass       ", keyEventClassAttr},
	{"EventID          ", keyEventIDAttr},
    
	{"TransactionID    ", keyTransactionIDAttr},
	{"ReturnID         ", keyReturnIDAttr},
	{"Address          ", keyAddressAttr},
	{"OptionalKeyword  ", keyOptionalKeywordAttr},
	{"Timeout          ", keyTimeoutAttr},
	{"InteractLevel    ", keyInteractLevelAttr},
	{"EventSource      ", keyEventSourceAttr},
    {"MissedKeyword    ", keyMissedKeywordAttr},
	{"OriginalAddress  ", keyOriginalAddressAttr},
	{"AcceptTimeout    ", keyAcceptTimeoutAttr},
    {"ReplyRequested   ", keyReplyRequestedAttr},
    
    // security
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1060
    {"SenderEUID                              ", keySenderEUIDAttr},
    {"SenderEGID                              ", keySenderEGIDAttr},
    {"SenderUID                               ", keySenderUIDAttr},
    {"SenderGID                               ", keySenderGIDAttr},
    {"SenderPID                               ", keySenderPIDAttr},
    {"SenderAuditToken                        ", keySenderAuditTokenAttr},
#endif
#if __MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
    {"SenderApplescriptEntitlements           ", keySenderApplescriptEntitlementsAttr},
    {"SenderApplicationIdentifierEntitlement  ", keySenderApplicationIdentifierEntitlementAttr},
    {"SenderApplicationSandboxed              ", keySenderApplicationSandboxed},
    {"ActualSenderAuditToken                  ", keyActualSenderAuditToken},
#endif
    
    // additional
	{"Considerations   ", enumConsiderations},
	{"ConsidsAndIgnores", enumConsidsAndIgnores},
	{"Subject          ", keySubjectAttr},
	{"ReplyPort        ", keyReplyPortAttr},
	{NULL, 0}
};


static NSString *kAEMReplyPortDescriptor = @"kAEMReplyPortDescriptor";


/**********************************************************************/


@implementation AEMReplyPortDescriptor

-(instancetype)initWithMachPort:(mach_port_t)port_ {
    self = [super init];
    if (!self) return self;
    port = port_;
    return self;
}

-(void)dealloc {
    mach_port_destroy(mach_task_self(), port);
}

@end


/**********************************************************************/


@implementation AEMEvent

@synthesize descriptor;

/*
 * Note: new AEMEvent instances are constructed by AEMApplication objects; 
 * clients shouldn't instantiate this class directly.
 */
- (instancetype)initWithApplication:(AEMApplication *)appObj_ event:(NSAppleEventDescriptor *)event_ codecs:(id)codecs_ {
	self = [super init];
	if (!self) return self;
    appObj = appObj_;
	descriptor = event_;
	codecs = codecs_;
	resultFormat = kAEMUnpackAsItem;
	resultType = typeWildCard;
	return self;
}

- (NSString *)description {
	NSAppleEventDescriptor *desc;
	NSMutableString *result = [NSMutableString stringWithString: @"<AEMEvent {"];
	int i = 0;
	while (AttributeKeys[i].name != NULL) {
		desc = [descriptor attributeDescriptorForKeyword: AttributeKeys[i].code];
		if (desc) {
			[result appendFormat: @"\n    %s = %@;", AttributeKeys[i].name,
                                                     [[AEMCodecs defaultCodecs] unpack: desc error: nil] ?: desc];
		}
		i += 1;
	} 
	[result appendString: @"\n}, "];
	desc = [descriptor coerceToDescriptorType: typeAERecord];
	if (!desc) return nil;
	[result appendFormat: @"%@>", [[AEMCodecs defaultCodecs] unpack: desc error: nil] ?: desc];
	return [result copy];
}

// Access codecs object

- (id <AEMCodecsProtocol>)codecs {
	return codecs;
}

// Pack event's attributes and parameters, if any.

- (instancetype)setAttribute:(id)value forKeyword:(AEKeyword)key error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
	if (!value) {
        if (error) *error = AEMErrorWithInfo(errAEWrongDataType, [NSString stringWithFormat:
                                                                  @"'%@' attribute can't be nil.", AEMFormatOSType(key)]);
        return nil;
	}
    NSAppleEventDescriptor *desc = [codecs pack: value error: error];
    if (!desc) return nil; // TO DO: error message should include attribute's key
    [descriptor setAttributeDescriptor: desc forKeyword: key];
    return self;
}

- (instancetype)setParameter:(id)value forKeyword:(AEKeyword)key error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
	if (!value) {
        if (error) *error = AEMErrorWithInfo(errAEWrongDataType, [NSString stringWithFormat:
                                                                  @"'%@' parameter can't be nil.", AEMFormatOSType(key)]);
        return nil;
	}
    NSAppleEventDescriptor *desc = [codecs pack: value error: error];
    if (!desc) return nil; // TO DO: error message should include parameter's key
    [descriptor setParamDescriptor: desc forKeyword: key];
    return self;
}

// shortcuts for above

- (instancetype)setAttribute:(id)value forKeyword:(AEKeyword)key {
    return [self setAttribute: value forKeyword: key error: nil];
}

- (instancetype)setParameter:(id)value forKeyword:(AEKeyword)key {
    return [self setParameter: value forKeyword: key error: nil];
}

// Get attributes and parameters:

- (id)attributeForKeyword:(AEKeyword)key type:(DescType)type error:(NSError * __autoreleasing *)error {
	if (error) *error = nil;
    NSAppleEventDescriptor *desc = [descriptor attributeDescriptorForKeyword: key];
	if (!desc) {
        if (error) *error = AEMErrorWithInfo(errAEDescNotFound, [NSString stringWithFormat:
                                                                 @"'%@' attribute not found.", AEMFormatOSType(key)]);
		return nil;
	}
    desc = [desc coerceToDescriptorType: type];
    if (!desc) {
        if (error) *error = AEMErrorWithInfo(errAECoercionFail, [NSString stringWithFormat: @"Can't coerce '%@' attribute to type '%@'.",
                                                                 AEMFormatOSType(key), AEMFormatOSType(type)]);
		return nil;
	}
	return [codecs unpack: desc error: error]; // TO DO: error message should include parameter's key
}

- (id)parameterForKeyword:(AEKeyword)key type:(DescType)type error:(NSError * __autoreleasing *)error {
	if (error) *error = nil;
	NSAppleEventDescriptor *desc = [descriptor paramDescriptorForKeyword: key];
	if (!desc) {
        if (error) *error = AEMErrorWithInfo(errAEDescNotFound, [NSString stringWithFormat:
                                                                 @"'%@' parameter not found.", AEMFormatOSType(key)]);
		return nil;
	}
    desc = [desc coerceToDescriptorType: type];
    if (!desc) {
        if (error) *error = AEMErrorWithInfo(errAECoercionFail, [NSString stringWithFormat: @"Can't coerce '%@' parameter to type '%@'.",
                                                                 AEMFormatOSType(key), AEMFormatOSType(type)]);
		return nil;
	}
	return [codecs unpack: desc error: error]; // TO DO: error message should include parameter's key

}

// shortcuts for above

- (id)attributeForKeyword:(AEKeyword)key {
	return [self attributeForKeyword: key type: typeWildCard error: nil];
}

- (id)parameterForKeyword:(AEKeyword)key {
	return [self parameterForKeyword: key type: typeWildCard error: nil];
}

// Specify if return value should be unpacked and as what type

- (void)setUnpackFormat:(AEMUnpackFormat)format_ type:(DescType)type_ {
	resultFormat = format_;
	resultType = type_;
}

- (void)getUnpackFormat:(AEMUnpackFormat *)format_ type:(DescType *)type_ {
	*format_ = resultFormat;
	*type_ = resultType;
}


/*
 * Send event.
 *
 * (-send and -sendWithError: are convenience shortcuts for -sendWithOptions:timeout:error:)
 *
 * (Note: a single event can be sent multiple times if desired.) // TO DO: check this is correct (i.e. what about returnID?)
 *
 * (Note: if an Apple Event Manager/application error occurs, these methods will return nil.
 * Clients should test for this, and use the error argument to retrieve additional error information
 * if needed.
 */

- (id)sendWithOptions:(AESendMode)sendMode timeout:(NSTimeInterval)timeoutInSeconds error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *result;
	NSString *errorDescription;
	if (error) *error = nil;
    OSStatus errorNumber = noErr;
    // if sending event on non-main thread, specify Mach port on which to receive reply
    if (!NSThread.isMainThread && sendMode & kAEWaitReply) {
        NSMutableDictionary *threadInfo = NSThread.currentThread.threadDictionary;
        AEMReplyPortDescriptor *replyPortDescriptor = threadInfo[kAEMReplyPortDescriptor];
        if (!replyPortDescriptor) { // allocate a Mach port to receive reply events on this thread
            mach_port_t replyPort = MACH_PORT_NULL;
            errorNumber = (OSStatus)mach_port_allocate(mach_task_self(), MACH_PORT_RIGHT_RECEIVE, &replyPort);
            if (errorNumber) {
                if (error) {
                    *error = [NSError errorWithDomain: kAEMErrorDomain code: errorNumber
                                             userInfo: @{NSLocalizedDescriptionKey: @"Failed to allocate Mach port.",
                                                         kAEMErrorNumberKey: @(errorNumber),
                                                         kAEMErrorFailedEvent: self}];
                }
                return nil;
            }
            replyPortDescriptor = [[AEMReplyPortDescriptor alloc] initWithMachPort: replyPort];
            threadInfo[kAEMReplyPortDescriptor] = replyPortDescriptor;
        }
        [descriptor setAttributeDescriptor: replyPortDescriptor forKeyword: keyReplyPortAttr];
    }
    // send event
    NSError *sendError = nil;
    NSAppleEventDescriptor *replyData = [descriptor sendEventWithOptions: sendMode timeout: timeoutInSeconds error: &sendError];
	// check for an Apple Event Manager error
    if (!replyData) {
		// ignore 'invalid connection' errors caused by application quitting normally after being sent a quit event
		if (sendError.code == connectionInvalid
            && [descriptor attributeDescriptorForKeyword: keyEventClassAttr].typeCodeValue == kCoreEventClass
            && [descriptor attributeDescriptorForKeyword: keyEventIDAttr].typeCodeValue == kAEQuitApplication) goto noResult;
		// for any other Apple Event Manager errors, generate an NSError if one is requested, then return nil
		if (error) {
			errorDescription = [NSString stringWithFormat: @"Apple Event Manager error: %@ (%li)", 
                                                           AEMDescriptionForError((OSStatus)sendError.code), (long)sendError.code];
			*error = [NSError errorWithDomain: kAEMErrorDomain code: sendError.code
                                     userInfo: @{NSLocalizedDescriptionKey: errorDescription,
                                                 kAEMErrorNumberKey: @(sendError.code),
                                                 kAEMErrorFailedEvent: self}];
		}
		return nil;
	}
	// extract reply data, if any
	if (replyData.descriptorType == typeNull) goto noResult; // application didn't return anything
	/*
	 * Check for an application error
	 *
	 *	Note: Apple spec says that both keyErrorNumber and keyErrorString parameters should be checked to determine if an 
	 *	error occurred; however, AppleScript only checks keyErrorNumber so we copy its behaviour for compatibility.
	 *	
	 *	Note: some apps (e.g. Finder) may return noErr on success, so ignore that too.
	 */
	errorNumber = [[replyData paramDescriptorForKeyword: keyErrorNumber] int32Value];
    
    // TO DO:
    // if e.errornumber == -1708 and self._code == b'ascrnoop':
	//			return # 'launch' events always return 'not handled' errors; just ignore these

    
	if (errorNumber) {
		// if an application error occurred, generate an NSError if one is requested, then return nil
		if (error) {
			NSString *errorString = [[replyData paramDescriptorForKeyword: keyErrorString] stringValue];
			if (errorString) {
				errorDescription = [NSString stringWithFormat: @"Application error: %@ (%i)", errorString, errorNumber];
			} else {
				errorDescription = [NSString stringWithFormat: @"Application error: %@ (%i)", 
																AEMDescriptionForError(errorNumber), errorNumber];
			}
            NSMutableDictionary *errorInfo = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                              errorDescription, NSLocalizedDescriptionKey,
                                              @(errorNumber),   kAEMErrorNumberKey,
                                              self,             kAEMErrorFailedEvent,
                                              nil];
            NSAppleEventDescriptor *errorMessage, *errorObject, *errorType;
			if (errorString) [errorInfo setValue: errorString forKey: kAEMErrorStringKey];
			if ((errorMessage = [replyData paramDescriptorForKeyword: kOSAErrorBriefMessage])) {
				[errorInfo setValue: [errorMessage stringValue] forKey: kAEMErrorBriefMessageKey];
            }
			if ((errorObject = [replyData paramDescriptorForKeyword: kOSAErrorOffendingObject])) { // TO DO: check this works now (unpacking was a problem)
				[errorInfo setValue: ([codecs unpack: errorObject error: nil] ?: errorObject) forKey: kAEMErrorOffendingObjectKey];
            }
			if ((errorType = [replyData paramDescriptorForKeyword: kOSAErrorExpectedType])) {
				[errorInfo setValue: ([codecs unpack: errorType error: nil] ?: errorType) forKey: kAEMErrorExpectedTypeKey];
            }
			*error = [NSError errorWithDomain: kAEMErrorDomain code: errorNumber userInfo: errorInfo];
		}
		return nil;
	}
	/*
	 * Check for an application result, returning NSNull instance if none was given
	 */
	result = [replyData paramDescriptorForKeyword: keyAEResult];
	if (!result) goto noResult;
	/*
	 * If client invoked -setUnpackFormat:type: with kAEMDontUnpack format, return the descriptor as-is
	 */
	if (resultFormat == kAEMDontUnpack) return result;
	/*
	 * Unpack result, performing any coercions specified via -setUnpackFormat:type: before unpacking the descriptor
	 */
	if (resultFormat == kAEMUnpackAsList) {
		if ([result descriptorType] != typeAEList) result = [result coerceToDescriptorType: typeAEList];
		if (resultType != typeWildCard) {
			NSMutableArray *resultList = [NSMutableArray array];
			NSInteger length = [result numberOfItems];
			for (NSInteger i = 1; i <= length; i++) {
				NSAppleEventDescriptor *item = [result descriptorAtIndex: i];
				if (resultType != typeWildCard && [item descriptorType] != resultType) {
					NSAppleEventDescriptor *originalItem = item;
					item = [item coerceToDescriptorType: resultType];
					if (!item) { // a coercion error occurred
						if (error) {
							errorDescription = [NSString stringWithFormat: @"Couldn't coerce item %li of returned list to type '%@': %@", 
																			(long)i, AEMFormatOSType(resultType), result];
							NSAppleEventDescriptor *expectedType = [NSAppleEventDescriptor descriptorWithTypeCode: resultType];
							*error = [NSError errorWithDomain: kAEMErrorDomain code: errAECoercionFail
                                                     userInfo: @{kAEMErrorExpectedTypeKey: expectedType,
                                                                 kAEMErrorOffendingObjectKey: originalItem,
                                                                 NSLocalizedDescriptionKey: errorDescription,
                                                                 kAEMErrorNumberKey: @(errorNumber),
                                                                 kAEMErrorFailedEvent: self}];
						}
						return nil;
					}
				}
                id itemObj = [codecs unpack: item error: error];
                if (!itemObj) return nil;
				[resultList addObject: itemObj];
			}
			return resultList;
		}
	} else if (resultType != typeWildCard && [result descriptorType] != resultType) {
		NSAppleEventDescriptor *originalResult = result;
		result = [result coerceToDescriptorType: resultType];
		if (!result) { // a coercion error occurred
			if (error) {
				errorDescription = [NSString stringWithFormat: @"Couldn't coerce returned item to type '%@': %@", 
																AEMFormatOSType(resultType), originalResult];
                NSAppleEventDescriptor *expectedType = [NSAppleEventDescriptor descriptorWithTypeCode: resultType];
				*error = [NSError errorWithDomain: kAEMErrorDomain code: errAECoercionFail
                                         userInfo: @{kAEMErrorExpectedTypeKey: expectedType,
                                                     kAEMErrorOffendingObjectKey: originalResult,
                                                     NSLocalizedDescriptionKey: errorDescription,
                                                     kAEMErrorNumberKey: @(errorNumber),
                                                     kAEMErrorFailedEvent: self}];
			}
			return nil;
		}
	}
	return [codecs unpack: result error: error];
noResult:
    return resultFormat == kAEMUnpackAsList ? [codecs unpack: [NSAppleEventDescriptor listDescriptor] error: error] : NSNull.null;
}

- (id)sendWithError:(NSError * __autoreleasing *)error {
	return [self sendWithOptions: kAEWaitReply timeout: kAEDefaultTimeout error: error];
}

- (id)send {
	return [self sendWithOptions: kAEWaitReply timeout: kAEDefaultTimeout error: nil];
}

@end
