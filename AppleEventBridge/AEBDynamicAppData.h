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
- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                     launchOptions:(NSWorkspaceLaunchOptions)options
                      relaunchMode:(AEBRelaunchMode)mode
                       targetTerms:(id)targetTerms_ // target app's terminology
                      defaultTerms:(id)defaultTerms_ // built-in terminology (normally an AEBDefaultTerms instance)
                  keywordConverter:(AEBKeywordConverter *)converter_
               aemApplicationClass:(Class)appClass;

// used by aebglue
- (instancetype)initWithApplicationURL:(NSURL *)url
                               useSDEF:(bool)useSDEF
                      keywordConverter:(AEBKeywordConverter *)converter_;


- (AEBDynamicTerminology *)terminologyWithError:(NSError * __autoreleasing *)error;

@end

