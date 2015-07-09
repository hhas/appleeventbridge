//
//  AEBKeywordConverter.h
//

#import <Foundation/Foundation.h>

@interface AEBKeywordConverter : NSObject
// Convert AS-style keywords to a form suitable for use in client language (e.g. as native identifiers).
// Default implementation returns names unchanged. Subclasses can override as appropriate.

// Convert an AppleScript-style keyword name to client language-appropriate (e.g. C-style) identifier.
- (NSString *)convertSpecifierName:(NSString *)name;
- (NSString *)convertParameterName:(NSString *)name;

// Disambiguate a converted name (e.g. by appending underscore); called when parser detects a terminology
// conflict between two name-code definitions where their names are same but their codes are different.
- (NSString *)escapeName:(NSString *)name;

@end
