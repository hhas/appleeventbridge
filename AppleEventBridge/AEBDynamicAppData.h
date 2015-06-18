//
//  AEBDynamicAppData.h
//
//  Extends AEBAppData to retrieve and manage dynamically retrieved terminology tables.
//  Language-specific subclasses can override pack/unpack methods as appropriate.
//

#import "AEBAppData.h"
#import "AEBDynamicAETEParser.h"
#import "AEBDynamicSDEFParser.h"
#import "AEBDynamicTerminology.h"
#import "AEMUtils.h"


/**********************************************************************/


@interface AEBDynamicAppData : AEBAppData {
    
	id targetTerms, defaultTerms, keywordConverter;
    AEBDynamicTerminology *termTable;
    
}

// designated initializer
// targetTerms: kAEBUseAETETerminology/kAEBUseSDEFTerminology/kAEBNoTerminology/any object conforming to AEBDynamicRawTermsProtocol
// defaultTerms: kAEBUseDefaultTerminology/kAEBNoTerminology/any object conforming to AEBDynamicRawTermsProtocol
- (instancetype)initWithApplicationClass:(Class)appClass
                              targetType:(AEBTargetType)type
                              targetData:(id)data
                            relaunchMode:(AEBRelaunchMode)mode
                           launchOptions:(NSWorkspaceLaunchOptions)options
                             targetTerms:(id)targetTerms_
                            defaultTerms:(id)defaultTerms_
                        keywordConverter:(AEBDefaultKeywordConverter *)converter_;

// used by aebglue
- (instancetype)initWithApplicationURL:(NSURL *)url
                               useSDEF:(bool)useSDEF
                      keywordConverter:(AEBDefaultKeywordConverter *)converter_;


- (AEBDynamicTerminology *)terminologyWithError:(NSError * __autoreleasing *)error;

@end

