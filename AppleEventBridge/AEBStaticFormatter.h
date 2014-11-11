//
//  AEBStaticFormatter.h
//
//
//

#import "AEMFormatter.h"
#import "AEMUtils.h"

#import "AEBStaticAppData.h"
#import "AEBStaticSpecifier.h"

/**********************************************************************/
// Abstract base class for specifier renderers

@interface AEBStaticFormatter : AEMVisitor {
	AEBStaticAppData *appData;
	NSMutableString *result;
}

- (instancetype)initWithAppData:(id)appData_;


/*******/
// private

- (NSString *)format:(id)object;
- (NSString *)result;

/*******/
// public
// application-specific subclasses should override this method to provide their own prefix codes

+ (NSString *)formatObject:(id)object appData:(id)appData_;

/*******/
// method stubs; application-specific subclasses will override to provide code->name translations

- (NSString *)propertyByCode:(OSType)code;
- (NSString *)elementByCode:(OSType)code;
- (NSString *)prefix;

@end

