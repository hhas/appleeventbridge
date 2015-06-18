//
//  AEBDefaultKeywordConverter.m
//

#import "AEBDefaultKeywordConverter.h"


@implementation AEBDefaultKeywordConverter // default implementation is a no-op // TO DO: eventually provide a subclass that takes list of legal characters and reserved words, and creates suitable converter on client's behalf, thereby reducing the amount of code a client bridge must implement

- (NSString *)convert:(NSString *)name {
    return name;
}

- (NSString *)escape:(NSString *)name {
    return name;
}

@end

