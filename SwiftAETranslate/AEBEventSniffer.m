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
    NSLog(@"%@", desc);
    [(AppDelegate *)(NSApp.delegate) performSelectorOnMainThread: @selector(logAppleEvent:) withObject: desc waitUntilDone: NO];
    return sendEvents;
}

- (void)sniffReply:(NSAppleEventDescriptor *)desc {
    NSLog(@"%@", AEMFormatOSType([desc paramDescriptorForKeyword: '----'].descriptorType));
    [(AppDelegate *)(NSApp.delegate) performSelectorOnMainThread: @selector(logReplyEvent:) withObject: desc waitUntilDone: NO];
}

@end

