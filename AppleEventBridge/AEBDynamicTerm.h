//
//  AEBDynamicTerm.h
//
//  Defines AEBDynamicKeywordTerm, AEBDynamicCommandTerm classes for describing individual name-code pairs.
//


#import "AEMTypes.h"
#import "AEMUtils.h"
#import "AEMFormatter.h"


/**********************************************************************/
// convert eventClass and eventID codes to an NSDictionary key


#define AEBCommandKeyForCodes(eventClass, eventID) @((UInt64)(eventClass) << 32 | (eventID))


/**********************************************************************/
// protocols


// any object that supports this protocol may be passed to AEBDynamicTerminology
@protocol AEBDynamicRawTermsProtocol <NSObject>

@property (readonly) NSArray *types, *enumerators, *properties, *elements, *commands;

@end


/**********************************************************************/


typedef enum {
    kAEBTermType = 1, // type or element name
    kAEBTermEnumerator,
    kAEBTermProperty,
    kAEBTermCommand,
    kAEBTermParameter
} AEBDynamicTermType;

#define kAEBTermElement (kAEBTermType)



@interface AEBDynamicTerm : NSObject // base class for keyword and command terms

@property (retain) NSString *name; // clients may need to escape names to disambiguate conflicting terms
@property (readonly) AEBDynamicTermType kind;

- (instancetype)initWithName:(NSString*)name_ kind:(AEBDynamicTermType)kind_;

@end


// concrete classes


@interface AEBDynamicKeywordTerm : AEBDynamicTerm

@property (readonly) OSType code;

- (instancetype)initWithName:(NSString*)name_ code:(OSType)code_ kind:(AEBDynamicTermType)kind_;

@end


@interface AEBDynamicCommandTerm : AEBDynamicTerm {
	NSMutableDictionary *parametersByName, *parametersByCode;
}

@property (readonly) OSType eventClass, eventID;
@property (readonly) NSSet *parameters; // set of AEBDynamicKeywordTerm

- (instancetype)initWithName:(NSString*)name_ eventClass:(OSType)eventClass_ eventID:(OSType)eventID_;


- (AEBDynamicCommandTerm *)addParameterWithName:(NSString *)name_ code:(OSType)code_; // returns self

- (AEBDynamicKeywordTerm *)parameterForName:(NSString *)name_;

- (AEBDynamicKeywordTerm *)parameterForCode:(OSType)code_;

@end

