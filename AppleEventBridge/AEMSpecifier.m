//
//  AEMSpecifier.m
//

#import <pthread.h>

#import "AEMSpecifier.h"
#import "AEMCodecs.h"


/**********************************************************************/
// initialise/dispose constants


// insertion locations
static NSAppleEventDescriptor *kEnumBeginning,
							  *kEnumEnd,
							  *kEnumBefore,
							  *kEnumAfter;

// relative positions
static NSAppleEventDescriptor *kEnumPrevious,
							  *kEnumNext;

// absolute ordinals
static NSAppleEventDescriptor *kOrdinalFirst,
							  *kOrdinalMiddle,
							  *kOrdinalLast,
							  *kOrdinalAny,
							  *kOrdinalAll;

// key forms
static NSAppleEventDescriptor *kFormPropertyID,
							  *kFormUserPropertyID,
							  *kFormName,
							  *kFormAbsolutePosition,
							  *kFormUniqueID,
							  *kFormRelativePosition,
							  *kFormRange,
							  *kFormTest;

// prepacked value for keyDesiredClass for use by -packWithCodecs: in property specifiers
static NSAppleEventDescriptor *kClassProperty;


static void InitSpecifierModule(void) {
    static dispatch_once_t pred = 0;
    dispatch_once(&pred, ^{
        #define KEYDESC(constName, varName, descType) { \
        OSType descData = constName; \
        varName = [[NSAppleEventDescriptor alloc] initWithDescriptorType: descType bytes: &descData length: sizeof(descData)]; \
        }
        #define ORDINAL(name)    KEYDESC(kAE##name, kOrdinal##name, typeAbsoluteOrdinal)
        #define ENUMERATOR(name) kEnum##name = [NSAppleEventDescriptor descriptorWithEnumCode: (kAE##name)];
        #define KEY_FORM(name)   kForm##name = [NSAppleEventDescriptor descriptorWithEnumCode: (form##name)];
        InitTestModule();
        // absolute ordinals
        ORDINAL(First);
        ORDINAL(Middle);
        ORDINAL(Last);
        ORDINAL(Any);
        ORDINAL(All);
        // insertion locations
        ENUMERATOR(Beginning);
        ENUMERATOR(End);
        ENUMERATOR(Before);
        ENUMERATOR(After);
        // relative positions
        ENUMERATOR(Previous);
        ENUMERATOR(Next);
        //key forms
        KEY_FORM(PropertyID);
        KEY_FORM(UserPropertyID);
        KEY_FORM(Name);
        KEY_FORM(AbsolutePosition);
        KEY_FORM(UniqueID);
        KEY_FORM(RelativePosition);
        KEY_FORM(Range);
        KEY_FORM(Test);
        // miscellaneous
        KEYDESC(cProperty, kClassProperty, typeType);
    });
}


/**********************************************************************/


#define ELEMENT_WANT_CODE ([NSAppleEventDescriptor descriptorWithTypeCode: wantCode])


NSAppleEventDescriptor *AEMNewObjectSpecifier(AEMCodecs *codecs,
                                              AEMQuery *container,
                                              NSAppleEventDescriptor *wantCode,
                                              NSAppleEventDescriptor *keyType,
                                              NSAppleEventDescriptor *keyData,
                                              NSError **error) {
    NSAppleEventDescriptor *containerDesc = [container packWithCodecs: codecs error: error];
    if (!containerDesc) return nil;
    NSAppleEventDescriptor *desc = AEMNewRecordOfType(typeObjectSpecifier);
    [desc setDescriptor: wantCode forKeyword: keyAEDesiredClass];
    [desc setDescriptor: keyType forKeyword: keyAEKeyForm];
    [desc setDescriptor: keyData forKeyword: keyAEKeyData];
    [desc setDescriptor: containerDesc forKeyword: keyAEContainer];
    return desc;
}


/**********************************************************************/
// Specifier base

/*
 * Abstract base class for all object specifier classes.
 */
