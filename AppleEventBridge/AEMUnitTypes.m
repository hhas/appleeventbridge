//
//  AEMUnitTypes.m
//

#import "AEMUnitTypes.h"


/**********************************************************************/
// default unit types

typedef struct {
	CFStringRef name;
	DescType code;
} AEMDefaultUnitTypeDef;


static AEMDefaultUnitTypeDef defaultUnitTypes[] = {
	{CFSTR("centimeters"), 'cmtr'},
	{CFSTR("meters"), 'metr'},
	{CFSTR("kilometers"), 'kmtr'},
	{CFSTR("inches"), 'inch'},
	{CFSTR("feet"), 'feet'},
	{CFSTR("yards"), 'yard'},
	{CFSTR("miles"), 'mile'},
	
	{CFSTR("square meters"), 'sqrm'},
	{CFSTR("square kilometers"), 'sqkm'},
	{CFSTR("square feet"), 'sqft'},
	{CFSTR("square yards"), 'sqyd'},
	{CFSTR("square miles"), 'sqmi'},
	
	{CFSTR("cubic centimeters"), 'ccmt'},
	{CFSTR("cubic meters"), 'cmet'},
	{CFSTR("cubic inches"), 'cuin'},
	{CFSTR("cubic feet"), 'cfet'},
	{CFSTR("cubic yards"), 'cyrd'},
	
	{CFSTR("liters"), 'litr'},
	{CFSTR("quarts"), 'qrts'},
	{CFSTR("gallons"), 'galn'},
	
	{CFSTR("grams"), 'gram'},
	{CFSTR("kilograms"), 'kgrm'},
	{CFSTR("ounces"), 'ozs '},
	{CFSTR("pounds"), 'lbs '},
	
	{CFSTR("degrees Celsius"), 'degc'},
	{CFSTR("degrees Fahrenheit"), 'degf'},
	{CFSTR("degrees Kelvin"), 'degk'},
	{nil, 0}
};


/**********************************************************************/
// Unit type definition

@implementation AEMUnitTypeDefinition

+ (instancetype)definitionWithName:(NSString *)name_ code:(DescType)code_ {
	return [[self.class alloc] initWithName: name_ code: code_];
}

- (instancetype)initWithName:(NSString *)name_ code:(DescType)code_ {
	self = [super init];
	if (!self) return self;
	name = name_;
	code = code_;
	return self;
}


- (NSString *)name {
	return name;
}

- (DescType)code {
	return code;
}

/*
 * The default implementation packs and unpacks the descriptor's data
 * handle as a double. Override these methods to support other formats.
 */
- (NSAppleEventDescriptor *)pack:(AEMUnits *)obj error:(NSError * __autoreleasing *)error {
	double float64 = [obj doubleValue];
	return [NSAppleEventDescriptor descriptorWithDescriptorType: code
														  bytes: &float64
														 length: sizeof(float64)];
}

- (AEMUnits *)unpack:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	double float64;
	[desc.data getBytes: &float64 length: sizeof(float64)];
	return [AEMUnits unitsWithDouble: float64 type: name];
}

@end


/**********************************************************************/

void AEMGetDefaultUnitTypeDefinitions(NSDictionary **definitionsByName,
                                      NSDictionary **definitionsByCode) {
	static NSMutableDictionary *defaultDefinitionsByName, *defaultDefinitionsByCode;
	int i = 0;
	if (!defaultDefinitionsByName) {
		defaultDefinitionsByName = [[NSMutableDictionary alloc] init];
		defaultDefinitionsByCode = [[NSMutableDictionary alloc] init];
		do {
			NSString *name = (__bridge NSString *)defaultUnitTypes[i].name;
			DescType code = defaultUnitTypes[i].code;
			AEMUnitTypeDefinition *definition = [[AEMUnitTypeDefinition alloc] initWithName: name code: code];
			defaultDefinitionsByName[name] = definition;
			defaultDefinitionsByCode[@(code)] = definition;
			i++;
		} while (defaultUnitTypes[i].name);
	}
	*definitionsByName = [NSMutableDictionary dictionaryWithDictionary: defaultDefinitionsByName];
	*definitionsByCode = [NSMutableDictionary dictionaryWithDictionary: defaultDefinitionsByCode];
}

