//
//  AEBAppData.h
//
//  Extends AEMCodecs to manage the target AEMApplication object as well.
//
//  Important: static and dynamic glue generators must disambiguate any
//  dictionary-defined keyword that starts with 'AEM' or 'AEB' as these
//  these prefixes are reserved for AEB's own use.
//

#import "AEMApplication.h"
#import "AEMCodecs.h"
#import "AEMUtils.h"


/**********************************************************************/
// typedefs

typedef enum {
	kAEBTargetCurrent = 1,
	kAEBTargetName,
	kAEBTargetURL,
	kAEBTargetBundleID,
	kAEBTargetProcessID,
	kAEBTargetDescriptor,
} AEBTargetType;


/**********************************************************************/


// base class for all high-level bridges
@interface AEBAppData : AEMCodecs {
	Class aemApplicationClass;
	AEMApplication *target;
}

@property (readonly) AEBTargetType targetType;
@property (readonly) id targetData;
@property (readonly) NSWorkspaceLaunchOptions launchOptions;

// is target application running?
@property (readonly) BOOL isRunning;

// determines if an application specified by path should be relaunched if
// its AEAddressDesc is no longer valid (i.e. application has quit/restarted)
@property (readwrite) AEBRelaunchMode relaunchMode;


- (instancetype)initWithApplicationClass:(Class)appClass
                              targetType:(AEBTargetType)type
                              targetData:(id)data
                            relaunchMode:(AEBRelaunchMode)mode
                           launchOptions:(NSWorkspaceLaunchOptions)options;


- (instancetype)initWithTargetType:(AEBTargetType)type targetData:(id)data;

// creates AEMApplication instance for target application; used internally
- (BOOL)connectWithError:(NSError * __autoreleasing *)error;

// returns AEMApplication instance for target application
- (id)targetWithError:(NSError * __autoreleasing *)error;

// launch the target application without sending it the usual 'run' event;
// equivalent to 'launch' command in AppleScript.
- (BOOL)launchApplicationWithError:(NSError * __autoreleasing *)error;

@end

