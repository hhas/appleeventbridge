//
//  AEBStaticAppData.h
//
// Concrete AppData class used in AEB's own static ObjC/Swift glues.
// Extends AEBAppData with additional pack/unpack methods used to
// pack and unpack AEB... objects.
//


#import "AEBAppData.h"

#import "AEBSpecifier.h"


/**********************************************************************/


@interface AEBStaticAppData : AEBAppData {
	Class symbolClass, specifierClass;
}

- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                     launchOptions:(NSWorkspaceLaunchOptions)options
                      relaunchMode:(AEBRelaunchMode)mode
                    specifierClass:(Class)specifierClass_
                       symbolClass:(Class)symbolClass_;

@end

