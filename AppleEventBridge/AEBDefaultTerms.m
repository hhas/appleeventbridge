//
//  AEBDefaultTerms.m
//

#import "AEBDefaultTerms.h"


// TO DO: this should use AS-style names and convert them on first use (i.e. each language would need to create its own AEBDefaultTerms instance, passing its own keyword converter to -[AEBDefaultTerms initWithKeywordConverter:], then pass it to terminology table builder every time it gets an apps' terms)

// TO DO: Would make life easier for users if less useful types aren't listed in introspection APIs, so add a 'legacy' arg to AEBDynamicKeywordTerm's init method and a LEGACY_TYPE_NAME macro for use below so they can be filtered out.


// TO DO: check for any missing terms (e.g. ctxt); try using TextEdit with AppleEventBridge AEB_DEBUG_PARSER enabled

#define KEYWORD(aName) (([converter convert: (aName)]))

#define TYPE_NAME(tName, tCode)          ([[AEBDynamicKeywordTerm alloc] initWithName: KEYWORD((tName)) code: (tCode) kind: kAEBTermType])
#define PROP_NAME(tName, tCode)          ([[AEBDynamicKeywordTerm alloc] initWithName: KEYWORD((tName)) code: (tCode) kind: kAEBTermProperty])
#define ENUM_NAME(tName, tCode)          ([[AEBDynamicKeywordTerm alloc] initWithName: KEYWORD((tName)) code: (tCode) kind: kAEBTermEnumerator])
#define COMMAND_NAME(eName, eClass, eID) ([[AEBDynamicCommandTerm alloc] initWithName: KEYWORD((eName)) eventClass: (eClass) eventID: (eID)])
#define PARAM(term, pName, pCode)        ([(term) addParameterWithName: KEYWORD((pName)) code: (pCode)])


@implementation AEBDefaultTerms

@synthesize types, enumerators, properties, elements, commands;

