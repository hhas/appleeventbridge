//
//  AEBDynamicSDEFParser.h
//
//  Quick-n-dirty SDEF parser, provided as fallback when working with apps with buggy `ascrgdte` handlers.
//
//  Caution: This parser doesn't support synonym or xinclude elements, and doesn't always translate OSTypes
//  correctly due to bugs in OSACopyScriptingDefinition's AETE-to-SDEF parser.
//
//  TO DO: check if converted aetes ever use synonym elements (they won't use xinclude)
//

#import "AEBDynamicTerminology.h"
#import "AEBDynamicTerm.h"
#import "AEBDefaultKeywordConverter.h"

#import "AEMUtils.h"


@interface AEBDynamicSDEFParser : NSObject <NSXMLParserDelegate, AEBDynamicRawTermsProtocol> {
    AEBDefaultKeywordConverter *keywordConverter;
    NSMutableDictionary *commandsDict;
    AEBDynamicCommandTerm *currentCommand;
}

@property (readonly) NSMutableArray *types, *enumerators, *properties, *elements, *commands;

+(NSData *)copyScriptingDefinitionAtURL:(NSURL *)url error:(NSError * __autoreleasing *)error; // convenience method as alternative to AEMCopyScriptingDefinitionFromURL

- (instancetype)initWithKeywordConverter:(AEBDefaultKeywordConverter *)converter_;

-(BOOL)parseURL:(NSURL *)url error:(NSError * __autoreleasing *)error;

-(BOOL)parseData:(NSData *)sdef error:(NSError * __autoreleasing *)error;


@end

