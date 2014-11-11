//
//  AEMQuery.h
//
//  Base class for all AEMObjectSpecifier and AEMTestSpecifier query-building subclasses.
//

#import "AEMUtils.h"

@class AEMQueryRoot;


/**********************************************************************/
// Base class for all AEM queries (object and test specifiers)


@interface AEMQuery : NSObject <AEMSelfPackingProtocol> {
	NSAppleEventDescriptor *cachedDesc;
	NSUInteger cachedHash;
}

// set cached descriptor; performance optimisation, used internally by AEMCodecs
- (void)setCachedDesc:(NSAppleEventDescriptor *)desc;

// return specifier's root object (AEMApp, AEMCon, AEMIts, or AEMCustomRoot)
- (AEMQueryRoot *)root;

// walk specifier
- (id)resolveWithObject:(id)object;

// pack specifier
- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id)codecs error:(NSError * __autoreleasing *)error;

// pack specifier, caching result for efficiency
- (NSAppleEventDescriptor *)packWithCodecs:(id)codecs error:(NSError * __autoreleasing *)error;

@end


/**********************************************************************/
// Visitor base class for objects to be passed to -[AEMQuery resolveWithObject:]
// Each method simply returns self; subclasses can override some or all of these
// methods as needed.


@interface AEMVisitor : NSObject

- (id)property:(OSType)code;
- (id)elements:(OSType)code;

- (id)first;
- (id)middle;
- (id)last;
- (id)any;

- (id)byIndex:(id)index;
- (id)byName:(id)name;
- (id)byID:(id)id_;

- (id)previous:(OSType)class_;
- (id)next:(OSType)class_;

- (id)byRange:(id)fromObject to:(id)toObject;
- (id)byTest:(id)testSpecifier;

- (id)beginning;
- (id)end;
- (id)before;
- (id)after;

- (id)greaterThan:(id)object;
- (id)greaterOrEquals:(id)object;
- (id)equals:(id)object;
- (id)notEquals:(id)object;
- (id)lessThan:(id)object;
- (id)lessOrEquals:(id)object;
- (id)beginsWith:(id)object;
- (id)endsWith:(id)object;
- (id)contains:(id)object;
- (id)isIn:(id)object;
- (id)AND:(id)remainingOperands;
- (id)OR:(id)remainingOperands;
- (id)NOT;

- (id)app;
- (id)con;
- (id)its;
- (id)customRoot:(id)rootObject;

@end

