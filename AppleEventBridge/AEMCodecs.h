//
//  AEMCodecs.h
//
//  Standard class for packing/unpacking Cocoa and AEMQuery instances;
//  also provides base class for high-level wrappers
//

// TO DO: -[AEMCodecs setApplicationRootDescriptor] could be used in OSA
// to pack AEMSpecifiers as fully qualified typeObjectSpecifier AEDescs;
// however, it isn't thread-safe (another thread using the same AECodecs
// instance at the same time would use the same state)

// TO DO: implement -pack:, -unpack: as convenience shortcuts

#import "AEMSpecifier.h"
#import "AEMTypes.h"
#import "AEMURL.h"
#import "AEMUtils.h"


/**********************************************************************/

// TO DO: figure out where AEMCodecs instances are/might be copied

@interface AEMCodecs : NSObject <AEMCodecsProtocol> {
	id applicationRootDescriptor;
	BOOL disableCache, allowUInt64;
}

+ (instancetype)defaultCodecs;


/**********************************************************************/
// compatibility options

/*
 * When unpacking object specifiers, unlike AppleScript, AEBridge caches
 * the original AEDesc for efficiency, allowing the resulting AEMQuery to
 * be re-packed much more quickly. Occasionally this causes compatibility
 * problems with applications that returned subtly malformed specifiers.
 * To force an AEMCodecs object to fully unpack and repack object specifiers,
 * call its -dontCacheUnpackedSpecifiers method.
 */
- (void)dontCacheUnpackedSpecifiers;

/*
 * For compatibility's sake, AEBridge packs UInt64s greater than 2^62 as
 * doubles, with some potential loss of precision. To pack them as typeUInt64
 * instead, call -allowUInt64.
 */
- (void)allowUInt64;


/**********************************************************************/
// main pack methods

/*
 * Converts a Cocoa object to an NSAppleEventDescriptor.
 * Calls -packUnknown: if object is of an unsupported class.
 */
//- (NSAppleEventDescriptor *)pack:(id)anObject;

- (NSAppleEventDescriptor *)pack:(id)anObject error:(NSError * __autoreleasing *)error;

/*
 * Called by -pack:error: to process a Cocoa object of unsupported class.
 * Default implementation returns nil and NSError; subclasses can
 * override this method to provide alternative behaviours if desired.
 */
- (NSAppleEventDescriptor *)packUnknown:(id)anObject error:(NSError * __autoreleasing *)error;


/**********************************************************************/
/*
 * The following methods will be called by -pack:error: as needed.
 * Subclasses can override the following methods to provide alternative 
 * behaviours if desired, although this is generally unnecessary.
 */
- (NSAppleEventDescriptor *)packArray:(NSArray *)anObject error:(NSError * __autoreleasing *)error;
- (NSAppleEventDescriptor *)packDictionary:(NSDictionary *)anObject error:(NSError * __autoreleasing *)error;

- (void)setApplicationRootDescriptor:(NSAppleEventDescriptor *)desc;
- (NSAppleEventDescriptor *)applicationRootDescriptor;


/**********************************************************************/
// main unpack methods; subclasses can override to process still-unconverted objects

/*
 * Converts an NSAppleEventDescriptor to a Cocoa object.
 * Calls -unpackUnknown: if descriptor is of an unsupported type.
 */
//- (id)unpack:(NSAppleEventDescriptor *)desc;

- (id)unpack:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

/*
 * Called by -unpack: to process an NSAppleEventDescriptor of unsupported type.
 * Default implementation checks to see if the descriptor is a record-type structure
 * and unpacks it as an NSDictionary if it is, otherwise it returns the value as-is.
 * Subclasses can override this method to provide alternative behaviours if desired.
 */
- (id)unpackUnknown:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;


/**********************************************************************/
/*
 * The following methods will be called by -unpack: as needed.
 * Subclasses can override the following methods to provide alternative 
 * behaviours if desired, although this is generally unnecessary.
 */
- (id)unpackAEList:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackAERecord:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackAERecordKey:(AEKeyword)key error:(NSError * __autoreleasing *)error;

- (id)unpackType:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackEnum:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackProperty:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackKeyword:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

- (id)fullyUnpackObjectSpecifier:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackObjectSpecifier:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackInsertionLoc:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

- (id)app;
- (id)con;
- (id)its;
- (id)customRoot:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

- (id)unpackCompDescriptor:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;
- (id)unpackLogicalDescriptor:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

/*
 * Notes:
 *
 * kAEContains is also used to construct 'is in' tests, where test value is first operand
 * and specifier being tested is second operand, so need to make sure first operand is an
 * its-based ref; if not, rearrange accordingly.
 *
 * Since type-checking is involved, this extra hook is provided so that AEBridge's
 * AEBAppData subclasses can override this method to add its own type checking.
 */
- (id)unpackContainsCompDescriptorWithOperand1:(id)op1 operand2:(id)op2 error:(NSError * __autoreleasing *)error;


/**********************************************************************/
/*
 * The following methods are not called by -unpack:, but are provided for benefit of
 * subclasses that wish to unpack AEAddressDescs as application objects. (Note that
 * typeProcessSerialNumber and typeApplSignature are obsolete so unpack methods aren't
 * provided for these types; to maintain compatibility, pass the NSAppleEventDescriptor
 * directly to -[AEMApplication initWithDescriptor:].)
 */

- (NSString *)unpackApplicationBundleID:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

- (NSURL *)unpackApplicationURL:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

- (pid_t)unpackProcessID:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

@end
