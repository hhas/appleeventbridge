//
// TEGlue.h
// TextEdit 1.11
// AppleEventBridge.framework 0.7.0
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"


// Generic specifier roots. These can be used to construct TESpecifiers for use in other TESpecifiers and TECommands,
// though only real specifiers constructed from a TEApplication can be used to send commands to the target application.
#define TEApp ([TESpecifier specifierWithAppData: nil aemQuery: AEMApp])
#define TECon ([TESpecifier specifierWithAppData: nil aemQuery: AEMCon])
#define TEIts ([TESpecifier specifierWithAppData: nil aemQuery: AEMIts])

// Symbol namespace
#define kTE (TESymbol)

// Classes

@interface TEFormatter : AEBStaticFormatter
@end


@interface TESymbol : AEBStaticSymbol
// Types and properties
+ (instancetype)applicationResponses;
+ (instancetype)ask;
+ (instancetype)case_;
+ (instancetype)detailed;
+ (instancetype)diacriticals;
+ (instancetype)expansion;
+ (instancetype)hyphens;
+ (instancetype)no;
+ (instancetype)numericStrings;
+ (instancetype)punctuation;
+ (instancetype)standard;
+ (instancetype)whitespace;
+ (instancetype)yes;
// Enumerators
+ (instancetype)April;
+ (instancetype)August;
+ (instancetype)CString;
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
+ (instancetype)PascalString;
+ (instancetype)RGB16Color;
+ (instancetype)RGB96Color;
+ (instancetype)RGBColor;
+ (instancetype)Saturday;
+ (instancetype)September;
+ (instancetype)Sunday;
+ (instancetype)TIFFPicture;
+ (instancetype)Thursday;
+ (instancetype)Tuesday;
+ (instancetype)UTF16Text;
+ (instancetype)UTF8Text;
+ (instancetype)UnicodeText;
+ (instancetype)Wednesday;
+ (instancetype)alias;
+ (instancetype)anything;
+ (instancetype)application;
+ (instancetype)applicationBundleID;
+ (instancetype)applicationSignature;
+ (instancetype)applicationURL;
+ (instancetype)attachment;
+ (instancetype)attributeRun;
+ (instancetype)best;
+ (instancetype)boolean;
+ (instancetype)boundingRectangle;
+ (instancetype)bounds;
+ (instancetype)centimeters;
+ (instancetype)character;
+ (instancetype)classInfo;
+ (instancetype)class_;
+ (instancetype)closeable;
+ (instancetype)collating;
+ (instancetype)color;
+ (instancetype)colorTable;
+ (instancetype)copies;
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
+ (instancetype)document;
+ (instancetype)doubleInteger;
+ (instancetype)elementInfo;
+ (instancetype)encodedString;
+ (instancetype)endingPage;
+ (instancetype)enumerator;
+ (instancetype)errorHandling;
+ (instancetype)eventInfo;
+ (instancetype)extendedFloat;
+ (instancetype)faxNumber;
+ (instancetype)feet;
+ (instancetype)fileName;
+ (instancetype)fileRef;
+ (instancetype)fileSpecification;
+ (instancetype)fileURL;
+ (instancetype)fixed;
+ (instancetype)fixedPoint;
+ (instancetype)fixedRectangle;
+ (instancetype)float128bit;
+ (instancetype)float_;
+ (instancetype)floating;
+ (instancetype)font;
+ (instancetype)frontmost;
+ (instancetype)gallons;
+ (instancetype)grams;
+ (instancetype)graphicText;
+ (instancetype)id_;
+ (instancetype)inches;
+ (instancetype)index;
+ (instancetype)integer;
+ (instancetype)internationalText;
+ (instancetype)internationalWritingCode;
+ (instancetype)item;
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
+ (instancetype)miniaturizable;
+ (instancetype)miniaturized;
+ (instancetype)missingValue;
+ (instancetype)modal;
+ (instancetype)modified;
+ (instancetype)name;
+ (instancetype)null;
+ (instancetype)ounces;
+ (instancetype)pagesAcross;
+ (instancetype)pagesDown;
+ (instancetype)paragraph;
+ (instancetype)parameterInfo;
+ (instancetype)path;
+ (instancetype)pixelMapRecord;
+ (instancetype)point;
+ (instancetype)pounds;
+ (instancetype)printSettings;
+ (instancetype)processSerialNumber;
+ (instancetype)properties;
+ (instancetype)property;
+ (instancetype)propertyInfo;
+ (instancetype)quarts;
+ (instancetype)record;
+ (instancetype)reference;
+ (instancetype)requestedPrintTime;
+ (instancetype)resizable;
+ (instancetype)rotation;
+ (instancetype)script;
+ (instancetype)shortFloat;
+ (instancetype)shortInteger;
+ (instancetype)size;
+ (instancetype)squareFeet;
+ (instancetype)squareKilometers;
+ (instancetype)squareMeters;
+ (instancetype)squareMiles;
+ (instancetype)squareYards;
+ (instancetype)startingPage;
+ (instancetype)string;
+ (instancetype)styledClipboardText;
+ (instancetype)styledText;
+ (instancetype)styledUnicodeText;
+ (instancetype)suiteInfo;
+ (instancetype)targetPrinter;
+ (instancetype)text;
+ (instancetype)textStyleInfo;
+ (instancetype)titled;
+ (instancetype)typeClass;
+ (instancetype)unsignedInteger;
+ (instancetype)version_;
+ (instancetype)visible;
+ (instancetype)window;
+ (instancetype)word;
+ (instancetype)writingCode;
+ (instancetype)yards;
+ (instancetype)zoomable;
+ (instancetype)zoomed;
@end


