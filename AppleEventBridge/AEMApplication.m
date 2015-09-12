//
//  AEMApplication.m
//

#import "AEMApplication.h"

#import "NSAppleEventDescriptor+AEDescExtensions.h"
#import "NSAppleEventDescriptor+AEDescMoreExtensions.h"


/**********************************************************************/


// kLSApplicationNotFoundErr = -10814
#define kAEMApplicationNotFoundError (-10814)


// procNotFound = -600
#define kAEMProcessNotFoundError (-600)


id AEMGetFileIDFromNSURL(NSURL *url) {
    id value;
    // YES+value = successful retrieval, YES+nil = resource not available; NO+error = failed (e.g. 'file not found')
    [url getResourceValue: &value forKey: NSURLFileResourceIdentifierKey error: nil];
    return value ?: url;
}


/**********************************************************************/


@implementation AEMApplication

@synthesize AppleEventDescriptorClass, AEMEventClass, defaultCodecs;

// utility class methods

// Find installed applications

+ (NSURL *)fileURLForCurrentApplication {
    NSRunningApplication *app = [NSRunningApplication currentApplication];
    return app.bundleURL ?: app.executableURL;
}

+ (NSURL *)fileURLForApplicationWithBundleID:(NSString *)bundleID {
    return [[NSWorkspace sharedWorkspace] URLForApplicationWithBundleIdentifier: bundleID];
}

+ (NSURL *)fileURLForApplicationWithName:(NSString *)name {
    NSString *path = nil;
	if ([name hasPrefix: @"/"]) {
		if ([[NSFileManager defaultManager] fileExistsAtPath: path]) path = name;
	} else {
		path = [[NSWorkspace sharedWorkspace] fullPathForApplication: name];
	}
    NSURL *url = nil;
    if (path) { // found it
        url = [NSURL fileURLWithPath: path];
    } else if ([[name pathExtension] caseInsensitiveCompare: @"app"] != NSOrderedSame) { // add .app extension and try again
		url = [self fileURLForApplicationWithName: [NSString stringWithFormat: @"%@.app", name]];
    }
    return url;
}

+ (NSURL *)fileURLForApplicationWithProcessID:(pid_t)pid {
    NSRunningApplication *app = [NSRunningApplication runningApplicationWithProcessIdentifier: pid];
    return app.bundleURL ?: app.executableURL;
}


// Get info on running applications

+ (pid_t)processIDForApplicationWithFileURL:(NSURL *)fileURL error:(NSError * __autoreleasing *)error {
    
    // TO DO: use NSWorkspace - (nullable NSRunningApplication *)launchApplicationAtURL:(NSURL *)url options:(NSWorkspaceLaunchOptions)options configuration:(NSDictionary<NSString *, id> *)configuration error:(NSError **)error; instead

    
    if (error) *error = nil;
    id fileID = AEMGetFileIDFromNSURL(fileURL);
    // check each process to see if it was launched from the specified bundle/executable
    for (NSRunningApplication *app in [[NSWorkspace sharedWorkspace] runningApplications]) {
        if ([fileID isEqual: AEMGetFileIDFromNSURL(app.bundleURL)]
         || [fileID isEqual: AEMGetFileIDFromNSURL(app.executableURL)]) return app.processIdentifier;
    }
    if (error) *error = AEMErrorWithInfo(kAEMProcessNotFoundError,
                                         [NSString stringWithFormat: @"No processes found for %@", fileURL.path]);
	return 0;
}

+ (NSAppleEventDescriptor *)descriptorForApplicationWithFileURL:(NSURL *)fileURL
                                                  launchOptions:(NSWorkspaceLaunchOptions)options
                                                          error:(NSError * __autoreleasing *)error {
    NSError *tempError = nil;
    pid_t pid = -1;
    // if user doesn't require a new instance, then see if app is running and get its PID if it is or tempError if not
    if (!(options & NSWorkspaceLaunchNewInstance)) {
        pid = [self processIDForApplicationWithFileURL: fileURL error: &tempError];
    }
    if (tempError || options & NSWorkspaceLaunchNewInstance) { // or launch new process if user requires a new instance/not already running
        if (tempError && tempError.code != kAEMProcessNotFoundError) {
            if (error) *error = tempError;
            return nil;
        }
        NSAppleEventDescriptor *evt;
        evt = [NSAppleEventDescriptor appleEventWithEventClass: kCoreEventClass
                                                       eventID: kAEOpenApplication
                                              targetDescriptor: [NSAppleEventDescriptor nullDescriptor]
                                                      returnID: kAutoGenerateReturnID
                                                 transactionID: kAnyTransactionID];
        pid = [self launchApplicationWithFileURL: fileURL launchOptions: options firstEvent: evt error: &tempError];
        if (tempError && tempError.code != kAEMProcessNotFoundError) {
            if (error) *error = tempError;
            return nil;
        }
    }
    return [NSAppleEventDescriptor descriptorWithProcessIdentifier: pid];
}


