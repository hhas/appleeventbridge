//
//  AEMestSpecifier.m
//

#import "AEMTestClause.h"


/**********************************************************************/
// initialise constants


// comparison tests
static NSAppleEventDescriptor *kEnumGreaterThan,
							  *kEnumGreaterThanEquals,
							  *kEnumEquals,
							  *kEnumLessThan,
							  *kEnumLessThanEquals,
							  *kEnumBeginsWith,
							  *kEnumEndsWith,
							  *kEnumContains;

// logical tests
static NSAppleEventDescriptor *kEnumAND,
							  *kEnumOR,
							  *kEnumNOT;


void AEMInitTestClauseModule(void) {
    #define ENUMERATOR(name) kEnum##name = [NSAppleEventDescriptor descriptorWithEnumCode: (kAE##name)];
	// comparison tests
	ENUMERATOR(GreaterThan);
	ENUMERATOR(GreaterThanEquals);
	ENUMERATOR(Equals);
	ENUMERATOR(LessThan);
	ENUMERATOR(LessThanEquals);
	ENUMERATOR(BeginsWith);
	ENUMERATOR(EndsWith);
	ENUMERATOR(Contains);
	// logical tests
	ENUMERATOR(AND);
	ENUMERATOR(OR);
	ENUMERATOR(NOT);
}


/**********************************************************************/
// Abstract base class for all comparison and logic test classes

@implementation AEMTestClause : AEMQuery

- (AEMQueryRoot *)root {
	return AEMIts; // test specifiers can only be constructed from AEMIts
}

// takes a single test clause or an array of test clauses
// note: currently performs no runtime type checks to ensure arg is/contains
// AEMTestClause instances only
- (AEMANDTest *)AND:(id)remainingOperands { 
	NSMutableArray *allOperands;
	
	allOperands = [NSMutableArray arrayWithObject: self];
	if ([remainingOperands isKindOfClass: NSArray.class]) {
		[allOperands addObjectsFromArray: remainingOperands];
	} else {
		[allOperands addObject: remainingOperands];
    }
	return [[AEMANDTest alloc] initWithOperands: allOperands];
}

// takes a single test clause or an array of test clauses
// note: currently performs no runtime type checks to ensure arg is/contains
// AEMTestClause instances only
- (AEMORTest *)OR:(id)remainingOperands {
	NSMutableArray *allOperands;
	
	allOperands = [NSMutableArray arrayWithObject: self];
	if ([remainingOperands isKindOfClass: NSArray.class]) {
		[allOperands addObjectsFromArray: remainingOperands];
	} else {
		[allOperands addObject: remainingOperands];
	}
    return [[AEMORTest alloc] initWithOperands: allOperands];
}

- (AEMNOTTest *)NOT {
	return [[AEMNOTTest alloc] initWithOperands: @[self]];
}

- (NSString *)formatString { // stub method; subclasses will override
	return nil;
}

- (NSAppleEventDescriptor *)operator { // stub method; subclasses will override
	return nil;
}

@end


/**********************************************************************/
// Comparison tests

// Abstract base class for all comparison test classes
@implementation AEMComparisonTest

- (instancetype)initWithOperand1:(id)operand1_ operand2:(id)operand2_ {
	self = [super init];
	if (!self) return self;
	operand1 = operand1_;
	operand2 = operand2_;
	return self;
}


- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class]) return NO;
	if ([operand1 isKindOfClass: NSAppleEventDescriptor.class]) {
		if (!AEMIsDescriptorEqualToObject(operand1, [object operand1])) return NO;
	} else
		if (![operand1 isEqual: [object operand1]]) return NO;
	if ([operand2 isKindOfClass: NSAppleEventDescriptor.class]) {
		if (!AEMIsDescriptorEqualToObject(operand2, [object operand2])) return NO;
	} else
		if (![operand2 isEqual: [object operand2]]) return NO;
	return YES;
}

- (id)operand1 { // used by isEqual:
	return operand1;
}

- (id)operand2 { // used by isEqual:
	return operand2;
}

- (NSString *)description {
	return [NSString stringWithFormat: self.formatString, AEMFormatObject(operand1), AEMFormatObject(operand2)];
}

- (id)resolveWithObject:(id)object {
	return nil;
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *opDesc1 = [codecs pack: operand1 error: error];
    if (!opDesc1) return nil;
    NSAppleEventDescriptor *opDesc2 = [codecs pack: operand2 error: error];
    if (!opDesc2) return nil;
	NSAppleEventDescriptor *desc = AEMNewRecordOfType(typeCompDescriptor);
	[desc setDescriptor: opDesc1 forKeyword: keyAEObject1];
	[desc setDescriptor: [self operator] forKeyword: keyAECompOperator];
	[desc setDescriptor: opDesc2 forKeyword: keyAEObject2];
	return desc;
}

@end

