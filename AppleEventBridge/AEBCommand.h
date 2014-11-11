//
//  AEBCommand.h
//
//  Base class for AEBStaticCommand base class used in static ObjC glues.
//
//  May also be used by dynamicbridge-based libraries as superclass to
//  their own equivalent, as it provides most of the logic required to
//  pack AEs in the same way as AppleScript. (AEMEvent only packs AEs;
//  it doesn't emulate the various quirks in how AppleScript does it.)
//

#import "AEMEvent.h"
#import "AEMUtils.h"

#import "AEBAppData.h"


// used internally
#define kAEBNoDirectParameter ((void *)-1)


/**********************************************************************/
// Command base



@interface AEBCommand : NSObject {
	AEMEvent *aemEvent;
    AEEventClass eventClass;
	AEEventID eventID;
	id directParameter, parentQuery; // packing is deferred
    AESendMode sendMode;
	long timeoutInTicks;
	UInt32 considsAndIgnoresFlags;
	NSError *commandError;
}

- (instancetype)initWithAppData:(AEBAppData *)appData
                     eventClass:(AEEventClass)eventClass_
                        eventID:(AEEventID)eventID_
                    parentQuery:(id)parentQuery_; // TO DO: shouldn't this be (AEMQuery*)?


// add a parameter (always use this, not -[AEMEvent setParameter:forKeyword:], when packing parameters to ensure that direct parameter and subject attribute are packed in same way as AppleScript for better application compatibility); any errors will be reported when -sendWithError: is called

-(void)setParameter:(id)value forKeyword:(DescType)key;

// get underlying AEMEvent instance
//
// Caution: subclasses should avoid directly accessing AEMEvent instance in aemEvent ivar
// (unless they really know what they're doing). Intead, use methods provided by AEBCommand
// itself, as these know how to emulate the various quirks that AppleScript has.
// 
- (AEMEvent *)AEMEvent; // TO DO: update glue generator to reserve 'AEM' and 'AEB' prefixes

// set attributes

/*
 * Set considering/ignoring attributes.
 *
 * kAECaseConsiderMask = 0x00000001
 * kAEDiacriticConsiderMask = 0x00000002
 * kAEWhiteSpaceConsiderMask = 0x00000004
 * kAEHyphensConsiderMask = 0x00000008
 * kAEExpansionConsiderMask = 0x00000010
 * kAEPunctuationConsiderMask = 0x00000020
 * kASNumericStringsConsiderMask = 0x00000080
 * 
 * kAECaseIgnoreMask = 0x00010000
 * kAEDiacriticIgnoreMask = 0x00020000
 * kAEWhiteSpaceIgnoreMask = 0x00040000
 * kAEHyphensIgnoreMask = 0x00080000
 * kAEExpansionIgnoreMask = 0x00100000
 * kAEPunctuationIgnoreMask = 0x00200000
 * kASNumericStringsIgnoreMask = 0x00800000
 */
- (instancetype)considering:(UInt32)consideringFlags_;

/* Set send mode flags.
 *	kAENoReply = 0x00000001,
 *	kAEQueueReply = 0x00000002,
 *	kAEWaitReply = 0x00000003,
 *	kAEDontReconnect = 0x00000080,
 *	kAEWantReceipt = 0x00000200,
 *	kAENeverInteract = 0x00000010,
 *	kAECanInteract = 0x00000020,
 *	kAEAlwaysInteract = 0x00000030,
 *	kAECanSwitchLayer = 0x00000040,
 *	kAEDontRecord = 0x00001000,
 *	kAEDontExecute = 0x00002000,
 *	kAEProcessNonReplyEvents = 0x00008000
 *
 * Default is kAEWaitReply | kAECanSwitchLayer
 */
- (instancetype)sendMode:(AESendMode)flags;

/*
 * Shortcut for setting kAEWaitReply send mode flag:
 */
- (instancetype)waitForReply;

/*
 * Shortcut for setting kAENoReply send mode flag:
 */
- (instancetype)ignoreReply;

/*
 * Shortcut for setting kAEQueueReply send mode flag:
 */
- (instancetype)queueReply;

/*
 * Specify timeout in seconds.
 *
 * Note: don't use kAEDefaultTimeout/kNoTimeOut constants in -timeout: as those only
 * work where ticks are being used; use -defaultTimeout/-noTimeout methods instead.
 */
- (instancetype)timeout:(long)timeout_;

- (instancetype)defaultTimeout;

- (instancetype)noTimeout;

/*
 * Specify the desired type for the return value. Where the application's event
 * handler supports this, it will attempt to coerce the event's result to this
 * type before returning it. May be a standard AE type (e.g. AEBSymbol.alias)
 * or, occasionally, an application-defined type.
 *
 * Note that most applications don't support this, and those that do usually
 * only support it for 'get' events (e.g. Finder).
 */
- (instancetype)requestedType:(DescType)type;

/*
 * Specify the AE type that the returned AEDesc must be coerced to before unpacking.
 * Whereas the -requestedType: method adds a kAERequestedType parameter to the outgoing
 * event, this coercion is performed locally by the -sendWithError: method using a
 * built-in or user-installed AE coercion handler if one is available. Note that if
 * the coercion fails, -sendWithError: will return nil and the associated NSError's
 * error code will be -1700 (errAECoercionFail).
 *
 * If the specified type is typeWildCard (the default), no coercion is performed.
 */
- (instancetype)returnType:(DescType)type;

/*
 * Shortcut for [cmd returnType: typeAEList].
 */
- (instancetype)returnList;

/*
 * Similar to -returnType:, except that the returned AEDesc is first coerced to
 * to typeAEList; each list item is then coerced to the specified type.
 */
- (instancetype)returnListOfType:(DescType)type;

/*
 * Invoke -returnDescriptor to have -sendWithError: return the returned AEDesc as
 * an NSAppleEventDescriptor without unpacking it.
 *
 */
- (instancetype)returnDescriptor;

// send events


/*
 * Send the event.
 *
 * error
 *    On return, an NSError object that describes an Apple Event Manager or application
 *    error if one has occurred, otherwise nil. Pass nil if not required.
 *
 * Return value
 *
 *    The value returned by the application, or an NSNull instance or equivalent (see
 *    below) if no value was returned, or nil if an error occurred.
 *
 * Notes
 *
 *    A single event can be sent more than once if desired.
 */
- (id)sendWithError:(NSError * __autoreleasing *)error;

/*
 * If the reply event contained neither result nor error, the following method is called.
 * Returns NSNull by default; dynamic glue subclasses may override to return their own
 * language-appropriate equivalent.
 */
- (id)nullResult;

@end

