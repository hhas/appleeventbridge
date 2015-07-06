//
//  AEBObjCFormatter.h
//
//  Generate ObjC-style description strings for AEBObjCSpecifiers, etc.
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

@interface AEBObjCFormatter : AEMQueryVisitor {
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

+ (NSString *)formatObject:(id)object appData:(id)appData_; // get literal representation of a Cocoa/AEB object

// method stubs; application-specific subclasses will override to provide code->name translations

// application-specific subclasses should override this method to provide their own prefix codes
@property (readonly) NSString *prefix; // TO DO: update aebglue

// override the following to return the property/element specifier syntax
- (NSString *)propertyByCode:(OSType)code;
- (NSString *)elementsByCode:(OSType)code;

@end

