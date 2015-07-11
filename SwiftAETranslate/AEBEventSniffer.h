//
//  AEBEventSniffer.h // test
//  
//

#import <Foundation/Foundation.h>
#import <AppleEventBridge/AppleEventBridge.h>
#import "AEBLanguageInstance.h"


@interface AEBEventSniffer : NSObject <AEBSniffEventProtocol>

@property (readwrite) BOOL sendEvents;

@end
