//
// FINGlue.h
// Finder.app 10.10.4
// AppleEventBridge.framework 0.7.0
// aebglue -o -s -r Finder
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"


// Generic specifier roots. These can be used to construct FINSpecifiers for use in other FINSpecifiers and FINCommands,
// though only real specifiers constructed from a FINApplication can be used to send commands to the target application.

#define FINApp ([[FINSpecifier alloc] initWithAppData: nil aemQuery: AEMApp])
#define FINCon ([[FINSpecifier alloc] initWithAppData: nil aemQuery: AEMCon])
#define FINIts ([[FINSpecifier alloc] initWithAppData: nil aemQuery: AEMIts])

// Symbol namespace
#define FIN FINSymbol

// TO DO: rename/alias Application class, c.f. Swift glue


// Classes

@interface FINFormatter : AEBObjCFormatter
@end


@interface FINSymbol : AEBObjCSymbol
// Types and properties
+ (AEBSymbol *)AdvancedPreferencesPanel;
+ (AEBSymbol *)ApplePhotoFormat;
+ (AEBSymbol *)AppleShareFormat;
+ (AEBSymbol *)ApplicationPanel;
+ (AEBSymbol *)BurningPanel;
+ (AEBSymbol *)CommentsPanel;
+ (AEBSymbol *)ContentIndexPanel;
+ (AEBSymbol *)FTPFormat;
+ (AEBSymbol *)GeneralInformationPanel;
+ (AEBSymbol *)GeneralPreferencesPanel;
+ (AEBSymbol *)HighSierraFormat;
+ (AEBSymbol *)ISO9660Format;
+ (AEBSymbol *)LabelPreferencesPanel;
+ (AEBSymbol *)LanguagesPanel;
+ (AEBSymbol *)MSDOSFormat;
+ (AEBSymbol *)MacOSExtendedFormat;
+ (AEBSymbol *)MacOSFormat;
+ (AEBSymbol *)MemoryPanel;
+ (AEBSymbol *)MoreInfoPanel;
+ (AEBSymbol *)NFSFormat;
+ (AEBSymbol *)NTFSFormat;
+ (AEBSymbol *)NameAndExtensionPanel;
+ (AEBSymbol *)PacketWrittenUDFFormat;
+ (AEBSymbol *)PluginsPanel;
+ (AEBSymbol *)PreviewPanel;
+ (AEBSymbol *)ProDOSFormat;
+ (AEBSymbol *)QuickTakeFormat;
+ (AEBSymbol *)SharingPanel;
+ (AEBSymbol *)SidebarPreferencesPanel;
+ (AEBSymbol *)SimpleHeaderPanel;
+ (AEBSymbol *)UDFFormat;
+ (AEBSymbol *)UFSFormat;
+ (AEBSymbol *)WebDAVFormat;
+ (AEBSymbol *)XsanFormat;
+ (AEBSymbol *)applicationResponses;
+ (AEBSymbol *)arrangedByCreationDate;
+ (AEBSymbol *)arrangedByKind;
+ (AEBSymbol *)arrangedByLabel;
+ (AEBSymbol *)arrangedByModificationDate;
+ (AEBSymbol *)arrangedByName;
+ (AEBSymbol *)arrangedBySize;
+ (AEBSymbol *)ask;
+ (AEBSymbol *)audioFormat;
+ (AEBSymbol *)bottom;
+ (AEBSymbol *)case_;
+ (AEBSymbol *)columnView;
+ (AEBSymbol *)comment;
+ (AEBSymbol *)commentColumn;
+ (AEBSymbol *)creationDate;
+ (AEBSymbol *)creationDateColumn;
+ (AEBSymbol *)diacriticals;
+ (AEBSymbol *)expansion;
+ (AEBSymbol *)flowView;
+ (AEBSymbol *)groupView;
+ (AEBSymbol *)hyphens;
+ (AEBSymbol *)iconView;
+ (AEBSymbol *)kind;
+ (AEBSymbol *)kindColumn;
+ (AEBSymbol *)labelColumn;
+ (AEBSymbol *)labelIndex;
+ (AEBSymbol *)large;
+ (AEBSymbol *)largeIcon;
+ (AEBSymbol *)listView;
+ (AEBSymbol *)mini;
+ (AEBSymbol *)modificationDate;
+ (AEBSymbol *)modificationDateColumn;
+ (AEBSymbol *)name;
+ (AEBSymbol *)nameColumn;
+ (AEBSymbol *)no;
+ (AEBSymbol *)none;
+ (AEBSymbol *)normal;
+ (AEBSymbol *)notArranged;
+ (AEBSymbol *)numericStrings;
+ (AEBSymbol *)punctuation;
+ (AEBSymbol *)readOnly;
+ (AEBSymbol *)readWrite;
+ (AEBSymbol *)reversed;
+ (AEBSymbol *)right;
+ (AEBSymbol *)size;
+ (AEBSymbol *)sizeColumn;
+ (AEBSymbol *)small;
+ (AEBSymbol *)smallIcon;
+ (AEBSymbol *)snapToGrid;
+ (AEBSymbol *)unknownFormat;
+ (AEBSymbol *)versionColumn;
+ (AEBSymbol *)version_;
+ (AEBSymbol *)whitespace;
+ (AEBSymbol *)writeOnly;
+ (AEBSymbol *)yes;
// Enumerators
+ (AEBSymbol *)April;
+ (AEBSymbol *)August;
+ (AEBSymbol *)CString;
+ (AEBSymbol *)December;
+ (AEBSymbol *)EPSPicture;
+ (AEBSymbol *)February;
+ (AEBSymbol *)FinderPreferences;
+ (AEBSymbol *)FinderWindow;
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
+ (AEBSymbol *)URL;
+ (AEBSymbol *)UTF16Text;
+ (AEBSymbol *)UTF8Text;
+ (AEBSymbol *)UnicodeText;
+ (AEBSymbol *)Wednesday;
+ (AEBSymbol *)acceptsHighLevelEvents;
+ (AEBSymbol *)acceptsRemoteEvents;
+ (AEBSymbol *)alias;
+ (AEBSymbol *)aliasFile;
+ (AEBSymbol *)aliasList;
+ (AEBSymbol *)allNameExtensionsShowing;
+ (AEBSymbol *)anything;
+ (AEBSymbol *)application;
+ (AEBSymbol *)applicationBundleID;
+ (AEBSymbol *)applicationFile;
+ (AEBSymbol *)applicationProcess;
+ (AEBSymbol *)applicationSignature;
+ (AEBSymbol *)applicationURL;
+ (AEBSymbol *)arrangement;
+ (AEBSymbol *)backgroundColor;
+ (AEBSymbol *)backgroundPicture;
+ (AEBSymbol *)best;
+ (AEBSymbol *)boolean;
+ (AEBSymbol *)boundingRectangle;
+ (AEBSymbol *)bounds;
+ (AEBSymbol *)calculatesFolderSizes;
+ (AEBSymbol *)capacity;
+ (AEBSymbol *)centimeters;
+ (AEBSymbol *)classInfo;
+ (AEBSymbol *)class_;
+ (AEBSymbol *)clipboard;
+ (AEBSymbol *)clipping;
+ (AEBSymbol *)clippingWindow;
+ (AEBSymbol *)closeable;
+ (AEBSymbol *)collapsed;
+ (AEBSymbol *)color;
+ (AEBSymbol *)colorTable;
+ (AEBSymbol *)column;
+ (AEBSymbol *)columnViewOptions;
+ (AEBSymbol *)completelyExpanded;
+ (AEBSymbol *)computerContainer;
+ (AEBSymbol *)computerObject;
+ (AEBSymbol *)container;
+ (AEBSymbol *)containerWindow;
+ (AEBSymbol *)creatorType;
+ (AEBSymbol *)cubicCentimeters;
+ (AEBSymbol *)cubicFeet;
+ (AEBSymbol *)cubicInches;
+ (AEBSymbol *)cubicMeters;
+ (AEBSymbol *)cubicYards;
+ (AEBSymbol *)currentPanel;
+ (AEBSymbol *)currentView;
+ (AEBSymbol *)dashStyle;
+ (AEBSymbol *)data;
+ (AEBSymbol *)date;
+ (AEBSymbol *)decimalStruct;
+ (AEBSymbol *)degreesCelsius;
+ (AEBSymbol *)degreesFahrenheit;
+ (AEBSymbol *)degreesKelvin;
+ (AEBSymbol *)delayBeforeSpringing;
+ (AEBSymbol *)description_;
+ (AEBSymbol *)deskAccessoryFile;
+ (AEBSymbol *)deskAccessoryProcess;
+ (AEBSymbol *)desktop;
+ (AEBSymbol *)desktopObject;
+ (AEBSymbol *)desktopPicture;
+ (AEBSymbol *)desktopPosition;
+ (AEBSymbol *)desktopShowsConnectedServers;
+ (AEBSymbol *)desktopShowsExternalHardDisks;
+ (AEBSymbol *)desktopShowsHardDisks;
+ (AEBSymbol *)desktopShowsRemovableMedia;
+ (AEBSymbol *)desktopWindow;
+ (AEBSymbol *)disclosesPreviewPane;
+ (AEBSymbol *)disk;
+ (AEBSymbol *)displayedName;
+ (AEBSymbol *)documentFile;
+ (AEBSymbol *)doubleInteger;
+ (AEBSymbol *)ejectable;
+ (AEBSymbol *)elementInfo;
+ (AEBSymbol *)encodedString;
+ (AEBSymbol *)entireContents;
+ (AEBSymbol *)enumerator;
+ (AEBSymbol *)eventInfo;
+ (AEBSymbol *)everyonesPrivileges;
+ (AEBSymbol *)expandable;
+ (AEBSymbol *)expanded;
+ (AEBSymbol *)extendedFloat;
+ (AEBSymbol *)extensionHidden;
+ (AEBSymbol *)feet;
+ (AEBSymbol *)file;
+ (AEBSymbol *)fileRef;
+ (AEBSymbol *)fileSpecification;
+ (AEBSymbol *)fileType;
+ (AEBSymbol *)fileURL;
+ (AEBSymbol *)fixed;
+ (AEBSymbol *)fixedPoint;
+ (AEBSymbol *)fixedRectangle;
+ (AEBSymbol *)float128bit;
+ (AEBSymbol *)float_;
+ (AEBSymbol *)floating;
+ (AEBSymbol *)folder;
+ (AEBSymbol *)foldersOpenInNewTabs;
+ (AEBSymbol *)foldersOpenInNewWindows;
+ (AEBSymbol *)foldersSpringOpen;
+ (AEBSymbol *)format;
+ (AEBSymbol *)freeSpace;
+ (AEBSymbol *)frontmost;
+ (AEBSymbol *)gallons;
+ (AEBSymbol *)grams;
+ (AEBSymbol *)graphicText;
+ (AEBSymbol *)group;
+ (AEBSymbol *)groupPrivileges;
+ (AEBSymbol *)hasScriptingTerminology;
+ (AEBSymbol *)home;
+ (AEBSymbol *)icon;
+ (AEBSymbol *)iconFamily;
+ (AEBSymbol *)iconSize;
+ (AEBSymbol *)iconViewOptions;
+ (AEBSymbol *)id_;
+ (AEBSymbol *)ignorePrivileges;
+ (AEBSymbol *)inches;
+ (AEBSymbol *)index;
+ (AEBSymbol *)informationWindow;
+ (AEBSymbol *)insertionLocation;
+ (AEBSymbol *)integer;
+ (AEBSymbol *)internationalText;
+ (AEBSymbol *)internationalWritingCode;
+ (AEBSymbol *)internetLocationFile;
+ (AEBSymbol *)item;
+ (AEBSymbol *)journalingEnabled;
+ (AEBSymbol *)kernelProcessID;
+ (AEBSymbol *)kilograms;
+ (AEBSymbol *)kilometers;
+ (AEBSymbol *)label;
+ (AEBSymbol *)labelPosition;
+ (AEBSymbol *)large32BitIcon;
+ (AEBSymbol *)large4BitIcon;
+ (AEBSymbol *)large8BitIcon;
+ (AEBSymbol *)large8BitMask;
+ (AEBSymbol *)largeMonochromeIconAndMask;
+ (AEBSymbol *)list;
+ (AEBSymbol *)listViewOptions;
+ (AEBSymbol *)liters;
+ (AEBSymbol *)localVolume;
+ (AEBSymbol *)location;
+ (AEBSymbol *)locationReference;
+ (AEBSymbol *)locked;
+ (AEBSymbol *)longFixed;
+ (AEBSymbol *)longFixedPoint;
+ (AEBSymbol *)longFixedRectangle;
+ (AEBSymbol *)longPoint;
+ (AEBSymbol *)longRectangle;
+ (AEBSymbol *)machPort;
+ (AEBSymbol *)machine;
+ (AEBSymbol *)machineLocation;
+ (AEBSymbol *)maximumWidth;
+ (AEBSymbol *)meters;
+ (AEBSymbol *)miles;
+ (AEBSymbol *)minimumSize;
+ (AEBSymbol *)minimumWidth;
+ (AEBSymbol *)missingValue;
+ (AEBSymbol *)modal;
+ (AEBSymbol *)nameExtension;
+ (AEBSymbol *)newWindowTarget;
+ (AEBSymbol *)newWindowsOpenInColumnView;
+ (AEBSymbol *)null;
+ (AEBSymbol *)opensInClassic;
+ (AEBSymbol *)originalItem;
+ (AEBSymbol *)ounces;
+ (AEBSymbol *)owner;
+ (AEBSymbol *)ownerPrivileges;
+ (AEBSymbol *)package;
+ (AEBSymbol *)parameterInfo;
+ (AEBSymbol *)partitionSpaceUsed;
+ (AEBSymbol *)physicalSize;
+ (AEBSymbol *)pixelMapRecord;
+ (AEBSymbol *)point;
+ (AEBSymbol *)position;
+ (AEBSymbol *)pounds;
+ (AEBSymbol *)preferences;
+ (AEBSymbol *)preferencesWindow;
+ (AEBSymbol *)preferredSize;
+ (AEBSymbol *)process;
+ (AEBSymbol *)processSerialNumber;
+ (AEBSymbol *)productVersion;
+ (AEBSymbol *)properties;
+ (AEBSymbol *)property;
+ (AEBSymbol *)propertyInfo;
+ (AEBSymbol *)quarts;
+ (AEBSymbol *)record;
+ (AEBSymbol *)reference;
+ (AEBSymbol *)resizable;
+ (AEBSymbol *)rotation;
+ (AEBSymbol *)script;
+ (AEBSymbol *)selection;
+ (AEBSymbol *)shortFloat;
+ (AEBSymbol *)shortInteger;
+ (AEBSymbol *)showsIcon;
+ (AEBSymbol *)showsIconPreview;
+ (AEBSymbol *)showsItemInfo;
+ (AEBSymbol *)showsPreviewColumn;
+ (AEBSymbol *)sidebarWidth;
+ (AEBSymbol *)small32BitIcon;
+ (AEBSymbol *)small4BitIcon;
+ (AEBSymbol *)small8BitIcon;
+ (AEBSymbol *)small8BitMask;
+ (AEBSymbol *)smallMonochromeIconAndMask;
+ (AEBSymbol *)sortColumn;
+ (AEBSymbol *)sortDirection;
+ (AEBSymbol *)squareFeet;
+ (AEBSymbol *)squareKilometers;
+ (AEBSymbol *)squareMeters;
+ (AEBSymbol *)squareMiles;
+ (AEBSymbol *)squareYards;
+ (AEBSymbol *)startup;
+ (AEBSymbol *)startupDisk;
+ (AEBSymbol *)stationery;
+ (AEBSymbol *)statusbarVisible;
+ (AEBSymbol *)string;
+ (AEBSymbol *)styledClipboardText;
+ (AEBSymbol *)styledText;
+ (AEBSymbol *)styledUnicodeText;
+ (AEBSymbol *)suggestedSize;
+ (AEBSymbol *)suiteInfo;
+ (AEBSymbol *)target;
+ (AEBSymbol *)textSize;
+ (AEBSymbol *)textStyleInfo;
+ (AEBSymbol *)titled;
+ (AEBSymbol *)toolbarVisible;
+ (AEBSymbol *)totalPartitionSize;
+ (AEBSymbol *)trash;
+ (AEBSymbol *)trashObject;
+ (AEBSymbol *)typeClass;
+ (AEBSymbol *)unsignedInteger;
+ (AEBSymbol *)usesRelativeDates;
+ (AEBSymbol *)visible;
+ (AEBSymbol *)warnsBeforeEmptying;
+ (AEBSymbol *)width;
+ (AEBSymbol *)window;
+ (AEBSymbol *)writingCode;
+ (AEBSymbol *)yards;
+ (AEBSymbol *)zoomable;
+ (AEBSymbol *)zoomed;
@end


