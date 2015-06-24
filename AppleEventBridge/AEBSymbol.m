//
//  AEBSymbol.m
//

#import "AEBSymbol.h"


/**********************************************************************/


@implementation AEBSymbol

+ (instancetype)symbolWithName:(NSString *)name_ type:(DescType)type_ code:(OSType)code_ {
    NSAppleEventDescriptor *desc_;
	desc_ = [[NSAppleEventDescriptor alloc] initWithDescriptorType: type_
															 bytes: &code_
															length: sizeof(code_)];
    return [[self alloc] initWithName: name_ descriptor: desc_];
}

+ (instancetype)symbolWithCode:(OSType)code_ {
    return nil;
}

- (instancetype)initWithName:(NSString *)name_ descriptor:(NSAppleEventDescriptor *)desc_ {
	self = [super init];
	if (!self) return self;
	name = name_;
	desc = desc_;
	return self;
}


- (NSString *)description {
	return [NSString stringWithFormat: @"[%@ %@]", self.class, name];
}

- (id)copyWithZone:(NSZone *)zone {
	return self;
}

- (NSUInteger)hash {
	return (NSUInteger)[desc typeCodeValue];
}

- (NSString *)aebName {
	return name;
}

- (OSType)aebCode {
	return [desc typeCodeValue];
}

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
	return desc;
}

@end

