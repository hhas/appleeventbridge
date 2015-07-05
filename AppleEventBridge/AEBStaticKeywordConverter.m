//
//  AEBStaticKeywordConverter.m
//

#import "AEBStaticKeywordConverter.h"

// TO DO: make Swift, ObjC converters singletons

// TO DO: should Swift converter use larger range of legal chars? or do users prefer sticking to C-style? (e.g. for ObjC interop)

/*
    Important: the following must be reserved so that terminology-defined properties and methods don't conflict
    with existing superclass properties and methods:

    - names of language keywords
    - names of NSObject class and instance methods
    - names of methods used in AEBStaticSymbol, AEBStaticSpecifier classes
    - names of additional methods used in Application classes
    - names of built-in keyword arguments in AEBStaticCommand

    Notes:

    - Method names that take more than one argument (e.g. -at:to:) do not need to be reserved as they cannot conflict. // TO DO: this is only true of ObjC glues; in Swift glues, application commands could conflict with any base class methods due to the way it maps ObjC's inter-arg method names to Swift method and arg names

    - The following tokens are reserved as punctuation in Swift and can’t be used as custom operators:
      (, ), {, }, [, ], ., ,, :, ;, =, @, #, & (as a prefix operator), ->, `, ?, and ! (as a postfix operator).
*/

#define UPPERCHAR @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#define LOWERCHAR @"abcdefghijklmnopqrstuvwxyz"
#define NUMERIC   @"0123456789"
#define OTHER     @"_"


@implementation AEBStaticKeywordConverter

@synthesize kLegalFirstChars, kLegalOtherChars, kNSObjectMethods, kAEBSpecifierMethods, kAEBReservedPrefixes;

- (instancetype)init {
    self = [super init];
    if (self) {
        cache = [NSMutableDictionary dictionary]; // cache previously translated keywords for efficiency
        kLegalFirstChars = [NSCharacterSet characterSetWithCharactersInString: UPPERCHAR LOWERCHAR OTHER];
        kLegalOtherChars = [NSCharacterSet characterSetWithCharactersInString: UPPERCHAR LOWERCHAR OTHER NUMERIC];
        // NSObject base class
        kNSObjectMethods = [NSSet setWithObjects: // TO DO: introspect NSObject for these, if practical
                            @"initialize",
                            @"load",
                            @"new",
                            @"alloc",
                            @"allocWithZone",
                            @"init",
                            @"copy",
                            @"copyWithZone",
                            @"mutableCopy",
                            @"mutableCopyWithZone",
                            @"dealloc",
                            @"finalize",
                            @"class",
                            @"superclass",
                            @"isSubclassOfClass",
                            @"instancesRespondToSelector",
                            @"conformsToProtocol",
                            @"methodForSelector",
                            @"instanceMethodForSelector",
                            @"instanceMethodSignatureForSelector",
                            @"methodSignatureForSelector",
                            @"description",
                            @"poseAsClass",
                            @"cancelPreviousPerformRequestsWithTarget",
                            @"forwardInvocation",
                            @"doesNotRecognizeSelector",
                            @"awakeAfterUsingCoder",
                            @"classForArchiver",
                            @"classForCoder",
                            @"classForKeyedArchiver",
                            @"classFallbacksForKeyedArchiver",
                            @"classForKeyedUnarchiver",
                            @"classForPortCoder",
                            @"replacementObjectForArchiver",
                            @"replacementObjectForCoder",
                            @"replacementObjectForKeyedArchiver",
                            @"replacementObjectForPortCoder",
                            @"setVersion",
                            @"version",
                            @"attributeKeys",
                            @"classDescription",
                            @"inverseForRelationshipKey",
                            @"toManyRelationshipKeys",
                            @"toOneRelationshipKeys",
                            @"classCode",
                            @"className",
                            @"scriptingProperties",
                            @"setScriptingProperties",
                            nil];
        kAEBSpecifierMethods = [NSSet setWithObjects: // names reserved on both Swift and ObjC glues
                                @"app",
                                @"con",
                                @"its",
                                // miscellaneous
                                @"isRunning",
                                @"relaunchMode",
                                @"seRelaunchMode",
                                @"launchApplication",
                                @"launchApplicationWithError",
                                @"reconnectApplication",
                                @"reconnectApplicationWithError",
                                @"beginTransaction",
                                @"beginTransactionWithError",
                                @"beginTransactionWithSession",
                                @"abortTransaction",
                                @"abortTransactionWithError",
                                @"endTransaction",
                                @"endTransactionWithError",
                                nil];
        kAEBReservedPrefixes = [NSSet setWithObjects: @"NS", @"AEM", @"AEB", nil];
    }
    return self;
}

