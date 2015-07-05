//
// TEDGlue.h
// TextEdit.app 1.10
// AppleEventBridge.framework 0.7.0
// aebglue -o -r TextEdit
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"


// Generic specifier roots. These can be used to construct TEDSpecifiers for use in other TEDSpecifiers and TEDCommands,
// though only real specifiers constructed from a TEDApplication can be used to send commands to the target application.

#define TEDApp ([[TEDSpecifier alloc] initWithAppData: nil aemQuery: AEMApp])
#define TEDCon ([[TEDSpecifier alloc] initWithAppData: nil aemQuery: AEMCon])
#define TEDIts ([[TEDSpecifier alloc] initWithAppData: nil aemQuery: AEMIts])

// Symbol namespace
#define TED TEDSymbol

// TO DO: rename/alias Application class, c.f. Swift glue


// Classes

@interface TEDFormatter : AEBStaticFormatter
@end


@interface TEDSymbol : AEBStaticSymbol
// Types and properties
+ (AEBSymbol *)applicationResponses;
+ (AEBSymbol *)ask;
+ (AEBSymbol *)case_;
+ (AEBSymbol *)detailed;
+ (AEBSymbol *)diacriticals;
+ (AEBSymbol *)expansion;
+ (AEBSymbol *)hyphens;
+ (AEBSymbol *)no;
+ (AEBSymbol *)numericStrings;
+ (AEBSymbol *)punctuation;
+ (AEBSymbol *)standard;
+ (AEBSymbol *)whitespace;
+ (AEBSymbol *)yes;
// Enumerators
+ (AEBSymbol *)April;
+ (AEBSymbol *)August;
+ (AEBSymbol *)CString;
+ (AEBSymbol *)December;
+ (AEBSymbol *)EPSPicture;
+ (AEBSymbol *)February;
+ (AEBSymbol *)Friday;
+ (AEBSymbol *)GIFPicture;
+ (AEBSymbol *)JPEGPicture;
+ (AEBSymbol *)January;
+ (AEBSymbol *)July;
+ (AEBSymbol *)June;
+ (AEBSymbol *)March;
+ (AEBSymbol *)May;
+ (AEBSymbol *)Monday;
+ (AEBSymbol *)November;
+ (AEBSymbol *)October;
+ (AEBSymbol *)PICTPicture;
+ (AEBSymbol *)PascalString;
+ (AEBSymbol *)RGB16Color;
+ (AEBSymbol *)RGB96Color;
+ (AEBSymbol *)RGBColor;
+ (AEBSymbol *)Saturday;
+ (AEBSymbol *)September;
+ (AEBSymbol *)Sunday;
+ (AEBSymbol *)TIFFPicture;
+ (AEBSymbol *)Thursday;
+ (AEBSymbol *)Tuesday;
+ (AEBSymbol *)UTF16Text;
+ (AEBSymbol *)UTF8Text;
+ (AEBSymbol *)UnicodeText;
+ (AEBSymbol *)Wednesday;
+ (AEBSymbol *)alias;
+ (AEBSymbol *)anything;
+ (AEBSymbol *)application;
+ (AEBSymbol *)applicationBundleID;
+ (AEBSymbol *)applicationSignature;
+ (AEBSymbol *)applicationURL;
+ (AEBSymbol *)attachment;
+ (AEBSymbol *)attributeRun;
+ (AEBSymbol *)best;
+ (AEBSymbol *)boolean;
+ (AEBSymbol *)boundingRectangle;
+ (AEBSymbol *)bounds;
+ (AEBSymbol *)centimeters;
+ (AEBSymbol *)character;
+ (AEBSymbol *)classInfo;
+ (AEBSymbol *)class_;
+ (AEBSymbol *)closeable;
+ (AEBSymbol *)collating;
+ (AEBSymbol *)color;
+ (AEBSymbol *)colorTable;
+ (AEBSymbol *)copies;
+ (AEBSymbol *)cubicCentimeters;
+ (AEBSymbol *)cubicFeet;
+ (AEBSymbol *)cubicInches;
+ (AEBSymbol *)cubicMeters;
+ (AEBSymbol *)cubicYards;
+ (AEBSymbol *)dashStyle;
+ (AEBSymbol *)data;
+ (AEBSymbol *)date;
+ (AEBSymbol *)decimalStruct;
+ (AEBSymbol *)degreesCelsius;
+ (AEBSymbol *)degreesFahrenheit;
+ (AEBSymbol *)degreesKelvin;
+ (AEBSymbol *)document;
+ (AEBSymbol *)doubleInteger;
+ (AEBSymbol *)elementInfo;
+ (AEBSymbol *)encodedString;
+ (AEBSymbol *)endingPage;
+ (AEBSymbol *)enumerator;
+ (AEBSymbol *)errorHandling;
+ (AEBSymbol *)eventInfo;
+ (AEBSymbol *)extendedFloat;
+ (AEBSymbol *)faxNumber;
+ (AEBSymbol *)feet;
+ (AEBSymbol *)fileName;
+ (AEBSymbol *)fileRef;
+ (AEBSymbol *)fileSpecification;
+ (AEBSymbol *)fileURL;
+ (AEBSymbol *)fixed;
+ (AEBSymbol *)fixedPoint;
+ (AEBSymbol *)fixedRectangle;
+ (AEBSymbol *)float128bit;
+ (AEBSymbol *)float_;
+ (AEBSymbol *)floating;
+ (AEBSymbol *)font;
+ (AEBSymbol *)frontmost;
+ (AEBSymbol *)gallons;
+ (AEBSymbol *)grams;
+ (AEBSymbol *)graphicText;
+ (AEBSymbol *)id_;
+ (AEBSymbol *)inches;
+ (AEBSymbol *)index;
+ (AEBSymbol *)integer;
+ (AEBSymbol *)internationalText;
+ (AEBSymbol *)internationalWritingCode;
+ (AEBSymbol *)item;
+ (AEBSymbol *)kernelProcessID;
+ (AEBSymbol *)kilograms;
+ (AEBSymbol *)kilometers;
+ (AEBSymbol *)list;
+ (AEBSymbol *)liters;
+ (AEBSymbol *)locationReference;
+ (AEBSymbol *)longFixed;
+ (AEBSymbol *)longFixedPoint;
+ (AEBSymbol *)longFixedRectangle;
+ (AEBSymbol *)longPoint;
+ (AEBSymbol *)longRectangle;
+ (AEBSymbol *)machPort;
+ (AEBSymbol *)machine;
+ (AEBSymbol *)machineLocation;
+ (AEBSymbol *)meters;
+ (AEBSymbol *)miles;
+ (AEBSymbol *)miniaturizable;
+ (AEBSymbol *)miniaturized;
+ (AEBSymbol *)missingValue;
+ (AEBSymbol *)modal;
+ (AEBSymbol *)modified;
+ (AEBSymbol *)name;
+ (AEBSymbol *)null;
+ (AEBSymbol *)ounces;
+ (AEBSymbol *)pagesAcross;
+ (AEBSymbol *)pagesDown;
+ (AEBSymbol *)paragraph;
+ (AEBSymbol *)parameterInfo;
+ (AEBSymbol *)path;
+ (AEBSymbol *)pixelMapRecord;
+ (AEBSymbol *)point;
+ (AEBSymbol *)pounds;
+ (AEBSymbol *)printSettings;
+ (AEBSymbol *)processSerialNumber;
+ (AEBSymbol *)properties;
+ (AEBSymbol *)property;
+ (AEBSymbol *)propertyInfo;
+ (AEBSymbol *)quarts;
+ (AEBSymbol *)record;
+ (AEBSymbol *)reference;
+ (AEBSymbol *)requestedPrintTime;
+ (AEBSymbol *)resizable;
+ (AEBSymbol *)rotation;
+ (AEBSymbol *)script;
+ (AEBSymbol *)shortFloat;
+ (AEBSymbol *)shortInteger;
+ (AEBSymbol *)size;
+ (AEBSymbol *)squareFeet;
+ (AEBSymbol *)squareKilometers;
+ (AEBSymbol *)squareMeters;
+ (AEBSymbol *)squareMiles;
+ (AEBSymbol *)squareYards;
+ (AEBSymbol *)startingPage;
+ (AEBSymbol *)string;
+ (AEBSymbol *)styledClipboardText;
+ (AEBSymbol *)styledText;
+ (AEBSymbol *)styledUnicodeText;
+ (AEBSymbol *)suiteInfo;
+ (AEBSymbol *)targetPrinter;
+ (AEBSymbol *)text;
+ (AEBSymbol *)textStyleInfo;
+ (AEBSymbol *)titled;
+ (AEBSymbol *)typeClass;
+ (AEBSymbol *)unsignedInteger;
+ (AEBSymbol *)version_;
+ (AEBSymbol *)visible;
+ (AEBSymbol *)window;
+ (AEBSymbol *)word;
+ (AEBSymbol *)writingCode;
+ (AEBSymbol *)yards;
+ (AEBSymbol *)zoomable;
+ (AEBSymbol *)zoomed;
@end


