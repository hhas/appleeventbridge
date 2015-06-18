//
//  AEBSpecifier.m
//

#import "AEBSpecifier.h"
#import "AEBStaticCommand.h"


/**********************************************************************/


@implementation AEBSpecifier

@synthesize aebAppData, aemQuery;

+ (instancetype)specifierWithAppData:(id)appData_ aemQuery:(id)aemQuery_ {
	return [[self alloc] initWithAppData: appData_ aemQuery: aemQuery_];
}

- (instancetype)initWithAppData:(AEBAppData *)appData_ aemQuery:(AEMQuery *)aemQuery_ {
	self = [super init];
	if (!self) return self;
	aebAppData = appData_;
	aemQuery = aemQuery_;
	return self;
}


// comparison, hash support

- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class]) return NO;
	return ([[aebAppData targetWithError: nil] isEqual: [((AEBSpecifier *)object).aebAppData targetWithError: nil]]
                 && [aemQuery isEqual: ((AEBSpecifier *)object).aemQuery]);
}

- (NSUInteger)hash {
	return ([[aebAppData targetWithError: nil] hash] + [aemQuery hash]);
}


//

- (NSAppleEventDescriptor *)aebPackSelf:(id)codecs error:(NSError * __autoreleasing *)error {
	return [aemQuery packWithCodecs: codecs error: error];
}

- (void)setRelaunchMode:(AEBRelaunchMode)relaunchMode_ {
	[aebAppData setRelaunchMode: relaunchMode_];
}

- (AEBRelaunchMode)relaunchMode {
	return [aebAppData relaunchMode];
}


- (BOOL)isRunning {
	return [aebAppData isRunning];
}

- (BOOL)launchApplication {
	return [self launchApplicationWithError: nil];
}

- (BOOL)launchApplicationWithError:(NSError * __autoreleasing *)error {
	return [aebAppData launchApplicationWithError: error];
}

- (BOOL)reconnectApplication {
	return [[aebAppData targetWithError: nil] reconnect];
}

- (BOOL)reconnectApplicationWithError:(NSError * __autoreleasing *)error {
	return [[aebAppData targetWithError: error] reconnectWithError: error];
}

/*
// missing terminology support // TO DO: these return id since they're available on both application and specifier objects but

- (id)propertyByOSType:(OSType)code {
    return [[self.class alloc] initWithAppData: aebAppData aemQuery: [((AEMObjectSpecifier *)aemQuery) property: code]];
}

- (id)elementsByOSType:(OSType)code {
    return [[self.class alloc] initWithAppData: aebAppData aemQuery: [((AEMObjectSpecifier *)aemQuery) elements: code]];
}

- (id)propertyByFourCharCode:(NSString *)code {
    return [self propertyByOSType: AEM4CC(code)];
}

- (id)elementsByFourCharCode:(NSString *)code {
    return [self elementsByOSType: AEM4CC(code)];
}*/


// transaction support

- (BOOL)beginTransactionWithError:(NSError * __autoreleasing *)error {
    return [[aebAppData targetWithError: nil] beginTransactionWithError: error];
}

- (BOOL)beginTransactionWithSession:(id)session error:(NSError * __autoreleasing *)error {
	 return [[aebAppData targetWithError: nil] beginTransactionWithSession: session error: error];
}

- (BOOL)endTransactionWithError:(NSError * __autoreleasing *)error {
	 return [[aebAppData targetWithError: nil] endTransactionWithError: error];
}

- (BOOL)abortTransactionWithError:(NSError * __autoreleasing *)error {
	 return [[aebAppData targetWithError: nil] abortTransactionWithError: error];
}

@end