// for now, just use same conversion algorithm for Swift and ObjC
-(NSString *)convertName:(NSString *)s reservedKeywords:(NSSet *)reservedWords { // Convert string to identifier
    NSString *result = cache[s];
    if (result) return result;
    s = [s stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (!s.length) return @"_"; // sanity check
    NSMutableString *tmp = [NSMutableString stringWithString: s];
    if ([tmp hasPrefix: @"init "]) { // if "init" is first word in name, escape it separately to avoid any confusion in Swift
        [tmp replaceCharactersInRange: NSMakeRange(0, 5) withString: @"_init_"];
    }
    // convert keyword to camelcase, e.g. "audio CD playlist" -> "audioCDPlaylist"
    for (NSInteger i = tmp.length - 1; i >= 0; i--) {
        unichar c = [tmp characterAtIndex: i];
        if (![self.kLegalOtherChars characterIsMember: c]) {
            if (c == ' ' || c == '-' || c == '/') { // remove word separator character and capitalize next word
                [tmp replaceCharactersInRange: NSMakeRange(i,2)
                                   withString: [tmp substringWithRange: NSMakeRange(i+1,1)].uppercaseString];
            } else if (c == '&') { // replace "&" with "And"
                [tmp replaceCharactersInRange: NSMakeRange(i,1) withString: @"And"];
            } else { // replace character with "0xXX" hex code // TO DO: use Swift's backtick identifier quoting where possible?
                [tmp replaceCharactersInRange: NSMakeRange(i,1) withString: [NSString stringWithFormat: @"0x%2.2X", c]];
            }
        }
    }
    // sanity check: if first character is digit (which it shouldn't ever be), prefix with underscore
    if (![self.kLegalFirstChars characterIsMember: [tmp characterAtIndex: 0]]) [tmp insertString: @"_" atIndex: 0];
    result = [tmp copy];
    if ([reservedWords containsObject: result]
        || [result hasPrefix: @"_"]
        || [result.lowercaseString hasPrefix: @"aeb"]
        || [result.lowercaseString hasPrefix: @"aem"]
        || !result.length) {
        result = [self escapeName: result];
    }
    cache[s] = result;
    return result;
}

- (NSString *)identifierForAppName:(NSString *)appName reservedWords:(NSSet *)reservedWords {
    // TO DO: see how well this does in practice
    // TO DO: decide if first letter should always be capitalized (currently it is, e.g. iTunes->ITunes, which is consistent with standard class naming practices, though less visually appealing)
    NSMutableString *tmp = [NSMutableString stringWithString: [self convertName: appName reservedKeywords: reservedWords]];
    [tmp replaceCharactersInRange: NSMakeRange(0, 1) withString: [tmp substringWithRange: NSMakeRange(0, 1)].uppercaseString];
    NSString *result = [tmp copy];
    return ([reservedWords containsObject: result]) ? [self escapeName: result] : result;
}

- (NSString *)prefixForAppName:(NSString *)appName reservedWords:(NSSet *)reservedWords {
    // Auto-generate a reasonable default classname prefix from an application name.
    // Only A-Z/a-z characters are used, so is most effective when app's name is mostly composed of those characters.
    // Split name into 'words' based on existing word separator characters (space, underscore, hyphen) and intercaps, if any
    NSMutableString *tmp = [NSMutableString stringWithString: appName.decomposedStringWithCanonicalMapping];
    [tmp replaceOccurrencesOfString: @"[^A-Za-z _-]" withString: @""
                            options: NSRegularExpressionSearch range: NSMakeRange(0, tmp.length)];
    [tmp replaceOccurrencesOfString: @"([A-Z])" withString: @" $1" // TO DO: check backwards compatibility (pre Xcode6?)
                            options: NSRegularExpressionSearch range: NSMakeRange(0, tmp.length)];
    [tmp replaceOccurrencesOfString: @"[ _-]+" withString: @" "
                            options: NSRegularExpressionSearch range: NSMakeRange(0, tmp.length)];
    NSArray *words = [[tmp stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]] componentsSeparatedByString: @" "];
    // assemble 3-character prefix, padding with 'X's if fewer than 3 suitable characters are found
    NSString *result;
    if (words.count == 1) { // use first 3 chars of word, e.g. Finder->FIN
        NSString *word = words[0];
        result = [word substringToIndex: fmin(3, word.length)];
    } else if (words.count == 2) {
        NSString *word1 = words[0], *word2 = words[1];
        if (word2.length == 1) { // use first 2 chars of first word + only char of second word, e.g. FooB->FOB
            result = [[word1 substringToIndex: fmin(2, word1.length)] stringByAppendingString: [word2 substringToIndex: 1]];
        } else { // use first char of first word + first 2 chars of second word, e.g. TextEdit->TED
            result = [[word1 substringToIndex: 1] stringByAppendingString: [word2 substringToIndex: 2]];
        }
    } else { // use first char of first 3 words, e.g. Adobe InDesign->AID
        NSString *word1 = words[0], *word2 = words[1], *word3 = words[2];
        result = [[[word1 substringToIndex: 1] stringByAppendingString: [word2 substringToIndex: 1]]
                                               stringByAppendingString: [word3 substringToIndex: 1]];
    }
    if (result.length < 3) result = [result stringByPaddingToLength: 3 withString: @"X" startingAtIndex: 0];
    result = result.uppercaseString;
    return ([reservedWords containsObject: result]) ? [self escapeName: result] : result;
}

