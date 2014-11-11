//
//  AEBAppData.m
//

#import "AEBAppData.h"


// caution: this does not typecheck targetData; static glues should use compile-time checking,
// dynamic bridges should typecheck targetData before using it in an AppData instance


/**********************************************************************/


@implementation AEBAppData

@synthesize targetType, targetData, launchOptions, isRunning, relaunchMode;

- (instancetype)initWithApplicationClass:(Class)appClass
                              targetType:(AEBTargetType)type
                              targetData:(id)data
                            relaunchMode:(AEBRelaunchMode)mode
                           launchOptions:(NSWorkspaceLaunchOptions)options {
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
    return [self initWithApplicationClass: AEMApplication.class
                               targetType: type
                               targetData: data
                             relaunchMode: kAEBRelaunchLimited
                              launchOptions: kAEMDefaultLaunchOptions];
}

// create target AEMApplication instance (this will launch local process if not already running)

- (BOOL)connectWithError:(NSError * __autoreleasing *)error {
	if (target) {
		target = nil;
	}
	switch (targetType) {
		case kAEBTargetCurrent:
			target = [[aemApplicationClass alloc] init];
			break;
		case kAEBTargetName:
			target = [[aemApplicationClass alloc] initWithName: targetData launchOptions: launchOptions error: error];
			break;
		case kAEBTargetBundleID:
			target = [[aemApplicationClass alloc] initWithBundleID: targetData launchOptions: launchOptions error: error];
			break;
		case kAEBTargetURL:
			target = [[aemApplicationClass alloc] initWithURL: targetData launchOptions: launchOptions error: error];
			break;
		case kAEBTargetProcessID:
			target = [[aemApplicationClass alloc] initWithProcessID: [(NSNumber *)targetData intValue]];
			break;
		case kAEBTargetDescriptor:
			target = [[aemApplicationClass alloc] initWithDescriptor: targetData];
	}
	return target != nil;
}

- (id)targetWithError:(NSError * __autoreleasing *)error { // returns underlying AEMApplication instance
	if (!target && ![self connectWithError: error]) return nil;
	return target;
}

- (BOOL)isRunning { // TO DO: FIX: move -isRunning to AEMApplication and rework to use same PID as its AEAddressDesc (i.e. its purpose is to determine if that particular application object is still valid; AEBAppData should only fall back to name/bundleID if it hasn't yet created an AEBApplication object [caveat it also needs to check launchOptions in case user has specified a new process instance should be launched, in which case !target == NO])
	NSURL *url;
	BOOL result;
	switch (targetType) {
		case kAEBTargetName:
			url = [AEMApplication fileURLForApplicationWithName: targetData];
			result = [AEMApplication isApplicationRunningWithURL: url];
			break;
		case kAEBTargetBundleID:
            url = [AEMApplication fileURLForApplicationWithBundleID: targetData];
			result = [AEMApplication isApplicationRunningWithURL: url];
			break;
		case kAEBTargetURL:
			result = [AEMApplication isApplicationRunningWithURL: targetData];
			break;
		case kAEBTargetProcessID:
			result = [AEMApplication isApplicationRunningWithProcessID: [(NSNumber *)targetData intValue]];
			break;
		case kAEBTargetDescriptor:
			result = [AEMApplication isApplicationRunningWithDescriptor: targetData];
			break;
		default: // kAEBTargetCurrent
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
		case kAEBTargetName:
			fileURL = [AEMApplication fileURLForApplicationWithName: targetData];
			break;
		case kAEBTargetBundleID:
			fileURL = [AEMApplication fileURLForApplicationWithBundleID: targetData];
			break;
		case kAEBTargetURL:
			if ([targetData isFileURL]) fileURL = targetData;
            break;
        default:
            *error = AEMErrorWithInfo(1, [NSString stringWithFormat: @"Invalid target type: %i", targetType]);
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

