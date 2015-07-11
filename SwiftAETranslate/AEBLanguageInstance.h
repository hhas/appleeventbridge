//
//  AEBLanguageInstance.h
//
//

#import <OSAKit/OSAKit.h>



@protocol AEBSniffEventProtocol <NSObject>

- (BOOL)sniffEvent:(NSAppleEventDescriptor *)desc;

- (void)sniffReply:(NSAppleEventDescriptor *)desc;

@end




@interface AEBLanguageInstance : OSALanguageInstance {

    id <AEBSniffEventProtocol> sniffer;

}

- (void)setEventSniffer:(id <AEBSniffEventProtocol>)sniffer_;

@end
