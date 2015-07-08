//
//  AEMTypes.m
//

#import "AEMTypes.h"


/**********************************************************************/
// Booleans


@implementation AEMBoolean

+ (instancetype)True {
    static dispatch_once_t pred = 0;
    __strong static AEMBoolean *value = nil;
    dispatch_once(&pred, ^{
        value = [[self.class alloc] initWithBool: YES];
    });
    return value;
}

+ (instancetype)False {
    static dispatch_once_t pred = 0;
    __strong static AEMBoolean *value = nil;
    dispatch_once(&pred, ^{
        value = [[self.class alloc] initWithBool: NO];
    });
    return value;
}

- (instancetype)initWithBool:(BOOL)value {
	self = [super init];
	if (!self) return self;
	boolValue = value;
	cachedDesc = [[NSAppleEventDescriptor alloc]
						 initWithDescriptorType: (value ? typeTrue : typeFalse)
										  bytes: NULL
										 length: 0];
	return self;
}

- (NSString *)description {
	return boolValue ? @"AEMTrue" : @"AEMFalse";
}

- (BOOL)boolValue {
	return boolValue;
}

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
	return cachedDesc;
}

- (NSAppleEventDescriptor *)descriptor {
	return cachedDesc;
}

@end


/**********************************************************************/
// types, enums, etc.


@implementation AEMTypeBase

- (instancetype)init {
    return nil;
}

// clients shouldn't call this initialiser directly; use subclasses' initialisers instead
- (instancetype)initWithDescriptorType:(DescType)type_
                                  code:(OSType)code_
                                  desc:(NSAppleEventDescriptor *)desc {
    self = [super init];
    if (!self) return self;
    type = type_;
    code = code_;
    cachedDesc = desc;
    return self;
}

- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithDescriptorType: '\000\000\000\000' // TO DO: is there any appreciable benefit to lazy unpacking (see -code), or would it be simpler just to get desc's descriptorType and typeCodeValue here?
                                   code: '\000\000\000\000'
                                   desc: desc];
}

- (instancetype)initWithCode:(OSType)code_ { // subclasses should override this method
    @throw [NSException exceptionWithName: @"NotImplementedError" reason: nil userInfo: nil];
}


- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (NSUInteger)hash {
    return (NSUInteger)[self code];
}


- (BOOL)isEqual:(id)anObject {
    if (anObject == self) return YES;
    if (!anObject || ![anObject isKindOfClass: self.class]) return NO;
    return [self code] == [(AEMTypeBase *)anObject code];
}

- (OSType)code {
    if (!code) code = cachedDesc.typeCodeValue; // (descriptors of typeType, typeEnumerated, typeProperty, typeKeyword)
    return code;
}

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
    @synchronized(self) {
        if (!cachedDesc) cachedDesc = [[NSAppleEventDescriptor alloc] initWithDescriptorType: type
                                                                                       bytes: &code
                                                                                      length: sizeof(code)];
        return cachedDesc;
    }
}

- (NSAppleEventDescriptor *)descriptor {
    return [self packWithCodecs: nil error: nil];
}

@end


/***********************************/


@implementation AEMType

+ (instancetype)typeWithCode:(OSType)code_ {
	return [[self.class alloc] initWithCode: code_];
}

- (instancetype)initWithCode:(OSType)code_ {
	return [super initWithDescriptorType: typeType code: code_ desc: nil];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"[AEMType typeWithCode: '%@']", AEMFormatOSType(self.code)];
}

@end


@implementation AEMEnum

+ (instancetype)enumWithCode:(OSType)code_ {
	return [[self.class alloc] initWithCode: code_];
}

- (instancetype)initWithCode:(OSType)code_ {
	return [super initWithDescriptorType: typeEnumerated code: code_ desc: nil];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"[AEMEnum enumWithCode: '%@']", AEMFormatOSType(self.code)];
}

@end


@implementation AEMProperty

+ (instancetype)propertyWithCode:(OSType)code_ {
	return [[self.class alloc] initWithCode: code_];
}

- (instancetype)initWithCode:(OSType)code_ {
	return [super initWithDescriptorType: typeProperty code: code_ desc: nil];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"[AEMProperty propertyWithCode: '%@']", AEMFormatOSType(self.code)];
}

@end


@implementation AEMKeyword

+ (instancetype)keywordWithCode:(OSType)code_ {
	return [[self.class alloc] initWithCode: code_];
}

- (instancetype)initWithCode:(OSType)code_ {
	return [super initWithDescriptorType: typeKeyword code: code_ desc: nil];
}

- (NSString *)description {
	return [NSString stringWithFormat: @"[AEMKeyword keywordWithCode: '%@']", AEMFormatOSType(self.code)];
}

@end


