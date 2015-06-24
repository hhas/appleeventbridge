//
//  AEBSymbol.h
//
//  Base class for all named symbols
//
//  Note that in addition to type and enum names (typeType, typeEnumerated), property
//  names should also be represented (note: property names should be packed as AEDescs
//  of typeType, not typeProperty, as that's how AppleScript does it and AEB needs to
//  mimic AppleScript's way of working as closely as possible to ensure compatibility
//  with all scriptable apps)
//


#import "AEMUtils.h"


/**********************************************************************/
// base class for all standard and application-defined symbols

@interface AEBSymbol : NSObject <NSCopying, AEMSelfPackingProtocol> {
	NSString *name;
	NSAppleEventDescriptor *desc;
}

+ (instancetype)symbolWithName:(NSString *)name_ type:(DescType)type_ code:(OSType)code_ NS_RETURNS_RETAINED;

//
// note: +symbolWithCode: is automatically called by AEBAppData when unpacking AEDescs of typeType/TypeEnumerated
//
// by default, this returns nil to indicate that no named symbol was found for the given code; subclasses should extend
// as needed to return named symbols for all AE codes that they recognize; e.g. AEBStaticSymbol recognizes standard AEM/AS
// types such as typeUnicodeText and typeList, so construct corresponding AEMStaticSymbol.unicodeText, AEMStaticSymbol.list
// instances; in turn, glue-defined subclasses construct names for
//
+ (instancetype)symbolWithCode:(OSType)code_;

- (instancetype)initWithName: (NSString *)name_ descriptor:(NSAppleEventDescriptor *)desc_;

@property (readonly) NSString *aebName;
@property (readonly) OSType aebCode;

@end

