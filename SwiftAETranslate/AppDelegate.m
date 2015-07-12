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
    // note: execute... returns fully qualified objspecs
    if (!([script compileAndReturnError: &errorInfo] && [script executeAndReturnDisplayValue: &scriptResult error: &errorInfo])) {
        error = AEMErrorWithInfo([errorInfo[OSAScriptErrorNumber] intValue] ?: 1, errorInfo[OSAScriptErrorMessage]);
    }
    [self writeToView: self.asOut isReply: YES literalResult: scriptResult.string error: error desc: nil];
}


-(void)logAppleEvent:(NSAppleEventDescriptor *)desc {
    NSError *error = nil;
    NSString *literalResult = [SwiftAEFormatter formatAppleEvent: desc useSDEF: useSDEF error: &error];
    [self writeToView: self.jsLog isReply: NO literalResult: literalResult error: error desc: desc];
}

-(void)logReplyEvent:(NSAppleEventDescriptor *)desc {
    NSError *error = nil;
    NSString *literalResult = [SwiftAEFormatter formatAppleEvent: desc useSDEF: useSDEF error: &error];
    [self writeToView: self.jsLog isReply: YES literalResult: literalResult error: error desc: desc];

}

-(void)writeToView:(NSTextView *)view isReply:(BOOL)isReply literalResult:(NSString *)result
                                        error:(NSError *)error desc:(NSAppleEventDescriptor *)desc {
    if (result) {
        NSColor *color;
        if (isReply) {
            color = NSColor.grayColor;
            if (view == self.jsLog) result = [NSString stringWithFormat: @"// %@", result];
        } else {
            color = NSColor.blackColor;
        }
        [view.textStorage appendAttributedString:
         [[NSAttributedString alloc] initWithString: result attributes: @{NSForegroundColorAttributeName: color}]];
    } else {
        NSMutableString *errorMessage = [NSMutableString stringWithString: @"ERROR: "];
        if (error) {
            [errorMessage appendFormat: @"(%li) %@", error.code, error.localizedDescription];
        } else {
            [errorMessage appendString: @"No details available."];
        }
        if (desc) [errorMessage appendFormat: @"%@\n", desc.description];
        [view.textStorage appendAttributedString:
         [[NSAttributedString alloc] initWithString: errorMessage attributes: @{NSForegroundColorAttributeName: NSColor.redColor}]];
    }
    [view.textStorage.mutableString appendString: @"\n"];
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

