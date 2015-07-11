//
//  AEBLanguageInstance.m
//
//

#import "AEBLanguageInstance.h"



// installs into CI to monitor outgoing AEs
static OSErr AEBSendFunction(const AppleEvent *theAppleEvent,
                             AppleEvent *reply,
                             AESendMode sendMode,
                             AESendPriority sendPriority,
                             long timeOutInTicks,
                             AEIdleUPP idleProc,
                             AEFilterUPP filterProc,
                             SRefCon refcon) {
    AEDesc eventCopy;
    OSErr err = AEDuplicateDesc(theAppleEvent, &eventCopy);
    if (err) return err;
    NSAppleEventDescriptor *desc = [[NSAppleEventDescriptor alloc] initWithAEDescNoCopy: &eventCopy];
    BOOL willSend = YES;
    BOOL willSniff = !([desc eventClass] == kASAppleScriptSuite && [desc eventID] == kGetAETE);
    if (willSniff) {
        willSend = [(__bridge id <AEBSniffEventProtocol>)refcon sniffEvent: desc];
    }
    if (willSend) {
        err = AESendMessage(theAppleEvent, reply, sendMode, timeOutInTicks);
        if (!err && willSniff) {
            AEDesc replyCopy;
            if (!AEDuplicateDesc(reply, &replyCopy)) {
                NSAppleEventDescriptor *replyDesc = [[NSAppleEventDescriptor alloc] initWithAEDescNoCopy: &replyCopy];
                [(__bridge id <AEBSniffEventProtocol>)refcon sniffReply: replyDesc];
            }
        }
    }
    if (err) return err;
    return err;
}


@implementation AEBLanguageInstance

- (void)setEventSniffer:(id <AEBSniffEventProtocol>)sniffer_ {
    sniffer = sniffer_;
    OSASetSendProc(self.componentInstance, NewOSASendUPP(AEBSendFunction), (__bridge SRefCon)sniffer_);
}

@end



