//
//  AEMApplication.h
//
//  Creates and manages AEAddressDesc for target process, and provides
//  methods for creating new AEMEvent instances for building and sending
//  Apple events to that process. Also provides convenience methods for
//  locating and launching applications via LaunchServices.
//
//  Includes hooks for setting custom Create and/or Send procedures for
//  use in situations where the Carbon Apple Event Manager's default
//  AECreateAppleEvent and/or AESendMessage functions need to be extended
//  or replaced (e.g. within OSA language components).
//
//  Note: classes with AEM... prefixes provide mid-level OO wrappers
//  around low-level procedural Apple Event Manager APIs. They are
//  roughly analogous to using AppleScript's raw chevron syntax.
//  High-level APIs that provide terminology support and [nearly] full
//  emulation of AppleScript's various quirks and foibles (which many)
//  apps have come to rely on and treat as their de facto "specification"
//  use the AEB ("Apple Event Bridge") prefix to distinguish themselves
//  from the lower AEM layer upon which they are built.
//

#import <AppKit/AppKit.h>

#import "AEMCodecs.h"
#import "AEMEvent.h"
#import "AEMFormatter.h"
#import "AEMUtils.h"


/**********************************************************************/
// typedefs

typedef NS_ENUM(NSUInteger, AEMTargetType) {
	AEMTargetCurrent = 1,
	AEMTargetFileURL,
	AEMTargetEppcURL,
	AEMTargetProcessID,
	AEMTargetDescriptor,
};


#define kAEMDefaultLaunchOptions (NSWorkspaceLaunchWithoutActivation)


/**********************************************************************/
// Application class

@interface AEMApplication : NSObject <AEMSelfPackingProtocol> {
	AEMTargetType targetType;
	id targetData;
	NSAppleEventDescriptor *addressDesc;
	AETransactionID transactionID;
    NSWorkspaceLaunchOptions launchOptions;
}

// hooks for specifying classes used to create, pack, and send AppleEvents
@property (retain) Class AppleEventDescriptorClass, AEMEventClass;
@property (retain) id <AEMCodecsProtocol> defaultCodecs;

// Utility class methods

// Find application from which this process was launched.
+ (NSURL *)fileURLForCurrentApplication;

// Find application by file name; returns nil if not found. Full path is also acceptable; .app suffix is optional.
+ (NSURL *)fileURLForApplicationWithName:(NSString *)name;

// Find application by bundle ID; returns nil if not found.
+ (NSURL *)fileURLForApplicationWithBundleID:(NSString *)bundleID;

// Find application by Unix process ID; returns nil if not found.
+ (NSURL *)fileURLForApplicationWithProcessID:(pid_t)pid;

// Get Unix process ID of first process launched from specified application
+ (pid_t)processIDForApplicationWithFileURL:(NSURL *)fileURL error:(NSError * __autoreleasing *)error;

// Creates and returns a typeKernelProcessID address descriptor, launching the application if necessary.
+ (NSAppleEventDescriptor *)descriptorForApplicationWithFileURL:(NSURL *)url
                                                  launchOptions:(NSWorkspaceLaunchOptions)options
                                                          error:(NSError * __autoreleasing *)error;


// Check if specified application is running

// If a file:// URL is given, e.g. [NSURL fileURLWithPath: @"/Applications/Calendar.app"],
// does a local process launched from that application file exist? Or, if an eppc://
// URL is given, e.g. [NSURL URLWithString: @"eppc://mac12.local/TextEdit"], does the
// remote process identified by that URL exist?
// Returns false if process doesn't exist or file isn't found/access isn't allowed.
+(BOOL)isApplicationRunningWithURL:(NSURL *)url;

// Is there a local application process with the given Unix process id?
+(BOOL)isApplicationRunningWithProcessID:(pid_t)pid;

// Does an application process specified by the given AEAddressDesc exist?
// Returns false if process doesn't exist, or if access isn't allowed.
+(BOOL)isApplicationRunningWithDescriptor:(NSAppleEventDescriptor *)desc;



// Start a local application using NSWorkspace.
// (Commonly used options: NSWorkspaceLaunchWithoutActivation | NSWorkspaceLaunchNewInstance | NSWorkspaceLaunchAndHide)
+ (pid_t)launchApplicationWithFileURL:(NSURL *)fileURL
                        launchOptions:(NSWorkspaceLaunchOptions)options
                           firstEvent:(NSAppleEventDescriptor *)firstEvent
                                error:(NSError * __autoreleasing *)error;


// convenience methods for sending `run`, `open`, `launch` events to a local app identified by file URL:

// tell application "path:to:app" to run
+ (pid_t)runApplication:(NSURL *)appFileURL error:(NSError * __autoreleasing *)error;

// tell application "path:to:app" to open theFiles
+ (pid_t)openDocuments:(id)files inApplication:(NSURL *)appFileURL error:(NSError * __autoreleasing *)error;

// tell application "path:to:app" to launch
+ (pid_t)launchApplicationWithFileURL:(NSURL *)appFileURL error:(NSError * __autoreleasing *)error;


/*******/

// designated initialiser; clients shouldn't call this directly but use one of the following methods

- (instancetype)initWithTargetType:(AEMTargetType)targetType_
                              data:(id)targetData_
                     launchOptions:(NSWorkspaceLaunchOptions)options
                             error:(NSError * __autoreleasing *)error;


/*
 * clients should call one of the following methods to initialize AEMApplication object
 *
 * Note: if an error occurs when finding/launching an application by name/bundle ID/file URL, additional
 * error information may be returned via the error argument.
 */

- (instancetype)initWithName:(NSString *)name
               launchOptions:(NSWorkspaceLaunchOptions)options
                       error:(NSError * __autoreleasing *)error;

- (instancetype)initWithURL:(NSURL *)url
              launchOptions:(NSWorkspaceLaunchOptions)options // note: launch options only apply to file:// URLs, not eppc://
                      error:(NSError * __autoreleasing *)error;

- (instancetype)initWithBundleID:(NSString *)bundleID
                   launchOptions:(NSWorkspaceLaunchOptions)options
                           error:(NSError * __autoreleasing *)error;

- (instancetype)initWithProcessID:(pid_t)pid;

- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc;

// shortcuts for above

- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithBundleID:(NSString *)bundleID;

- (instancetype)initWithURL:(NSURL *)url;


// comparison, hash support

- (BOOL)isEqual:(id)object;

- (AEMTargetType)targetType; // used by -isEqual:

- (id)targetData; // used by -isEqual:


// get address desc

- (NSAppleEventDescriptor *)descriptor;


// create new AEMEvent object

- (id)eventWithEventClass:(AEEventClass)eventClass
                  eventID:(AEEventID)eventID
				 returnID:(AEReturnID)returnID
				   codecs:(id <AEMCodecsProtocol>)codecs;

// shortcut for above, using kAutoGenerateReturnID and standard AEMCodecs
- (id)eventWithEventClass:(AEEventClass)eventClass eventID:(AEEventID)eventID;


// reconnect to a local application originally specified by name, bundle ID or file URL

- (BOOL)reconnect;

- (BOOL)reconnectWithError:(NSError * __autoreleasing *)error;


// transaction support

- (BOOL)beginTransactionWithError:(NSError * __autoreleasing *)error;

- (BOOL)beginTransactionWithSession:(id)session error:(NSError * __autoreleasing *)error;

- (BOOL)endTransactionWithError:(NSError * __autoreleasing *)error;

- (BOOL)abortTransactionWithError:(NSError * __autoreleasing *)error;



@end

