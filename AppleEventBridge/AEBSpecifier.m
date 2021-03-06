//
//  AEBSpecifier.m
//

#import "AEBSpecifier.h"
#import "AEBObjCCommand.h"


/**********************************************************************/


@implementation AEBSpecifier

@synthesize aebAppData, aemQuery;

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

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
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


// transaction support

- (BOOL)beginTransactionWithError:(NSError * __autoreleasing *)error {
    return [[aebAppData targetWithError: error] beginTransactionWithError: error];
}

- (BOOL)beginTransactionWithSession:(id)session error:(NSError * __autoreleasing *)error {
	 return [[aebAppData targetWithError: error] beginTransactionWithSession: session error: error];
}

- (BOOL)endTransactionWithError:(NSError * __autoreleasing *)error {
	 return [[aebAppData targetWithError: error] endTransactionWithError: error];
}

- (BOOL)abortTransactionWithError:(NSError * __autoreleasing *)error {
	 return [[aebAppData targetWithError: error] abortTransactionWithError: error];
}

@end