@interface TEDActivateCommand : AEBStaticCommand
@end

@interface TEDCloseCommand : AEBStaticCommand
- (instancetype)savingIn:(id)value;
- (instancetype)saving:(id)value;
@end

@interface TEDCountCommand : AEBStaticCommand
- (instancetype)each:(id)value;
@end

@interface TEDDeleteCommand : AEBStaticCommand
@end

@interface TEDDuplicateCommand : AEBStaticCommand
- (instancetype)to:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TEDExistsCommand : AEBStaticCommand
@end

@interface TEDGetCommand : AEBStaticCommand
@end

@interface TEDLaunchCommand : AEBStaticCommand
@end

@interface TEDMakeCommand : AEBStaticCommand
- (instancetype)withData:(id)value;
- (instancetype)at_:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TEDMoveCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface TEDOpenCommand : AEBStaticCommand
@end

@interface TEDOpenLocationCommand : AEBStaticCommand
- (instancetype)window:(id)value;
@end

@interface TEDPrintCommand : AEBStaticCommand
- (instancetype)printDialog:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface TEDQuitCommand : AEBStaticCommand
- (instancetype)saving:(id)value;
@end

@interface TEDReopenCommand : AEBStaticCommand
@end

@interface TEDRunCommand : AEBStaticCommand
@end

