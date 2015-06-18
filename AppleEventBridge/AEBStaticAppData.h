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

- (instancetype)initWithApplicationClass:(Class)appClass
                             symbolClass:(Class)symbolClass_
                          specifierClass:(Class)specifierClass_
                              targetType:(AEBTargetType)type
                              targetData:(id)data;

@end

