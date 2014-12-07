//
//  AEBDefaultTerms.m
//

#import "AEBDefaultTerms.h"


// TO DO: this should use AS-style names and convert them on first use (i.e. each language would need to create its own AEBDefaultTerms instance, passing its own keyword converter to -[AEBDefaultTerms initWithKeywordConverter:], then pass it to terminology table builder every time it gets an apps' terms)

// TO DO: Would make life easier for users if less useful types aren't listed in introspection APIs, so add a 'legacy' arg to AEBDynamicKeywordTerm's init method and a LEGACY_TYPE_NAME macro for use below so they can be filtered out.


// TO DO: check for any missing terms (e.g. ctxt); try using TextEdit with AppleEventBridge AEB_DEBUG_PARSER enabled

#define TYPE_NAME(tName, tCode)          [[AEBDynamicKeywordTerm alloc] initWithName: (tName) code: (tCode) kind: kAEBTermType]
#define PROP_NAME(tName, tCode)          [[AEBDynamicKeywordTerm alloc] initWithName: (tName) code: (tCode) kind: kAEBTermProperty]
#define ENUM_NAME(tName, tCode)          [[AEBDynamicKeywordTerm alloc] initWithName: (tName) code: (tCode) kind: kAEBTermEnumerator]
#define COMMAND_NAME(eName, eClass, eID) [[AEBDynamicCommandTerm alloc] initWithName: (eName) eventClass: (eClass) eventID: (eID)]
#define PARAM(term, pName, pCode)        [(term) addParameterWithName: (pName) code: (pCode)]


@implementation AEBDefaultTerms

