//
//  AEBDynamicAppData.h
//
//  Extends AEBAppData to retrieve and manage dynamically retrieved terminology tables.
//  Language-specific subclasses can override pack/unpack methods as appropriate.
//

#import "AEBAppData.h"
#import "AEBDynamicAETEParser.h"
#import "AEBDynamicTerminology.h"
#import "AEMUtils.h"


/**********************************************************************/


@interface AEBDynamicAppData : AEBAppData {
    
	id targetTerms, defaultTerms, keywordConverter;
    AEBDynamicTerminology *termTable;
    
}

// designated initializer
- (instancetype)initWithApplicationClass:(Class)appClass
                              targetType:(AEBTargetType)type
                              targetData:(id)data
                            relaunchMode:(AEBRelaunchMode)mode
                           launchOptions:(NSWorkspaceLaunchOptions)options
                             targetTerms:(id)targetTerms_ // AEMTrue/AEMFalse/AEBDynamicRawTermsProtocol
                            defaultTerms:(id)defaultTerms_ // AEMTrue/AEMFalse/AEBDynamicRawTermsProtocol
                        keywordConverter:(id<AEBDynamicTermNameConverterProtocol>)converter_;

// used by aebglue
- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                  keywordConverter:(id<AEBDynamicTermNameConverterProtocol>)converter_;


- (AEBDynamicTerminology *)terminologyWithError:(NSError * __autoreleasing *)error;

@end