// Check if an application is running given its local/remote URL, process ID, or a target descriptor

+ (BOOL)isApplicationRunningWithURL:(NSURL *)url {
    if ([url isFileURL]) {
        NSURL *fileURL = AEMGetFileIDFromNSURL(url);
        for (NSRunningApplication *app in [[NSWorkspace sharedWorkspace] runningApplications]) {
            if ([fileURL isEqual: AEMGetFileIDFromNSURL(app.bundleURL)]
                || [fileURL isEqual: AEMGetFileIDFromNSURL(app.executableURL)]) return YES;
        }
        return NO;
    } else { // assume it's an eppc:// URL, and send it a noop event to see if it's handled
        NSData *data = [[url absoluteString] dataUsingEncoding: NSUTF8StringEncoding];
        NSAppleEventDescriptor *desc = [NSAppleEventDescriptor descriptorWithDescriptorType: typeFileURL data: data];
        return [self isApplicationRunningWithDescriptor: desc];

    }
}

+(BOOL)isApplicationRunningWithProcessID:(pid_t)pid {
    return [NSRunningApplication runningApplicationWithProcessIdentifier: pid] ? YES : NO;
}

+(BOOL)isApplicationRunningWithDescriptor:(NSAppleEventDescriptor *)desc {
	NSError *err = nil;
	AEMApplication *app = [[self alloc] initWithDescriptor: desc];
    // send 'noop' event - this returns error -1708 (or maybe no error) if process exists, or -600/-905 if not
	[[app eventWithEventClass: kASAppleScriptSuite eventID: kASLaunchEvent] sendWithError: &err];
	return !err ? YES : !(err.code == procNotFound || err.code == localOnlyErr); // not running/no network access
}


// Launch local applications

+ (pid_t)launchApplicationWithFileURL:(NSURL *)url
                        launchOptions:(NSWorkspaceLaunchOptions)options
                           firstEvent:(NSAppleEventDescriptor *)event
                                error:(NSError * __autoreleasing *)error {
	if (error) *error = nil;
    NSDictionary *configuration = @{NSWorkspaceLaunchConfigurationAppleEvent: event};
    NSRunningApplication *app = [[NSWorkspace sharedWorkspace] launchApplicationAtURL: url
                                                                              options: options
                                                                        configuration: configuration
                                                                                error: error];
    if (!app) return 0;
    return app.processIdentifier;
}


// Convenience methods for sending basic run/open/launch events, launching application if necessary

+ (pid_t)runApplication:(NSURL *)appFileURL error:(NSError * __autoreleasing *)error {
	NSAppleEventDescriptor *evt;
	evt = [NSAppleEventDescriptor appleEventWithEventClass: kCoreEventClass
												   eventID: kAEOpenApplication
										  targetDescriptor: [NSAppleEventDescriptor nullDescriptor]
												  returnID: kAutoGenerateReturnID
											 transactionID: kAnyTransactionID];
	return [self launchApplicationWithFileURL: appFileURL launchOptions: kAEMDefaultLaunchOptions firstEvent: evt error: error];
}

+ (pid_t)openDocuments:(id)documentFiles inApplication:(NSURL *)appFileURL error:(NSError * __autoreleasing *)error {
	NSAppleEventDescriptor *evt;
	evt = [NSAppleEventDescriptor appleEventWithEventClass: kCoreEventClass
												   eventID: kAEOpenDocuments
										  targetDescriptor: [NSAppleEventDescriptor nullDescriptor]
												  returnID: kAutoGenerateReturnID
											 transactionID: kAnyTransactionID];
    NSAppleEventDescriptor *param = [[AEMCodecs defaultCodecs] pack: documentFiles error: error];
    if (!param) return 0;
	[evt setDescriptor: param forKeyword: keyDirectObject];
	return [self launchApplicationWithFileURL: appFileURL launchOptions: kAEMDefaultLaunchOptions firstEvent: evt error: error];
}

+ (pid_t)launchApplicationWithFileURL:(NSURL *)appFileURL error:(NSError * __autoreleasing *)error { // (not a shortcut for the above, despite the similar name)
    NSAppleEventDescriptor *evt;
	evt = [NSAppleEventDescriptor appleEventWithEventClass: kASAppleScriptSuite
												   eventID: kASLaunchEvent
										  targetDescriptor: [NSAppleEventDescriptor nullDescriptor]
												  returnID: kAutoGenerateReturnID
											 transactionID: kAnyTransactionID];
	return [self launchApplicationWithFileURL: appFileURL launchOptions: kAEMDefaultLaunchOptions firstEvent: evt error: error];
}


