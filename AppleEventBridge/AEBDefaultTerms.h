//
//  AEBDefaultTerms.h
//
// Defines built-in terminology available for any application. When constructing
// the terminology tables for a particular application, AEBDynamicTerminology
// will duplicate these tables and then add application-specific terms to create
// the finished lookup tables.
//

#import "AEBDynamicTerm.h"


@interface AEBDefaultTerms : NSObject<AEBDynamicRawTermsProtocol>

// TO DO: need class method that returns a single instance for a given keyword converter (note: keyword converters should be uniquely identifiable by class name or 'name' property)

@property (weak, readonly) NSArray *types, *enumerators, *properties, *elements, *commands;

@end



