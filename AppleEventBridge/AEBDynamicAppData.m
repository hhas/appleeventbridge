//
//  AEBDynamicAppData.m
//

#import "AEBDynamicAppData.h"


/**********************************************************************/


@implementation AEBDynamicAppData

- (instancetype)initWithTargetType:(AEBTargetType)type
                        targetData:(id)data
                     launchOptions:(NSWorkspaceLaunchOptions)options
                      relaunchMode:(AEBRelaunchMode)mode
                       targetTerms:(id)targetTerms_ // target app's terminology
                      defaultTerms:(id)defaultTerms_ // built-in terminology (normally an AEBDefaultTerms instance)
                  keywordConverter:(AEBKeywordConverter *)converter_
               aemApplicationClass:(Class)appClass {
    self = [super initWithTargetType: type
                          targetData: data
                       launchOptions: options
                        relaunchMode: mode
                 aemApplicationClass: appClass];
    if (!self) return self;
    targetTerms = targetTerms_;
    defaultTerms = defaultTerms_;
	keywordConverter = (id)converter_;
	return self;
}


- (instancetype)initWithApplicationURL:(NSURL *)url
                               useSDEF:(bool)useSDEF
                      keywordConverter:(AEBKeywordConverter *)converter_ {
    return [self initWithTargetType: (url ? AEBTargetURL : AEBTargetCurrent)
                         targetData: url
                      launchOptions: kAEMDefaultLaunchOptions
                       relaunchMode: AEBRelaunchAlways
                        targetTerms: (useSDEF ? kAEBUseSDEFTerminology : kAEBUseAETETerminology)
                       defaultTerms: kAEBUseDefaultTerminology
                   keywordConverter: converter_
                aemApplicationClass: AEMApplication.class];
}


- (id)aetesWithError:(NSError * __autoreleasing *)error {
	AEMApplication *targetApp = [self targetWithError: error];
    // use a standard AEMApplication instance to send event, bypassing any custom (e.g. OSA component-supplied) Create/Send procs
    // or other customizations that might be used by targetApp
    // TO DO: if target is current app, should targetApp be used (i.e. in an OSA component, should _all_ events be dispatched via
    // its custom Send proc, or is it safe to send it events via standard AESendMessage)
    targetApp = [[AEMApplication alloc] initWithDescriptor: targetApp.descriptor];
//	if (!targetApp) NSLog(@"Can't make target: %@", *error);
	AEMEvent *event = [targetApp eventWithEventClass: kASAppleScriptSuite eventID: kGetAETE];
	[event setParameter: @0 forKeyword: keyDirectObject];
	id result = [event sendWithError: error];
//    if (!result) NSLog(@"Failed to get aete: %@", *error);
    return result;
}

- (AEBDynamicTerminology *)terminologyWithError:(NSError * __autoreleasing *)error {
    NSError *tempError = nil;
    if (error) *error = nil;
    if (!termTable) {
        termTable = [[AEBDynamicTerminology alloc] initWithKeywordConverter: keywordConverter
                                                         defaultTerminology: defaultTerms];
        if ([targetTerms isEqual: kAEBUseAETETerminology]) { // obtain AETE terminology from application by sending `ascrgdte` event
            id aetes = [self aetesWithError: &tempError];
            if (aetes) {
                AEBDynamicAETEParser *parser = [[AEBDynamicAETEParser alloc] initWithKeywordConverter: keywordConverter];
                if (![parser parse: aetes error: error]) return nil;
                // TO DO: cache parser result? (names haven't been converted yet, so this data is language-agnostic; Q. what to use as key - not AEBTargetProcessID, obviously; what about file/eppc url?) or just leave clients to do all their own caching once they've converted raw terms to finished terminology tables?
                [termTable addRawTerminology: parser];
            } else if (tempError.code != resNotFound) { // an error occurred when getting aetes (e.g. AE failed)
                NSLog(@"AETE retrieval failed: %@", tempError);
                if (error) *error = tempError;
                return nil;
            } // else no AETE, probably because app is 'non-scriptable' or an SE applet
 //           NSLog(@"AETE resource not found: %@", tempError); // DEBUG
        } else if ([targetTerms isEqual: kAEBUseSDEFTerminology]) { // obtain SDEF terminology via AEMCopyScriptingDefinitionFromURL
            AEBDynamicSDEFParser *parser = [[AEBDynamicSDEFParser alloc] initWithKeywordConverter: keywordConverter];
            [parser parseURL: self.targetData error: error];
            [termTable addRawTerminology: parser];
        } else if ([targetTerms conformsToProtocol: @protocol(AEMSelfPackingProtocol)]) { // an object containing raw (dumped) terminology
            [termTable addRawTerminology: targetTerms];
        } else if (![targetTerms isEqual: kAEBNoTerminology]) { // bad argument
            if (error) *error = AEMErrorWithInfo(1, [NSString stringWithFormat: @"Invalid targetTerms value: %@", targetTerms]);
            return nil;
        } // else use default terms only (e.g. when targeting AppleScript applets)
    }
    return termTable;
}

@end

