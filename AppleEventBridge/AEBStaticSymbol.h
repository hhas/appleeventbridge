//
//  AEBStaticSymbol.h
//
//  Built-in typeType/typeEnum definitions, as found in AppleScript's own AETE.
//  Standard AE type names (integer, list), common enumerators (January, yes), etc.
//  Provided by default as some applications may use them without defining their
//  terminology in their own dictionaries.
//

// TO DO: define macro names as shortcuts? e.g.:
//
// AEBTypeUnicodeText
// AEBSymbol.unicodeText
// AEBSymbol.unicodeText
// AEBEnumNo
// AEBSymbol.no
// @{TEPropName: @"README.txt"}
// @{TEConstant.name: @"README.txt"}



#import "AEMUtils.h"

/**********************************************************************/
// macros


#define AEB_RETURN_SYMBOL(aName, aType, aCode) \
    static dispatch_once_t pred = 0; \
    __strong static id obj = nil; \
    dispatch_once(&pred, ^{ \
    obj = [AEBSymbol symbolWithName: (aName) type: (aType) code: (aCode)]; \
    }); \
    return obj;


/**********************************************************************/
// base class for standard and application-defined symbols

@interface AEBSymbol : NSObject<NSCopying> {
	NSString *name;
	NSAppleEventDescriptor *desc;
}

+ (instancetype)symbolWithName:(NSString *)name_ type:(DescType)type_ code:(OSType)code_ NS_RETURNS_RETAINED;
+ (instancetype)symbolWithCode:(OSType)code_;

- (instancetype)initWithName: (NSString *)name_ descriptor:(NSAppleEventDescriptor *)desc_;

- (NSString *)AEBName;
- (OSType)AEBCode;

- (NSAppleEventDescriptor *)AEBPackSelf:(id)codecs error:(NSError * __autoreleasing *)error;


/***********************************/
// Apple Event Manager-defined types and enumerators

/* Enumerators */

+ (instancetype)applicationResponses;
+ (instancetype)ask;
+ (instancetype)case_;
+ (instancetype)diacriticals;
+ (instancetype)expansion;
+ (instancetype)hyphens;
+ (instancetype)no;
+ (instancetype)numericStrings;
+ (instancetype)punctuation;
+ (instancetype)whitespace;
+ (instancetype)yes;

/* Types and properties */

+ (instancetype)April;
+ (instancetype)August;
+ (instancetype)December;
+ (instancetype)EPSPicture;
+ (instancetype)February;
+ (instancetype)Friday;
+ (instancetype)GIFPicture;
+ (instancetype)JPEGPicture;
+ (instancetype)January;
+ (instancetype)July;
+ (instancetype)June;
+ (instancetype)March;
+ (instancetype)May;
+ (instancetype)Monday;
+ (instancetype)November;
+ (instancetype)October;
+ (instancetype)PICTPicture;
+ (instancetype)RGB16Color;
+ (instancetype)RGB96Color;
+ (instancetype)RGBColor;
+ (instancetype)Saturday;
+ (instancetype)September;
+ (instancetype)Sunday;
+ (instancetype)TIFFPicture;
+ (instancetype)Thursday;
+ (instancetype)Tuesday;
+ (instancetype)Wednesday;
+ (instancetype)alias;
+ (instancetype)anything;
+ (instancetype)applicationBundleID;
+ (instancetype)applicationSignature;
+ (instancetype)applicationURL;
+ (instancetype)best;
+ (instancetype)bookmarkData;
+ (instancetype)boolean;
+ (instancetype)boundingRectangle;
+ (instancetype)centimeters;
+ (instancetype)class_;
+ (instancetype)classInfo;
+ (instancetype)colorTable;
+ (instancetype)cubicCentimeters;
+ (instancetype)cubicFeet;
+ (instancetype)cubicInches;
+ (instancetype)cubicMeters;
+ (instancetype)cubicYards;
+ (instancetype)dashStyle;
+ (instancetype)data;
+ (instancetype)date;
+ (instancetype)decimalStruct;
+ (instancetype)degreesCelsius;
+ (instancetype)degreesFahrenheit;
+ (instancetype)degreesKelvin;
+ (instancetype)doubleInteger;
+ (instancetype)elementInfo;
+ (instancetype)encodedString;
+ (instancetype)enumerator;
+ (instancetype)eventInfo;
+ (instancetype)extendedFloat;
+ (instancetype)feet;
+ (instancetype)fileRef;
+ (instancetype)fileSpecification;
+ (instancetype)fileURL;
+ (instancetype)fixed;
+ (instancetype)fixedPoint;
+ (instancetype)fixedRectangle;
+ (instancetype)float_;
+ (instancetype)float128bit;
+ (instancetype)gallons;
+ (instancetype)grams;
+ (instancetype)graphicText;
+ (instancetype)inches;
+ (instancetype)integer;
+ (instancetype)internationalText;
+ (instancetype)internationalWritingCode;
+ (instancetype)kernelProcessID;
+ (instancetype)kilograms;
+ (instancetype)kilometers;
+ (instancetype)list;
+ (instancetype)liters;
+ (instancetype)locationReference;
+ (instancetype)longFixed;
+ (instancetype)longFixedPoint;
+ (instancetype)longFixedRectangle;
+ (instancetype)longPoint;
+ (instancetype)longRectangle;
+ (instancetype)machPort;
+ (instancetype)machine;
+ (instancetype)machineLocation;
+ (instancetype)meters;
+ (instancetype)miles;
+ (instancetype)missingValue;
+ (instancetype)null;
+ (instancetype)ounces;
+ (instancetype)parameterInfo;
+ (instancetype)pixelMapRecord;
+ (instancetype)point;
+ (instancetype)pounds;
+ (instancetype)processSerialNumber;
+ (instancetype)property;
+ (instancetype)propertyInfo;
+ (instancetype)quarts;
+ (instancetype)record;
+ (instancetype)reference;
+ (instancetype)rotation;
+ (instancetype)script;
+ (instancetype)shortFloat;
+ (instancetype)shortInteger;
+ (instancetype)squareFeet;
+ (instancetype)squareKilometers;
+ (instancetype)squareMeters;
+ (instancetype)squareMiles;
+ (instancetype)squareYards;
+ (instancetype)string;
+ (instancetype)styledClipboardText;
+ (instancetype)styledText;
+ (instancetype)suiteInfo;
+ (instancetype)textStyleInfo;
+ (instancetype)typeClass;
+ (instancetype)unicodeText;
+ (instancetype)unsignedInteger;
+ (instancetype)utf16Text;
+ (instancetype)utf8Text;
+ (instancetype)version;
+ (instancetype)writingCode;
+ (instancetype)yards;

@end