@implementation AEMSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_ key:(id)key_ {
	self = [super init];
	if (!self) return self;
	container = container_;
	key = key_;
	return self;
}


// reserved methods

- (AEMQueryRoot *)root {
	return [container root];
}

- (AEMSpecifier *)trueSelf {
	return self;
}

- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class]) return NO;
	id key2 = [object key];
	if ([key isKindOfClass: NSAppleEventDescriptor.class]) {
		// NSAppleEventDescriptors compare for object identity only, so do a more thorough comparison here
		if (!AEMIsDescriptorEqualToObject(key, key2)) return NO;
	} else if (!([key isEqual: key2] || (key == nil && key2 == nil))) {
		return NO;
	}
    return ([container isEqual: [object container]]);
}

- (id)key { // used by -isEqual:
	return key;
}

- (id)container { // used by -isEqual:
	return container;
}

@end


/**********************************************************************/
// Performance optimisation used by -[AEMCodecs unpackObjectSpecifier:]


@implementation AEMDeferredSpecifier

- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc_ codecs:(id)codecs_ {
	self = [super initWithContainer: nil key: nil];
	if (!self) return self;
	specifier = nil;
	desc = desc_;
	codecs = codecs_;
	return self;
}


- (id)realSpecifier { // used internally // TO DO: ought to return error where practical
	if (!specifier) specifier = [codecs fullyUnpackObjectSpecifier: desc error: nil];
	return specifier;
}

- (NSString *)description {
	return [[self realSpecifier] description];
}

- (AEMQueryRoot *)root {
	return [[self realSpecifier] root];
}

- (id)resolveWithObject:(id)object {
	return [[self realSpecifier] resolveWithObject: object];
}

- (BOOL)isEqual:(id)object {
	return [[self realSpecifier] isEqual: object];
}

@end


/**********************************************************************/
// Insertion location specifier

/*
 * A reference to an element insertion point.
 *
 * key : NSAppleEventDescriptor of typeEnumerated, value:
 *			 kEnumBeginning/kEnumEnd/kEnumBefore/kEnumAfter
 *
 */
@implementation AEMInsertionSpecifier

- (NSString *)description {
	switch ([key enumCodeValue]) {
		case kAEBeginning:
			return [NSString stringWithFormat: @"[%@ beginning]", container];
		case kAEEnd:
			return [NSString stringWithFormat: @"[%@ end]", container];
		case kAEBefore:
			return [NSString stringWithFormat: @"[%@ before]", container];
		case kAEAfter:
			return [NSString stringWithFormat: @"[%@ after]", container];
		default:
			return nil;
	}
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *containerDesc = [container packWithCodecs: codecs error: error];
    if (!containerDesc) return nil;
	NSAppleEventDescriptor *desc = AEMNewRecordOfType(typeInsertionLoc);
	[desc setDescriptor: containerDesc forKeyword: keyAEObject];
	[desc setDescriptor: key forKeyword: keyAEPosition];
	return desc;	
}

-(id)resolveWithObject:(id)object { 
	id result = [container resolveWithObject: object];
	switch ([key enumCodeValue]) {
		case kAEBeginning:
			return [result beginning];
		case kAEEnd:
			return [result end];
		case kAEBefore:
			return [result before];
		case kAEAfter:
			return [result after];
		default:
			return nil;
	}
}

@end


/**********************************************************************/
// Position specifier base

/*
 * All property and element reference forms inherit from this abstract class.
 */
@implementation AEMObjectSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_ key:(id)key_ wantCode:(OSType)wantCode_; {
	self = [super initWithContainer:(AEMSpecifier *)container_ key:(id)key_];
	if (!self) return self;
	wantCode = wantCode_;
	return self;
}

- (BOOL)isEqual:(id)object {
	return ([super isEqual: object] && wantCode == [object wantCode]);
}

- (OSType)wantCode { // used by isEqual
	return wantCode;
}

// Comparison and logic tests

