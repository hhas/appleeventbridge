//
//  AEMEvent.h
//
//  Mid-level wrapper for packing and sending AppleEvents; instantiated
//  via -[AEMApplication eventWithEventClass:eventID:...] methods,
//

#import "AEMCodecs.h"
#import "AEMFormatter.h"
#import "AEMUtils.h"
#import "NSAppleEventDescriptor+AEDescExtensions.h"


@class AEMApplication;


/**********************************************************************/
// typedefs

typedef enum {
	kAEMDontUnpack,
	kAEMUnpackAsItem,
	kAEMUnpackAsList
} AEMUnpackFormat;


/**********************************************************************/
// Event class
/*
 * Note: clients shouldn't instantiate AEMEvent directly; instead use AEMApplication -eventWith... methods.
 */

@interface AEMEvent : NSObject {
    AEMApplication *appObj;
	id codecs;
	DescType resultType; // type to coerce returned value to before unpacking it
	AEMUnpackFormat resultFormat;
}

/*
 * The NSAppleEventDescriptor instance containing this AppleEvent
 */
@property (retain, readonly) NSAppleEventDescriptor *descriptor; // TO DO: was named `-descriptor`

/*
 * Note: new AEMEvent instances are constructed by AEMApplication objects; 
 * clients shouldn't instantiate this class directly.
 */

- (instancetype)initWithApplication:(AEMApplication *)appObj_ event:(NSAppleEventDescriptor *)descriptor_ codecs:(id)codecs_;

/*
 * Get codecs object used by this AEMEvent instance
 */
 - (id)codecs;

// Pack event's attributes and parameters, if any; returns self if successful or nil if an error occurred.

- (instancetype)setAttribute:(id)value forKeyword:(AEKeyword)key error:(NSError * __autoreleasing *)error;
- (instancetype)setParameter:(id)value forKeyword:(AEKeyword)key error:(NSError * __autoreleasing *)error;

- (instancetype)setAttribute:(id)value forKeyword:(AEKeyword)key;
- (instancetype)setParameter:(id)value forKeyword:(AEKeyword)key;

// Get event's attributes and parameters.

- (id)attributeForKeyword:(AEKeyword)key type:(DescType)type error:(NSError * __autoreleasing *)error;
- (id)parameterForKeyword:(AEKeyword)key type:(DescType)type error:(NSError * __autoreleasing *)error;

- (id)attributeForKeyword:(AEKeyword)key;
- (id)parameterForKeyword:(AEKeyword)key;

/*
 * Specify how the the reply descriptor should be unpacked, as a
 * single item or list of items of specified type, or not at all.
 * (Default format is kAEMUnpackAsItem, default type is typeWildCard)
 */

- (void)setUnpackFormat:(AEMUnpackFormat)format_ type:(DescType)type_;

- (void)getUnpackFormat:(AEMUnpackFormat *)format_ type:(DescType *)type_;

/*
 * Send event.
 
 * Parameters
 *
 * sendMode
 *    kAEWaitReply
 *
 * timeoutInTicks
 *    kAEDefaultTimeout
 *
 * error
 *    On return, an NSError object that describes an Apple Event Manager or application
 *    error if one has occurred, otherwise nil. Pass nil if not required.
 *
 * Return value
 *
 *    The value returned by the application, or an NSNull instance if no value was returned,
 *    or nil if an error occurred.
 *
 * Notes
 *
 *    A single event can be sent more than once if desired.
 *
 */

- (id)sendWithMode:(AESendMode)sendMode timeout:(long)timeoutInTicks error:(NSError * __autoreleasing *)error;

// shortcuts for -sendWithMode:timeout:error:

- (id)sendWithError:(NSError * __autoreleasing *)error;

- (id)send;

@end

