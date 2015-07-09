//
//  AEMSpecifier.h
//
//  Mid-level OO API for constructing object specifiers and their
//  various reference forms using raw "four-char codes" (OSType).
//
//  (See AEMTestClause.h for related classes used to construct test clauses
//  for use in by-test reference form.)
//
//  These classes nearly perfectly replicate the full range of
//  structures and combinations that AppleScript can form, and
//  can be used as-is when communicating with Apple event-aware
//  applications that do not provide keyword terminology (or whose
//  dictionaries are sufficiently buggy/broken to require raw
//  workarounds). They also provide a robust foundation upon
//  which high-level, terminology-driven bridges can be built,
//  freeing those bridges from the complexities of defining and
//  expressing all the details of AEM query building themselves,
//  and get on with the business of making it all look palatable
//  and friendly to ordinary users.
//

#import "AEMQuery.h"
#import "AEMTestClause.h"
#import "AEMQueryVisitor.h"
#import "AEMFormatter.h"
#import "AEMUtils.h"


/**********************************************************************/
// Forward declarations

@class AEMPropertySpecifier;
@class AEMUserPropertySpecifier;
@class AEMElementByNameSpecifier;
@class AEMElementByIndexSpecifier;
@class AEMElementByIDSpecifier;
@class AEMElementByOrdinalSpecifier;
@class AEMElementByRelativePositionSpecifier;
@class AEMElementsByRangeSpecifier;
@class AEMElementsByTestSpecifier;
@class AEMAllElementsSpecifier;

@class AEMGreaterThanTest;
@class AEMGreaterOrEqualsTest;
@class AEMEqualsTest;
@class AEMNotEqualsTest;
@class AEMLessThanTest;
@class AEMLessOrEqualsTest;
@class AEMBeginsWithTest;
@class AEMEndsWithTest;
@class AEMContainsTest;
@class AEMIsInTest;

@class AEMSpecifier;
@class AEMQueryRoot;
@class AEMApplicationRoot;
@class AEMCurrentContainerRoot;
@class AEMObjectBeingExaminedRoot;
@class AEMCustomRoot;

@class AEMTestClause;


/**********************************************************************/
// Specifier base

/*
 * Abstract base class for all object specifier classes.
 */
@interface AEMSpecifier : AEMQuery {
	AEMSpecifier *container;
	id key;
}

- (instancetype)initWithContainer:(AEMSpecifier *)container_ key:(id)key_;

// reserved methods

- (id)key; // used by -isEqual:
- (id)container; // used by -isEqual:

- (AEMSpecifier *)trueSelf;

@end


/**********************************************************************/
// Performance optimisation used by -[AEMCodecs unpackObjectSpecifier:]


@interface AEMDeferredSpecifier : AEMSpecifier {
	id specifier;
	NSAppleEventDescriptor *desc;
	id <AEMCodecsProtocol> codecs;
}

- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc_ codecs:(id)codecs_;

- (id)realSpecifier;

@end


/**********************************************************************/
// Insertion location specifier

/*
 * A reference to an element insertion point.
 */
@interface AEMInsertionSpecifier : AEMSpecifier
@end


/**********************************************************************/
// Position specifier base

/*
 * All property and element reference forms inherit from this abstract class.
 */
@interface AEMObjectSpecifier : AEMSpecifier {
	OSType wantCode;
}

- (instancetype)initWithContainer:(AEMSpecifier *)container_ key:(id)key_ wantCode:(OSType)wantCode_;

- (OSType)wantCode; // used by isEqual

// Comparison and logic tests

- (AEMGreaterThanTest		*)greaterThan:(id)object;
- (AEMGreaterOrEqualsTest	*)greaterOrEquals:(id)object;
- (AEMEqualsTest			*)equals:(id)object;
- (AEMNotEqualsTest			*)notEquals:(id)object;
- (AEMLessThanTest			*)lessThan:(id)object;
- (AEMLessOrEqualsTest		*)lessOrEquals:(id)object;
- (AEMBeginsWithTest		*)beginsWith:(id)object;
- (AEMEndsWithTest			*)endsWith:(id)object;
- (AEMContainsTest			*)contains:(id)object;
- (AEMIsInTest				*)isIn:(id)object;

// Insertion location selectors

- (AEMInsertionSpecifier *)beginning;
- (AEMInsertionSpecifier *)end;
- (AEMInsertionSpecifier *)before;
- (AEMInsertionSpecifier *)after;