@interface TEActivateCommand : AEBStaticCommand
@end

@interface TECloseCommand : AEBStaticCommand
- (instancetype)savingIn:(id)value;
- (instancetype)saving:(id)value;
@end

@interface TECountCommand : AEBStaticCommand
- (instancetype)each:(id)value;
@end

@interface TEDeleteCommand : AEBStaticCommand
@end

@interface TEDuplicateCommand : AEBStaticCommand
- (instancetype)to:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TEExistsCommand : AEBStaticCommand
@end

@interface TEGetCommand : AEBStaticCommand
@end

@interface TELaunchCommand : AEBStaticCommand
@end

@interface TEMakeCommand : AEBStaticCommand
- (instancetype)withData:(id)value;
- (instancetype)at_:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TEMoveCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface TEOpenCommand : AEBStaticCommand
@end

@interface TEOpenLocationCommand : AEBStaticCommand
- (instancetype)window:(id)value;
@end

@interface TEPrintCommand : AEBStaticCommand
- (instancetype)printDialog:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TEQuitCommand : AEBStaticCommand
- (instancetype)saving:(id)value;
@end

@interface TEReopenCommand : AEBStaticCommand
@end

@interface TERunCommand : AEBStaticCommand
@end

@interface TESaveCommand : AEBStaticCommand
- (instancetype)as:(id)value;
- (instancetype)in_:(id)value;
@end

@interface TESetCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end


@interface TESpecifier : AEBStaticSpecifier
// Properties
- (instancetype)bounds;
- (instancetype)class_;
- (instancetype)closeable;
- (instancetype)collating;
- (instancetype)color;
- (instancetype)copies;
- (instancetype)document;
- (instancetype)endingPage;
- (instancetype)errorHandling;
- (instancetype)faxNumber;
- (instancetype)fileName;
- (instancetype)floating;
- (instancetype)font;
- (instancetype)frontmost;
- (instancetype)id_;
- (instancetype)index;
- (instancetype)miniaturizable;
- (instancetype)miniaturized;
- (instancetype)modal;
- (instancetype)modified;
- (instancetype)name;
- (instancetype)pagesAcross;
- (instancetype)pagesDown;
- (instancetype)path;
- (instancetype)properties;
- (instancetype)requestedPrintTime;
- (instancetype)resizable;
- (instancetype)size;
- (instancetype)startingPage;
- (instancetype)targetPrinter;
- (instancetype)titled;
- (instancetype)version_;
- (instancetype)visible;
- (instancetype)zoomable;
- (instancetype)zoomed;
// Elements
- (instancetype)applications;
- (instancetype)attachment;
- (instancetype)attributeRuns;
- (instancetype)characters;
- (instancetype)colors;
- (instancetype)documents;
- (instancetype)items;
- (instancetype)paragraphs;
- (instancetype)printSettings;
- (instancetype)text;
- (instancetype)windows;
- (instancetype)words;
// Commands
- (TEActivateCommand *)activate;
- (TEActivateCommand *)activate:(id)directParameter;
- (TECloseCommand *)close;
- (TECloseCommand *)close:(id)directParameter;
- (TECountCommand *)count;
- (TECountCommand *)count:(id)directParameter;
- (TEDeleteCommand *)delete;
- (TEDeleteCommand *)delete:(id)directParameter;
- (TEDuplicateCommand *)duplicate;
- (TEDuplicateCommand *)duplicate:(id)directParameter;
- (TEExistsCommand *)exists;
- (TEExistsCommand *)exists:(id)directParameter;
- (TEGetCommand *)get;
- (TEGetCommand *)get:(id)directParameter;
- (TELaunchCommand *)launch;
- (TELaunchCommand *)launch:(id)directParameter;
- (TEMakeCommand *)make;
- (TEMakeCommand *)make:(id)directParameter;
- (TEMoveCommand *)move;
- (TEMoveCommand *)move:(id)directParameter;
- (TEOpenCommand *)open;
- (TEOpenCommand *)open:(id)directParameter;
- (TEOpenLocationCommand *)openLocation;
- (TEOpenLocationCommand *)openLocation:(id)directParameter;
- (TEPrintCommand *)print;
- (TEPrintCommand *)print:(id)directParameter;
- (TEQuitCommand *)quit;
- (TEQuitCommand *)quit:(id)directParameter;
- (TEReopenCommand *)reopen;
- (TEReopenCommand *)reopen:(id)directParameter;
- (TERunCommand *)run;
- (TERunCommand *)run:(id)directParameter;
- (TESaveCommand *)save;
- (TESaveCommand *)save:(id)directParameter;
- (TESetCommand *)set;
- (TESetCommand *)set:(id)directParameter;
@end


@interface TEApplication : TESpecifier
// note: clients shouldn't need to call -initWithTargetType:data: themselves
- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_;
// initialisers
+ (instancetype)application;
+ (instancetype)currentApplication;
+ (instancetype)applicationWithName:(NSString *)name;
+ (instancetype)applicationWithURL:(NSURL *)url;
+ (instancetype)applicationWithBundleID:(NSString *)bundleID;
+ (instancetype)applicationWithProcessID:(pid_t)pid;
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc;
- (instancetype)init;
- (instancetype)initCurrentApplication;
- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithURL:(NSURL *)url;
- (instancetype)initWithBundleID:(NSString *)bundleID;
- (instancetype)initWithProcessID:(pid_t)pid;
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc;
// misc
- (TESpecifier *)customRoot:(id)object;
@end


// Convenience constructor for application objects.
// TO DO: TextEdit function+macro