- (AEMGreaterThanTest *)greaterThan:(id)object {
	return [[AEMGreaterThanTest alloc] initWithOperand1: self operand2: object];
}

- (AEMGreaterOrEqualsTest *)greaterOrEquals:(id)object {
	return [[AEMGreaterOrEqualsTest alloc] initWithOperand1: self operand2: object];
}

- (AEMEqualsTest *)equals:(id)object {
	return [[AEMEqualsTest alloc] initWithOperand1: self operand2: object];
}

- (AEMNotEqualsTest *)notEquals:(id)object {
	return [[AEMNotEqualsTest alloc] initWithOperand1: self operand2: object];
}

- (AEMLessThanTest *)lessThan:(id)object {
	return [[AEMLessThanTest alloc] initWithOperand1: self operand2: object];
}

- (AEMLessOrEqualsTest *)lessOrEquals:(id)object {
	return [[AEMLessOrEqualsTest alloc] initWithOperand1: self operand2: object];
}

- (AEMBeginsWithTest *)beginsWith:(id)object {
	return [[AEMBeginsWithTest alloc] initWithOperand1: self operand2: object];
}

- (AEMEndsWithTest *)endsWith:(id)object {
	return [[AEMEndsWithTest alloc] initWithOperand1: self operand2: object];
}

- (AEMContainsTest *)contains:(id)object {
	return [[AEMContainsTest alloc] initWithOperand1: self operand2: object];
}

- (AEMIsInTest *)isIn:(id)object {
	return [[AEMIsInTest alloc] initWithOperand1: self operand2: object];
}


// Insertion location selectors

- (AEMInsertionSpecifier *)beginning {
	return [[AEMInsertionSpecifier alloc] initWithContainer: self key: kEnumBeginning];
}

- (AEMInsertionSpecifier *)end {
	return [[AEMInsertionSpecifier alloc] initWithContainer: self key: kEnumEnd];
}

- (AEMInsertionSpecifier *)before {
	return [[AEMInsertionSpecifier alloc] initWithContainer: self key: kEnumBefore];
}

- (AEMInsertionSpecifier *)after {
	return [[AEMInsertionSpecifier alloc] initWithContainer: self key: kEnumAfter];
}


// property and all-element specifiers

- (AEMPropertySpecifier *)property:(OSType)propertyCode {
	return [[AEMPropertySpecifier alloc]
					   initWithContainer: self
									 key: [NSAppleEventDescriptor descriptorWithTypeCode: propertyCode]
								wantCode: cProperty];
}

- (AEMUserPropertySpecifier *)userProperty:(NSString *)propertyName {
	return [[AEMUserPropertySpecifier alloc]
						   initWithContainer: self
										 key: propertyName
									wantCode: cProperty];
}

- (AEMAllElementsSpecifier *)elements:(OSType)classCode {
	return [[AEMAllElementsSpecifier alloc]
						  initWithContainer: self
								   wantCode: classCode];
}


// by-relative-position selectors

- (AEMElementByRelativePositionSpecifier *)previous:(OSType)classCode {
	return [[AEMElementByRelativePositionSpecifier alloc]
										initWithContainer: self
													  key: kEnumPrevious
												 wantCode: classCode];
}

- (AEMElementByRelativePositionSpecifier *)next:(OSType)classCode {
	return [[AEMElementByRelativePositionSpecifier alloc]
										initWithContainer: self
													  key: kEnumNext
												 wantCode: classCode];
}

@end


/**********************************************************************/
// Properties

/*
 * A reference to an application-defined property specifier
 */
@implementation AEMPropertySpecifier

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ property: '%@']", container, AEMFormatOSType([key typeCodeValue])];
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
	return AEMNewObjectSpecifier(codecs, container, kClassProperty, kFormPropertyID, key, error);
}

-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] property: [key typeCodeValue]];
}

@end


/*
 * A reference to a user-defined property specifier
 */
