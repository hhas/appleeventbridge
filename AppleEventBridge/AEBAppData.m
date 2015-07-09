//
//  AEBAppData.m
//

#import "AEBAppData.h"


// caution: this does not typecheck targetData; static glues should use compile-time checking,
// dynamic bridges should typecheck targetData before using it in an AppData instance


/**********************************************************************/


@implementation AEBAppData

@synthesize targetType, targetData, launchOptions, isRunning, relaunchMode;

- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                     launchOptions:(NSWorkspaceLaunchOptions)options
                      relaunchMode:(AEBRelaunchMode)mode
               aemApplicationClass:(Class)appClass {
	self = [super init];
	if (!self) return self;
	aemApplicationClass = appClass;
	targetType = type;
	targetData = data;
    launchOptions = options;
	target = nil;
	[self setRelaunchMode: mode];
	return self;
}


- (instancetype)initWithTargetType:(AEBTargetType)type targetData:(id)data {
    return [self initWithTargetType: type
                         targetData: data
                      launchOptions: kAEMDefaultLaunchOptions
                       relaunchMode: AEBRelaunchLimited
                aemApplicationClass: AEMApplication.class];
}

// create target AEMApplication instance (this will launch local process if not already running)

- (BOOL)connectWithError:(NSError * __autoreleasing *)error {
	if (target) {
		target = nil;
	}
	switch (targetType) {
		case AEBTargetCurrent:
			target = [[aemApplicationClass alloc] init];
			break;
		case AEBTargetName:
			target = [[aemApplicationClass alloc] initWithName: targetData launchOptions: launchOptions error: error];
			break;
		case AEBTargetBundleID:
			target = [[aemApplicationClass alloc] initWithBundleID: targetData launchOptions: launchOptions error: error];
			break;
		case AEBTargetURL:
			target = [[aemApplicationClass alloc] initWithURL: targetData launchOptions: launchOptions error: error];
			break;
		case AEBTargetProcessID:
			target = [[aemApplicationClass alloc] initWithProcessID: [(NSNumber *)targetData intValue]];
			break;
		case AEBTargetDescriptor:
			target = [[aemApplicationClass alloc] initWithDescriptor: targetData];
	}
	return target != nil;
}

- (AEMApplication *)targetWithError:(NSError * __autoreleasing *)error { // returns underlying AEMApplication instance
	if (!target && ![self connectWithError: error]) return nil;
	return target;
}

- (BOOL)isRunning { // TO DO: FIX: move -isRunning to AEMApplication and rework to use same PID as its AEAddressDesc (i.e. its purpose is to determine if that particular application object is still valid; AEBAppData should only fall back to name/bundleID if it hasn't yet created an AEBApplication object [caveat it also needs to check launchOptions in case user has specified a new process instance should be launched, in which case !target == NO])
	NSURL *url;
	BOOL result;
	switch (targetType) {
		case AEBTargetName:
			url = [AEMApplication fileURLForApplicationWithName: targetData];
			result = [AEMApplication isApplicationRunningWithURL: url];
			break;
		case AEBTargetBundleID:
            url = [AEMApplication fileURLForApplicationWithBundleID: targetData];
			result = [AEMApplication isApplicationRunningWithURL: url];
			break;
		case AEBTargetURL:
			result = [AEMApplication isApplicationRunningWithURL: targetData];
			break;
		case AEBTargetProcessID:
			result = [AEMApplication isApplicationRunningWithProcessID: [(NSNumber *)targetData intValue]];
			break;
		case AEBTargetDescriptor:
			result = [AEMApplication isApplicationRunningWithDescriptor: targetData];
			break;
		default: // AEBTargetCurrent
			result = YES;
	}
	return result;
}

- (BOOL)launchApplicationWithError:(NSError * __autoreleasing *)error {
	NSURL *fileURL = nil;
	NSError * __autoreleasing err; // TO DO: is this appropriate? might be better if -launchApplication..., etc. returned NSRunningApplication*/nil instead of pid_t (callers can then call -[NSRunningApplication processIdentifier] to get pid)
	if (!error) error = &err;
	*error = nil;
	switch (targetType) {
		case AEBTargetName:
			fileURL = [AEMApplication fileURLForApplicationWithName: targetData];
			break;
		case AEBTargetBundleID:
			fileURL = [AEMApplication fileURLForApplicationWithBundleID: targetData];
			break;
		case AEBTargetURL:
			if ([targetData isFileURL]) fileURL = targetData;
            break;
        default:
            *error = AEMErrorWithInfo(1, [NSString stringWithFormat: @"Invalid target type: %lu", (unsigned long)targetType]);
            return NO;
	}
	if (fileURL) { // launch local app
		[AEMApplication launchApplicationWithFileURL: fileURL error: error];
		if (!*error) { // TO DO: see above; would be cleaner if launch method returned object/nil instead of int
			AEMApplication *app = [self targetWithError: error];
            if (!app) return NO;
			return [app reconnectWithError: error];
		}
	} else { // just send 'launch' event to remote app - if app is not already running, an error will occur
		AEMApplication *app = [self targetWithError: error];
		if (!app) return NO;
		[[app eventWithEventClass: kASAppleScriptSuite eventID: kASLaunchEvent] sendWithError: error];
		if ([*error code] == -1708) { // 'event not handled' error is normal for 'launch' events, so ignore it
			*error = nil;
			return YES;
		}
	}
	return NO;
}

@end

