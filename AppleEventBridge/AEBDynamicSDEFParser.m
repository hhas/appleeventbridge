//
//  AEBDynamicSDEFParser.m
//

#import "AEBDynamicSDEFParser.h"

// KLUDGE: workaround for buggy OSACopyScriptingDefinitionFromURL(); TO DO: remove when bug is fixed
#include "AEMCopyScriptingDefinitionFromURL.h"



@implementation AEBDynamicSDEFParser

@synthesize types, enumerators, properties, elements, commands;

+(NSData *)copyScriptingDefinitionAtURL:(NSURL *)url error:(NSError * __autoreleasing *)error {
    CFDataRef sdef = nil;
    if (error) *error = nil;
    if (!url) {
        if (error) *error = AEMErrorWithInfo(fnfErr, @"Can't get SDEF data: no URL was given.");
        return nil;
    }
    // TO DO: next line should use OSACopyScriptingDefinitionFromURL() once it's fixed
    OSStatus err = AEMCopyScriptingDefinitionFromURL((__bridge CFURLRef)url, 0, &sdef);
    if (err) {
        if (error) *error = AEMErrorWithInfo(err, @"Can't retrieve SDEF.");
        return nil;
    }
    return (NSData *)CFBridgingRelease(sdef);
}

-(BOOL)parseURL:(NSURL *)url error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
    NSData *sdef = [self.class copyScriptingDefinitionAtURL: url error: error];
    if (!sdef) return NO;
    return [self parseData: sdef error: error];
}

-(BOOL)parseData:(NSData *)sdef error:(NSError * __autoreleasing *)error {
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData: sdef];
    parser.delegate = self;
    BOOL success = [parser parse];
    if (error)  *error = success ? nil : parser.parserError;
    return success;
}

//

-(instancetype)init {
    self = [super init];
    if (!self) return self;
    types = [NSMutableArray array];
    enumerators = [NSMutableArray array];
    properties = [NSMutableArray array];
    elements = [NSMutableArray array];
    commandsDict = [NSMutableDictionary dictionary];
    return self;
}

-(NSArray *)commands {
    return commandsDict.allValues;
}

// XML parser callback


-(BOOL)getOSTypeForCode:(NSString *)string code:(OSType *)code {
    if (string.length != 4) return NO;
    NSData *data = [string dataUsingEncoding: NSMacOSRomanStringEncoding];
    if (!data) return NO;
    UInt32 tmp;
    [data getBytes: &tmp length: 4];
    *code = CFSwapInt32HostToBig(tmp);
    return YES;
}

#define eNAME   (attributeDict[@"name"])
#define eCODE   (attributeDict[@"code"])
#define ePLURAL (attributeDict[@"plural"])

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
                                        namespaceURI:(NSString *)namespaceURI
                                       qualifiedName:(NSString *)qualifiedName
                                          attributes:(NSDictionary *)attributeDict {
    NSString *name, *codeString, *plural;
    OSType code=0, eventClass=0, eventID=0;
    BOOL isClass;
    if ((isClass = [elementName isEqualToString: @"class"]) || [elementName isEqualToString: @"record-type"]
                                                            || [elementName isEqualToString: @"value-type"]) {
        if (!((name = eNAME).length && [self getOSTypeForCode: eCODE code: &code])) goto malformedElement;
        [types addObject: [[AEBDynamicKeywordTerm alloc] initWithName: name code: code kind: kAEBTermType]];
        if (isClass) {
            if (!(plural = ePLURAL).length) plural = [NSString stringWithFormat: @"%@s", name];
            [elements addObject: [[AEBDynamicKeywordTerm alloc] initWithName: plural code: code kind: kAEBTermType]];
        }
        
    } else if ([elementName isEqualToString: @"property"]) {
        if (!((name = eNAME).length && [self getOSTypeForCode: eCODE code: &code])) goto malformedElement;
         [properties addObject: [[AEBDynamicKeywordTerm alloc] initWithName: name code: code kind: kAEBTermProperty]];
        
    } else if ([elementName isEqualToString: @"enumerator"]) {
        if (!((name = eNAME).length && [self getOSTypeForCode: eCODE code: &code])) goto malformedElement;
        [enumerators addObject: [[AEBDynamicKeywordTerm alloc] initWithName: name code: code kind: kAEBTermEnumerator]];
        
    } else if ([elementName isEqualToString: @"command"]) {
        if (!((name = eNAME).length && (codeString = eCODE).length == 8
              && [self getOSTypeForCode: [codeString substringToIndex: 4] code: &eventClass]
              && [self getOSTypeForCode: [codeString substringFromIndex: 4] code: &eventID])) goto malformedElement;
        // Note: overlapping command definitions (e.g. 'path to') should be processed as follows:
		// - If their names and codes are the same, only the last definition is used; other definitions are ignored
        //   and will not compile.
		// - If their names are the same but their codes are different, only the first definition is used; other
        //   definitions are ignored and will not compile.
        AEBDynamicCommandTerm *previousDef = commandsDict[name];
        if (!previousDef || (previousDef.eventClass == eventClass && previousDef.eventID == eventID)) {
            currentCommand = [[AEBDynamicCommandTerm alloc] initWithName: name eventClass: eventClass eventID: eventID];
            commandsDict[name] = currentCommand;
        } else {
            currentCommand = nil;
        }
        
    } else if ([elementName isEqualToString: @"parameter"]) {
        if (!((name = eNAME).length && [self getOSTypeForCode: eCODE code: &code])) goto malformedElement;
        [currentCommand addParameterWithName: name code: code];
    }
    return;
malformedElement: // e.g. OSACopyScriptingDefinition's AETE-to-SDEF conversion is buggy
    NSLog(@"Found invalid %@ in SDEF (name='%@', code='%@')", elementName, name, codeString);
}

@end
