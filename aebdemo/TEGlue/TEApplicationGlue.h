//
// TEApplicationGlue.h
// TextEdit
// (aebglue 0.6.0)
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"
#import "TESymbolGlue.h"
#import "TESpecifierGlue.h"

@interface TEApplication : TESpecifier

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_;

/* initialisers */

+ (id)application;
+ (instancetype)applicationWithName:(NSString *)name;
+ (instancetype)applicationWithURL:(NSURL *)url;
+ (instancetype)applicationWithBundleID:(NSString *)bundleID;
+ (instancetype)applicationWithProcessID:(pid_t)pid;
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc;
- (instancetype)init;
- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithBundleID:(NSString *)bundleID;
- (instancetype)initWithProcessID:(pid_t)pid;
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc;

/* misc */

- (TESpecifier *)specifierWithObject:(id)object;
@end