@interface FINActivateCommand : AEBObjCCommand
@end

@interface FINCleanUpCommand : AEBObjCCommand
- (instancetype)by:(id)value;
@end

@interface FINCloseCommand : AEBObjCCommand
@end

@interface FINCopy_Command : AEBObjCCommand
@end

@interface FINCountCommand : AEBObjCCommand
- (instancetype)each:(id)value;
@end

@interface FINDataSizeCommand : AEBObjCCommand
- (instancetype)as:(id)value;
@end

@interface FINDeleteCommand : AEBObjCCommand
@end

@interface FINDuplicateCommand : AEBObjCCommand
- (instancetype)replacing:(id)value;
- (instancetype)exactCopy:(id)value;
- (instancetype)to:(id)value;
- (instancetype)routingSuppressed:(id)value;
@end

@interface FINEjectCommand : AEBObjCCommand
@end

@interface FINEmptyCommand : AEBObjCCommand
- (instancetype)security:(id)value;
@end

@interface FINEraseCommand : AEBObjCCommand
@end

@interface FINExistsCommand : AEBObjCCommand
@end

@interface FINGetCommand : AEBObjCCommand
@end

@interface FINLaunchCommand : AEBObjCCommand
@end

@interface FINMakeCommand : AEBObjCCommand
- (instancetype)at:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withProperties:(id)value;
- (instancetype)to:(id)value;
@end

