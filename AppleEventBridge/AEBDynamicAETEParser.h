//
//  AEBDynamicAETEParser.h
//
//  Parses AETE resources for keywords, obtaining their names, codes and
//  meaning (type, enumerator, property, element, command, or parameter
//  name). This is not used by AppleEventBridge.framework's own static ObjC
//  glues (which are generated using the bundled aebglue tool), but may be
//  used by other bridges that use its AEMApplication, AEMQuery, AEMEvent,
//  and AEBStaticAppData/AEBDynamicAppData classes to provide the foundation
//  to their own terminology-driven, high-level bridge.
//
//  Note: like AppleScript, any other dictionary information is ignored:
//  it is not used when building AEs the same way that AppleScript does,
//  and is neither accurate nor complete enough to be relied on in any
//  other critical capacity (i.e. AETE/SDEF format is not an IDL and it
//  is unsafe to rely on any application-provided AETE/SDEF data - other
//  than the keyword attributes listed above - as if it was.)
//


#import "AEBDynamicTerminology.h"
#import "AEBDynamicTerm.h"
#import "AEMUtils.h"


/**********************************************************************/


@interface AEBDynamicAETEParser : NSObject<AEBDynamicRawTermsProtocol> {
	char *aeteData;
	unsigned long aeteSize, cursor;
	// terminology tables; order is significant where synonym definitions occur
	NSMutableDictionary *commands;
	NSMutableSet *properties, *elements, *classes, *enumerators;
	// use sets to record previously found definitions, and avoid adding duplicates to lists
	NSMutableSet *foundProperties, *foundElements, *foundClasses, *foundEnumerators;
	// ideally, aetes should define both singular and plural names for each class, but
	// some define only one or the other so we need to fill in any missing ones afterwards
	NSMutableDictionary *classAndElementDefsByCode;
	NSMutableSet *foundClassCodes, *foundElementCodes;
    NSString *errorMessage;
}

// private

- (unsigned short)integer; // read next two bytes as UInt16
- (OSType)word; // read next four bytes as OSType
- (NSString *)name NS_RETURNS_RETAINED; // read next 1-256 bytes as Pascal string

- (BOOL)parseCommand;
- (BOOL)parseClass;
- (BOOL)parseComparison;
- (BOOL)parseEnumeration;
- (BOOL)parseSuite;

// public

// returns YES on success or NO+NSError on failure
- (BOOL)parse:(id)aetes error:(NSError * __autoreleasing *)error;

@end

