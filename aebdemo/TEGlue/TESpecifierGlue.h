//
// TESpecifierGlue.h
// TextEdit
// (aebglue 0.6.0)
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"
#import "TECommandGlue.h"
#import "TEFormatterGlue.h"
#define TEApp ([TESpecifier specifierWithAppData: nil aemQuery: AEMApp])
#define TECon ([TESpecifier specifierWithAppData: nil aemQuery: AEMCon])
#define TEIts ([TESpecifier specifierWithAppData: nil aemQuery: AEMIts])

@interface TESpecifier : AEBSpecifier

/* Elements */

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

/* Properties */

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

/* Commands */

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

