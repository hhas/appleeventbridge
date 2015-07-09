//
//  AEMQuery.h
//
//  Base class for all AEMObjectSpecifier and AEMTestClause query-building subclasses.
//

#import "AEMUtils.h"

@class AEMQueryRoot;
@class AEMApplicationRoot;
@class AEMCurrentContainerRoot;
@class AEMObjectBeingExaminedRoot;
@class AEMCustomRoot;


/**********************************************************************/
// convenience macros for +[AEMQuery app], etc.

#define AEMApp ([AEMQuery app])
#define AEMCon ([AEMQuery con])
#define AEMIts ([AEMQuery its])
#define AEMRoot(object) ([AEMQuery customRoot: (object)])


/**********************************************************************/
// Base class for all AEM queries (object and test specifiers)


// TO DO: when specifier is used as selector or parameter, need to check its root is the right type (i.e. AEMIts in -byTest:, AEMApp/AEMCon in -byRange:to:, AEMApp in event params) and return error if not


@interface AEMQuery : NSObject <AEMSelfPackingProtocol, AEMQueryProtocol> {
	NSAppleEventDescriptor *cachedDesc;
}

// obtain root objects for building all new queries
+ (AEMApplicationRoot *)app;
+ (AEMCurrentContainerRoot *)con;
+ (AEMObjectBeingExaminedRoot *)its;
+ (AEMCustomRoot *)customRoot:(id)rootObject;

// return specifier's root object (AEMApp, AEMCon, AEMIts, or AEMCustomRoot)
@property (readonly) AEMQueryRoot *root;

// TO DO: add method for rebuilding this query with a different root, suitable for constructing fully qualified specifiers? (caveat: those things are a bad idea to begin with, and only used in Automator + OSA components AFAIK; also bear in mind that codecs is right way to do it, since it can handle arbitrarily deep structures including lists and records)

// set cached descriptor; performance optimisation, used internally by AEMCodecs
- (void)setCachedDesc:(NSAppleEventDescriptor *)desc;

// walk specifier
- (id)resolveWithObject:(id)object;

// pack specifier
- (NSAppleEventDescriptor *)packWithCodecsNoCache:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error;

// pack specifier, caching result for efficiency
- (NSAppleEventDescriptor *)packWithCodecs:(id <AEMCodecsProtocol>)codecs error:(NSError * __autoreleasing *)error;

@end

