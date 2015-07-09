//
//  AEBKeywordConverter.m
//

#import "AEBKeywordConverter.h"


@implementation AEBKeywordConverter // default implementation is a no-op // TO DO: eventually provide a subclass that takes list of legal characters and reserved words, and creates suitable converter on client's behalf, thereby reducing the amount of code a client bridge must implement

- (NSString *)escapeName:(NSString *)name {
    return name;
}

- (NSString *)convertSpecifierName:(NSString *)name {
    return name;
}

- (NSString *)convertParameterName:(NSString *)name {
    return name;
}

@end