@implementation AEMUserPropertySpecifier

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ userProperty: '%@']", container, AEMFormatObject(key)];
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *keyDesc = [[NSAppleEventDescriptor descriptorWithString: key] coerceToDescriptorType: typeChar]; // TO DO: check if typeUnicodeText is supported now
    if (!keyDesc) {
        if (error) *error = AEMErrorWithInfo(errAECoercionFail, @"Invalid user property name.");
        return nil;
    }
    return AEMNewObjectSpecifier(codecs, container, kClassProperty, kFormUserPropertyID, keyDesc, error);
}

-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] userProperty: key];
}

@end


/**********************************************************************/
// Single elements

/*
 * Abstract base class for all single element specifiers
 * (except AEMElementByRelativePositionSpecifier, which
 * needs the original container reference as-is while
 * the rest call its -trueSelf method to get rid of any
 * all-elements specifiers)
 */
@implementation AEMSingleElementSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_ key:(id)key_ wantCode:(OSType)wantCode_; {
	return [super initWithContainer: [container_ trueSelf] key: key_ wantCode: wantCode_];
}

@end


@implementation AEMElementByNameSpecifier

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ byName: %@]", container, AEMFormatObject(key)];
}

// reserved methods


- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *keyDesc = [codecs pack: key error: error];
    if (!keyDesc) return nil; // TO DO: better error message
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormName, keyDesc, error);
}

-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] byName: key];
}

@end


@implementation AEMElementByIndexSpecifier

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ byIndex: %@]", container, AEMFormatObject(key)];
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *keyDesc = [codecs pack: key error: error];
    if (!keyDesc) return nil; // TO DO: better error message
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormAbsolutePosition, keyDesc, error);
}

-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] byIndex: key];
}

@end


@implementation AEMElementByIDSpecifier

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ byID: %@]", container, AEMFormatObject(key)];
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *keyDesc = [codecs pack: key error: error];
    if (!keyDesc) return nil; // TO DO: better error message
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormUniqueID, keyDesc, error);
}

-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] byID: key];
}

@end


@implementation AEMElementByOrdinalSpecifier

- (NSString *)description {
	switch ([key enumCodeValue]) {
		case kAEFirst:
			return [NSString stringWithFormat: @"[%@ first]", container];
		case kAEMiddle:
			return [NSString stringWithFormat: @"[%@ middle]", container];
		case kAELast:
			return [NSString stringWithFormat: @"[%@ last]", container];
		case kAEAny:
			return [NSString stringWithFormat: @"[%@ any]", container];
		default:
			return nil;
	}
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormAbsolutePosition, key, error);
}

-(id)resolveWithObject:(id)object { 
	id result = [container resolveWithObject: object];
	switch ([key enumCodeValue]) {
		case kAEFirst:
			return [result first];
		case kAEMiddle:
			return [result middle];
		case kAELast:
			return [result last];
		case kAEAny:
			return [result any];
		default:
			return nil;
	}
}

@end



@implementation AEMElementByRelativePositionSpecifier

- (NSString *)description {
	switch ([key enumCodeValue]) {
		case kAEPrevious:
			return [NSString stringWithFormat: @"[%@ previous: '%@']", container, AEMFormatOSType(wantCode)];
		case kAENext:
			return [NSString stringWithFormat: @"[%@ next: '%@']", container, AEMFormatOSType(wantCode)];
		default:
			return nil;
	}
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormRelativePosition, key, error);
}


-(id)resolveWithObject:(id)object { 
	id result = [container resolveWithObject: object];
	switch ([key enumCodeValue]) {
		case kAEPrevious:
			return [result previous: wantCode];
		case kAENext:
			return [result next: wantCode];
		default:
			return nil;
	}
}

@end



/**********************************************************************/
// Multiple elements

/*
 * Base class for all multiple element specifiers.
 */
@implementation AEMMultipleElementsSpecifier 

// ordinal selectors

