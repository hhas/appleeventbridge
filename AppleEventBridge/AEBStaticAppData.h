//
//  AEBStaticAppData.h
//
// Concrete AppData class used in AEBridge's own static ObjC glues.
// Extends AEBAppData with additional pack/unpack methods used to
// pack and unpack AEB... objects.
//


#import "AEBAppData.h"

#import "AEBStaticSpecifier.h"


/**********************************************************************/


@interface AEBStaticAppData : AEBAppData {
	Class symbolClass, specifierClass;
}

- (instancetype)initWithApplicationClass:(Class)appClass
                             symbolClass:(Class)symbolClass_
                          specifierClass:(Class)specifierClass_
                              targetType:(AEBTargetType)type
                              targetData:(id)data;

@end

