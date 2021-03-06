//
//  AEMUtils.h
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>


/**********************************************************************/
// NSError constants

extern NSString *const kAEMErrorDomain; // error domain used in all NSErrors returned by AppleEventBridge

/*
 * -sendWithError: will return an NSError containing error code, localized description, and a userInfo dictionary
 * containing kAEMErrorNumberKey (this has the same value as -[NSError code]) and zero or more other keys:
 */

extern NSString *const kAEMErrorNumberKey;			// @"ErrorNumber"; error number returned by Apple Event Manager or application
extern NSString *const kAEMErrorStringKey;			// @"ErrorString"; error string returned by application, if given
extern NSString *const kAEMErrorBriefMessageKey;	// @"ErrorBriefMessage"; brief error string returned by application, if given
extern NSString *const kAEMErrorExpectedTypeKey;	// @"ErrorExpectedType"; AE type responsible for a coercion error (-1700), if given
extern NSString *const kAEMErrorOffendingObjectKey;	// @"ErrorOffendingObject"; value or object specifer responsible for error, if given
extern NSString *const kAEMErrorFailedEvent;		// @"ErrorFailedEvent"; the AEMEvent object that returned the error


NSError *AEMErrorWithInfo(NSInteger code, NSString *message);


/**********************************************************************/
// Convert NSString to four-char code


OSType AEM4CC(NSString * codeStr);


/**********************************************************************/


#define AEMNewRecordOfType(descType) ([[NSAppleEventDescriptor recordDescriptor] coerceToDescriptorType: (descType)])


#define AEMIsDescriptorEqualToObject(desc, obj) ([(obj) isKindOfClass: NSAppleEventDescriptor.class] \
                                                 && ([(desc) descriptorType] == [(obj) descriptorType]) \
                                                 && [[(desc) data] isEqualToData: [(obj) data]])


/**********************************************************************/


@protocol AEMCodecsProtocol <NSObject>

- (NSAppleEventDescriptor *)pack:(id)obj error:(NSError * __autoreleasing *)error;

- (NSAppleEventDescriptor *)applicationRootDescriptor;

- (id)unpack:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

- (id)fullyUnpackObjectSpecifier:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

@end


/**********************************************************************/
// supported by all self-packing objects; called by -[AEMCodecs pack:error:]

@protocol AEMSelfPackingProtocol <NSObject>

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error;

@end

/**********************************************************************/
// supported by all objects that wrap (or are) AEMQuery objects

@class AEMQuery;


@protocol AEMQueryProtocol <NSObject>
@property (readonly) AEMQuery *aemQuery;
@end


/**********************************************************************/

NSString *AEMDescriptionForError(OSStatus err);


void AEMLog(NSString *format, ...); // TEST



