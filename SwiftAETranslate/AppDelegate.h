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

-(void)logReplyEvent:(NSString *)desc;

-(void)writeToView:(NSTextView *)view isReply:(BOOL)isReply literalResult:(NSString *)result
                                        error:(NSError *)error desc:(NSAppleEventDescriptor *)desc;

-(IBAction)clearLog:(id)sender;

-(IBAction)openHelp:(id)sender;


@end

