//
//  AEBStaticAppData.m
//

#import "AEBStaticAppData.h"


/**********************************************************************/


@implementation AEBStaticAppData

// TO DO: should this use AEBStaticSymbol, AEBStaticSpecifier as defaults? need to check which superclasses define this method, and maybe push it down to AEBDynamicAppData
- (instancetype)initWithTargetType:(AEBTargetType)type targetData:(id)data {
    [NSException raise: kAEMErrorDomain format: @"Unsupported initializer for AEBStaticAppData"];
    return nil;
}

- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                     launchOptions:(NSWorkspaceLaunchOptions)options
                      relaunchMode:(AEBRelaunchMode)mode
                    specifierClass:(Class)specifierClass_
                       symbolClass:(Class)symbolClass_ {
    self = [super initWithTargetType: type
                          targetData: data
                       launchOptions: options // default is kAEMDefaultLaunchOptions
                        relaunchMode: mode // default is AEBRelaunchLimited
                 aemApplicationClass: AEMApplication.class];
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
	return [[specifierClass alloc] initWithAppData: self aemQuery: [super unpackObjectSpecifier: desc error: error]];
}

- (id)unpackInsertionLoc:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [[specifierClass alloc] initWithAppData: self aemQuery: [super unpackInsertionLoc: desc error: error]];
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