/*******/

// initializers

// clients shouldn't call this initializer directly; use one of the methods below
- (instancetype)initWithTargetType:(AEMTargetType)targetType_
                              data:(id)targetData_
                     launchOptions:(NSWorkspaceLaunchOptions)options
                             error:(NSError * __autoreleasing *)error {
	if (!targetData_) return nil;
	self = [super init];
	if (!self) return self;
	// description
	targetType = targetType_;
	targetData = targetData_;
    // event classes
    AppleEventDescriptorClass = NSAppleEventDescriptor.class;
    AEMEventClass = AEMEvent.class;
	// address desc
	switch (targetType) {
		case AEMTargetFileURL:
			addressDesc = [self.class descriptorForApplicationWithFileURL: targetData launchOptions: options error: error];
			break;
		case AEMTargetEppcURL:
			addressDesc = [NSAppleEventDescriptor descriptorWithApplicationURL: targetData];
			break;
		case AEMTargetCurrent:
			addressDesc = [NSAppleEventDescriptor currentProcessDescriptor];
			break;
		default:
			addressDesc = targetData;
	}
	if (!addressDesc) return nil;
	// misc
	defaultCodecs = [[AEMCodecs alloc] init];
	transactionID = kAnyTransactionID;
	return self;
}

// initializers

- (instancetype)init {
	NSError *error;
	return [self initWithTargetType: AEMTargetCurrent data: NSNull.null launchOptions: kAEMDefaultLaunchOptions error: &error];
}

- (instancetype)initWithBundleID:(NSString *)bundleID
                   launchOptions:(NSWorkspaceLaunchOptions)options
                           error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
    NSURL *url = [[NSWorkspace sharedWorkspace] URLForApplicationWithBundleIdentifier: bundleID];
    if (!url) {
        if (error) *error = AEMErrorWithInfo(kAEMApplicationNotFoundError,
                                             [NSString stringWithFormat: @"Application not found: '%@'", bundleID]);
        return nil;
    }
	return [self initWithTargetType: AEMTargetFileURL data: url launchOptions: options error: error];
}

- (instancetype)initWithName:(NSString *)name
               launchOptions:(NSWorkspaceLaunchOptions)options
                       error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
	NSURL *url = [self.class fileURLForApplicationWithName: name];
    if (!url) {
        if (error) *error = AEMErrorWithInfo(kAEMApplicationNotFoundError,
                                             [NSString stringWithFormat: @"Application not found: '%@'", name]);
        return nil;
    }
	return [self initWithTargetType: AEMTargetFileURL data: url launchOptions: options error: error];
}

- (instancetype)initWithURL:(NSURL *)url
              launchOptions:(NSWorkspaceLaunchOptions)options
                      error:(NSError * __autoreleasing *)error {
	if ([url isFileURL]) {
		return [self initWithTargetType: AEMTargetFileURL data: url launchOptions: options error: error];
	} else {
		return [self initWithTargetType: AEMTargetEppcURL data: url launchOptions: kAEMDefaultLaunchOptions error: error];
    }
}

- (instancetype)initWithProcessID:(pid_t)pid {
    NSAppleEventDescriptor *desc = [NSAppleEventDescriptor descriptorWithProcessIdentifier: pid];
	return [self initWithTargetType: AEMTargetProcessID data: desc launchOptions: kAEMDefaultLaunchOptions error: nil];
}

- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
	return [self initWithTargetType: AEMTargetDescriptor data: desc launchOptions: kAEMDefaultLaunchOptions error: nil];
}


// shortcuts for above

- (instancetype)initWithBundleID:(NSString *)bundleID {
	return [self initWithBundleID: bundleID launchOptions: kAEMDefaultLaunchOptions error: nil];
}

- (instancetype)initWithName:(NSString *)name {
	return [self initWithName: name launchOptions: kAEMDefaultLaunchOptions error: nil];
}

- (instancetype)initWithURL:(NSURL *)url {
	return [self initWithURL: url launchOptions: kAEMDefaultLaunchOptions error: nil];
}


// comparison, hash support

- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class] || targetType != [object targetType]) return NO;
	id targetData2 = [object targetData];
	if ([targetData isKindOfClass: NSAppleEventDescriptor.class]) {
		// NSAppleEventDescriptors compare for object identity only, so do a more thorough comparison here
		return ([targetData2 isKindOfClass: NSAppleEventDescriptor.class]
			&& ([targetData descriptorType] == [targetData2 descriptorType])
			&& [[targetData data] isEqualToData: [targetData2 data]]);
    }
	return ([targetData isEqual: targetData2] || (targetData == nil && targetData2 == nil));
}

