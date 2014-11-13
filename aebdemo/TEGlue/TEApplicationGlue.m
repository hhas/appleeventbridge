//
// TEApplicationGlue.m
// TextEdit
// (AppleEventBridge 1.0)
//

#import "TEApplicationGlue.h"

@implementation TEApplication

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_ {
    AEBStaticAppData *data = [[AEBStaticAppData alloc] initWithApplicationClass: AEMApplication.class
                                                                    symbolClass: TESymbol.class
                                                                 specifierClass: TESpecifier.class
                                                                     targetType: targetType_
                                                                     targetData: targetData_];
    self = [super initWithAppData: data aemQuery: AEMApp];

    if (!self) return self;
    return self;
}

/* initialisers */

+ (instancetype)application {
    return [[self alloc] init];
}
+ (instancetype)currentApplication {
    return [[self alloc] initCurrentApplication];
}
+ (instancetype)applicationWithName:(NSString *)name {
    return [[self alloc] initWithName: name];
}
+ (instancetype)applicationWithURL:(NSURL *)url {
    return [[self alloc] initWithURL: url];
}
+ (instancetype)applicationWithBundleID:(NSString *)bundleID {
    return [[self alloc] initWithBundleID: bundleID];
}
+ (instancetype)applicationWithProcessID:(pid_t)pid {
    return [[self alloc] initWithProcessID: pid];
}
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [[self alloc] initWithDescriptor: desc];
}
- (instancetype)init {
    return [self initWithBundleID: @"com.apple.TextEdit"];
}
- (instancetype)initCurrentApplication {
    return [self initWithTargetType: kAEBTargetCurrent data: nil];
}
- (instancetype)initWithName:(NSString *)name {
    return [self initWithTargetType: kAEBTargetName data: name];
}
- (instancetype)initWithURL:(NSURL *)url {
    return [self initWithTargetType: kAEBTargetURL data: url];
}
- (instancetype)initWithBundleID:(NSString *)bundleID {
    return [self initWithTargetType: kAEBTargetBundleID data: bundleID];
}
- (instancetype)initWithProcessID:(pid_t)pid {
    return [self initWithTargetType: kAEBTargetProcessID data: [NSNumber numberWithInteger: pid]];
}
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithTargetType: kAEBTargetDescriptor data: desc];
}

/* misc */

- (TESpecifier *)specifierWithObject:(id)object {
    if ([object isKindOfClass: TESpecifier.class]) {
        return [[TESpecifier alloc] initWithAppData: appData aemQuery: [object AEMQuery]];
    } else if ([object isKindOfClass: AEMQuery.class]) {
        return [[TESpecifier alloc] initWithAppData: appData aemQuery: object];
    } else if (!object) {
        return [[TESpecifier alloc] initWithAppData: appData aemQuery: AEMApp];
    } else {
        return [[TESpecifier alloc] initWithAppData: appData aemQuery: AEMRoot(object)];
    }
}
@end

