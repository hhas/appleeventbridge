//
//  AEBSpecifier.h
//
//  Base class for static ObjC glues' own XXSpecifier class.
//

#import "AEMApplication.h"
#import "AEMSpecifier.h"
#import "AEMTestSpecifier.h"
#import "AEMUtils.h"

#import "AEBStaticSymbol.h"


@class AEBStaticAppData;

/**********************************************************************/
// Specifier base


@interface AEBSpecifier : NSObject {
	AEBStaticAppData *appData;
    AEMQuery *aemQuery;
}

+ (instancetype)specifierWithAppData:(AEBStaticAppData *)appData_ aemQuery:(AEMQuery *)aemQuery_;

- (instancetype)initWithAppData:(AEBStaticAppData *)appData_ aemQuery:(AEMQuery *)aemQuery_;

- (NSAppleEventDescriptor *)AEBPackSelf:(id)codecs error:(NSError * __autoreleasing *)error;

// internal objects may be accessed for special use
@property (readonly) id AEBAppData, AEMQuery;

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

// get/set shortcuts

// shortcut for [[[ref set] to: value] send]
- (id)setItem:(id)data;
- (id)setItem:(id)data error:(NSError * __autoreleasing *)error;

// shortcut for [[ref get] send]
- (id)getItem; 
- (id)getItemWithError:(NSError * __autoreleasing *)error;

// shortcut for [[[ref get] returnList] send]
- (id)getList;
- (id)getListWithError:(NSError * __autoreleasing *)error;

// shortcut for [[[[ref get] requestedType: descType] returnType: descType] send]
- (id)getItemOfType:(DescType)type;
- (id)getItemOfType:(DescType)type error:(NSError * __autoreleasing *)error;

// shortcut for [[[[ref get] requestedType: descType] returnListOfType: descType] send]
- (id)getListOfType:(DescType)type;
- (id)getListOfType:(DescType)type error:(NSError * __autoreleasing *)error;

/*
 * shortcuts for getting numerical property values as C primitives
 * (note: if result is 0, check if an NSError is also returned to determine if command was successful or if an error occurred)
 */

// shortcut for [[[[[ref get] requestedType: typeSInt64] returnType: typeSInt64] send] integerValue]
- (NSInteger)getIntegerWithError:(NSError * __autoreleasing *)error;

// shortcut for [[[[[ref get] requestedType: typeIEEE64BitFloatingPoint] returnType: typeIEEE64BitFloatingPoint] send] doubleValue]
- (double)getDoubleWithError:(NSError * __autoreleasing *)error;


/*
 * specifier roots and reference forms
 */

/* +app, +con, +its methods can be used in place of TEApp, TECon, TEIts macros */

+ (instancetype)app;
+ (instancetype)con;
+ (instancetype)its;

/* ordinal selectors */

- (instancetype)first;
- (instancetype)middle;
- (instancetype)last;
- (instancetype)any;

/* by-index, by-name, by-id selectors */

- (instancetype)at:(int)index;
- (instancetype)byIndex:(id)index;
- (instancetype)byName:(id)name;
- (instancetype)byID:(id)id_;

/* by-relative-position selectors */

- (instancetype)previous:(AEBSymbol *)class_;
- (instancetype)next:(AEBSymbol *)class_;

/* by-range selector */

- (instancetype)at:(int)fromIndex to:(int)toIndex;
- (instancetype)byRange:(id)fromObject to:(id)toObject;

/* by-test selector */

- (instancetype)byTest:(id)testQuery;

/* insertion location selectors */

- (instancetype)beginning;
- (instancetype)end;
- (instancetype)before;
- (instancetype)after;

/* Comparison and logic tests */

- (instancetype)greaterThan:(id)object;
- (instancetype)greaterOrEquals:(id)object;
- (instancetype)equals:(id)object;
- (instancetype)notEquals:(id)object;
- (instancetype)lessThan:(id)object;
- (instancetype)lessOrEquals:(id)object;
- (instancetype)beginsWith:(id)object;
- (instancetype)endsWith:(id)object;
- (instancetype)contains:(id)object;
- (instancetype)isIn:(id)object;
- (instancetype)AND:(id)remainingOperands;
- (instancetype)OR:(id)remainingOperands;
- (instancetype)NOT;
@end