// comparison tests
// Note: clients should not instantiate these classes directly;
// instead, call the appropriate methods on specifier objects
// of AEMIts-based specifiers

@implementation AEMGreaterThanTest

- (NSString *)formatString {
	return @"[%@ greaterThan: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumGreaterThan;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] greaterThan: operand2];
}

@end


@implementation AEMGreaterOrEqualsTest

- (NSString *)formatString {
	return @"[%@ greaterOrEquals: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumGreaterThanEquals;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] greaterOrEquals: operand2];
}

@end


@implementation AEMEqualsTest

- (NSString *)formatString {
	return @"[%@ equals: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumEquals;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] equals: operand2];
}

@end


@implementation AEMNotEqualsTest

- (NSString *)formatString {
	return @"[%@ notEquals: %@]";
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
	return [[[operand1 equals: operand2] NOT] packWithCodecs: codecs error: error];
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] notEquals: operand2];
}

@end


@implementation AEMLessThanTest

- (NSString *)formatString {
	return @"[%@ lessThan: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumLessThan;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] lessThan: operand2];
}

@end


@implementation AEMLessOrEqualsTest

- (NSString *)formatString {
	return @"[%@ lessOrEquals: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumLessThanEquals;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] lessOrEquals: operand2];
}

@end


@implementation AEMBeginsWithTest

- (NSString *)formatString {
	return @"[%@ beginsWith: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumBeginsWith;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] beginsWith: operand2];
}

@end


@implementation AEMEndsWithTest

- (NSString *)formatString {
	return @"[%@ endsWith: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumEndsWith;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] endsWith: operand2];
}

@end


@implementation AEMContainsTest

- (NSString *)formatString {
	return @"[%@ contains: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumContains;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] contains: operand2];
}

@end


@implementation AEMIsInTest

- (NSString *)formatString {
	return @"[%@ isIn: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumContains;
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *opDesc1 = [codecs pack: operand1 error: error];
    if (!opDesc1) return nil;
    NSAppleEventDescriptor *opDesc2 = [codecs pack: operand2 error: error];
    if (!opDesc2) return nil;
	NSAppleEventDescriptor *desc = AEMNewRecordOfType(typeCompDescriptor);
	[desc setDescriptor: opDesc2 forKeyword: keyAEObject1];
	[desc setDescriptor: self.operator forKeyword: keyAECompOperator];
	[desc setDescriptor: opDesc1 forKeyword: keyAEObject2];
	return desc;
}

- (id)resolveWithObject:(id)object {
	return [[operand1 resolveWithObject: object] isIn: operand2];
}

@end


/**********************************************************************/
// Logical tests

// Abstract base class for all logical test classes
@implementation AEMLogicalTest

- (instancetype)initWithOperands:(NSArray *)operands_ {
	self = [super init];
	if (!self) return self;
	operands = operands_;
	return self;
}


- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class]) return NO;
	// note: this doesn't check for NSAppleEventDescriptor operands on the
	// [reasonable] assumption that all operands are test instances anyway
	return ([operands isEqual: [object operands]]);
}

- (id)operands {
	return operands;
}

- (NSString *)description {
	NSRange range = {1, [operands count] - 1};
	id operand1 = operands[0];
	id otherOperands = ([operands count] == 2) ? operands[1] : [operands subarrayWithRange: range];
	return [NSString stringWithFormat: self.formatString, AEMFormatObject(operand1), AEMFormatObject(otherOperands)];
}

- (id)resolveWithObject:(id)object {
	NSRange range = {1, [operands count] - 1};
	id operand1 = [operands[0] resolveWithObject: object];
	NSArray *otherOperands = [operands subarrayWithRange: range];
    return (self.operator == kEnumAND) ? [operand1 AND: otherOperands] : [operand1 OR: otherOperands];
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *opsDesc = [codecs pack: operands error: error];
    if (!opsDesc) return nil;
	NSAppleEventDescriptor *desc = AEMNewRecordOfType(typeLogicalDescriptor);
	[desc setDescriptor: self.operator forKeyword: keyAELogicalOperator];
	[desc setDescriptor: opsDesc forKeyword: keyAELogicalTerms];
	return desc;	
}

@end

// logical tests
// Note: clients should not instantiate these classes directly

@implementation AEMANDTest

- (NSString *)formatString {
	return @"[%@ AND: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumAND;
}

@end


@implementation AEMORTest

- (NSString *)formatString {
	return @"[%@ OR: %@]";
}

- (NSAppleEventDescriptor *)operator {
	return kEnumOR;
}

@end


@implementation AEMNOTTest

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ NOT]", AEMFormatObject(operands[0])];
}

- (NSAppleEventDescriptor *)operator {
	return kEnumNOT;
}

- (id)resolveWithObject:(id)object {
	return [[operands[0] resolveWithObject: object] NOT];
}

@end