- (instancetype)initWithKeywordConverter:(AEBDefaultKeywordConverter *)converter {
    self = [super init];
    if (!self) return self;
    types = @[TYPE_NAME(@"anything", '****'),
              TYPE_NAME(@"boolean", 'bool'),
              
              TYPE_NAME(@"short integer", 'shor'),
              TYPE_NAME(@"integer", 'long'),
              TYPE_NAME(@"unsigned integer", 'magn'),
              TYPE_NAME(@"double integer", 'comp'),
              
              TYPE_NAME(@"fixed", 'fixd'),
              TYPE_NAME(@"long fixed", 'lfxd'),
              TYPE_NAME(@"decimal struct", 'decm'),
              
              TYPE_NAME(@"short float", 'sing'),
              TYPE_NAME(@"float", 'doub'),
              TYPE_NAME(@"extended float", 'exte'),
              TYPE_NAME(@"float 128bit", 'ldbl'),
              
              TYPE_NAME(@"string", 'TEXT'),
              TYPE_NAME(@"C string", 'cstr'),
              TYPE_NAME(@"Pascal string", 'pstr'),
              TYPE_NAME(@"styled text", 'STXT'),
              TYPE_NAME(@"text style info", 'tsty'),
              TYPE_NAME(@"styled clipboard text", 'styl'),
              TYPE_NAME(@"encoded string", 'encs'),
              TYPE_NAME(@"writing code", 'psct'),
              TYPE_NAME(@"international writing code", 'intl'),
              TYPE_NAME(@"international text", 'itxt'),
              TYPE_NAME(@"styled Unicode text", 'sutx'),
              TYPE_NAME(@"Unicode text", 'utxt'),
              TYPE_NAME(@"UTF8 text", 'utf8'), // typeUTF8Text
              TYPE_NAME(@"UTF16 text", 'ut16'), // typeUTF16ExternalRepresentation
              
              TYPE_NAME(@"version", 'vers'),
              TYPE_NAME(@"date", 'ldt '),
              TYPE_NAME(@"list", 'list'),
              TYPE_NAME(@"record", 'reco'),
              TYPE_NAME(@"data", 'rdat'),
              TYPE_NAME(@"script", 'scpt'),
              
              // 'reference' is an AS keyword, but ASLG prefers 'object specifier'; either rename or add 'object specifier' as preferred alias
              TYPE_NAME(@"location reference", 'insl'), // TO DO: rename 'insertion specifier'?
              TYPE_NAME(@"reference", 'obj '), // TO DO: rename 'object specifier'?
              
              TYPE_NAME(@"alias", 'alis'),
              TYPE_NAME(@"file ref", 'fsrf'),
              TYPE_NAME(@"file specification", 'fss '),
              TYPE_NAME(@"file URL", 'furl'),
              
              TYPE_NAME(@"point", 'QDpt'),
              TYPE_NAME(@"bounding rectangle", 'qdrt'),
              TYPE_NAME(@"fixed point", 'fpnt'),
              TYPE_NAME(@"fixed rectangle", 'frct'),
              TYPE_NAME(@"long point", 'lpnt'),
              TYPE_NAME(@"long rectangle", 'lrct'),
              TYPE_NAME(@"long fixed point", 'lfpt'),
              TYPE_NAME(@"long fixed rectangle", 'lfrc'),
              
              TYPE_NAME(@"EPS picture", 'EPS '),
              TYPE_NAME(@"GIF picture", 'GIFf'),
              TYPE_NAME(@"JPEG picture", 'JPEG'),
              TYPE_NAME(@"PICT picture", 'PICT'),
              TYPE_NAME(@"TIFF picture", 'TIFF'),
              TYPE_NAME(@"RGB color", 'cRGB'),
              TYPE_NAME(@"RGB16 color", 'tr16'),
              TYPE_NAME(@"RGB96 color", 'tr96'),
              TYPE_NAME(@"graphic text", 'cgtx'),
              TYPE_NAME(@"color table", 'clrt'),
              TYPE_NAME(@"pixel map record", 'tpmm'),
              
              TYPE_NAME(@"best", 'best'),
              TYPE_NAME(@"type class", 'type'),
              TYPE_NAME(@"enumerator", 'enum'),
              TYPE_NAME(@"property", 'prop'),
              
              // AEAddressDesc types
              
              TYPE_NAME(@"mach port", 'port'),
              TYPE_NAME(@"kernel process ID", 'kpid'),
              TYPE_NAME(@"application bundle ID", 'bund'),
              TYPE_NAME(@"process serial number", 'psn '),
              TYPE_NAME(@"application signature", 'sign'),
              TYPE_NAME(@"application URL", 'aprl'),
              
              // misc.
              
              TYPE_NAME(@"missing value", 'msng'),
              
              TYPE_NAME(@"class", 'pcls'),
              
              TYPE_NAME(@"null", 'null'),
              
              TYPE_NAME(@"machine location", 'mLoc'),
              TYPE_NAME(@"machine", 'mach'),
              
              TYPE_NAME(@"dash style", 'tdas'),
              TYPE_NAME(@"rotation", 'trot'),
              
              TYPE_NAME(@"suite info", 'suin'),
              TYPE_NAME(@"class info", 'gcli'),
              TYPE_NAME(@"property info", 'pinf'),
              TYPE_NAME(@"element info", 'elin'),
              TYPE_NAME(@"event info", 'evin'),
              TYPE_NAME(@"parameter info", 'pmin'),
              
              // unit types
              
              TYPE_NAME(@"centimeters", 'cmtr'),
              TYPE_NAME(@"meters", 'metr'),
              TYPE_NAME(@"kilometers", 'kmtr'),
              TYPE_NAME(@"inches", 'inch'),
              TYPE_NAME(@"feet", 'feet'),
              TYPE_NAME(@"yards", 'yard'),
              TYPE_NAME(@"miles", 'mile'),
              
              TYPE_NAME(@"square meters", 'sqrm'),
              TYPE_NAME(@"square kilometers", 'sqkm'),
              TYPE_NAME(@"square feet", 'sqft'),
              TYPE_NAME(@"square yards", 'sqyd'),
              TYPE_NAME(@"square miles", 'sqmi'),
              
              TYPE_NAME(@"cubicCentimeters", 'ccmt'),
              TYPE_NAME(@"cubic meters", 'cmet'),
              TYPE_NAME(@"cubic inches", 'cuin'),
              TYPE_NAME(@"cubic feet", 'cfet'),
              TYPE_NAME(@"cubic yards", 'cyrd'),
              
              TYPE_NAME(@"liters", 'litr'),
              TYPE_NAME(@"quarts", 'qrts'),
              TYPE_NAME(@"gallons", 'galn'),
              
              TYPE_NAME(@"grams", 'gram'),
              TYPE_NAME(@"kilograms", 'kgrm'),
              TYPE_NAME(@"ounces", 'ozs '),
              TYPE_NAME(@"pounds", 'lbs '),
              
              TYPE_NAME(@"degrees Celsius", 'degc'),
              TYPE_NAME(@"degrees Fahrenheit", 'degf'),
              TYPE_NAME(@"degrees Kelvin", 'degk'),
              
              // month and weekday
              
              TYPE_NAME(@"January", 'jan '),
              TYPE_NAME(@"February", 'feb '),
              TYPE_NAME(@"March", 'mar '),
              TYPE_NAME(@"April", 'apr '),
              TYPE_NAME(@"May", 'may '),
              TYPE_NAME(@"June", 'jun '),
              TYPE_NAME(@"July", 'jul '),
              TYPE_NAME(@"August", 'aug '),
              TYPE_NAME(@"September", 'sep '),
              TYPE_NAME(@"October", 'oct '),
              TYPE_NAME(@"November", 'nov '),
              TYPE_NAME(@"December", 'dec '),
              
              TYPE_NAME(@"Sunday", 'sun '),
              TYPE_NAME(@"Monday", 'mon '),
              TYPE_NAME(@"Tuesday", 'tue '),
              TYPE_NAME(@"Wednesday", 'wed '),
              TYPE_NAME(@"Thursday", 'thu '),
              TYPE_NAME(@"Friday", 'fri '),
              TYPE_NAME(@"Saturday", 'sat ')];
    enumerators = @[ENUM_NAME(@"yes", 'yes '),
                    ENUM_NAME(@"no", 'no  '),
                    ENUM_NAME(@"ask", 'ask '),
                    
                    ENUM_NAME(@"case", 'case'),
                    ENUM_NAME(@"diacriticals", 'diac'),
                    ENUM_NAME(@"expansion", 'expa'),
                    ENUM_NAME(@"hyphens", 'hyph'),
                    ENUM_NAME(@"punctuation", 'punc'),
                    ENUM_NAME(@"whitespace", 'whit'),
                    ENUM_NAME(@"numeric strings", 'nume'),
                    ENUM_NAME(@"application responses", 'rmte')];
    properties = @[PROP_NAME(@"class", 'pcls'),
                   PROP_NAME(@"id", 'ID  ')];
    elements = @[];
    commands = @[COMMAND_NAME(@"run", 'aevt', 'oapp'),
                 COMMAND_NAME(@"open", 'aevt', 'odoc'),
                 COMMAND_NAME(@"print", 'aevt', 'pdoc'),
           PARAM(COMMAND_NAME(@"quit", 'aevt', 'quit'), @"saving", 'savo'),
               
                 COMMAND_NAME(@"reopen", 'aevt', 'rapp'),
                 COMMAND_NAME(@"launch", 'ascr', 'noop'),
                 COMMAND_NAME(@"activate", 'misc', 'actv'),
           PARAM(COMMAND_NAME(@"open location", 'GURL', 'GURL'), @"window", 'WIND'),
               
                 COMMAND_NAME(@"get", 'core', 'getd'),
           PARAM(COMMAND_NAME(@"set", 'core', 'setd'), @"to", 'data')];
    return self;
}

@end