- (NSString *)escapeName:(NSString *)s {
    return [s stringByAppendingString: @"_"];
}

@end




@implementation AEBSwiftKeywordConverter

@synthesize kSwiftKeywords, kAEBSwiftSpecifierMethods, kAEBSwiftParameterNames,
            kReservedSpecifierWords, kReservedParameterWords, kReservedPrefixes;

+ (instancetype)sharedKeywordConverter {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        kSwiftKeywords = [NSSet setWithObjects: // Swift 2.0
                          // Keywords used in declarations:
                          @"class", @"deinit", @"enum", @"extension", @"func", @"import", @"init", @"internal", @"let", @"operator",
                          @"private", @"protocol", @"public", @"static", @"struct", @"subscript", @"typealias", @"var",
                          // Keywords used in statements:
                          @"break", @"case", @"continue", @"default", @"do", @"else", @"fallthrough", @"for", @"if", @"in", @"return",
                          @"switch", @"where", @"while",
                          // Keywords used in expressions and types:
                          @"as", @"dynamicType", @"false", @"is", @"nil", @"self", @"Self", @"super", @"true",
                          @"__COLUMN__", @"__FILE__", @"__FUNCTION__", @"__LINE__",
                          // Keywords reserved in particular contexts:
                          @"associativity", @"convenience", @"dynamic", @"didSet", @"final", @"infix", @"inout", @"lazy", @"left",
                          @"mutating", @"none", @"nonmutating",
                          @"optional", @"override", @"postfix", @"precedence", @"prefix", @"Protocol", @"required", @"right",
                          @"Type", @"unowned", @"weak", @"willSet",
                          // "get", @"set",  // only used in defining getters/setters so shouldn't conflict with apps' get(), set() commands
                          nil];
        // Swift glue methods
        kAEBSwiftSpecifierMethods = [NSSet setWithObjects:
                                     // custom property/element specifiers
                                     @"propertyByCode",
                                     @"elementsByCode",
                                     @"customRoot",
                                     // sendAppleEvent(eventClass:eventID:...
                                     // element(s) selectors
                                     @"ID",
                                     @"beginning",
                                     @"end",
                                     @"before",
                                     @"after",
                                     @"previous",
                                     @"next",
                                     @"first",
                                     @"middle",
                                     @"last",
                                     @"any",
                                     // test clause constructors
                                     @"beginsWith",
                                     @"endsWith",
                                     @"contains",
                                     @"isIn",
                                     // used by AEBSymbol
                                     @"aebSymbolForCode",
                                     @"symbolWithDescriptor",
                                     // currently unused
                                     @"help", // TO DO: uppercase?
                                     nil];
        kAEBSwiftParameterNames = [NSSet setWithObjects:
                                   // standard parameter+attribute names used in SwiftGlueTemplate
                                   @"directParameter",
                                   @"returnType",
                                   @"waitReply",
                                   @"withTimeout",
                                   @"considering",
                                   @"ignoring",
                                   nil];
        kReservedSpecifierWords = [[[kSwiftKeywords setByAddingObjectsFromSet: kAEBSwiftSpecifierMethods]
                                                    setByAddingObjectsFromSet: self.kAEBSpecifierMethods]
                                                    setByAddingObjectsFromSet: self.kNSObjectMethods];
        kReservedParameterWords = [kSwiftKeywords setByAddingObjectsFromSet: kAEBSwiftParameterNames];
        kReservedPrefixes = [self.kSwiftKeywords setByAddingObjectsFromSet: self.kAEBReservedPrefixes];
    }
    return self;
}

            
- (NSString *)convertSpecifierName:(NSString *)s {
    return [self convertName: s reservedKeywords: self.kReservedSpecifierWords];
}

- (NSString *)convertParameterName:(NSString *)s {
    return [self convertName: s reservedKeywords: self.kReservedParameterWords];
}

- (NSString *)identifierForAppName:(NSString *)appName {
    return [self identifierForAppName: appName reservedWords: self.kSwiftKeywords];
}

- (NSString *)prefixForAppName:(NSString *)appName {
    return [self prefixForAppName: appName reservedWords: self.kReservedPrefixes];
}