@interface TEDSaveCommand : AEBStaticCommand
- (instancetype)as:(id)value;
- (instancetype)in_:(id)value;
@end

@interface TEDSetCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end


@interface TEDSpecifier : AEBStaticSpecifier
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
- (TEDActivateCommand *)activate;
- (TEDActivateCommand *)activate:(id)directParameter;
- (TEDCloseCommand *)close;
- (TEDCloseCommand *)close:(id)directParameter;
- (TEDCountCommand *)count;
- (TEDCountCommand *)count:(id)directParameter;
- (TEDDeleteCommand *)delete;
- (TEDDeleteCommand *)delete:(id)directParameter;
- (TEDDuplicateCommand *)duplicate;
- (TEDDuplicateCommand *)duplicate:(id)directParameter;
- (TEDExistsCommand *)exists;
- (TEDExistsCommand *)exists:(id)directParameter;
- (TEDGetCommand *)get;
- (TEDGetCommand *)get:(id)directParameter;
- (TEDLaunchCommand *)launch;
- (TEDLaunchCommand *)launch:(id)directParameter;
- (TEDMakeCommand *)make;
- (TEDMakeCommand *)make:(id)directParameter;
- (TEDMoveCommand *)move;
- (TEDMoveCommand *)move:(id)directParameter;
- (TEDOpenCommand *)open;
- (TEDOpenCommand *)open:(id)directParameter;
- (TEDOpenLocationCommand *)openLocation;
- (TEDOpenLocationCommand *)openLocation:(id)directParameter;
- (TEDPrintCommand *)print;
- (TEDPrintCommand *)print:(id)directParameter;
- (TEDQuitCommand *)quit;
- (TEDQuitCommand *)quit:(id)directParameter;
- (TEDReopenCommand *)reopen;
- (TEDReopenCommand *)reopen:(id)directParameter;
- (TEDRunCommand *)run;
- (TEDRunCommand *)run:(id)directParameter;
- (TEDSaveCommand *)save;
- (TEDSaveCommand *)save:(id)directParameter;
- (TEDSetCommand *)set;
- (TEDSetCommand *)set:(id)directParameter;
@end


@interface TEDApplication : TEDSpecifier
- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_; // private; used internally
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
- (TEDSpecifier *)customRoot:(id)object;
@end


