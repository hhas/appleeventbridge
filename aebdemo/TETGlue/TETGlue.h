//
// TETGlue.h
// TextEdit.app 1.11
// AppleEventBridge.framework 0.7.0
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"


// TO DO: finish API revisions (e.g. should symbol namespace drop 'k' prefix and provide app, con, its constructors as in Swift glues?)

// Generic specifier roots. These can be used to construct TETSpecifiers for use in other TETSpecifiers and TETCommands,
// though only real specifiers constructed from a TETApplication can be used to send commands to the target application.

#define TETApp ([TETSpecifier specifierWithAppData: nil aemQuery: AEMApp])
#define TETCon ([TETSpecifier specifierWithAppData: nil aemQuery: AEMCon])
#define TETIts ([TETSpecifier specifierWithAppData: nil aemQuery: AEMIts])

// Symbol namespace // TO DO: is macro appropriate?
#define TET TETSymbol

// Convenience constructor for application objects.
// TO DO: once created, Application instance should be cached and reused, and only recreated if app is no longer running
#define TextEdit ([TETApplication application])


// Classes

@interface TETFormatter : AEBStaticFormatter
@end


@interface TETSymbol : AEBStaticSymbol
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


@interface TETActivateCommand : AEBStaticCommand
@end

@interface TETCloseCommand : AEBStaticCommand
- (instancetype)savingIn:(id)value;
- (instancetype)saving:(id)value;
@end

@interface TETCountCommand : AEBStaticCommand
- (instancetype)each:(id)value;
@end

@interface TETDeleteCommand : AEBStaticCommand
@end

@interface TETDuplicateCommand : AEBStaticCommand
- (instancetype)to:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TETExistsCommand : AEBStaticCommand
@end

@interface TETGetCommand : AEBStaticCommand
@end

@interface TETLaunchCommand : AEBStaticCommand
@end

@interface TETMakeCommand : AEBStaticCommand
- (instancetype)withData:(id)value;
- (instancetype)at_:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TETMoveCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface TETOpenCommand : AEBStaticCommand
@end

@interface TETOpenLocationCommand : AEBStaticCommand
- (instancetype)window:(id)value;
@end

@interface TETPrintCommand : AEBStaticCommand
- (instancetype)printDialog:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TETQuitCommand : AEBStaticCommand
- (instancetype)saving:(id)value;
@end

@interface TETReopenCommand : AEBStaticCommand
@end

@interface TETRunCommand : AEBStaticCommand
@end

@interface TETSaveCommand : AEBStaticCommand
- (instancetype)as:(id)value;
- (instancetype)in_:(id)value;
@end

@interface TETSetCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end


@interface TETSpecifier : AEBStaticSpecifier
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
- (TETActivateCommand *)activate;
- (TETActivateCommand *)activate:(id)directParameter;
- (TETCloseCommand *)close;
- (TETCloseCommand *)close:(id)directParameter;
- (TETCountCommand *)count;
- (TETCountCommand *)count:(id)directParameter;
- (TETDeleteCommand *)delete;
- (TETDeleteCommand *)delete:(id)directParameter;
- (TETDuplicateCommand *)duplicate;
- (TETDuplicateCommand *)duplicate:(id)directParameter;
- (TETExistsCommand *)exists;
- (TETExistsCommand *)exists:(id)directParameter;
- (TETGetCommand *)get;
- (TETGetCommand *)get:(id)directParameter;
- (TETLaunchCommand *)launch;
- (TETLaunchCommand *)launch:(id)directParameter;
- (TETMakeCommand *)make;
- (TETMakeCommand *)make:(id)directParameter;
- (TETMoveCommand *)move;
- (TETMoveCommand *)move:(id)directParameter;
- (TETOpenCommand *)open;
- (TETOpenCommand *)open:(id)directParameter;
- (TETOpenLocationCommand *)openLocation;
- (TETOpenLocationCommand *)openLocation:(id)directParameter;
- (TETPrintCommand *)print;
- (TETPrintCommand *)print:(id)directParameter;
- (TETQuitCommand *)quit;
- (TETQuitCommand *)quit:(id)directParameter;
- (TETReopenCommand *)reopen;
- (TETReopenCommand *)reopen:(id)directParameter;
- (TETRunCommand *)run;
- (TETRunCommand *)run:(id)directParameter;
- (TETSaveCommand *)save;
- (TETSaveCommand *)save:(id)directParameter;
- (TETSetCommand *)set;
- (TETSetCommand *)set:(id)directParameter;
@end


@interface TETApplication : TETSpecifier
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
- (TETSpecifier *)customRoot:(id)object;
@end


