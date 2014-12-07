//
//  AEMTypes.h
//
//  Wrapper classes for primitive AE types that do not have direct
//  Foundation equivalents (typeBoolean, typeType, typeEnum, etc).
//  Ensure AE data can be fully round-tripped without altering its
//  type or meaning (which in turn can cause compatibility problems
//  to arise particularly with Carbon-based apps that are especially
//  finicky about which data types they will/won't accept, e.g.
//  because they don't use AE-supplied coercion handlers as they're
//  supposed to.
//

#import "AEMFormatter.h"
#import "AEMUtils.h"

/**********************************************************************/
// not defined in __LP64__

enum { typeFSS = 'fss ' };


/**********************************************************************/
// convenience macros

#define AEMTrue  ([AEMBoolean True])
#define AEMFalse ([AEMBoolean False])


/**********************************************************************/
// Boolean class represents AEDescs of typeTrue and typeFalse


@interface AEMBoolean : NSObject <AEMSelfPackingProtocol> {
	BOOL boolValue;
	NSAppleEventDescriptor *cachedDesc;
}

+ (instancetype)True;

+ (instancetype)False;

// client's shouldn't call -initWithBool: directly; use +True/+False (or AEMTrue/AEMFalse macros) instead
- (instancetype)initWithBool:(BOOL)boolValue_;

- (BOOL)boolValue;

- (NSAppleEventDescriptor *)descriptor;

@end


/**********************************************************************/

// abstract base class for AEMType, AEMEnum, AEMProperty, AEMKeyword
@interface AEMTypeBase : NSObject <NSCopying, AEMSelfPackingProtocol> {
	DescType type;
	OSType code;
	NSAppleEventDescriptor *cachedDesc;
}

// clients shouldn't call this next method directly; use subclasses' class/instance initialisers instead
- (instancetype)initWithDescriptorType:(DescType)type_
						code:(OSType)code_
						desc:(NSAppleEventDescriptor *)desc;

- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc; // normally called by AEMCodecs -unpack:, though clients could also use it to wrap any loose NSAppleEventDescriptor instances they might have. Note: doesn't verify descriptor's type before use; clients are responsible for providing an appropriate value.

- (instancetype)initWithCode:(OSType)code_; // stub method; subclasses will override this to provide concrete implementations 

- (OSType)code;

- (NSAppleEventDescriptor *)descriptor;

@end


/***********************************/
// concrete classes representing AEDescs of typeType, typeEnumerator, typeProperty, typeKeyword
// note: unlike NSAppleEventDescriptor instances, instances of these classes are fully hashable
// and comparable, so suitable for use as NSDictionary keys.

@interface AEMType : AEMTypeBase

+ (instancetype)typeWithCode:(OSType)code_;

@end


@interface AEMEnum : AEMTypeBase

+ (instancetype)enumWithCode:(OSType)code_;

@end


@interface AEMProperty : AEMTypeBase

+ (instancetype)propertyWithCode:(OSType)code_;

@end


@interface AEMKeyword : AEMTypeBase

+ (instancetype)keywordWithCode:(OSType)code_;

@end


