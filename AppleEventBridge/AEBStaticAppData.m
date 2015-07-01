//
//  AEBStaticAppData.m
//

#import "AEBStaticAppData.h"


/**********************************************************************/


@implementation AEBStaticAppData

// TO DO: should this use AEBStaticSymbol, AEBStaticSpecifier as defaults?
- (instancetype)initWithTargetType:(AEBTargetType)type targetData:(id)data {
    [NSException raise: kAEMErrorDomain format: @"Unsupported initializer for AEBStaticAppData"];
    return nil;
}

- (instancetype)initWithApplicationClass:(Class)appClass // TO DO: appClass arg is currently unused; suspect it's supposed to be high-level XXApplication class, for use in unpacking application objects (as opposed to AEMApplication.class alternative)
                             symbolClass:(Class)symbolClass_
                          specifierClass:(Class)specifierClass_
                              targetType:(AEBTargetType)type
                              targetData:(id)data {
    //self = [super initWithTargetType: type targetData: data]; // TO DO: currently disabled due to Swift 2.0 runtime bug: -[AEBAppData initWithTargetType:targetData:] throws "fatal error: use of unimplemented initializer" when it tries to call [self initWithApplicationClass:targetType:targetData:relaunchMode:launchOptions:]
    self = [super initWithApplicationClass: AEMApplication.class
                               targetType: type
                               targetData: data
                             relaunchMode: kAEBRelaunchLimited
                            launchOptions: kAEMDefaultLaunchOptions]; // TO DO: temporary workaround for above Swift bug
	if (!self) return self;
	symbolClass = symbolClass_;
	specifierClass = specifierClass_;
	return self;
}


// override pack, various unpack methods

- (id)unpackAERecordKey:(AEKeyword)key error:(NSError * __autoreleasing *)error {
	return [symbolClass aebSymbolForCode: key];
}

- (id)unpackType:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass aebSymbolForCode: [desc typeCodeValue]] ?: [super unpackType: desc error: error];
}

- (id)unpackEnum:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass aebSymbolForCode: [desc enumCodeValue]] ?: [super unpackEnum: desc error: error];
}

- (id)unpackProperty:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass aebSymbolForCode: [desc typeCodeValue]] ?: [super unpackProperty: desc error: error];
}

- (id)unpackKeyword:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass aebSymbolForCode: [desc typeCodeValue]] ?: [super unpackKeyword: desc error: error];
}

- (id)unpackObjectSpecifier:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [specifierClass specifierWithAppData: self aemQuery: [super unpackObjectSpecifier: desc error: error]];
}

- (id)unpackInsertionLoc:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [specifierClass specifierWithAppData: self aemQuery: [super unpackInsertionLoc: desc error: error]];
}


// TO DO: FIX (also rename)
- (id)unpackContainsCompDescriptorWithOperand1:(id)op1 operand2:(id)op2 error:(NSError * __autoreleasing *)error {
	if ([op1 isKindOfClass: AEBSpecifier.class] && [((AEBSpecifier *)op1).aemQuery.root isEqual: AEMIts]) {
		return [op1 contains: op2];
	} else {
		return [super unpackContainsCompDescriptorWithOperand1: op1 operand2: op2 error: error];
    }
}

@end