- (AEMElementByOrdinalSpecifier *)first {
	return [[AEMElementByOrdinalSpecifier alloc]
							   initWithContainer: self
											 key: kOrdinalFirst
										wantCode: wantCode];
}

- (AEMElementByOrdinalSpecifier *)middle {
	return [[AEMElementByOrdinalSpecifier alloc]
							   initWithContainer: self
											 key: kOrdinalMiddle
										wantCode: wantCode];
}

- (AEMElementByOrdinalSpecifier *)last {
	return [[AEMElementByOrdinalSpecifier alloc]
							   initWithContainer: self
											 key: kOrdinalLast
										wantCode: wantCode];
}

- (AEMElementByOrdinalSpecifier *)any {
	return [[AEMElementByOrdinalSpecifier alloc]
							   initWithContainer: self
											 key: kOrdinalAny
										wantCode: wantCode];
}


// by-index, by-name, by-id selectors
 
- (AEMElementByIndexSpecifier *)at:(int)index {
	return [[AEMElementByIndexSpecifier alloc]
							 initWithContainer: self
										   key: @(index)
									  wantCode: wantCode];
}

- (AEMElementByIndexSpecifier *)byIndex:(id)index { // index is normally NSNumber, but may occasionally be other types where target application accepts it (e.g. Finder also accepts typeAlias)
	return [[AEMElementByIndexSpecifier alloc]
							 initWithContainer: self
										   key: index
									  wantCode: wantCode];
}

- (AEMElementByNameSpecifier *)byName:(id)name {
	return [[AEMElementByNameSpecifier alloc]
							initWithContainer: self
										  key: name
									 wantCode: wantCode];
}

- (AEMElementByIDSpecifier *)byID:(id)id_ {
	return [[AEMElementByIDSpecifier alloc]
						  initWithContainer: self
										key: id_
								   wantCode: wantCode];
}

// by-range selector

- (AEMElementsByRangeSpecifier *)at:(int)startIndex to:(int)stopIndex {
	return [[AEMElementsByRangeSpecifier alloc]
							  initWithContainer: self
										  start: [[AEMCon elements: wantCode] at: startIndex]
										   stop: [[AEMCon elements: wantCode] at: stopIndex]
									   wantCode: wantCode];
}

// takes two app- or con-based specifiers, expanding any other values as necessary
- (AEMElementsByRangeSpecifier *)byRange:(id)startSpecifier to:(id)stopSpecifier { 
	return [[AEMElementsByRangeSpecifier alloc]
							  initWithContainer: self
										  start: startSpecifier
										   stop: stopSpecifier
									   wantCode: wantCode];
}


// by-test selector

- (AEMElementsByTestSpecifier *)byTest:(AEMTest *)testSpecifier {
	return [[AEMElementsByTestSpecifier alloc]
							 initWithContainer: self
										   key: testSpecifier
									  wantCode: wantCode];
}

@end


@implementation AEMElementsByRangeSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_
				  start:(id)startSpecifier_
				   stop:(id)stopSpecifier_
			   wantCode:(OSType)wantCode_ {
	self = [super initWithContainer: [container_ trueSelf] key: nil wantCode: wantCode_];
	if (!self) return self;
	startSpecifier = startSpecifier_;
	stopSpecifier = stopSpecifier_;
	return self;
}

- (BOOL)isEqual:(id)object {
	return ([super isEqual: object] && [startSpecifier isEqual: [object startSpecifier]]
									&& [stopSpecifier isEqual: [object stopSpecifier]]); 
}

- (id)startSpecifier { // used by isEqual:
	return startSpecifier;
}

- (id)stopSpecifier { // used by isEqual:
	return stopSpecifier;
}



- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ byRange: %@ to: %@]",
									   container, AEMFormatObject(startSpecifier), AEMFormatObject(stopSpecifier)];
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
	id start, stop;
	// expand non-specifier values to con-based specifiers
	// (note: doesn't bother to check if specifiers are app- or con-based;
	//	will assume users are smart enough not to try passing its-based specifiers)
	if ([startSpecifier isKindOfClass: AEMSpecifier.class] || ([startSpecifier isKindOfClass: NSAppleEventDescriptor.class]
                                                               && [startSpecifier descriptorType] == typeObjectSpecifier)) {
		start = startSpecifier;
    } else if ([startSpecifier isKindOfClass: NSString.class]) {
		start = [[AEMCon elements: wantCode] byName: startSpecifier];
	} else {
		start = [[AEMCon elements: wantCode] byIndex: startSpecifier];
	}
    if ([stopSpecifier isKindOfClass: AEMSpecifier.class] || ([stopSpecifier isKindOfClass: NSAppleEventDescriptor.class]
                                                                && [stopSpecifier descriptorType] == typeObjectSpecifier)) {
		stop = stopSpecifier;
	} else if ([stopSpecifier isKindOfClass: NSString.class]) {
		stop = [[AEMCon elements: wantCode] byName: stopSpecifier];
	} else {
		stop = [[AEMCon elements: wantCode] byIndex: stopSpecifier];
    }
	// pack descriptor
    NSAppleEventDescriptor *startDesc = [codecs pack: start error: error];
    if (!startDesc) return nil;
    NSAppleEventDescriptor *stopDesc = [codecs pack: stop error: error];
    if (!stopDesc) return nil;
	NSAppleEventDescriptor *keyDesc = AEMNewRecordOfType(typeRangeDescriptor);
	[keyDesc setDescriptor: startDesc forKeyword: keyAERangeStart];
	[keyDesc setDescriptor: stopDesc forKeyword: keyAERangeStop];
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormRange, keyDesc, error);
}


-(id)resolveWithObject:(id)object {
	return [[container resolveWithObject: object] byRange: startSpecifier to: stopSpecifier];
}

@end


@implementation AEMElementsByTestSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_ key:(AEMTest *)key_ wantCode:(OSType)wantCode_; {
	return [super initWithContainer: [container_ trueSelf] key: key_ wantCode: wantCode_];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ byTest: %@]", container, key];
}

// reserved methods

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    NSAppleEventDescriptor *keyDesc = [codecs pack: key error: error];
    // TO DO: check keyDesc.descriptorType is a valid comparison/logic test type as apps may not check this themselves?
    if (!keyDesc) return nil; // TO DO: better error message
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormTest, keyDesc, error);
}


-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] byTest: key];
}

@end


@implementation AEMAllElementsSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_ wantCode:(OSType)wantCode_ {
	AEMUnkeyedElementsShim *shim;
	shim = [[AEMUnkeyedElementsShim alloc] initWithContainer: container_ wantCode: wantCode_];
	self = [super initWithContainer: shim key: kOrdinalAll wantCode: wantCode_];
	return self;
}

- (NSString *)description {
	return [container description]; // forward to shim
}

// reserved methods

- (AEMSpecifier *)trueSelf {
	// Overrides default implementation to return the UnkeyedElements object
	// stored inside of this AllElements instance.
	return container; 
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
    return AEMNewObjectSpecifier(codecs, container, ELEMENT_WANT_CODE, kFormAbsolutePosition, kOrdinalAll, error);
}

-(id)resolveWithObject:(id)object { 
	return [container resolveWithObject: object]; // forward to shim
}

@end


/**********************************************************************/
// Multiple element shim

@implementation AEMUnkeyedElementsShim

- (instancetype)initWithContainer:(AEMSpecifier *)container_ wantCode:(OSType)wantCode_ {
	self = [super initWithContainer: container_ key: nil];
	if (!self) return self;
	wantCode = wantCode_;
	return self;
}

- (BOOL)isEqual:(id)object {
	return ([super isEqual: object] && wantCode == [object wantCode]);
}

- (OSType)wantCode { // used by isEqual
	return wantCode;
}

- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ elements: '%@']", container, AEMFormatOSType(wantCode)];
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
	return [container packWithCodecs: codecs error: error]; // forward to next container
}

