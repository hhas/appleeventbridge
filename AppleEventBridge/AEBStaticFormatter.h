//
//  AEBStaticFormatter.h
//
//  Generate ObjC-style description strings for AEBStaticSpecifiers, etc.
//
//  TO DO: replace `id` in method signatures where possible
//

#import "AEMFormatter.h"
#import "AEMQueryVisitor.h"
#import "AEMUtils.h"

#import "AEBStaticAppData.h"
#import "AEBSpecifier.h"

/**********************************************************************/
// Abstract base class for specifier renderers

@interface AEBStaticFormatter : AEMQueryVisitor {
	AEBStaticAppData *appData;
}

- (instancetype)initWithAppData:(id)appData_;


/*******/
// private

@property (readonly) AEBStaticAppData *appData; // TO DO: this is a workaround; need to sort out how best to expose ivars to Swift subclasses

@property (readonly) NSMutableString *mutableResult;

- (NSString *)format:(id)object;

/*******/
// public
// application-specific subclasses should override this method to provide their own prefix codes

+ (NSString *)formatObject:(id)object appData:(id)appData_;

/*******/
// method stubs; application-specific subclasses will override to provide code->name translations

@property (readonly) NSString *prefix; // TO DO: update aebglue

// override the following to return the property/element specifier syntax
- (NSString *)propertyByCode:(OSType)code;
- (NSString *)elementsByCode:(OSType)code;

@end

