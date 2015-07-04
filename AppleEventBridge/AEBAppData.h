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

typedef NS_ENUM(NSUInteger, AEBTargetType) {
	AEBTargetCurrent = 1,
	AEBTargetName,
	AEBTargetURL,
	AEBTargetBundleID,
	AEBTargetProcessID,
	AEBTargetDescriptor,
}; // used by AppData instances; client code generally shouldn't need to use it


typedef NS_ENUM(NSUInteger, AEBRelaunchMode) {
    AEBRelaunchNever,
    AEBRelaunchLimited, // automatically relaunches application only if a 'run' event is being sent (this is the default)
    AEBRelaunchAlways   // (AppleScript behavior)
}; // specifies behavior when an event is being sent to a local process that has since terminated

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


- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                     launchOptions:(NSWorkspaceLaunchOptions)options
                      relaunchMode:(AEBRelaunchMode)mode
               aemApplicationClass:(Class)appClass; // hook; e.g. an OSA component can supply an AEMApplication subclass with custom AESend hook


- (instancetype)initWithTargetType:(AEBTargetType)type targetData:(id)data;

// creates AEMApplication instance for target application; used internally
- (BOOL)connectWithError:(NSError * __autoreleasing *)error; // error may be nil

// returns AEMApplication instance for target application
- (AEMApplication *)targetWithError:(NSError * __autoreleasing *)error; // error may be nil

// launch the target application without sending it the usual 'run' event;
// equivalent to 'launch' command in AppleScript.
- (BOOL)launchApplicationWithError:(NSError * __autoreleasing *)error; // error may be nil

@end

