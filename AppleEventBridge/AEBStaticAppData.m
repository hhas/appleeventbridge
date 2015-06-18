//
//  AEBStaticAppData.m
//

#import "AEBStaticAppData.h"


/**********************************************************************/


@implementation AEBStaticAppData

- (instancetype)initWithApplicationClass:(Class)appClass
                             symbolClass:(Class)symbolClass_
                          specifierClass:(Class)specifierClass_
                              targetType:(AEBTargetType)type
                              targetData:(id)data {
    self = [super initWithTargetType: type targetData: data];
	if (!self) return self;
	symbolClass = symbolClass_;
	specifierClass = specifierClass_;
	return self;
}


// override pack, various unpack methods

- (NSAppleEventDescriptor *)pack:(id)object error:(NSError * __autoreleasing *)error {
	if ([object isKindOfClass: AEBSpecifier.class] || [object isKindOfClass: AEBSymbol.class]) { // TO DO: use self-packing protocol
		return [object aebPackSelf: self error: error];
	} else {
		return [super pack: object error: error];
    }
}

- (id)unpackAERecordKey:(AEKeyword)key error:(NSError * __autoreleasing *)error {
	return [symbolClass symbolWithCode: key];
}

- (id)unpackType:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass symbolWithCode: [desc typeCodeValue]] ?: [super unpackType: desc error: error];
}

- (id)unpackEnum:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass symbolWithCode: [desc enumCodeValue]] ?: [super unpackEnum: desc error: error];
}

- (id)unpackProperty:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass symbolWithCode: [desc typeCodeValue]] ?: [super unpackProperty: desc error: error];
}

- (id)unpackKeyword:(NSAppleEventDescriptor *)desc error:(NSError * __autoreleasing *)error {
	return [symbolClass symbolWithCode: [desc typeCodeValue]] ?: [super unpackKeyword: desc error: error];
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

