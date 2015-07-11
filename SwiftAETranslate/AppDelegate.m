//
//  AppDelegate.m
//  SwiftAETranslate
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end


@implementation AppDelegate

@synthesize useSDEF, formatter;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    for (NSTextView *view in @[self.asIn, self.asOut]) {
        [view setAutomaticDashSubstitutionEnabled:NO];
        [view setAutomaticQuoteSubstitutionEnabled:NO];
        [view setAutomaticSpellingCorrectionEnabled:NO];
        [view setAutomaticTextReplacementEnabled:NO];
    }
    [self.asIn.textStorage.mutableString setString: @"tell app \"textedit\" to get documents"];
    languageInstance = [[AEBLanguageInstance alloc] initWithLanguage: [OSALanguage languageForName: @"AppleScript"]];
    formatter = [[AEBEventSniffer alloc] init];
    [languageInstance setEventSniffer: formatter];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (IBAction)runAppleScript:(id)sender {
    [self clearView:self.asOut];
    NSString *source = [self.asIn.textStorage.mutableString copy];
    OSAScript *script = [[OSAScript alloc] initWithSource: source fromURL: nil languageInstance: languageInstance usingStorageOptions: 0];
    NSAttributedString *scriptResult = nil;
    NSDictionary *errorInfo = nil;
    NSError *error = nil;
    if (!([script compileAndReturnError: &errorInfo] && [script executeAndReturnDisplayValue: &scriptResult error: &errorInfo])) {
        NSLog(@"%@", errorInfo);
        error = AEMErrorWithInfo([errorInfo[OSAScriptErrorNumber] intValue], errorInfo[OSAScriptErrorMessage]);
    }
    [self writeToView: self.asOut literalResult: scriptResult.string error: error desc: nil];
}


-(void)logAppleEvent:(NSAppleEventDescriptor *)desc {
    NSError *error = nil;
    NSString *literalResult = [SwiftAEFormatter formatAppleEvent: desc useSDEF: useSDEF error: &error];
    [self writeToView: self.jsLog literalResult: literalResult error: error desc: desc];
}

-(void)writeToView:(NSTextView *)view literalResult:(NSString *)result error:(NSError *)error desc:(NSAppleEventDescriptor *)desc {
    if (result) {
        [view.textStorage.mutableString appendFormat: @"%@\n", result];
    } else {
        [view.textStorage.mutableString appendFormat: @"ERROR: %@\n",
         error ? [NSString stringWithFormat: @"(%li) %@", error.code, error.localizedDescription] : @"No details available."];
        if (desc) [view.textStorage.mutableString appendFormat: @"%@\n", desc.description];
        [view.textStorage.mutableString appendString: @"\n"];
    }
}

-(IBAction)clearLog:(id)sender {
    [self clearView: self.jsLog];
}

-(void)clearView:(NSTextView *)view {
    [view.textStorage.mutableString setString: @""];
}

-(IBAction)openHelp:(id)sender {
    NSString *aebPath = [NSBundle bundleForClass: AEMApplication.class].bundlePath;
    NSURL *url = [[NSBundle bundleWithPath: aebPath] URLForResource: @"index" withExtension: @"html" subdirectory: @"swift-manual"];
    [[NSWorkspace sharedWorkspace] openURL: url];
}

@end