-(NSArray *)types {
    static dispatch_once_t pred = 0;
    __strong static NSArray *data = nil;
    dispatch_once(&pred, ^{
        data = @[TYPE_NAME(@"anything", '****'),
                 
                 TYPE_NAME(@"boolean", 'bool'),
                 
                 TYPE_NAME(@"shortInteger", 'shor'),
                 TYPE_NAME(@"integer", 'long'),
                 TYPE_NAME(@"unsignedInteger", 'magn'),
                 TYPE_NAME(@"doubleInteger", 'comp'),
                 
                 TYPE_NAME(@"fixed", 'fixd'),
                 TYPE_NAME(@"longFixed", 'lfxd'),
                 TYPE_NAME(@"decimalStruct", 'decm'),
                 
                 TYPE_NAME(@"shortFloat", 'sing'),
                 TYPE_NAME(@"float", 'doub'),
                 TYPE_NAME(@"extendedFloat", 'exte'),
                 TYPE_NAME(@"float128bit", 'ldbl'),
                 
                 TYPE_NAME(@"string", 'TEXT'),
                 TYPE_NAME(@"CString", 'cstr'),
                 TYPE_NAME(@"PascalString", 'pstr'),
                 TYPE_NAME(@"styledText", 'STXT'),
                 TYPE_NAME(@"textStyleInfo", 'tsty'),
                 TYPE_NAME(@"styledClipboardText", 'styl'),
                 TYPE_NAME(@"encodedString", 'encs'),
                 TYPE_NAME(@"writingCode", 'psct'),
                 TYPE_NAME(@"internationalWritingCode", 'intl'),
                 TYPE_NAME(@"internationalText", 'itxt'),
                 TYPE_NAME(@"styledUnicodeText", 'sutx'),
                 TYPE_NAME(@"UnicodeText", 'utxt'),
                 TYPE_NAME(@"UTF8Text", 'utf8'), // typeUTF8Text
                 TYPE_NAME(@"UTF16Text", 'ut16'), // typeUTF16ExternalRepresentation
                 
                 TYPE_NAME(@"version", 'vers'),
                 TYPE_NAME(@"date", 'ldt '),
                 TYPE_NAME(@"list", 'list'),
                 TYPE_NAME(@"record", 'reco'),
                 TYPE_NAME(@"data", 'rdat'),
                 TYPE_NAME(@"script", 'scpt'),
                 
                 // 'reference' is an AS keyword, but ASLG prefers 'object specifier'; either rename or add 'object specifier' as preferred alias
                 TYPE_NAME(@"locationReference", 'insl'), // TO DO: rename 'insertion specifier'?
                 TYPE_NAME(@"reference", 'obj '), // TO DO: rename 'object specifier'?
                 
                 TYPE_NAME(@"alias", 'alis'),
                 TYPE_NAME(@"fileRef", 'fsrf'),
                 TYPE_NAME(@"fileSpecification", 'fss '),
                 TYPE_NAME(@"fileURL", 'furl'),
                 
                 TYPE_NAME(@"point", 'QDpt'),
                 TYPE_NAME(@"boundingRectangle", 'qdrt'),
                 TYPE_NAME(@"fixedPoint", 'fpnt'),
                 TYPE_NAME(@"fixedRectangle", 'frct'),
                 TYPE_NAME(@"longPoint", 'lpnt'),
                 TYPE_NAME(@"longRectangle", 'lrct'),
                 TYPE_NAME(@"longFixedPoint", 'lfpt'),
                 TYPE_NAME(@"longFixedRectangle", 'lfrc'),
                 
                 TYPE_NAME(@"EPSPicture", 'EPS '),
                 TYPE_NAME(@"GIFPicture", 'GIFf'),
                 TYPE_NAME(@"JPEGPicture", 'JPEG'),
                 TYPE_NAME(@"PICTPicture", 'PICT'),
                 TYPE_NAME(@"TIFFPicture", 'TIFF'),
                 TYPE_NAME(@"RGBColor", 'cRGB'),
                 TYPE_NAME(@"RGB16Color", 'tr16'),
                 TYPE_NAME(@"RGB96Color", 'tr96'),
                 TYPE_NAME(@"graphicText", 'cgtx'),
                 TYPE_NAME(@"colorTable", 'clrt'),
                 TYPE_NAME(@"pixelMapRecord", 'tpmm'),
                 
                 TYPE_NAME(@"best", 'best'),
                 TYPE_NAME(@"typeClass", 'type'),
                 TYPE_NAME(@"enumerator", 'enum'),
                 TYPE_NAME(@"property", 'prop'),
                 
                 // AEAddressDesc types
                 
                 TYPE_NAME(@"machPort", 'port'),
                 TYPE_NAME(@"kernelProcessID", 'kpid'),
                 TYPE_NAME(@"applicationBundleID", 'bund'),
                 TYPE_NAME(@"processSerialNumber", 'psn '),
                 TYPE_NAME(@"applicationSignature", 'sign'),
                 TYPE_NAME(@"applicationURL", 'aprl'),
                 
                 // misc.
                 
                 TYPE_NAME(@"missingValue", 'msng'),
                 
                 TYPE_NAME(@"class", 'pcls'),
                 
                 TYPE_NAME(@"null", 'null'),
                 
                 TYPE_NAME(@"machineLocation", 'mLoc'),
                 TYPE_NAME(@"machine", 'mach'),
                 
                 TYPE_NAME(@"dashStyle", 'tdas'),
                 TYPE_NAME(@"rotation", 'trot'),
                 
                 TYPE_NAME(@"suiteInfo", 'suin'),
                 TYPE_NAME(@"classInfo", 'gcli'),
                 TYPE_NAME(@"propertyInfo", 'pinf'),
                 TYPE_NAME(@"elementInfo", 'elin'),
                 TYPE_NAME(@"eventInfo", 'evin'),
                 TYPE_NAME(@"parameterInfo", 'pmin'),
                 
                 // unit types
                 
                 TYPE_NAME(@"centimeters", 'cmtr'),
                 TYPE_NAME(@"meters", 'metr'),
                 TYPE_NAME(@"kilometers", 'kmtr'),
                 TYPE_NAME(@"inches", 'inch'),
                 TYPE_NAME(@"feet", 'feet'),
                 TYPE_NAME(@"yards", 'yard'),
                 TYPE_NAME(@"miles", 'mile'),
                 
                 TYPE_NAME(@"squareMeters", 'sqrm'),
                 TYPE_NAME(@"squareKilometers", 'sqkm'),
                 TYPE_NAME(@"squareFeet", 'sqft'),
                 TYPE_NAME(@"squareYards", 'sqyd'),
                 TYPE_NAME(@"squareMiles", 'sqmi'),
                 
                 TYPE_NAME(@"cubicCentimeters", 'ccmt'),
                 TYPE_NAME(@"cubicMeters", 'cmet'),
                 TYPE_NAME(@"cubicInches", 'cuin'),
                 TYPE_NAME(@"cubicFeet", 'cfet'),
                 TYPE_NAME(@"cubicYards", 'cyrd'),
                 
                 TYPE_NAME(@"liters", 'litr'),
                 TYPE_NAME(@"quarts", 'qrts'),
                 TYPE_NAME(@"gallons", 'galn'),
                 
                 TYPE_NAME(@"grams", 'gram'),
                 TYPE_NAME(@"kilograms", 'kgrm'),
                 TYPE_NAME(@"ounces", 'ozs '),
                 TYPE_NAME(@"pounds", 'lbs '),
                 
                 TYPE_NAME(@"degreesCelsius", 'degc'),
                 TYPE_NAME(@"degreesFahrenheit", 'degf'),
                 TYPE_NAME(@"degreesKelvin", 'degk'),
                 
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
    });
    return data;
}

-(NSArray *)enumerators {
    static dispatch_once_t pred = 0;
    __strong static NSArray *data = nil;
    dispatch_once(&pred, ^{
        data = @[ENUM_NAME(@"yes", 'yes '),
                 ENUM_NAME(@"no", 'no  '),
                 ENUM_NAME(@"ask", 'ask '),
                 
                 ENUM_NAME(@"case", 'case'),
                 ENUM_NAME(@"diacriticals", 'diac'),
                 ENUM_NAME(@"expansion", 'expa'),
                 ENUM_NAME(@"hyphens", 'hyph'),
                 ENUM_NAME(@"punctuation", 'punc'),
                 ENUM_NAME(@"whitespace", 'whit'),
                 ENUM_NAME(@"numericStrings", 'nume'),
                 ENUM_NAME(@"applicationResponses", 'rmte')];
    });
    return data;
}

-(NSArray *)properties {
    static dispatch_once_t pred = 0;
    __strong static NSArray *data = nil;
    dispatch_once(&pred, ^{
        data = @[PROP_NAME(@"class", 'pcls'),
                 PROP_NAME(@"id", 'ID  ')];
    });
    return data;
}

-(NSArray *)elements {
    static dispatch_once_t pred = 0;
    __strong static NSArray *data = nil;
    dispatch_once(&pred, ^{
        data = @[];
    });
    return data;
}

-(NSArray *)commands {
    static dispatch_once_t pred = 0;
    __strong static NSArray *data = nil;
    dispatch_once(&pred, ^{
        data = @[COMMAND_NAME(@"run", 'aevt', 'oapp'),
                 COMMAND_NAME(@"open", 'aevt', 'odoc'),
                 COMMAND_NAME(@"print", 'aevt', 'pdoc'),
           PARAM(COMMAND_NAME(@"quit", 'aevt', 'quit'), @"saving", 'savo'),
               
                 COMMAND_NAME(@"reopen", 'aevt', 'rapp'),
                 COMMAND_NAME(@"launch", 'ascr', 'noop'),
                 COMMAND_NAME(@"activate", 'misc', 'actv'),
           PARAM(COMMAND_NAME(@"openLocation", 'GURL', 'GURL'), @"window", 'WIND'),
               
                 COMMAND_NAME(@"get", 'core', 'getd'),
           PARAM(COMMAND_NAME(@"set", 'core', 'setd'), @"to", 'data')];
    });
    return data;
}

@end