@interface FINMoveCommand : AEBObjCCommand
- (instancetype)replacing:(id)value;
- (instancetype)to:(id)value;
- (instancetype)positionedAt:(id)value;
- (instancetype)routingSuppressed:(id)value;
@end

@interface FINOpenCommand : AEBObjCCommand
- (instancetype)withProperties:(id)value;
- (instancetype)using:(id)value;
@end

@interface FINOpenLocationCommand : AEBObjCCommand
- (instancetype)window:(id)value;
@end

@interface FINPrintCommand : AEBObjCCommand
- (instancetype)withProperties:(id)value;
@end

@interface FINQuitCommand : AEBObjCCommand
@end

@interface FINReopenCommand : AEBObjCCommand
@end

@interface FINRestartCommand : AEBObjCCommand
@end

@interface FINRevealCommand : AEBObjCCommand
@end

@interface FINRunCommand : AEBObjCCommand
@end

@interface FINSelectCommand : AEBObjCCommand
@end

@interface FINSetCommand : AEBObjCCommand
- (instancetype)to:(id)value;
@end

@interface FINShutDownCommand : AEBObjCCommand
@end

@interface FINSleepCommand : AEBObjCCommand
@end

@interface FINSortCommand : AEBObjCCommand
- (instancetype)by:(id)value;
@end

