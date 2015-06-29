//
//  AEBStaticKeywordConverter.h
//

#import "AEBKeywordConverter.h"


@interface AEBStaticKeywordConverter : NSObject {
 
    NSMutableDictionary *cache;
    
}

@property (readonly) NSCharacterSet *kLegalFirstChars, *kLegalOtherChars;
@property (readonly) NSSet *kNSObjectMethods, *kAEBSpecifierMethods, *kAEBReservedPrefixes;

 // used internally
- (NSString *)convertName:(NSString *)s reservedKeywords:(NSSet *)reservedWords;
- (NSString *)identifierForAppName:(NSString *)appName reservedWords:(NSSet *)reservedWords;
- (NSString *)prefixForAppName:(NSString *)appName reservedWords:(NSSet *)reservedWords;
- (NSString *)escapeName:(NSString *)s;

@end



@interface AEBSwiftKeywordConverter : AEBStaticKeywordConverter

@property (readonly) NSSet *kSwiftKeywords, *kAEBSwiftSpecifierMethods, *kAEBSwiftParameterNames,
                           *kReservedSpecifierWords, *kReservedParameterWords, *kReservedPrefixes;

- (NSString *)convertSpecifierName:(NSString *)name;
- (NSString *)convertParameterName:(NSString *)name;
- (NSString *)identifierForAppName:(NSString *)name;
- (NSString *)prefixForAppName:(NSString *)name;

@end



@interface AEBObjCKeywordConverter : AEBStaticKeywordConverter

@property (readonly) NSSet *kObjectiveCKeywords, *kAEBObjectiveCMethods, *kReservedWords, *kReservedPrefixes;

- (NSString *)convertSpecifierName:(NSString *)name;
- (NSString *)convertParameterName:(NSString *)name;
- (NSString *)identifierForAppName:(NSString *)name;
- (NSString *)prefixForAppName:(NSString *)name;

@end

