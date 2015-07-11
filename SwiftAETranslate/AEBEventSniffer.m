//
//  AEBEventSniffer.m
//  
//

#import "AEBEventSniffer.h"
#import "AppDelegate.h"

@implementation AEBEventSniffer

@synthesize sendEvents;

// called by AEBLanguageInstance

- (BOOL)sniffEvent:(NSAppleEventDescriptor *)desc {
    [(AppDelegate *)(NSApp.delegate) performSelectorOnMainThread: @selector(logAppleEvent:) withObject: desc waitUntilDone: NO];
    return sendEvents;
}

- (void)sniffReply:(NSAppleEventDescriptor *)desc { // TO DO: log result in swift syntax too?
}

@end

