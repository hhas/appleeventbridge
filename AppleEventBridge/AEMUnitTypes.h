//
//  AEMUnitTypes.h
//
//  Somewhat clunky API for managing standard and third-party unit type
//  (e.g. 3 as meters, 95 as degrees Centigrade) keyword<->code mappings.
//  In practice, almost no apps use these: the built-in UTs don't cover
//  many units such as points and tons, and injecting third-party terms
//  and corresponding coercion handlers is hardly ever done; e.g. see
//  Adobe Unit Types.osax for a rare exception, and even the Adobe apps
//  tend to make their own arrangements, such as using strings to qualify
//  numbers with unit names (c.f. InDesign), e.g. "3m", "10.5pt". Still
//  included here though as one can never be _entirely_ sure there isn't
//  some old, niche, but still important app out there that relies on
//  this sort of thing.
//

#import "AEMTypes.h"
#import "AEMUtils.h"


/**********************************************************************/
// Unit type definition

@interface AEMUnitTypeDefinition : NSObject {
	NSString *name;
	DescType code;
}

+ (instancetype)definitionWithName:(NSString *)name_ code:(DescType)code_;

- (instancetype)initWithName:(NSString *)name_ code:(DescType)code_;

- (NSString *)name;

- (DescType)code;

/*
 * The default implementation packs and unpacks the descriptor's data
 * handle as a double. Override these methods to support other formats.
 */
- (NSAppleEventDescriptor *)pack:(AEMUnits *)obj error:(NSError * __autoreleasing *)error;

- (AEMUnits *)unpack:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error;

@end

/**********************************************************************/
// called by -[AEMCodecs init]

void AEMGetDefaultUnitTypeDefinitions(NSDictionary **definitionsByName,
									  NSDictionary **definitionsByCode);