@interface FINUpdateCommand : AEBObjCCommand
- (instancetype)necessity:(id)value;
- (instancetype)registeringApplications:(id)value;
@end


@interface FINSpecifier : AEBObjCSpecifier
// Properties
- (instancetype)FinderPreferences;
- (instancetype)URL;
- (instancetype)acceptsHighLevelEvents;
- (instancetype)acceptsRemoteEvents;
- (instancetype)allNameExtensionsShowing;
- (instancetype)applicationFile;
- (instancetype)arrangement;
- (instancetype)backgroundColor;
- (instancetype)backgroundPicture;
- (instancetype)bounds;
- (instancetype)calculatesFolderSizes;
- (instancetype)capacity;
- (instancetype)class_;
- (instancetype)clipboard;
- (instancetype)clippingWindow;
- (instancetype)closeable;
- (instancetype)collapsed;
- (instancetype)color;
- (instancetype)columnViewOptions;
- (instancetype)comment;
- (instancetype)completelyExpanded;
- (instancetype)computerContainer;
- (instancetype)container;
- (instancetype)containerWindow;
- (instancetype)creationDate;
- (instancetype)creatorType;
- (instancetype)currentPanel;
- (instancetype)currentView;
- (instancetype)delayBeforeSpringing;
- (instancetype)description_;
- (instancetype)deskAccessoryFile;
- (instancetype)desktop;
- (instancetype)desktopPicture;
- (instancetype)desktopPosition;
- (instancetype)desktopShowsConnectedServers;
- (instancetype)desktopShowsExternalHardDisks;
- (instancetype)desktopShowsHardDisks;
- (instancetype)desktopShowsRemovableMedia;
- (instancetype)disclosesPreviewPane;
- (instancetype)disk;
- (instancetype)displayedName;
- (instancetype)ejectable;
- (instancetype)entireContents;
- (instancetype)everyonesPrivileges;
- (instancetype)expandable;
- (instancetype)expanded;
- (instancetype)extensionHidden;
- (instancetype)file;
- (instancetype)fileType;
- (instancetype)floating;
- (instancetype)foldersOpenInNewTabs;
- (instancetype)foldersOpenInNewWindows;
- (instancetype)foldersSpringOpen;
- (instancetype)format;
- (instancetype)freeSpace;
- (instancetype)frontmost;
- (instancetype)group;
- (instancetype)groupPrivileges;
- (instancetype)hasScriptingTerminology;
- (instancetype)home;
- (instancetype)icon;
- (instancetype)iconSize;
- (instancetype)iconViewOptions;
- (instancetype)id_;
- (instancetype)ignorePrivileges;
- (instancetype)index;
- (instancetype)informationWindow;
- (instancetype)insertionLocation;
- (instancetype)item;
- (instancetype)journalingEnabled;
- (instancetype)kind;
- (instancetype)labelIndex;
- (instancetype)labelPosition;
- (instancetype)large32BitIcon;
- (instancetype)large4BitIcon;
- (instancetype)large8BitIcon;
- (instancetype)large8BitMask;
- (instancetype)largeMonochromeIconAndMask;
- (instancetype)listViewOptions;
- (instancetype)localVolume;
- (instancetype)location;
- (instancetype)locked;
- (instancetype)maximumWidth;
- (instancetype)minimumSize;
- (instancetype)minimumWidth;
- (instancetype)modal;
- (instancetype)modificationDate;
- (instancetype)name;
- (instancetype)nameExtension;
- (instancetype)newWindowTarget;
- (instancetype)newWindowsOpenInColumnView;
- (instancetype)opensInClassic;
- (instancetype)originalItem;
- (instancetype)owner;
- (instancetype)ownerPrivileges;
- (instancetype)partitionSpaceUsed;
- (instancetype)physicalSize;
- (instancetype)position;
- (instancetype)preferredSize;
- (instancetype)productVersion;
- (instancetype)properties;
- (instancetype)resizable;
- (instancetype)selection;
- (instancetype)showsIcon;
- (instancetype)showsIconPreview;
- (instancetype)showsItemInfo;
- (instancetype)showsPreviewColumn;
- (instancetype)sidebarWidth;
- (instancetype)size;
- (instancetype)small32BitIcon;
- (instancetype)small4BitIcon;
- (instancetype)small8BitIcon;
- (instancetype)small8BitMask;
- (instancetype)smallMonochromeIconAndMask;
- (instancetype)sortColumn;
- (instancetype)sortDirection;
- (instancetype)startup;
- (instancetype)startupDisk;
- (instancetype)stationery;
- (instancetype)statusbarVisible;
- (instancetype)suggestedSize;
- (instancetype)target;
- (instancetype)textSize;
- (instancetype)titled;
- (instancetype)toolbarVisible;
- (instancetype)totalPartitionSize;
- (instancetype)trash;
- (instancetype)usesRelativeDates;
- (instancetype)version_;
- (instancetype)visible;
- (instancetype)warnsBeforeEmptying;
- (instancetype)width;
- (instancetype)window;
- (instancetype)zoomable;
- (instancetype)zoomed;
// Elements
- (instancetype)FinderWindows;
- (instancetype)aliasFiles;
- (instancetype)aliasLists;
- (instancetype)applicationFiles;
- (instancetype)applicationProcesses;
- (instancetype)applications;
- (instancetype)clippingWindows;
- (instancetype)clippings;
- (instancetype)columnViewOptionss;
- (instancetype)columns;
- (instancetype)computerObjects;
- (instancetype)containers;
- (instancetype)deskAccessoryProcesses;
- (instancetype)desktopObjects;
- (instancetype)desktopWindows;
- (instancetype)disks;
- (instancetype)documentFiles;
- (instancetype)files;
- (instancetype)folders;
- (instancetype)iconFamilys;
- (instancetype)iconViewOptionss;
- (instancetype)informationWindows;
- (instancetype)internetLocationFiles;
- (instancetype)items;
- (instancetype)labels;
- (instancetype)listViewOptionss;
- (instancetype)packages;
- (instancetype)preferencesWindows;
- (instancetype)preferencess;
- (instancetype)processes;
- (instancetype)trashObjects;
- (instancetype)windows;
// Commands
- (FINActivateCommand *)activate;
- (FINActivateCommand *)activate:(id)directParameter;
- (FINCleanUpCommand *)cleanUp;
- (FINCleanUpCommand *)cleanUp:(id)directParameter;
- (FINCloseCommand *)close;
- (FINCloseCommand *)close:(id)directParameter;
- (FINCopy_Command *)copy_;
- (FINCopy_Command *)copy_:(id)directParameter;
- (FINCountCommand *)count;
- (FINCountCommand *)count:(id)directParameter;
- (FINDataSizeCommand *)dataSize;
- (FINDataSizeCommand *)dataSize:(id)directParameter;
- (FINDeleteCommand *)delete;
- (FINDeleteCommand *)delete:(id)directParameter;
- (FINDuplicateCommand *)duplicate;
- (FINDuplicateCommand *)duplicate:(id)directParameter;
- (FINEjectCommand *)eject;
- (FINEjectCommand *)eject:(id)directParameter;
- (FINEmptyCommand *)empty;
- (FINEmptyCommand *)empty:(id)directParameter;
- (FINEraseCommand *)erase;
- (FINEraseCommand *)erase:(id)directParameter;
- (FINExistsCommand *)exists;
- (FINExistsCommand *)exists:(id)directParameter;
- (FINGetCommand *)get;
- (FINGetCommand *)get:(id)directParameter;
- (FINLaunchCommand *)launch;
- (FINLaunchCommand *)launch:(id)directParameter;
- (FINMakeCommand *)make;
- (FINMakeCommand *)make:(id)directParameter;
- (FINMoveCommand *)move;
- (FINMoveCommand *)move:(id)directParameter;
- (FINOpenCommand *)open;
- (FINOpenCommand *)open:(id)directParameter;
- (FINOpenLocationCommand *)openLocation;
- (FINOpenLocationCommand *)openLocation:(id)directParameter;
- (FINPrintCommand *)print;
- (FINPrintCommand *)print:(id)directParameter;
- (FINQuitCommand *)quit;
- (FINQuitCommand *)quit:(id)directParameter;
- (FINReopenCommand *)reopen;
- (FINReopenCommand *)reopen:(id)directParameter;
- (FINRestartCommand *)restart;
- (FINRestartCommand *)restart:(id)directParameter;
- (FINRevealCommand *)reveal;
- (FINRevealCommand *)reveal:(id)directParameter;
- (FINRunCommand *)run;
- (FINRunCommand *)run:(id)directParameter;
- (FINSelectCommand *)select;
- (FINSelectCommand *)select:(id)directParameter;
- (FINSetCommand *)set;
- (FINSetCommand *)set:(id)directParameter;
- (FINShutDownCommand *)shutDown;
- (FINShutDownCommand *)shutDown:(id)directParameter;
- (FINSleepCommand *)sleep;
- (FINSleepCommand *)sleep:(id)directParameter;
- (FINSortCommand *)sort;
- (FINSortCommand *)sort:(id)directParameter;
- (FINUpdateCommand *)update;
- (FINUpdateCommand *)update:(id)directParameter;
@end


@interface FINApplication : FINSpecifier
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
- (FINSpecifier *)customRoot:(id)object;
@end