-(id)resolveWithObject:(id)object { 
	return [[container resolveWithObject: object] elements: wantCode];
}

@end


/**********************************************************************/
// Query roots

@implementation AEMQueryRoot

- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class]) return NO;
	return YES;
}

- (AEMQueryRoot *)root {
	return self;
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
	return cachedDesc;
}

@end


@implementation AEMApplicationRoot

+ (AEMApplicationRoot *)applicationRoot {
    static dispatch_once_t pred = 0;
    __strong static AEMApplicationRoot *root = nil;
    dispatch_once(&pred, ^{
        InitSpecifierModule();
        root = [[AEMApplicationRoot alloc] initWithContainer: nil key: nil wantCode: '????'];
    });
    return root;
}

- (NSString *)description {
	return @"AEMApp";
}

- (id)resolveWithObject:(id)object {
	return [object app];
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
	return [codecs applicationRootDescriptor];
}

@end


@implementation AEMCurrentContainerRoot

// note: clients should avoid calling this initialiser directly; 
// use AEMApp, AEMCon, AEMIts macros instead.
+ (AEMCurrentContainerRoot *)currentContainerRoot {
    static dispatch_once_t pred = 0;
    __strong static AEMCurrentContainerRoot *root = nil;
    dispatch_once(&pred, ^{
        InitSpecifierModule();
        root = [[AEMCurrentContainerRoot alloc] initWithContainer: nil key: nil wantCode: '????'];
        [root setCachedDesc: [[NSAppleEventDescriptor alloc] initWithDescriptorType: typeCurrentContainer
                                                                              bytes: NULL
                                                                             length: 0]];
    });
    return root;
}

- (NSString *)description {
	return @"AEMCon";
}

- (id)resolveWithObject:(id)object {
	return [object con];
}

@end


@implementation AEMObjectBeingExaminedRoot

+ (AEMObjectBeingExaminedRoot *)objectBeingExaminedRoot {
    static dispatch_once_t pred = 0;
    __strong static AEMObjectBeingExaminedRoot *root = nil;
    dispatch_once(&pred, ^{
        InitSpecifierModule();
        root = [[AEMObjectBeingExaminedRoot alloc] initWithContainer: nil key: nil wantCode: '????'];
        [root setCachedDesc: [[NSAppleEventDescriptor alloc] initWithDescriptorType: typeObjectBeingExamined
                                                                              bytes: NULL
                                                                             length: 0]];
    });
    return root;
}

- (NSString *)description {
	return @"AEMIts";
}

- (id)resolveWithObject:(id)object {
	return [object its];
}

@end


@implementation AEMCustomRoot

+ (AEMCustomRoot *)customRootWithObject:(id)rootObject_ {
    @synchronized(self) {
        InitSpecifierModule();
        return [[self alloc] initWithObject: rootObject_];
    }
}

- (instancetype)initWithObject:(id)rootObject_ {
	self = [super initWithContainer: nil key: nil wantCode: '????'];
	if (!self) return self;
	rootObject = rootObject_;
	return self;
}

- (BOOL)isEqual:(id)object {
	if (![super isEqual: object]) return NO;
	id rootObject2 = [object rootObject];
	if ([rootObject isKindOfClass: NSAppleEventDescriptor.class]) {
		// NSAppleEventDescriptors compare for object identity only, so do a more thorough comparison here
		return AEMIsDescriptorEqualToObject(rootObject, rootObject2);
	} else {
		return ([rootObject isEqual: rootObject2]);
    }
}

- (id)rootObject { // used by isEqual
	return rootObject;
}


- (NSString *)description {
	return [NSString stringWithFormat: @"AEMRoot(%@)", AEMFormatObject(rootObject)];
}

- (id)resolveWithObject:(id)object {
	return [object customRoot: rootObject];
}

- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error {
	return [codecs pack: rootObject error: error];
}

@end