- (AEMTargetType)targetType {
	return targetType;
}

- (id)targetData {
	return targetData;
}

- (NSUInteger)hash {
	return [[self description] hash];
}


// get address desc

- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error {
	return addressDesc;
}

- (NSAppleEventDescriptor *)descriptor {
	return addressDesc;
}


// display

- (NSString *)description {
	pid_t pid;
	switch (targetType) {
		case AEMTargetFileURL:
		case AEMTargetEppcURL:
			return [NSString stringWithFormat: @"<AEMApplication url=%@>", AEMFormatObject(targetData)];
		case AEMTargetProcessID:
			[[addressDesc data] getBytes: &pid length: sizeof(pid_t)];
			return [NSString stringWithFormat: @"<AEMApplication pid=%i>", pid];
		case AEMTargetCurrent:
			return @"<AEMApplication current>";
		default:
			return [NSString stringWithFormat: @"<AEMApplication desc=%@>", AEMFormatObject(addressDesc)];
	}
}


// create new AEMEvent object

- (id)eventWithEventClass:(AEEventClass)eventClass
                  eventID:(AEEventID)eventID
                 returnID:(AEReturnID)returnID
                   codecs:(id <AEMCodecsProtocol>)codecs {
    NSAppleEventDescriptor *desc = [self.AppleEventDescriptorClass appleEventWithEventClass: eventClass
                                                                                    eventID: eventID
                                                                           targetDescriptor: addressDesc
                                                                                   returnID: returnID
                                                                              transactionID: transactionID];
	if (!desc) return nil;
	return [[[self AEMEventClass] alloc] initWithApplication: self event: desc codecs: codecs];
}

- (id)eventWithEventClass:(AEEventClass)eventClass eventID:(AEEventID)eventID {
	return [self eventWithEventClass: eventClass eventID: eventID returnID: kAutoGenerateReturnID codecs: defaultCodecs];
}


// reconnect to a local application specified by path

- (BOOL)reconnect {
	return [self reconnectWithError: nil];
}

- (BOOL)reconnectWithError:(NSError * __autoreleasing *)error {
	if (error) *error = nil;
	if (targetType == AEMTargetFileURL) {
        NSAppleEventDescriptor *newAddress;
		newAddress = [self.class descriptorForApplicationWithFileURL: targetData launchOptions: launchOptions error: error];
		if (newAddress) {
			addressDesc = newAddress;
			return YES;
		}
	}
	return NO;
}


// transaction support

- (BOOL)beginTransactionWithError:(NSError * __autoreleasing *)error {
	return [self beginTransactionWithSession: nil error: error];
}

- (BOOL)beginTransactionWithSession:(id)session error:(NSError * __autoreleasing *)error {
	@synchronized(self) {
        id transactionIDObj = nil;
		if (error) *error = nil;
		if (transactionID == kAnyTransactionID) {
			AEMEvent *evt = [self eventWithEventClass: kAEMiscStandards eventID: kAEBeginTransaction];
			if (session) [evt setParameter: session forKeyword: keyDirectObject];
			[evt setUnpackFormat: kAEMUnpackAsItem type: typeSInt32];
			transactionIDObj = [evt sendWithError: error];
			if (transactionIDObj) transactionID = [transactionIDObj intValue];
		}
        if (error) *error =  AEMErrorWithInfo(errAEInTransaction, @"Transaction is already active.");
        return (transactionIDObj != nil);
	}
}

- (BOOL)endTransactionWithError:(NSError * __autoreleasing *)error {
	@synchronized(self) {
        id result = nil;
		if (error) *error = nil;
		if (transactionID != kAnyTransactionID) {
			AEMEvent *evt = [self eventWithEventClass: kAEMiscStandards eventID: kAEEndTransaction];
			result = [evt sendWithError: error];
		}
        if (error) *error =  AEMErrorWithInfo(errAENoSuchTransaction, @"Transaction isn't active.");
        return (result != nil);
	}
}

- (BOOL)abortTransactionWithError:(NSError * __autoreleasing *)error {
	@synchronized(self) {
        id result = nil;
		if (error) *error = nil;
		if (transactionID != kAnyTransactionID) {
			AEMEvent *evt = [self eventWithEventClass: kAEMiscStandards eventID: kAETransactionTerminated];
			result = [evt sendWithError: error];
		}
        if (error) *error = AEMErrorWithInfo(errAENoSuchTransaction, @"Transaction isn't active.");
        return (result != nil);
	}
}

@end
