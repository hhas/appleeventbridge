//
//  AppDelegate.h
//  SwiftAETranslate
//

#import <Cocoa/Cocoa.h>
#import "AEBLanguageInstance.h"
#import "AEBEventSniffer.h"
#import "SwiftAETranslate-swift.h"


@interface AppDelegate : NSObject <NSApplicationDelegate> {
    AEBLanguageInstance *languageInstance;
    AEBEventSniffer *formatter;
}

@property (assign) IBOutlet NSWindow *window;

@property (assign) IBOutlet NSTextView *asIn, *asOut, *jsLog;

@property (assign) BOOL useSDEF;

@property (readonly) AEBEventSniffer *formatter;

-(IBAction)runAppleScript:(id)sender;

-(void)logAppleEvent:(NSString *)desc;

-(IBAction)clearLog:(id)sender;

-(IBAction)openHelp:(id)sender;


@end