@end



@implementation AEBObjCKeywordConverter

@synthesize kObjectiveCKeywords, kAEBObjectiveCMethods, kReservedWords, kReservedPrefixes;

+ (instancetype)sharedKeywordConverter {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        kObjectiveCKeywords = [NSSet setWithObjects:
                               @"const",
                               @"extern",
                               @"auto",
                               @"register",
                               @"static",
                               @"unsigned",
                               @"signed",
                               @"volatile",
                               @"char",
                               @"double",
                               @"float",
                               @"int",
                               @"long",
                               @"short",
                               @"void",
                               @"typedef",
                               @"struct",
                               @"union",
                               @"enum",
                               @"id",
                               @"Class",
                               @"SEL",
                               @"IMP",
                               @"BOOL",
                               @"return",
                               @"goto",
                               @"if",
                               @"else",
                               @"case",
                               @"default",
                               @"switch",
                               @"break",
                               @"continue",
                               @"while",
                               @"do",
                               @"for",
                               @"in",
                               @"sizeof",
                               @"self",
                               @"super",
                               @"nil",
                               @"NIL",
                               @"YES",
                               @"NO",
                               @"true",
                               @"false",
                               @"inline",
                               nil];
        // methods defined by ObjC glue base classes (AEBStaticSpecifier, etc)
        kAEBObjectiveCMethods = [NSSet setWithObjects:
                                 // custom property/element specifiers
                                 @"propertyByCode",
                                 @"elementsByCode",
                                 @"customRoot",
                                 // element(s) selectors
                                 @"at",
                                 @"byIndex",
                                 @"byName",
                                 @"byID",
                                 @"byTest",
                                 @"beginning",
                                 @"end",
                                 @"before",
                                 @"after",
                                 @"previous",
                                 @"next",
                                 @"first",
                                 @"middle",
                                 @"last",
                                 @"any",
                                 // test clause constructors
                                 @"greaterThan",
                                 @"greaterOrEquals",
                                 @"equals",
                                 @"notEquals",
                                 @"lessThan",
                                 @"lessOrEquals",
                                 @"beginsWith",
                                 @"endsWith",
                                 @"contains",
                                 @"isIn",
                                 @"doesNotBeginWith",
                                 @"doesNotEndWith",
                                 @"doesNotContain",
                                 @"isNotIn",
                                 @"AND",
                                 @"NOT",
                                 @"OR",
                                 // shortcuts
                                 @"setItem",
                                 @"getItem",
                                 @"getItemWithError",
                                 @"getList",
                                 @"getListWithError",
                                 @"getItemOfType",
                                 @"getListOfType",
                                 @"getIntWithError",
                                 @"getLongWithError",
                                 @"getDoubleWithError",
                                 // used by aebglue-generated XXApplication classes
                                 @"initWithName",
                                 @"initWithBundleID",
                                 @"initWithSignature",
                                 @"initWithPath",
                                 @"initWithURL",
                                 @"initWithProcessID",
                                 @"initWithDescriptor",
                                 // used by AEBStaticSymbol
                                 @"symbolWithName",
                                 @"aebSymbolForCode",
                                 // used by AEBStaticCommand
                                 @"considering",
                                 @"sendMode",
                                 @"waitForReply",
                                 @"ignoreReply",
                                 @"queueReply",
                                 @"timeout",
                                 @"requestedClass",
                                 @"requestedType",
                                 @"returnClass",
                                 @"returnType",
                                 @"returnList",
                                 @"returnListOfClass",
                                 @"returnListOfType",
                                 @"returnDescriptor",
                                 @"sendWithError",
                                 @"send",
                                 // currently unused
                                 @"ignoring",
                                 @"returnID",
                                 @"help",
                                 nil];
        kReservedWords = [[[kObjectiveCKeywords setByAddingObjectsFromSet: kAEBObjectiveCMethods]
                                                setByAddingObjectsFromSet: self.kAEBSpecifierMethods]
                                                setByAddingObjectsFromSet: self.kNSObjectMethods];
        kReservedPrefixes = [self.kObjectiveCKeywords setByAddingObjectsFromSet: self.kAEBReservedPrefixes];
    }
    return self;
}


- (NSString *)convertSpecifierName:(NSString *)s {
    return [self convertName: s reservedKeywords: self.kReservedWords];
}

- (NSString *)convertParameterName:(NSString *)s {
    return [self convertName: s reservedKeywords: self.kReservedWords];
}

- (NSString *)identifierForAppName:(NSString *)appName {
    return [self identifierForAppName: appName reservedWords: self.kObjectiveCKeywords];
}

- (NSString *)prefixForAppName:(NSString *)appName {
    return [self prefixForAppName: appName reservedWords: self.kReservedPrefixes];
}

@end


