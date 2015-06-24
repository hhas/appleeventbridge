//
//  AEBSpecifier.h
//
//  Base class for static ObjC glues' own XXSpecifier class.
//
//  AEBDynamic-based bridges could also use this as base class to their own specifier
//  class(es) if they wished, although it's more common for them to implement their
//  own wrapper classes around AEBAppData and AEMQuery instances.
//

#import "AEMApplication.h"
#import "AEMSpecifier.h"
#import "AEMTestClause.h"
#import "AEMUtils.h"

#import "AEBAppData.h"
#import "AEBSymbol.h"


/**********************************************************************/
// Specifier base


@interface AEBSpecifier : NSObject <AEMSelfPackingProtocol, AEMQueryProtocol>

+ (instancetype)specifierWithAppData:(AEBAppData *)appData_ aemQuery:(AEMQuery *)aemQuery_;

- (instancetype)initWithAppData:(AEBAppData *)appData_ aemQuery:(AEMQuery *)aemQuery_;


// internal objects may be accessed for special use
@property (readonly) AEBAppData *aebAppData;
@property (readonly) AEMQuery *aemQuery;

// TO DO: most/all of the following should only be public on application objects; move to category for use by glues?

// should application be automatically relaunched when sending command if no longer running?
@property AEBRelaunchMode relaunchMode;

// is target application running?
@property (readonly) BOOL isRunning;

// launch the target application without sending it the usual 'run' event;
// equivalent to 'launch' command in AppleScript.
- (BOOL)launchApplicationWithError:(NSError * __autoreleasing *)error; // may be nil

- (BOOL)launchApplication; // convenience shortcut for the above


// restart local application and/or update AEAddressDesc if needed
// (typically used after application has quit; refreshes existing
// application object without the need to recreate it)
// note: only works for apps specified by name/path/bundle ID

- (BOOL)reconnectApplicationWithError:(NSError * __autoreleasing *)error;

- (BOOL)reconnectApplication;

// transaction support

- (BOOL)beginTransactionWithError:(NSError * __autoreleasing *)error;

- (BOOL)beginTransactionWithSession:(id)session error:(NSError * __autoreleasing *)error;

- (BOOL)endTransactionWithError:(NSError * __autoreleasing *)error;

- (BOOL)abortTransactionWithError:(NSError * __autoreleasing *)error;

@end


