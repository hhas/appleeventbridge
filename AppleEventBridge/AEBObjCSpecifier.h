//
//  AEBObjCSpecifier.h
//
//  Extends AEBSpecifier with selector methods for ObjC.
//

#import "AEBSpecifier.h"
#import "AEBObjCCommand.h"

@interface AEBObjCSpecifier : AEBSpecifier

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
