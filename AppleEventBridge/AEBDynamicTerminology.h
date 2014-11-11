//
//  AEBDynamicTerminology
//
//  Given an AEBDynamicRawTermsProtocol object that supplies five arrays
//  containing name/code pairs for types, enums, properties, and elements, and
//  name/code+params pairs for commands, recomposes these into lookup tables
//  for use by client bridge when converting 'keywords' and 'specifiers' to and
//  from AEDescs.
//

#import "AEMFormatter.h"
#import "AEMTypes.h"
#import "AEMUtils.h"

#import "AEBDynamicTerm.h"
#import "AEBDefaultTerms.h"


/**********************************************************************/


// Given arrays of type, enum, property, element, and command name-code definitions, recomposes
// these into lookup tables to be used in converting client-bridge's native keyword and object
// specifier representations to and from their AEM equivalents. Tries to mimic AppleScript's
// own behavior when resolving duplicate/overlapping definitions (which are not uncommon in
// non-trivial application dictionaries) to ensureß application compatibility.
@interface AEBDynamicTerminology : NSObject {

	id keywordConverter;
	NSMutableDictionary *keywordCache;
    NSDictionary *defaultTypeByName, *defaultCommandByName;

}

// lookup tables used by language-specific bridges to pack/unpack/format keywords and object specifiers
@property (readonly) NSMutableDictionary *typesByName,        // {NSString: NSAppleEventDescriptor}
                                         *specifiersByName,   // {NSString: AEBDynamicKeywordTerm} // key is property/element/command name
                                         *propertiesByName,   // {NSString: AEBDynamicKeywordTerm} // e.g. AERecord keys
                                         *elementsByName,     // {NSString: AEBDynamicKeywordTerm}
                                         *commandsByName,     // {NSString: AEBDynamicCommandTerm}
                                         *typesByCode,        // {NSNumber(UInt32):  NSString}
                                         *propertiesByCode,   // {NSNumber(UInt32):  NSString}
                                         *elementsByCode,     // {NSNumber(UInt32):  NSString}
                                         *commandsByCode;     // {NSNumber(UInt64): AEBDynamicCommandTerm}

// PUBLIC

- (instancetype)initWithKeywordConverter:(id<AEBDynamicTermNameConverterProtocol>)keywordConverter_
                      defaultTerminology:(id)defaultTerms_; // AEMTrue/AEMFalse/AEBDynamicRawTermsProtocol

/*
 * add data from AEBDynamicAETEParser or equivalent
 */
- (void)addRawTerminology:(id<AEBDynamicRawTermsProtocol>)terms;

@end