// property and all-element specifiers

- (AEMPropertySpecifier		*)property:(OSType)propertyCode;
- (AEMUserPropertySpecifier	*)userProperty:(NSString *)propertyName;
- (AEMAllElementsSpecifier	*)elements:(OSType)classCode;

// by-relative-position selectors

- (AEMElementByRelativePositionSpecifier *)previous:(OSType)classCode;
- (AEMElementByRelativePositionSpecifier *)next:(OSType)classCode;

@end


/**********************************************************************/
// Properties

/*
 * Specifier identifying an application-defined property
 */
@interface AEMPropertySpecifier : AEMObjectSpecifier
@end


@interface AEMUserPropertySpecifier : AEMObjectSpecifier
@end


/**********************************************************************/
// Single elements

/*
 * Abstract base class for all single element specifiers
 */
@interface AEMSingleElementSpecifier : AEMObjectSpecifier
@end

/*
 * Specifiers identifying a single element by name, index, id or named ordinal
 */
@interface AEMElementByNameSpecifier : AEMSingleElementSpecifier
@end

@interface AEMElementByIndexSpecifier : AEMSingleElementSpecifier
@end

@interface AEMElementByIDSpecifier : AEMSingleElementSpecifier
@end

@interface AEMElementByOrdinalSpecifier : AEMSingleElementSpecifier
@end

@interface AEMElementByRelativePositionSpecifier : AEMObjectSpecifier
@end


/**********************************************************************/
// Multiple elements

/*
 * Base class for all multiple element specifiers.
 */
@interface AEMMultipleElementsSpecifier : AEMObjectSpecifier 

// ordinal selectors

- (AEMElementByOrdinalSpecifier *)first;
- (AEMElementByOrdinalSpecifier *)middle;
- (AEMElementByOrdinalSpecifier *)last;
- (AEMElementByOrdinalSpecifier *)any;

// by-index, by-name, by-id selectors
 
- (AEMElementByIndexSpecifier *)at:(int)index;
- (AEMElementByIndexSpecifier *)byIndex:(id)index; // normally NSNumber, but may occasionally be other types (e.g. typeAlias)
- (AEMElementByNameSpecifier  *)byName:(id)name;   // normally NSString, but may occasionally be other types (e.g. typeEnum)
- (AEMElementByIDSpecifier    *)byID:(id)id_;

// by-range selector

- (AEMElementsByRangeSpecifier *)at:(int)startIndex to:(int)stopIndex;
- (AEMElementsByRangeSpecifier *)byRange:(id)startSpecifier to:(id)stopSpecifier; // takes two con-based specifiers, with other values being expanded as necessary

// by-test selector

- (AEMElementsByTestSpecifier *)byTest:(AEMTestClause *)testSpecifier;

@end


@interface AEMElementsByRangeSpecifier : AEMMultipleElementsSpecifier {
	id startSpecifier, stopSpecifier;
}

- (instancetype)initWithContainer:(AEMSpecifier *)container_
                            start:(id)startSpecifier_
                             stop:(id)stopSpecifier_
                         wantCode:(OSType)wantCode_;

- (id)startSpecifier; // used by isEqual:
- (id)stopSpecifier; // used by isEqual:

@end


@interface AEMElementsByTestSpecifier : AEMMultipleElementsSpecifier
@end


@interface AEMAllElementsSpecifier : AEMMultipleElementsSpecifier

- (instancetype)initWithContainer:(AEMSpecifier *)container_ wantCode:(OSType)wantCode_;

@end


/**********************************************************************/
// Multiple element shim

@interface AEMUnkeyedElementsShim : AEMSpecifier {
	OSType wantCode;
}

- (instancetype)initWithContainer:(AEMSpecifier *)container_ wantCode:(OSType)wantCode_;

@end


/**********************************************************************/
// Reference roots
//
// note: clients should avoid initializing these class directly;
// use AEMQuery class methods or convenience macros instead

@interface AEMQueryRoot : AEMObjectSpecifier // abstract base class
@end


@interface AEMApplicationRoot : AEMQueryRoot
@end

@interface AEMCurrentContainerRoot : AEMQueryRoot
@end

@interface AEMObjectBeingExaminedRoot : AEMQueryRoot
@end

@interface AEMCustomRoot : AEMQueryRoot {
	id rootObject;
}

- (instancetype)initWithRootObject:(id)object;

- (id)rootObject; // used by isEqual

@end

