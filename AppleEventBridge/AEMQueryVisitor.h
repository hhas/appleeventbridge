//
//  AEMQueryVisitor.h
//
// Visitor base class for objects to be passed to -[AEMQuery resolveWithObject:]
// Each method simply returns self; subclasses can override some or all of these
// methods as needed.
//

#import "AEMUtils.h"


@interface AEMQueryVisitor : NSObject

- (instancetype)property:(OSType)code;
- (instancetype)elements:(OSType)code;

- (instancetype)first;
- (instancetype)middle;
- (instancetype)last;
- (instancetype)any;

- (instancetype)byIndex:(id)index;
- (instancetype)byName:(id)name;
- (instancetype)byID:(id)id_;

- (instancetype)previous:(OSType)class_;
- (instancetype)next:(OSType)class_;

- (instancetype)byRange:(id)fromObject to:(id)toObject;
- (instancetype)byTest:(id)testSpecifier;

- (instancetype)beginning;
- (instancetype)end;
- (instancetype)before;
- (instancetype)after;

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

- (instancetype)app;
- (instancetype)con;
- (instancetype)its;
- (instancetype)customRoot:(id)rootObject;

@end

