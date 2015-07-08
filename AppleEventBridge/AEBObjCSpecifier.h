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

/* by-index, by-name, by-test selectors */

 - (instancetype)objectAtIndexedSubscript:(int)idx; // convenience shortcut for by-index selector where index is a C int
 - (instancetype)objectForKeyedSubscript:(id)key; // by-name, by-test, by-index

- (instancetype)named:(id)name; // TO DO: superceded by id subscript, except where specifying non-string name (AppleScript API parity)

/* by-id selector */

- (instancetype)ID:(id)elementID;

/* by-relative-position selectors */

- (instancetype)previous:(AEBSymbol *)elementClass;
- (instancetype)next:(AEBSymbol *)elementClass;

/* by-range selector */

- (instancetype)from:(id)fromObject to:(id)toObject;

/* insertion location selectors */

- (instancetype)beginning;
- (instancetype)end;
- (instancetype)before;
- (instancetype)after;

/* Comparison and logic tests */

- (instancetype)gt:(id)object;
- (instancetype)ge:(id)object;
- (instancetype)eq:(id)object;
- (instancetype)ne:(id)object;
- (instancetype)lt:(id)object;
- (instancetype)le:(id)object;
- (instancetype)beginsWith:(id)object;
- (instancetype)endsWith:(id)object;
- (instancetype)contains:(id)object;
- (instancetype)isIn:(id)object;
- (instancetype)AND:(id)remainingOperands;
- (instancetype)OR:(id)remainingOperands;
- (instancetype)NOT;

@end
