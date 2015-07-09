//
// FINGlue.m
// Finder.app 10.10.4
// AppleEventBridge.framework 0.7.0
// aebglue -o -s -r Finder
//

#import "FINGlue.h"

// TO DO: add comments where -release calls are needed in non-ARC builds


@implementation FINFormatter
- (NSString *)propertyByCode:(OSType)code {
    switch (code) {
        case 0x70667270: return @"FinderPreferences";
        case 0x7055524c: return @"URL";
        case 0x69736162: return @"acceptsHighLevelEvents";
        case 0x72657674: return @"acceptsRemoteEvents";
        case 0x70736e78: return @"allNameExtensionsShowing";
        case 0x61707066: return @"applicationFile";
        case 0x69617272: return @"arrangement";
        case 0x636f6c72: return @"backgroundColor";
        case 0x69626b67: return @"backgroundPicture";
        case 0x70626e64: return @"bounds";
        case 0x7366737a: return @"calculatesFolderSizes";
        case 0x63617061: return @"capacity";
        case 0x70636c73: return @"class_";
        case 0x70636c69: return @"clipboard";
        case 0x6c776e64: return @"clippingWindow";
        case 0x68636c62: return @"closeable";
        case 0x77736864: return @"collapsed";
        case 0x63766f70: return @"columnViewOptions";
        case 0x636f6d74: return @"comment";
        case 0x70657863: return @"completelyExpanded";
        case 0x70636d70: return @"computerContainer";
        case 0x63746e72: return @"container";
        case 0x63776e64: return @"containerWindow";
        case 0x61736364: return @"creationDate";
        case 0x66637274: return @"creatorType";
        case 0x70616e6c: return @"currentPanel";
        case 0x70766577: return @"currentView";
        case 0x64656c61: return @"delayBeforeSpringing";
        case 0x64736372: return @"description_";
        case 0x64616669: return @"deskAccessoryFile";
        case 0x6465736b: return @"desktop";
        case 0x64706963: return @"desktopPicture";
        case 0x64706f73: return @"desktopPosition";
        case 0x70647376: return @"desktopShowsConnectedServers";
        case 0x70656864: return @"desktopShowsExternalHardDisks";
        case 0x70646864: return @"desktopShowsHardDisks";
        case 0x7064726d: return @"desktopShowsRemovableMedia";
        case 0x64737072: return @"disclosesPreviewPane";
        case 0x63646973: return @"disk";
        case 0x646e616d: return @"displayedName";
        case 0x6973656a: return @"ejectable";
        case 0x65637473: return @"entireContents";
        case 0x67737470: return @"everyonesPrivileges";
        case 0x70657861: return @"expandable";
        case 0x70657870: return @"expanded";
        case 0x68696478: return @"extensionHidden";
        case 0x66696c65: return @"file";
        case 0x61737479: return @"fileType";
        case 0x6973666c: return @"floating";
        case 0x706f6e74: return @"foldersOpenInNewTabs";
        case 0x706f6e77: return @"foldersOpenInNewWindows";
        case 0x73707267: return @"foldersSpringOpen";
        case 0x64666d74: return @"format";
        case 0x66727370: return @"freeSpace";
        case 0x70697366: return @"frontmost";
        case 0x73677270: return @"group";
        case 0x67707072: return @"groupPrivileges";
        case 0x68736372: return @"hasScriptingTerminology";
        case 0x686f6d65: return @"home";
        case 0x69696d67: return @"icon";
        case 0x6c766973: return @"iconSize";
        case 0x69636f70: return @"iconViewOptions";
        case 0x49442020: return @"id_";
        case 0x69677072: return @"ignorePrivileges";
        case 0x70696478: return @"index";
        case 0x69776e64: return @"informationWindow";
        case 0x70696e73: return @"insertionLocation";
        case 0x636f626a: return @"item";
        case 0x4a726e6c: return @"journalingEnabled";
        case 0x6b696e64: return @"kind";
        case 0x6c616269: return @"labelIndex";
        case 0x6c706f73: return @"labelPosition";
        case 0x696c3332: return @"large32BitIcon";
        case 0x69636c34: return @"large4BitIcon";
        case 0x69636c38: return @"large8BitIcon";
        case 0x6c386d6b: return @"large8BitMask";
        case 0x49434e23: return @"largeMonochromeIconAndMask";
        case 0x6c766f70: return @"listViewOptions";
        case 0x69737276: return @"localVolume";
        case 0x696c6f63: return @"location";
        case 0x61736c6b: return @"locked";
        case 0x636c776d: return @"maximumWidth";
        case 0x6d707274: return @"minimumSize";
        case 0x636c776e: return @"minimumWidth";
        case 0x706d6f64: return @"modal";
        case 0x61736d6f: return @"modificationDate";
        case 0x706e616d: return @"name";
        case 0x6e6d7874: return @"nameExtension";
        case 0x706e7774: return @"newWindowTarget";
        case 0x706f6376: return @"newWindowsOpenInColumnView";
        case 0x436c7363: return @"opensInClassic";
        case 0x6f726967: return @"originalItem";
        case 0x736f776e: return @"owner";
        case 0x6f776e72: return @"ownerPrivileges";
        case 0x70757364: return @"partitionSpaceUsed";
        case 0x70687973: return @"physicalSize";
        case 0x706f736e: return @"position";
        case 0x76657232: return @"productVersion";
        case 0x70414c4c: return @"properties";
        case 0x7072737a: return @"resizable";
        case 0x73656c65: return @"selection";
        case 0x73686963: return @"showsIcon";
        case 0x70727677: return @"showsIconPreview";
        case 0x6d6e666f: return @"showsItemInfo";
        case 0x73687072: return @"showsPreviewColumn";
        case 0x73627769: return @"sidebarWidth";
        case 0x7074737a: return @"size";
        case 0x69733332: return @"small32BitIcon";
        case 0x69637334: return @"small4BitIcon";
        case 0x69637338: return @"small8BitIcon";
        case 0x69637323: return @"smallMonochromeIconAndMask";
        case 0x73727463: return @"sortColumn";
        case 0x736f7264: return @"sortDirection";
        case 0x69737464: return @"startup";
        case 0x7364736b: return @"startupDisk";
        case 0x70737064: return @"stationery";
        case 0x73747669: return @"statusbarVisible";
        case 0x73707274: return @"suggestedSize";
        case 0x66767467: return @"target";
        case 0x6673697a: return @"textSize";
        case 0x70746974: return @"titled";
        case 0x74627669: return @"toolbarVisible";
        case 0x61707074: return @"totalPartitionSize";
        case 0x74727368: return @"trash";
        case 0x75726474: return @"usesRelativeDates";
        case 0x76657273: return @"version_";
        case 0x70766973: return @"visible";
        case 0x7761726e: return @"warnsBeforeEmptying";
        case 0x636c7764: return @"width";
        case 0x6377696e: return @"window";
        case 0x69737a6d: return @"zoomable";
        case 0x707a756d: return @"zoomed";
        default: return [super propertyByCode: code];
    }
}
- (NSString *)elementsByCode:(OSType)code {
    switch (code) {
        case 0x62726f77: return @"FinderWindows";
        case 0x616c6961: return @"aliasFiles";
        case 0x616c7374: return @"aliasLists";
        case 0x61707066: return @"applicationFiles";
        case 0x70636170: return @"applicationProcesses";
        case 0x63617070: return @"applications";
        case 0x6c776e64: return @"clippingWindows";
        case 0x636c7066: return @"clippings";
        case 0x63766f70: return @"columnViewOptionss";
        case 0x6c76636c: return @"columns";
        case 0x63636d70: return @"computerObjects";
        case 0x63746e72: return @"containers";
        case 0x70636461: return @"deskAccessoryProcesses";
        case 0x6364736b: return @"desktopObjects";
        case 0x646b7477: return @"desktopWindows";
        case 0x63646973: return @"disks";
        case 0x646f6366: return @"documentFiles";
        case 0x66696c65: return @"files";
        case 0x63666f6c: return @"folders";
        case 0x6966616d: return @"iconFamilys";
        case 0x69636f70: return @"iconViewOptionss";
        case 0x69776e64: return @"informationWindows";
        case 0x696e6c66: return @"internetLocationFiles";
        case 0x636f626a: return @"items";
        case 0x636c626c: return @"labels";
        case 0x6c766f70: return @"listViewOptionss";
        case 0x7061636b: return @"packages";
        case 0x70776e64: return @"preferencesWindows";
        case 0x63707266: return @"preferencess";
        case 0x70726373: return @"processes";
        case 0x63747273: return @"trashObjects";
        case 0x6377696e: return @"windows";
        default: return [super elementsByCode: code];
    }
}
- (NSString *)prefix {
    return @"FIN";
}
@end




@implementation FINSymbol
+ (AEBSymbol *)aebSymbolForCode:(OSType)code_ {
    switch (code_) {
        case 0x70616476: return self.AdvancedPreferencesPanel;
        case 0x64667068: return self.ApplePhotoFormat;
        case 0x64666173: return self.AppleShareFormat;
        case 0x61706e6c: return self.ApplicationPanel;
        case 0x61707220: return self.April;
        case 0x61756720: return self.August;
        case 0x62706e6c: return self.BurningPanel;
        case 0x63737472: return self.CString;
        case 0x63706e6c: return self.CommentsPanel;
        case 0x63696e6c: return self.ContentIndexPanel;
        case 0x64656320: return self.December;
        case 0x45505320: return self.EPSPicture;
        case 0x64666674: return self.FTPFormat;
        case 0x66656220: return self.February;
        case 0x70667270: return self.FinderPreferences;
        case 0x62726f77: return self.FinderWindow;
        case 0x66726920: return self.Friday;
        case 0x47494666: return self.GIFPicture;
        case 0x67706e6c: return self.GeneralInformationPanel;
        case 0x70676e70: return self.GeneralPreferencesPanel;
        case 0x64666873: return self.HighSierraFormat;
        case 0x64663936: return self.ISO9660Format;
        case 0x4a504547: return self.JPEGPicture;
        case 0x6a616e20: return self.January;
        case 0x6a756c20: return self.July;
        case 0x6a756e20: return self.June;
        case 0x706c6270: return self.LabelPreferencesPanel;
        case 0x706b6c67: return self.LanguagesPanel;
        case 0x64666d73: return self.MSDOSFormat;
        case 0x6466682b: return self.MacOSExtendedFormat;
        case 0x64666866: return self.MacOSFormat;
        case 0x6d617220: return self.March;
        case 0x6d617920: return self.May;
        case 0x6d706e6c: return self.MemoryPanel;
        case 0x6d6f6e20: return self.Monday;
        case 0x6d696e6c: return self.MoreInfoPanel;
        case 0x64666e66: return self.NFSFormat;
        case 0x64666e74: return self.NTFSFormat;
        case 0x6e706e6c: return self.NameAndExtensionPanel;
        case 0x6e6f7620: return self.November;
        case 0x6f637420: return self.October;
        case 0x50494354: return self.PICTPicture;
        case 0x64667075: return self.PacketWrittenUDFFormat;
        case 0x70737472: return self.PascalString;
        case 0x706b7067: return self.PluginsPanel;
        case 0x76706e6c: return self.PreviewPanel;
        case 0x64667072: return self.ProDOSFormat;
        case 0x64667174: return self.QuickTakeFormat;
        case 0x74723136: return self.RGB16Color;
        case 0x74723936: return self.RGB96Color;
        case 0x63524742: return self.RGBColor;
        case 0x73617420: return self.Saturday;
        case 0x73657020: return self.September;
        case 0x73706e6c: return self.SharingPanel;
        case 0x70736964: return self.SidebarPreferencesPanel;
        case 0x73686e6c: return self.SimpleHeaderPanel;
        case 0x73756e20: return self.Sunday;
        case 0x54494646: return self.TIFFPicture;
        case 0x74687520: return self.Thursday;
        case 0x74756520: return self.Tuesday;
        case 0x64667564: return self.UDFFormat;
        case 0x64667566: return self.UFSFormat;
        case 0x7055524c: return self.URL;
        case 0x75743136: return self.UTF16Text;
        case 0x75746638: return self.UTF8Text;
        case 0x75747874: return self.UnicodeText;
        case 0x64667764: return self.WebDAVFormat;
        case 0x77656420: return self.Wednesday;
        case 0x64666163: return self.XsanFormat;
        case 0x69736162: return self.acceptsHighLevelEvents;
        case 0x72657674: return self.acceptsRemoteEvents;
        case 0x616c6973: return self.alias;
        case 0x616c6961: return self.aliasFile;
        case 0x616c7374: return self.aliasList;
        case 0x70736e78: return self.allNameExtensionsShowing;
        case 0x2a2a2a2a: return self.anything;
        case 0x63617070: return self.application;
        case 0x62756e64: return self.applicationBundleID;
        case 0x61707066: return self.applicationFile;
        case 0x70636170: return self.applicationProcess;
        case 0x726d7465: return self.applicationResponses;
        case 0x7369676e: return self.applicationSignature;
        case 0x6170726c: return self.applicationURL;
        case 0x63647461: return self.arrangedByCreationDate;
        case 0x6b696e61: return self.arrangedByKind;
        case 0x6c616261: return self.arrangedByLabel;
        case 0x6d647461: return self.arrangedByModificationDate;
        case 0x6e616d61: return self.arrangedByName;
        case 0x73697a61: return self.arrangedBySize;
        case 0x69617272: return self.arrangement;
        case 0x61736b20: return self.ask;
        case 0x64666175: return self.audioFormat;
        case 0x636f6c72: return self.backgroundColor;
        case 0x69626b67: return self.backgroundPicture;
        case 0x62657374: return self.best;
        case 0x626f6f6c: return self.boolean;
        case 0x6c626f74: return self.bottom;
        case 0x71647274: return self.boundingRectangle;
        case 0x70626e64: return self.bounds;
        case 0x7366737a: return self.calculatesFolderSizes;
        case 0x63617061: return self.capacity;
        case 0x63617365: return self.case_;
        case 0x636d7472: return self.centimeters;
        case 0x67636c69: return self.classInfo;
        case 0x70636c73: return self.class_;
        case 0x70636c69: return self.clipboard;
        case 0x636c7066: return self.clipping;
        case 0x6c776e64: return self.clippingWindow;
        case 0x68636c62: return self.closeable;
        case 0x77736864: return self.collapsed;
        case 0x636c7274: return self.colorTable;
        case 0x6c76636c: return self.column;
        case 0x636c7677: return self.columnView;
        case 0x63766f70: return self.columnViewOptions;
        case 0x636f6d74: return self.comment;
        case 0x656c7343: return self.commentColumn;
        case 0x70657863: return self.completelyExpanded;
        case 0x70636d70: return self.computerContainer;
        case 0x63636d70: return self.computerObject;
        case 0x63746e72: return self.container;
        case 0x63776e64: return self.containerWindow;
        case 0x61736364: return self.creationDate;
        case 0x656c7363: return self.creationDateColumn;
        case 0x66637274: return self.creatorType;
        case 0x63636d74: return self.cubicCentimeters;
        case 0x63666574: return self.cubicFeet;
        case 0x6375696e: return self.cubicInches;
        case 0x636d6574: return self.cubicMeters;
        case 0x63797264: return self.cubicYards;
        case 0x70616e6c: return self.currentPanel;
        case 0x70766577: return self.currentView;
        case 0x74646173: return self.dashStyle;
        case 0x72646174: return self.data;
        case 0x6c647420: return self.date;
        case 0x6465636d: return self.decimalStruct;
        case 0x64656763: return self.degreesCelsius;
        case 0x64656766: return self.degreesFahrenheit;
        case 0x6465676b: return self.degreesKelvin;
        case 0x64656c61: return self.delayBeforeSpringing;
        case 0x64736372: return self.description_;
        case 0x64616669: return self.deskAccessoryFile;
        case 0x70636461: return self.deskAccessoryProcess;
        case 0x6465736b: return self.desktop;
        case 0x6364736b: return self.desktopObject;
        case 0x64706963: return self.desktopPicture;
        case 0x64706f73: return self.desktopPosition;
        case 0x70647376: return self.desktopShowsConnectedServers;
        case 0x70656864: return self.desktopShowsExternalHardDisks;
        case 0x70646864: return self.desktopShowsHardDisks;
        case 0x7064726d: return self.desktopShowsRemovableMedia;
        case 0x646b7477: return self.desktopWindow;
        case 0x64696163: return self.diacriticals;
        case 0x64737072: return self.disclosesPreviewPane;
        case 0x63646973: return self.disk;
        case 0x646e616d: return self.displayedName;
        case 0x646f6366: return self.documentFile;
        case 0x636f6d70: return self.doubleInteger;
        case 0x6973656a: return self.ejectable;
        case 0x656c696e: return self.elementInfo;
        case 0x656e6373: return self.encodedString;
        case 0x65637473: return self.entireContents;
        case 0x656e756d: return self.enumerator;
        case 0x6576696e: return self.eventInfo;
        case 0x67737470: return self.everyonesPrivileges;
        case 0x70657861: return self.expandable;
        case 0x70657870: return self.expanded;
        case 0x65787061: return self.expansion;
        case 0x65787465: return self.extendedFloat;
        case 0x68696478: return self.extensionHidden;
        case 0x66656574: return self.feet;
        case 0x66696c65: return self.file;
        case 0x66737266: return self.fileRef;
        case 0x66737320: return self.fileSpecification;
        case 0x61737479: return self.fileType;
        case 0x6675726c: return self.fileURL;
        case 0x66697864: return self.fixed;
        case 0x66706e74: return self.fixedPoint;
        case 0x66726374: return self.fixedRectangle;
        case 0x6c64626c: return self.float128bit;
        case 0x646f7562: return self.float_;
        case 0x6973666c: return self.floating;
        case 0x666c7677: return self.flowView;
        case 0x63666f6c: return self.folder;
        case 0x706f6e74: return self.foldersOpenInNewTabs;
        case 0x706f6e77: return self.foldersOpenInNewWindows;
        case 0x73707267: return self.foldersSpringOpen;
        case 0x64666d74: return self.format;
        case 0x66727370: return self.freeSpace;
        case 0x70697366: return self.frontmost;
        case 0x67616c6e: return self.gallons;
        case 0x6772616d: return self.grams;
        case 0x63677478: return self.graphicText;
        case 0x73677270: return self.group;
        case 0x67707072: return self.groupPrivileges;
        case 0x67727677: return self.groupView;
        case 0x68736372: return self.hasScriptingTerminology;
        case 0x686f6d65: return self.home;
        case 0x68797068: return self.hyphens;
        case 0x69696d67: return self.icon;
        case 0x6966616d: return self.iconFamily;
        case 0x6c766973: return self.iconSize;
        case 0x69636e76: return self.iconView;
        case 0x69636f70: return self.iconViewOptions;
        case 0x49442020: return self.id_;
        case 0x69677072: return self.ignorePrivileges;
        case 0x696e6368: return self.inches;
        case 0x70696478: return self.index;
        case 0x69776e64: return self.informationWindow;
        case 0x70696e73: return self.insertionLocation;
        case 0x6c6f6e67: return self.integer;
        case 0x69747874: return self.internationalText;
        case 0x696e746c: return self.internationalWritingCode;
        case 0x696e6c66: return self.internetLocationFile;
        case 0x636f626a: return self.item;
        case 0x4a726e6c: return self.journalingEnabled;
        case 0x6b706964: return self.kernelProcessID;
        case 0x6b67726d: return self.kilograms;
        case 0x6b6d7472: return self.kilometers;
        case 0x6b696e64: return self.kind;
        case 0x656c736b: return self.kindColumn;
        case 0x636c626c: return self.label;
        case 0x656c736c: return self.labelColumn;
        case 0x6c616269: return self.labelIndex;
        case 0x6c706f73: return self.labelPosition;
        case 0x6c676963: return self.large;
        case 0x696c3332: return self.large32BitIcon;
        case 0x69636c34: return self.large4BitIcon;
        case 0x69636c38: return self.large8BitIcon;
        case 0x6c386d6b: return self.large8BitMask;
        case 0x49434e23: return self.largeMonochromeIconAndMask;
        case 0x6c697374: return self.list;
        case 0x6c737677: return self.listView;
        case 0x6c766f70: return self.listViewOptions;
        case 0x6c697472: return self.liters;
        case 0x69737276: return self.localVolume;
        case 0x696c6f63: return self.location;
        case 0x696e736c: return self.locationReference;
        case 0x61736c6b: return self.locked;
        case 0x6c667864: return self.longFixed;
        case 0x6c667074: return self.longFixedPoint;
        case 0x6c667263: return self.longFixedRectangle;
        case 0x6c706e74: return self.longPoint;
        case 0x6c726374: return self.longRectangle;
        case 0x706f7274: return self.machPort;
        case 0x6d616368: return self.machine;
        case 0x6d4c6f63: return self.machineLocation;
        case 0x636c776d: return self.maximumWidth;
        case 0x6d657472: return self.meters;
        case 0x6d696c65: return self.miles;
        case 0x6d696963: return self.mini;
        case 0x6d707274: return self.minimumSize;
        case 0x636c776e: return self.minimumWidth;
        case 0x6d736e67: return self.missingValue;
        case 0x706d6f64: return self.modal;
        case 0x61736d6f: return self.modificationDate;
        case 0x656c736d: return self.modificationDateColumn;
        case 0x706e616d: return self.name;
        case 0x656c736e: return self.nameColumn;
        case 0x6e6d7874: return self.nameExtension;
        case 0x706e7774: return self.newWindowTarget;
        case 0x706f6376: return self.newWindowsOpenInColumnView;
        case 0x6e6f2020: return self.no;
        case 0x6e6f6e65: return self.none;
        case 0x736e726d: return self.normal;
        case 0x6e617272: return self.notArranged;
        case 0x6e756c6c: return self.null;
        case 0x6e756d65: return self.numericStrings;
        case 0x436c7363: return self.opensInClassic;
        case 0x6f726967: return self.originalItem;
        case 0x6f7a7320: return self.ounces;
        case 0x736f776e: return self.owner;
        case 0x6f776e72: return self.ownerPrivileges;
        case 0x7061636b: return self.package;
        case 0x706d696e: return self.parameterInfo;
        case 0x70757364: return self.partitionSpaceUsed;
        case 0x74706d6d: return self.pixelMapRecord;
        case 0x51447074: return self.point;
        case 0x706f736e: return self.position;
        case 0x6c627320: return self.pounds;
        case 0x63707266: return self.preferences;
        case 0x70776e64: return self.preferencesWindow;
        case 0x70726373: return self.process;
        case 0x70736e20: return self.processSerialNumber;
        case 0x76657232: return self.productVersion;
        case 0x70414c4c: return self.properties;
        case 0x70726f70: return self.property;
        case 0x70696e66: return self.propertyInfo;
        case 0x70756e63: return self.punctuation;
        case 0x71727473: return self.quarts;
        case 0x72656164: return self.readOnly;
        case 0x72647772: return self.readWrite;
        case 0x7265636f: return self.record;
        case 0x6f626a20: return self.reference;
        case 0x7072737a: return self.resizable;
        case 0x73727673: return self.reversed;
        case 0x6c726774: return self.right;
        case 0x74726f74: return self.rotation;
        case 0x73637074: return self.script;
        case 0x73656c65: return self.selection;
        case 0x73696e67: return self.shortFloat;
        case 0x73686f72: return self.shortInteger;
        case 0x73686963: return self.showsIcon;
        case 0x70727677: return self.showsIconPreview;
        case 0x6d6e666f: return self.showsItemInfo;
        case 0x73687072: return self.showsPreviewColumn;
        case 0x73627769: return self.sidebarWidth;
        case 0x7074737a: return self.size;
        case 0x70687973: return self.size;
        case 0x656c7373: return self.sizeColumn;
        case 0x736d6963: return self.small;
        case 0x69733332: return self.small32BitIcon;
        case 0x69637334: return self.small4BitIcon;
        case 0x69637338: return self.small8BitIcon;
        case 0x69637323: return self.smallMonochromeIconAndMask;
        case 0x67726461: return self.snapToGrid;
        case 0x73727463: return self.sortColumn;
        case 0x736f7264: return self.sortDirection;
        case 0x73716674: return self.squareFeet;
        case 0x73716b6d: return self.squareKilometers;
        case 0x7371726d: return self.squareMeters;
        case 0x73716d69: return self.squareMiles;
        case 0x73717964: return self.squareYards;
        case 0x69737464: return self.startup;
        case 0x7364736b: return self.startupDisk;
        case 0x70737064: return self.stationery;
        case 0x73747669: return self.statusbarVisible;
        case 0x54455854: return self.string;
        case 0x7374796c: return self.styledClipboardText;
        case 0x53545854: return self.styledText;
        case 0x73757478: return self.styledUnicodeText;
        case 0x73707274: return self.suggestedSize;
        case 0x7375696e: return self.suiteInfo;
        case 0x66767467: return self.target;
        case 0x6673697a: return self.textSize;
        case 0x74737479: return self.textStyleInfo;
        case 0x70746974: return self.titled;
        case 0x74627669: return self.toolbarVisible;
        case 0x61707074: return self.totalPartitionSize;
        case 0x74727368: return self.trash;
        case 0x63747273: return self.trashObject;
        case 0x74797065: return self.typeClass;
        case 0x64663f3f: return self.unknownFormat;
        case 0x6d61676e: return self.unsignedInteger;
        case 0x75726474: return self.usesRelativeDates;
        case 0x656c7376: return self.versionColumn;
        case 0x76657273: return self.version_;
        case 0x70766973: return self.visible;
        case 0x7761726e: return self.warnsBeforeEmptying;
        case 0x77686974: return self.whitespace;
        case 0x636c7764: return self.width;
        case 0x6377696e: return self.window;
        case 0x77726974: return self.writeOnly;
        case 0x70736374: return self.writingCode;
        case 0x79617264: return self.yards;
        case 0x79657320: return self.yes;
        case 0x69737a6d: return self.zoomable;
        case 0x707a756d: return self.zoomed;
        default: return [super aebSymbolForCode: code_];
    }
}
// Types/properties 
+ (AEBSymbol *)April {AEB_RETURN_SYMBOL(@"April", typeType, 0x61707220);}
+ (AEBSymbol *)August {AEB_RETURN_SYMBOL(@"August", typeType, 0x61756720);}
+ (AEBSymbol *)CString {AEB_RETURN_SYMBOL(@"CString", typeType, 0x63737472);}
+ (AEBSymbol *)December {AEB_RETURN_SYMBOL(@"December", typeType, 0x64656320);}
+ (AEBSymbol *)EPSPicture {AEB_RETURN_SYMBOL(@"EPSPicture", typeType, 0x45505320);}
+ (AEBSymbol *)February {AEB_RETURN_SYMBOL(@"February", typeType, 0x66656220);}
+ (AEBSymbol *)FinderPreferences {AEB_RETURN_SYMBOL(@"FinderPreferences", typeType, 0x70667270);}
+ (AEBSymbol *)FinderWindow {AEB_RETURN_SYMBOL(@"FinderWindow", typeType, 0x62726f77);}
+ (AEBSymbol *)Friday {AEB_RETURN_SYMBOL(@"Friday", typeType, 0x66726920);}
+ (AEBSymbol *)GIFPicture {AEB_RETURN_SYMBOL(@"GIFPicture", typeType, 0x47494666);}
+ (AEBSymbol *)JPEGPicture {AEB_RETURN_SYMBOL(@"JPEGPicture", typeType, 0x4a504547);}
+ (AEBSymbol *)January {AEB_RETURN_SYMBOL(@"January", typeType, 0x6a616e20);}
+ (AEBSymbol *)July {AEB_RETURN_SYMBOL(@"July", typeType, 0x6a756c20);}
+ (AEBSymbol *)June {AEB_RETURN_SYMBOL(@"June", typeType, 0x6a756e20);}
+ (AEBSymbol *)March {AEB_RETURN_SYMBOL(@"March", typeType, 0x6d617220);}
+ (AEBSymbol *)May {AEB_RETURN_SYMBOL(@"May", typeType, 0x6d617920);}
+ (AEBSymbol *)Monday {AEB_RETURN_SYMBOL(@"Monday", typeType, 0x6d6f6e20);}
+ (AEBSymbol *)November {AEB_RETURN_SYMBOL(@"November", typeType, 0x6e6f7620);}
+ (AEBSymbol *)October {AEB_RETURN_SYMBOL(@"October", typeType, 0x6f637420);}
+ (AEBSymbol *)PICTPicture {AEB_RETURN_SYMBOL(@"PICTPicture", typeType, 0x50494354);}
+ (AEBSymbol *)PascalString {AEB_RETURN_SYMBOL(@"PascalString", typeType, 0x70737472);}
+ (AEBSymbol *)RGB16Color {AEB_RETURN_SYMBOL(@"RGB16Color", typeType, 0x74723136);}
+ (AEBSymbol *)RGB96Color {AEB_RETURN_SYMBOL(@"RGB96Color", typeType, 0x74723936);}
+ (AEBSymbol *)RGBColor {AEB_RETURN_SYMBOL(@"RGBColor", typeType, 0x63524742);}
+ (AEBSymbol *)Saturday {AEB_RETURN_SYMBOL(@"Saturday", typeType, 0x73617420);}
+ (AEBSymbol *)September {AEB_RETURN_SYMBOL(@"September", typeType, 0x73657020);}
+ (AEBSymbol *)Sunday {AEB_RETURN_SYMBOL(@"Sunday", typeType, 0x73756e20);}
+ (AEBSymbol *)TIFFPicture {AEB_RETURN_SYMBOL(@"TIFFPicture", typeType, 0x54494646);}
+ (AEBSymbol *)Thursday {AEB_RETURN_SYMBOL(@"Thursday", typeType, 0x74687520);}
+ (AEBSymbol *)Tuesday {AEB_RETURN_SYMBOL(@"Tuesday", typeType, 0x74756520);}
+ (AEBSymbol *)URL {AEB_RETURN_SYMBOL(@"URL", typeType, 0x7055524c);}
+ (AEBSymbol *)UTF16Text {AEB_RETURN_SYMBOL(@"UTF16Text", typeType, 0x75743136);}
+ (AEBSymbol *)UTF8Text {AEB_RETURN_SYMBOL(@"UTF8Text", typeType, 0x75746638);}
+ (AEBSymbol *)UnicodeText {AEB_RETURN_SYMBOL(@"UnicodeText", typeType, 0x75747874);}
+ (AEBSymbol *)Wednesday {AEB_RETURN_SYMBOL(@"Wednesday", typeType, 0x77656420);}
+ (AEBSymbol *)acceptsHighLevelEvents {AEB_RETURN_SYMBOL(@"acceptsHighLevelEvents", typeType, 0x69736162);}
+ (AEBSymbol *)acceptsRemoteEvents {AEB_RETURN_SYMBOL(@"acceptsRemoteEvents", typeType, 0x72657674);}
+ (AEBSymbol *)alias {AEB_RETURN_SYMBOL(@"alias", typeType, 0x616c6973);}
+ (AEBSymbol *)aliasFile {AEB_RETURN_SYMBOL(@"aliasFile", typeType, 0x616c6961);}
+ (AEBSymbol *)aliasList {AEB_RETURN_SYMBOL(@"aliasList", typeType, 0x616c7374);}
+ (AEBSymbol *)allNameExtensionsShowing {AEB_RETURN_SYMBOL(@"allNameExtensionsShowing", typeType, 0x70736e78);}
+ (AEBSymbol *)anything {AEB_RETURN_SYMBOL(@"anything", typeType, 0x2a2a2a2a);}
+ (AEBSymbol *)application {AEB_RETURN_SYMBOL(@"application", typeType, 0x63617070);}
+ (AEBSymbol *)applicationBundleID {AEB_RETURN_SYMBOL(@"applicationBundleID", typeType, 0x62756e64);}
+ (AEBSymbol *)applicationFile {AEB_RETURN_SYMBOL(@"applicationFile", typeType, 0x61707066);}
+ (AEBSymbol *)applicationProcess {AEB_RETURN_SYMBOL(@"applicationProcess", typeType, 0x70636170);}
+ (AEBSymbol *)applicationSignature {AEB_RETURN_SYMBOL(@"applicationSignature", typeType, 0x7369676e);}
+ (AEBSymbol *)applicationURL {AEB_RETURN_SYMBOL(@"applicationURL", typeType, 0x6170726c);}
+ (AEBSymbol *)arrangement {AEB_RETURN_SYMBOL(@"arrangement", typeType, 0x69617272);}
+ (AEBSymbol *)backgroundColor {AEB_RETURN_SYMBOL(@"backgroundColor", typeType, 0x636f6c72);}
+ (AEBSymbol *)backgroundPicture {AEB_RETURN_SYMBOL(@"backgroundPicture", typeType, 0x69626b67);}
+ (AEBSymbol *)best {AEB_RETURN_SYMBOL(@"best", typeType, 0x62657374);}
+ (AEBSymbol *)boolean {AEB_RETURN_SYMBOL(@"boolean", typeType, 0x626f6f6c);}
+ (AEBSymbol *)boundingRectangle {AEB_RETURN_SYMBOL(@"boundingRectangle", typeType, 0x71647274);}
+ (AEBSymbol *)bounds {AEB_RETURN_SYMBOL(@"bounds", typeType, 0x70626e64);}
+ (AEBSymbol *)calculatesFolderSizes {AEB_RETURN_SYMBOL(@"calculatesFolderSizes", typeType, 0x7366737a);}
+ (AEBSymbol *)capacity {AEB_RETURN_SYMBOL(@"capacity", typeType, 0x63617061);}
+ (AEBSymbol *)centimeters {AEB_RETURN_SYMBOL(@"centimeters", typeType, 0x636d7472);}
+ (AEBSymbol *)classInfo {AEB_RETURN_SYMBOL(@"classInfo", typeType, 0x67636c69);}
+ (AEBSymbol *)class_ {AEB_RETURN_SYMBOL(@"class_", typeType, 0x70636c73);}
+ (AEBSymbol *)clipboard {AEB_RETURN_SYMBOL(@"clipboard", typeType, 0x70636c69);}
+ (AEBSymbol *)clipping {AEB_RETURN_SYMBOL(@"clipping", typeType, 0x636c7066);}
+ (AEBSymbol *)clippingWindow {AEB_RETURN_SYMBOL(@"clippingWindow", typeType, 0x6c776e64);}
+ (AEBSymbol *)closeable {AEB_RETURN_SYMBOL(@"closeable", typeType, 0x68636c62);}
+ (AEBSymbol *)collapsed {AEB_RETURN_SYMBOL(@"collapsed", typeType, 0x77736864);}
+ (AEBSymbol *)color {AEB_RETURN_SYMBOL(@"color", typeType, 0x636f6c72);}
+ (AEBSymbol *)colorTable {AEB_RETURN_SYMBOL(@"colorTable", typeType, 0x636c7274);}
+ (AEBSymbol *)column {AEB_RETURN_SYMBOL(@"column", typeType, 0x6c76636c);}
+ (AEBSymbol *)columnViewOptions {AEB_RETURN_SYMBOL(@"columnViewOptions", typeType, 0x63766f70);}
+ (AEBSymbol *)completelyExpanded {AEB_RETURN_SYMBOL(@"completelyExpanded", typeType, 0x70657863);}
+ (AEBSymbol *)computerContainer {AEB_RETURN_SYMBOL(@"computerContainer", typeType, 0x70636d70);}
+ (AEBSymbol *)computerObject {AEB_RETURN_SYMBOL(@"computerObject", typeType, 0x63636d70);}
+ (AEBSymbol *)container {AEB_RETURN_SYMBOL(@"container", typeType, 0x63746e72);}
+ (AEBSymbol *)containerWindow {AEB_RETURN_SYMBOL(@"containerWindow", typeType, 0x63776e64);}
+ (AEBSymbol *)creatorType {AEB_RETURN_SYMBOL(@"creatorType", typeType, 0x66637274);}
+ (AEBSymbol *)cubicCentimeters {AEB_RETURN_SYMBOL(@"cubicCentimeters", typeType, 0x63636d74);}
+ (AEBSymbol *)cubicFeet {AEB_RETURN_SYMBOL(@"cubicFeet", typeType, 0x63666574);}
+ (AEBSymbol *)cubicInches {AEB_RETURN_SYMBOL(@"cubicInches", typeType, 0x6375696e);}
+ (AEBSymbol *)cubicMeters {AEB_RETURN_SYMBOL(@"cubicMeters", typeType, 0x636d6574);}
+ (AEBSymbol *)cubicYards {AEB_RETURN_SYMBOL(@"cubicYards", typeType, 0x63797264);}
+ (AEBSymbol *)currentPanel {AEB_RETURN_SYMBOL(@"currentPanel", typeType, 0x70616e6c);}
+ (AEBSymbol *)currentView {AEB_RETURN_SYMBOL(@"currentView", typeType, 0x70766577);}
+ (AEBSymbol *)dashStyle {AEB_RETURN_SYMBOL(@"dashStyle", typeType, 0x74646173);}
+ (AEBSymbol *)data {AEB_RETURN_SYMBOL(@"data", typeType, 0x72646174);}
+ (AEBSymbol *)date {AEB_RETURN_SYMBOL(@"date", typeType, 0x6c647420);}
+ (AEBSymbol *)decimalStruct {AEB_RETURN_SYMBOL(@"decimalStruct", typeType, 0x6465636d);}
+ (AEBSymbol *)degreesCelsius {AEB_RETURN_SYMBOL(@"degreesCelsius", typeType, 0x64656763);}
+ (AEBSymbol *)degreesFahrenheit {AEB_RETURN_SYMBOL(@"degreesFahrenheit", typeType, 0x64656766);}
+ (AEBSymbol *)degreesKelvin {AEB_RETURN_SYMBOL(@"degreesKelvin", typeType, 0x6465676b);}
+ (AEBSymbol *)delayBeforeSpringing {AEB_RETURN_SYMBOL(@"delayBeforeSpringing", typeType, 0x64656c61);}
+ (AEBSymbol *)description_ {AEB_RETURN_SYMBOL(@"description_", typeType, 0x64736372);}
+ (AEBSymbol *)deskAccessoryFile {AEB_RETURN_SYMBOL(@"deskAccessoryFile", typeType, 0x64616669);}
+ (AEBSymbol *)deskAccessoryProcess {AEB_RETURN_SYMBOL(@"deskAccessoryProcess", typeType, 0x70636461);}
+ (AEBSymbol *)desktop {AEB_RETURN_SYMBOL(@"desktop", typeType, 0x6465736b);}
+ (AEBSymbol *)desktopObject {AEB_RETURN_SYMBOL(@"desktopObject", typeType, 0x6364736b);}
+ (AEBSymbol *)desktopPicture {AEB_RETURN_SYMBOL(@"desktopPicture", typeType, 0x64706963);}
+ (AEBSymbol *)desktopPosition {AEB_RETURN_SYMBOL(@"desktopPosition", typeType, 0x64706f73);}
+ (AEBSymbol *)desktopShowsConnectedServers {AEB_RETURN_SYMBOL(@"desktopShowsConnectedServers", typeType, 0x70647376);}
+ (AEBSymbol *)desktopShowsExternalHardDisks {AEB_RETURN_SYMBOL(@"desktopShowsExternalHardDisks", typeType, 0x70656864);}
+ (AEBSymbol *)desktopShowsHardDisks {AEB_RETURN_SYMBOL(@"desktopShowsHardDisks", typeType, 0x70646864);}
+ (AEBSymbol *)desktopShowsRemovableMedia {AEB_RETURN_SYMBOL(@"desktopShowsRemovableMedia", typeType, 0x7064726d);}
+ (AEBSymbol *)desktopWindow {AEB_RETURN_SYMBOL(@"desktopWindow", typeType, 0x646b7477);}
+ (AEBSymbol *)disclosesPreviewPane {AEB_RETURN_SYMBOL(@"disclosesPreviewPane", typeType, 0x64737072);}
+ (AEBSymbol *)disk {AEB_RETURN_SYMBOL(@"disk", typeType, 0x63646973);}
+ (AEBSymbol *)displayedName {AEB_RETURN_SYMBOL(@"displayedName", typeType, 0x646e616d);}
+ (AEBSymbol *)documentFile {AEB_RETURN_SYMBOL(@"documentFile", typeType, 0x646f6366);}
+ (AEBSymbol *)doubleInteger {AEB_RETURN_SYMBOL(@"doubleInteger", typeType, 0x636f6d70);}
+ (AEBSymbol *)ejectable {AEB_RETURN_SYMBOL(@"ejectable", typeType, 0x6973656a);}
+ (AEBSymbol *)elementInfo {AEB_RETURN_SYMBOL(@"elementInfo", typeType, 0x656c696e);}
+ (AEBSymbol *)encodedString {AEB_RETURN_SYMBOL(@"encodedString", typeType, 0x656e6373);}
+ (AEBSymbol *)entireContents {AEB_RETURN_SYMBOL(@"entireContents", typeType, 0x65637473);}
+ (AEBSymbol *)enumerator {AEB_RETURN_SYMBOL(@"enumerator", typeType, 0x656e756d);}
+ (AEBSymbol *)eventInfo {AEB_RETURN_SYMBOL(@"eventInfo", typeType, 0x6576696e);}
+ (AEBSymbol *)everyonesPrivileges {AEB_RETURN_SYMBOL(@"everyonesPrivileges", typeType, 0x67737470);}
+ (AEBSymbol *)expandable {AEB_RETURN_SYMBOL(@"expandable", typeType, 0x70657861);}
+ (AEBSymbol *)expanded {AEB_RETURN_SYMBOL(@"expanded", typeType, 0x70657870);}
+ (AEBSymbol *)extendedFloat {AEB_RETURN_SYMBOL(@"extendedFloat", typeType, 0x65787465);}
+ (AEBSymbol *)extensionHidden {AEB_RETURN_SYMBOL(@"extensionHidden", typeType, 0x68696478);}
+ (AEBSymbol *)feet {AEB_RETURN_SYMBOL(@"feet", typeType, 0x66656574);}
+ (AEBSymbol *)file {AEB_RETURN_SYMBOL(@"file", typeType, 0x66696c65);}
+ (AEBSymbol *)fileRef {AEB_RETURN_SYMBOL(@"fileRef", typeType, 0x66737266);}
+ (AEBSymbol *)fileSpecification {AEB_RETURN_SYMBOL(@"fileSpecification", typeType, 0x66737320);}
+ (AEBSymbol *)fileType {AEB_RETURN_SYMBOL(@"fileType", typeType, 0x61737479);}
+ (AEBSymbol *)fileURL {AEB_RETURN_SYMBOL(@"fileURL", typeType, 0x6675726c);}
+ (AEBSymbol *)fixed {AEB_RETURN_SYMBOL(@"fixed", typeType, 0x66697864);}
+ (AEBSymbol *)fixedPoint {AEB_RETURN_SYMBOL(@"fixedPoint", typeType, 0x66706e74);}
+ (AEBSymbol *)fixedRectangle {AEB_RETURN_SYMBOL(@"fixedRectangle", typeType, 0x66726374);}
+ (AEBSymbol *)float128bit {AEB_RETURN_SYMBOL(@"float128bit", typeType, 0x6c64626c);}
+ (AEBSymbol *)float_ {AEB_RETURN_SYMBOL(@"float_", typeType, 0x646f7562);}
+ (AEBSymbol *)floating {AEB_RETURN_SYMBOL(@"floating", typeType, 0x6973666c);}
+ (AEBSymbol *)folder {AEB_RETURN_SYMBOL(@"folder", typeType, 0x63666f6c);}
+ (AEBSymbol *)foldersOpenInNewTabs {AEB_RETURN_SYMBOL(@"foldersOpenInNewTabs", typeType, 0x706f6e74);}
+ (AEBSymbol *)foldersOpenInNewWindows {AEB_RETURN_SYMBOL(@"foldersOpenInNewWindows", typeType, 0x706f6e77);}
+ (AEBSymbol *)foldersSpringOpen {AEB_RETURN_SYMBOL(@"foldersSpringOpen", typeType, 0x73707267);}
+ (AEBSymbol *)format {AEB_RETURN_SYMBOL(@"format", typeType, 0x64666d74);}
+ (AEBSymbol *)freeSpace {AEB_RETURN_SYMBOL(@"freeSpace", typeType, 0x66727370);}
+ (AEBSymbol *)frontmost {AEB_RETURN_SYMBOL(@"frontmost", typeType, 0x70697366);}
+ (AEBSymbol *)gallons {AEB_RETURN_SYMBOL(@"gallons", typeType, 0x67616c6e);}
+ (AEBSymbol *)grams {AEB_RETURN_SYMBOL(@"grams", typeType, 0x6772616d);}
+ (AEBSymbol *)graphicText {AEB_RETURN_SYMBOL(@"graphicText", typeType, 0x63677478);}
+ (AEBSymbol *)group {AEB_RETURN_SYMBOL(@"group", typeType, 0x73677270);}
+ (AEBSymbol *)groupPrivileges {AEB_RETURN_SYMBOL(@"groupPrivileges", typeType, 0x67707072);}
+ (AEBSymbol *)hasScriptingTerminology {AEB_RETURN_SYMBOL(@"hasScriptingTerminology", typeType, 0x68736372);}
+ (AEBSymbol *)home {AEB_RETURN_SYMBOL(@"home", typeType, 0x686f6d65);}
+ (AEBSymbol *)icon {AEB_RETURN_SYMBOL(@"icon", typeType, 0x69696d67);}
+ (AEBSymbol *)iconFamily {AEB_RETURN_SYMBOL(@"iconFamily", typeType, 0x6966616d);}
+ (AEBSymbol *)iconSize {AEB_RETURN_SYMBOL(@"iconSize", typeType, 0x6c766973);}
+ (AEBSymbol *)iconViewOptions {AEB_RETURN_SYMBOL(@"iconViewOptions", typeType, 0x69636f70);}
+ (AEBSymbol *)id_ {AEB_RETURN_SYMBOL(@"id_", typeType, 0x49442020);}
+ (AEBSymbol *)ignorePrivileges {AEB_RETURN_SYMBOL(@"ignorePrivileges", typeType, 0x69677072);}
+ (AEBSymbol *)inches {AEB_RETURN_SYMBOL(@"inches", typeType, 0x696e6368);}
+ (AEBSymbol *)index {AEB_RETURN_SYMBOL(@"index", typeType, 0x70696478);}
+ (AEBSymbol *)informationWindow {AEB_RETURN_SYMBOL(@"informationWindow", typeType, 0x69776e64);}
+ (AEBSymbol *)insertionLocation {AEB_RETURN_SYMBOL(@"insertionLocation", typeType, 0x70696e73);}
+ (AEBSymbol *)integer {AEB_RETURN_SYMBOL(@"integer", typeType, 0x6c6f6e67);}
+ (AEBSymbol *)internationalText {AEB_RETURN_SYMBOL(@"internationalText", typeType, 0x69747874);}
+ (AEBSymbol *)internationalWritingCode {AEB_RETURN_SYMBOL(@"internationalWritingCode", typeType, 0x696e746c);}
+ (AEBSymbol *)internetLocationFile {AEB_RETURN_SYMBOL(@"internetLocationFile", typeType, 0x696e6c66);}
+ (AEBSymbol *)item {AEB_RETURN_SYMBOL(@"item", typeType, 0x636f626a);}
+ (AEBSymbol *)journalingEnabled {AEB_RETURN_SYMBOL(@"journalingEnabled", typeType, 0x4a726e6c);}
+ (AEBSymbol *)kernelProcessID {AEB_RETURN_SYMBOL(@"kernelProcessID", typeType, 0x6b706964);}
+ (AEBSymbol *)kilograms {AEB_RETURN_SYMBOL(@"kilograms", typeType, 0x6b67726d);}
+ (AEBSymbol *)kilometers {AEB_RETURN_SYMBOL(@"kilometers", typeType, 0x6b6d7472);}
+ (AEBSymbol *)label {AEB_RETURN_SYMBOL(@"label", typeType, 0x636c626c);}
+ (AEBSymbol *)labelPosition {AEB_RETURN_SYMBOL(@"labelPosition", typeType, 0x6c706f73);}
+ (AEBSymbol *)large32BitIcon {AEB_RETURN_SYMBOL(@"large32BitIcon", typeType, 0x696c3332);}
+ (AEBSymbol *)large4BitIcon {AEB_RETURN_SYMBOL(@"large4BitIcon", typeType, 0x69636c34);}
+ (AEBSymbol *)large8BitIcon {AEB_RETURN_SYMBOL(@"large8BitIcon", typeType, 0x69636c38);}
+ (AEBSymbol *)large8BitMask {AEB_RETURN_SYMBOL(@"large8BitMask", typeType, 0x6c386d6b);}
+ (AEBSymbol *)largeMonochromeIconAndMask {AEB_RETURN_SYMBOL(@"largeMonochromeIconAndMask", typeType, 0x49434e23);}
+ (AEBSymbol *)list {AEB_RETURN_SYMBOL(@"list", typeType, 0x6c697374);}
+ (AEBSymbol *)listViewOptions {AEB_RETURN_SYMBOL(@"listViewOptions", typeType, 0x6c766f70);}
+ (AEBSymbol *)liters {AEB_RETURN_SYMBOL(@"liters", typeType, 0x6c697472);}
+ (AEBSymbol *)localVolume {AEB_RETURN_SYMBOL(@"localVolume", typeType, 0x69737276);}
+ (AEBSymbol *)location {AEB_RETURN_SYMBOL(@"location", typeType, 0x696c6f63);}
+ (AEBSymbol *)locationReference {AEB_RETURN_SYMBOL(@"locationReference", typeType, 0x696e736c);}
+ (AEBSymbol *)locked {AEB_RETURN_SYMBOL(@"locked", typeType, 0x61736c6b);}
+ (AEBSymbol *)longFixed {AEB_RETURN_SYMBOL(@"longFixed", typeType, 0x6c667864);}
+ (AEBSymbol *)longFixedPoint {AEB_RETURN_SYMBOL(@"longFixedPoint", typeType, 0x6c667074);}
+ (AEBSymbol *)longFixedRectangle {AEB_RETURN_SYMBOL(@"longFixedRectangle", typeType, 0x6c667263);}
+ (AEBSymbol *)longPoint {AEB_RETURN_SYMBOL(@"longPoint", typeType, 0x6c706e74);}
+ (AEBSymbol *)longRectangle {AEB_RETURN_SYMBOL(@"longRectangle", typeType, 0x6c726374);}
+ (AEBSymbol *)machPort {AEB_RETURN_SYMBOL(@"machPort", typeType, 0x706f7274);}
+ (AEBSymbol *)machine {AEB_RETURN_SYMBOL(@"machine", typeType, 0x6d616368);}
+ (AEBSymbol *)machineLocation {AEB_RETURN_SYMBOL(@"machineLocation", typeType, 0x6d4c6f63);}
+ (AEBSymbol *)maximumWidth {AEB_RETURN_SYMBOL(@"maximumWidth", typeType, 0x636c776d);}
+ (AEBSymbol *)meters {AEB_RETURN_SYMBOL(@"meters", typeType, 0x6d657472);}
+ (AEBSymbol *)miles {AEB_RETURN_SYMBOL(@"miles", typeType, 0x6d696c65);}
+ (AEBSymbol *)minimumSize {AEB_RETURN_SYMBOL(@"minimumSize", typeType, 0x6d707274);}
+ (AEBSymbol *)minimumWidth {AEB_RETURN_SYMBOL(@"minimumWidth", typeType, 0x636c776e);}
+ (AEBSymbol *)missingValue {AEB_RETURN_SYMBOL(@"missingValue", typeType, 0x6d736e67);}
+ (AEBSymbol *)modal {AEB_RETURN_SYMBOL(@"modal", typeType, 0x706d6f64);}
+ (AEBSymbol *)nameExtension {AEB_RETURN_SYMBOL(@"nameExtension", typeType, 0x6e6d7874);}
+ (AEBSymbol *)newWindowTarget {AEB_RETURN_SYMBOL(@"newWindowTarget", typeType, 0x706e7774);}
+ (AEBSymbol *)newWindowsOpenInColumnView {AEB_RETURN_SYMBOL(@"newWindowsOpenInColumnView", typeType, 0x706f6376);}
+ (AEBSymbol *)null {AEB_RETURN_SYMBOL(@"null", typeType, 0x6e756c6c);}
+ (AEBSymbol *)opensInClassic {AEB_RETURN_SYMBOL(@"opensInClassic", typeType, 0x436c7363);}
+ (AEBSymbol *)originalItem {AEB_RETURN_SYMBOL(@"originalItem", typeType, 0x6f726967);}
+ (AEBSymbol *)ounces {AEB_RETURN_SYMBOL(@"ounces", typeType, 0x6f7a7320);}
+ (AEBSymbol *)owner {AEB_RETURN_SYMBOL(@"owner", typeType, 0x736f776e);}
+ (AEBSymbol *)ownerPrivileges {AEB_RETURN_SYMBOL(@"ownerPrivileges", typeType, 0x6f776e72);}
+ (AEBSymbol *)package {AEB_RETURN_SYMBOL(@"package", typeType, 0x7061636b);}
+ (AEBSymbol *)parameterInfo {AEB_RETURN_SYMBOL(@"parameterInfo", typeType, 0x706d696e);}
+ (AEBSymbol *)partitionSpaceUsed {AEB_RETURN_SYMBOL(@"partitionSpaceUsed", typeType, 0x70757364);}
+ (AEBSymbol *)physicalSize {AEB_RETURN_SYMBOL(@"physicalSize", typeType, 0x70687973);}
+ (AEBSymbol *)pixelMapRecord {AEB_RETURN_SYMBOL(@"pixelMapRecord", typeType, 0x74706d6d);}
+ (AEBSymbol *)point {AEB_RETURN_SYMBOL(@"point", typeType, 0x51447074);}
+ (AEBSymbol *)position {AEB_RETURN_SYMBOL(@"position", typeType, 0x706f736e);}
+ (AEBSymbol *)pounds {AEB_RETURN_SYMBOL(@"pounds", typeType, 0x6c627320);}
+ (AEBSymbol *)preferences {AEB_RETURN_SYMBOL(@"preferences", typeType, 0x63707266);}
+ (AEBSymbol *)preferencesWindow {AEB_RETURN_SYMBOL(@"preferencesWindow", typeType, 0x70776e64);}
+ (AEBSymbol *)preferredSize {AEB_RETURN_SYMBOL(@"preferredSize", typeType, 0x61707074);}
+ (AEBSymbol *)process {AEB_RETURN_SYMBOL(@"process", typeType, 0x70726373);}
+ (AEBSymbol *)processSerialNumber {AEB_RETURN_SYMBOL(@"processSerialNumber", typeType, 0x70736e20);}
+ (AEBSymbol *)productVersion {AEB_RETURN_SYMBOL(@"productVersion", typeType, 0x76657232);}
+ (AEBSymbol *)properties {AEB_RETURN_SYMBOL(@"properties", typeType, 0x70414c4c);}
+ (AEBSymbol *)property {AEB_RETURN_SYMBOL(@"property", typeType, 0x70726f70);}
+ (AEBSymbol *)propertyInfo {AEB_RETURN_SYMBOL(@"propertyInfo", typeType, 0x70696e66);}
+ (AEBSymbol *)quarts {AEB_RETURN_SYMBOL(@"quarts", typeType, 0x71727473);}
+ (AEBSymbol *)record {AEB_RETURN_SYMBOL(@"record", typeType, 0x7265636f);}
+ (AEBSymbol *)reference {AEB_RETURN_SYMBOL(@"reference", typeType, 0x6f626a20);}
+ (AEBSymbol *)resizable {AEB_RETURN_SYMBOL(@"resizable", typeType, 0x7072737a);}
+ (AEBSymbol *)rotation {AEB_RETURN_SYMBOL(@"rotation", typeType, 0x74726f74);}
+ (AEBSymbol *)script {AEB_RETURN_SYMBOL(@"script", typeType, 0x73637074);}
+ (AEBSymbol *)selection {AEB_RETURN_SYMBOL(@"selection", typeType, 0x73656c65);}
+ (AEBSymbol *)shortFloat {AEB_RETURN_SYMBOL(@"shortFloat", typeType, 0x73696e67);}
+ (AEBSymbol *)shortInteger {AEB_RETURN_SYMBOL(@"shortInteger", typeType, 0x73686f72);}
+ (AEBSymbol *)showsIcon {AEB_RETURN_SYMBOL(@"showsIcon", typeType, 0x73686963);}
+ (AEBSymbol *)showsIconPreview {AEB_RETURN_SYMBOL(@"showsIconPreview", typeType, 0x70727677);}
+ (AEBSymbol *)showsItemInfo {AEB_RETURN_SYMBOL(@"showsItemInfo", typeType, 0x6d6e666f);}
+ (AEBSymbol *)showsPreviewColumn {AEB_RETURN_SYMBOL(@"showsPreviewColumn", typeType, 0x73687072);}
+ (AEBSymbol *)sidebarWidth {AEB_RETURN_SYMBOL(@"sidebarWidth", typeType, 0x73627769);}
+ (AEBSymbol *)small32BitIcon {AEB_RETURN_SYMBOL(@"small32BitIcon", typeType, 0x69733332);}
+ (AEBSymbol *)small4BitIcon {AEB_RETURN_SYMBOL(@"small4BitIcon", typeType, 0x69637334);}
+ (AEBSymbol *)small8BitIcon {AEB_RETURN_SYMBOL(@"small8BitIcon", typeType, 0x69637338);}
+ (AEBSymbol *)small8BitMask {AEB_RETURN_SYMBOL(@"small8BitMask", typeType, 0x69637338);}
+ (AEBSymbol *)smallMonochromeIconAndMask {AEB_RETURN_SYMBOL(@"smallMonochromeIconAndMask", typeType, 0x69637323);}
+ (AEBSymbol *)sortColumn {AEB_RETURN_SYMBOL(@"sortColumn", typeType, 0x73727463);}
+ (AEBSymbol *)sortDirection {AEB_RETURN_SYMBOL(@"sortDirection", typeType, 0x736f7264);}
+ (AEBSymbol *)squareFeet {AEB_RETURN_SYMBOL(@"squareFeet", typeType, 0x73716674);}
+ (AEBSymbol *)squareKilometers {AEB_RETURN_SYMBOL(@"squareKilometers", typeType, 0x73716b6d);}
+ (AEBSymbol *)squareMeters {AEB_RETURN_SYMBOL(@"squareMeters", typeType, 0x7371726d);}
+ (AEBSymbol *)squareMiles {AEB_RETURN_SYMBOL(@"squareMiles", typeType, 0x73716d69);}
+ (AEBSymbol *)squareYards {AEB_RETURN_SYMBOL(@"squareYards", typeType, 0x73717964);}
+ (AEBSymbol *)startup {AEB_RETURN_SYMBOL(@"startup", typeType, 0x69737464);}
+ (AEBSymbol *)startupDisk {AEB_RETURN_SYMBOL(@"startupDisk", typeType, 0x7364736b);}
+ (AEBSymbol *)stationery {AEB_RETURN_SYMBOL(@"stationery", typeType, 0x70737064);}
+ (AEBSymbol *)statusbarVisible {AEB_RETURN_SYMBOL(@"statusbarVisible", typeType, 0x73747669);}
+ (AEBSymbol *)string {AEB_RETURN_SYMBOL(@"string", typeType, 0x54455854);}
+ (AEBSymbol *)styledClipboardText {AEB_RETURN_SYMBOL(@"styledClipboardText", typeType, 0x7374796c);}
+ (AEBSymbol *)styledText {AEB_RETURN_SYMBOL(@"styledText", typeType, 0x53545854);}
+ (AEBSymbol *)styledUnicodeText {AEB_RETURN_SYMBOL(@"styledUnicodeText", typeType, 0x73757478);}
+ (AEBSymbol *)suggestedSize {AEB_RETURN_SYMBOL(@"suggestedSize", typeType, 0x73707274);}
+ (AEBSymbol *)suiteInfo {AEB_RETURN_SYMBOL(@"suiteInfo", typeType, 0x7375696e);}
+ (AEBSymbol *)target {AEB_RETURN_SYMBOL(@"target", typeType, 0x66767467);}
+ (AEBSymbol *)textSize {AEB_RETURN_SYMBOL(@"textSize", typeType, 0x6673697a);}
+ (AEBSymbol *)textStyleInfo {AEB_RETURN_SYMBOL(@"textStyleInfo", typeType, 0x74737479);}
+ (AEBSymbol *)titled {AEB_RETURN_SYMBOL(@"titled", typeType, 0x70746974);}
+ (AEBSymbol *)toolbarVisible {AEB_RETURN_SYMBOL(@"toolbarVisible", typeType, 0x74627669);}
+ (AEBSymbol *)totalPartitionSize {AEB_RETURN_SYMBOL(@"totalPartitionSize", typeType, 0x61707074);}
+ (AEBSymbol *)trash {AEB_RETURN_SYMBOL(@"trash", typeType, 0x74727368);}
+ (AEBSymbol *)trashObject {AEB_RETURN_SYMBOL(@"trashObject", typeType, 0x63747273);}
+ (AEBSymbol *)typeClass {AEB_RETURN_SYMBOL(@"typeClass", typeType, 0x74797065);}
+ (AEBSymbol *)unsignedInteger {AEB_RETURN_SYMBOL(@"unsignedInteger", typeType, 0x6d61676e);}
+ (AEBSymbol *)usesRelativeDates {AEB_RETURN_SYMBOL(@"usesRelativeDates", typeType, 0x75726474);}
+ (AEBSymbol *)visible {AEB_RETURN_SYMBOL(@"visible", typeType, 0x70766973);}
+ (AEBSymbol *)warnsBeforeEmptying {AEB_RETURN_SYMBOL(@"warnsBeforeEmptying", typeType, 0x7761726e);}
+ (AEBSymbol *)width {AEB_RETURN_SYMBOL(@"width", typeType, 0x636c7764);}
+ (AEBSymbol *)window {AEB_RETURN_SYMBOL(@"window", typeType, 0x6377696e);}
+ (AEBSymbol *)writingCode {AEB_RETURN_SYMBOL(@"writingCode", typeType, 0x70736374);}
+ (AEBSymbol *)yards {AEB_RETURN_SYMBOL(@"yards", typeType, 0x79617264);}
+ (AEBSymbol *)zoomable {AEB_RETURN_SYMBOL(@"zoomable", typeType, 0x69737a6d);}
+ (AEBSymbol *)zoomed {AEB_RETURN_SYMBOL(@"zoomed", typeType, 0x707a756d);}
// Enumerators
+ (AEBSymbol *)AdvancedPreferencesPanel {AEB_RETURN_SYMBOL(@"AdvancedPreferencesPanel", typeEnumerated, 0x70616476);}
+ (AEBSymbol *)ApplePhotoFormat {AEB_RETURN_SYMBOL(@"ApplePhotoFormat", typeEnumerated, 0x64667068);}
+ (AEBSymbol *)AppleShareFormat {AEB_RETURN_SYMBOL(@"AppleShareFormat", typeEnumerated, 0x64666173);}
+ (AEBSymbol *)ApplicationPanel {AEB_RETURN_SYMBOL(@"ApplicationPanel", typeEnumerated, 0x61706e6c);}
+ (AEBSymbol *)BurningPanel {AEB_RETURN_SYMBOL(@"BurningPanel", typeEnumerated, 0x62706e6c);}
+ (AEBSymbol *)CommentsPanel {AEB_RETURN_SYMBOL(@"CommentsPanel", typeEnumerated, 0x63706e6c);}
+ (AEBSymbol *)ContentIndexPanel {AEB_RETURN_SYMBOL(@"ContentIndexPanel", typeEnumerated, 0x63696e6c);}
+ (AEBSymbol *)FTPFormat {AEB_RETURN_SYMBOL(@"FTPFormat", typeEnumerated, 0x64666674);}
+ (AEBSymbol *)GeneralInformationPanel {AEB_RETURN_SYMBOL(@"GeneralInformationPanel", typeEnumerated, 0x67706e6c);}
+ (AEBSymbol *)GeneralPreferencesPanel {AEB_RETURN_SYMBOL(@"GeneralPreferencesPanel", typeEnumerated, 0x70676e70);}
+ (AEBSymbol *)HighSierraFormat {AEB_RETURN_SYMBOL(@"HighSierraFormat", typeEnumerated, 0x64666873);}
+ (AEBSymbol *)ISO9660Format {AEB_RETURN_SYMBOL(@"ISO9660Format", typeEnumerated, 0x64663936);}
+ (AEBSymbol *)LabelPreferencesPanel {AEB_RETURN_SYMBOL(@"LabelPreferencesPanel", typeEnumerated, 0x706c6270);}
+ (AEBSymbol *)LanguagesPanel {AEB_RETURN_SYMBOL(@"LanguagesPanel", typeEnumerated, 0x706b6c67);}
+ (AEBSymbol *)MSDOSFormat {AEB_RETURN_SYMBOL(@"MSDOSFormat", typeEnumerated, 0x64666d73);}
+ (AEBSymbol *)MacOSExtendedFormat {AEB_RETURN_SYMBOL(@"MacOSExtendedFormat", typeEnumerated, 0x6466682b);}
+ (AEBSymbol *)MacOSFormat {AEB_RETURN_SYMBOL(@"MacOSFormat", typeEnumerated, 0x64666866);}
+ (AEBSymbol *)MemoryPanel {AEB_RETURN_SYMBOL(@"MemoryPanel", typeEnumerated, 0x6d706e6c);}
+ (AEBSymbol *)MoreInfoPanel {AEB_RETURN_SYMBOL(@"MoreInfoPanel", typeEnumerated, 0x6d696e6c);}
+ (AEBSymbol *)NFSFormat {AEB_RETURN_SYMBOL(@"NFSFormat", typeEnumerated, 0x64666e66);}
+ (AEBSymbol *)NTFSFormat {AEB_RETURN_SYMBOL(@"NTFSFormat", typeEnumerated, 0x64666e74);}
+ (AEBSymbol *)NameAndExtensionPanel {AEB_RETURN_SYMBOL(@"NameAndExtensionPanel", typeEnumerated, 0x6e706e6c);}
+ (AEBSymbol *)PacketWrittenUDFFormat {AEB_RETURN_SYMBOL(@"PacketWrittenUDFFormat", typeEnumerated, 0x64667075);}
+ (AEBSymbol *)PluginsPanel {AEB_RETURN_SYMBOL(@"PluginsPanel", typeEnumerated, 0x706b7067);}
+ (AEBSymbol *)PreviewPanel {AEB_RETURN_SYMBOL(@"PreviewPanel", typeEnumerated, 0x76706e6c);}
+ (AEBSymbol *)ProDOSFormat {AEB_RETURN_SYMBOL(@"ProDOSFormat", typeEnumerated, 0x64667072);}
+ (AEBSymbol *)QuickTakeFormat {AEB_RETURN_SYMBOL(@"QuickTakeFormat", typeEnumerated, 0x64667174);}
+ (AEBSymbol *)SharingPanel {AEB_RETURN_SYMBOL(@"SharingPanel", typeEnumerated, 0x73706e6c);}
+ (AEBSymbol *)SidebarPreferencesPanel {AEB_RETURN_SYMBOL(@"SidebarPreferencesPanel", typeEnumerated, 0x70736964);}
+ (AEBSymbol *)SimpleHeaderPanel {AEB_RETURN_SYMBOL(@"SimpleHeaderPanel", typeEnumerated, 0x73686e6c);}
+ (AEBSymbol *)UDFFormat {AEB_RETURN_SYMBOL(@"UDFFormat", typeEnumerated, 0x64667564);}
+ (AEBSymbol *)UFSFormat {AEB_RETURN_SYMBOL(@"UFSFormat", typeEnumerated, 0x64667566);}
+ (AEBSymbol *)WebDAVFormat {AEB_RETURN_SYMBOL(@"WebDAVFormat", typeEnumerated, 0x64667764);}
+ (AEBSymbol *)XsanFormat {AEB_RETURN_SYMBOL(@"XsanFormat", typeEnumerated, 0x64666163);}
+ (AEBSymbol *)applicationResponses {AEB_RETURN_SYMBOL(@"applicationResponses", typeEnumerated, 0x726d7465);}
+ (AEBSymbol *)arrangedByCreationDate {AEB_RETURN_SYMBOL(@"arrangedByCreationDate", typeEnumerated, 0x63647461);}
+ (AEBSymbol *)arrangedByKind {AEB_RETURN_SYMBOL(@"arrangedByKind", typeEnumerated, 0x6b696e61);}
+ (AEBSymbol *)arrangedByLabel {AEB_RETURN_SYMBOL(@"arrangedByLabel", typeEnumerated, 0x6c616261);}
+ (AEBSymbol *)arrangedByModificationDate {AEB_RETURN_SYMBOL(@"arrangedByModificationDate", typeEnumerated, 0x6d647461);}
+ (AEBSymbol *)arrangedByName {AEB_RETURN_SYMBOL(@"arrangedByName", typeEnumerated, 0x6e616d61);}
+ (AEBSymbol *)arrangedBySize {AEB_RETURN_SYMBOL(@"arrangedBySize", typeEnumerated, 0x73697a61);}
+ (AEBSymbol *)ask {AEB_RETURN_SYMBOL(@"ask", typeEnumerated, 0x61736b20);}
+ (AEBSymbol *)audioFormat {AEB_RETURN_SYMBOL(@"audioFormat", typeEnumerated, 0x64666175);}
+ (AEBSymbol *)bottom {AEB_RETURN_SYMBOL(@"bottom", typeEnumerated, 0x6c626f74);}
+ (AEBSymbol *)case_ {AEB_RETURN_SYMBOL(@"case_", typeEnumerated, 0x63617365);}
+ (AEBSymbol *)columnView {AEB_RETURN_SYMBOL(@"columnView", typeEnumerated, 0x636c7677);}
+ (AEBSymbol *)comment {AEB_RETURN_SYMBOL(@"comment", typeEnumerated, 0x636f6d74);}
+ (AEBSymbol *)commentColumn {AEB_RETURN_SYMBOL(@"commentColumn", typeEnumerated, 0x656c7343);}
+ (AEBSymbol *)creationDate {AEB_RETURN_SYMBOL(@"creationDate", typeEnumerated, 0x61736364);}
+ (AEBSymbol *)creationDateColumn {AEB_RETURN_SYMBOL(@"creationDateColumn", typeEnumerated, 0x656c7363);}
+ (AEBSymbol *)diacriticals {AEB_RETURN_SYMBOL(@"diacriticals", typeEnumerated, 0x64696163);}
+ (AEBSymbol *)expansion {AEB_RETURN_SYMBOL(@"expansion", typeEnumerated, 0x65787061);}
+ (AEBSymbol *)flowView {AEB_RETURN_SYMBOL(@"flowView", typeEnumerated, 0x666c7677);}
+ (AEBSymbol *)groupView {AEB_RETURN_SYMBOL(@"groupView", typeEnumerated, 0x67727677);}
+ (AEBSymbol *)hyphens {AEB_RETURN_SYMBOL(@"hyphens", typeEnumerated, 0x68797068);}
+ (AEBSymbol *)iconView {AEB_RETURN_SYMBOL(@"iconView", typeEnumerated, 0x69636e76);}
+ (AEBSymbol *)kind {AEB_RETURN_SYMBOL(@"kind", typeEnumerated, 0x6b696e64);}
+ (AEBSymbol *)kindColumn {AEB_RETURN_SYMBOL(@"kindColumn", typeEnumerated, 0x656c736b);}
+ (AEBSymbol *)labelColumn {AEB_RETURN_SYMBOL(@"labelColumn", typeEnumerated, 0x656c736c);}
+ (AEBSymbol *)labelIndex {AEB_RETURN_SYMBOL(@"labelIndex", typeEnumerated, 0x6c616269);}
+ (AEBSymbol *)large {AEB_RETURN_SYMBOL(@"large", typeEnumerated, 0x6c676963);}
+ (AEBSymbol *)largeIcon {AEB_RETURN_SYMBOL(@"largeIcon", typeEnumerated, 0x6c676963);}
+ (AEBSymbol *)listView {AEB_RETURN_SYMBOL(@"listView", typeEnumerated, 0x6c737677);}
+ (AEBSymbol *)mini {AEB_RETURN_SYMBOL(@"mini", typeEnumerated, 0x6d696963);}
+ (AEBSymbol *)modificationDate {AEB_RETURN_SYMBOL(@"modificationDate", typeEnumerated, 0x61736d6f);}
+ (AEBSymbol *)modificationDateColumn {AEB_RETURN_SYMBOL(@"modificationDateColumn", typeEnumerated, 0x656c736d);}
+ (AEBSymbol *)name {AEB_RETURN_SYMBOL(@"name", typeEnumerated, 0x706e616d);}
+ (AEBSymbol *)nameColumn {AEB_RETURN_SYMBOL(@"nameColumn", typeEnumerated, 0x656c736e);}
+ (AEBSymbol *)no {AEB_RETURN_SYMBOL(@"no", typeEnumerated, 0x6e6f2020);}
+ (AEBSymbol *)none {AEB_RETURN_SYMBOL(@"none", typeEnumerated, 0x6e6f6e65);}
+ (AEBSymbol *)normal {AEB_RETURN_SYMBOL(@"normal", typeEnumerated, 0x736e726d);}
+ (AEBSymbol *)notArranged {AEB_RETURN_SYMBOL(@"notArranged", typeEnumerated, 0x6e617272);}
+ (AEBSymbol *)numericStrings {AEB_RETURN_SYMBOL(@"numericStrings", typeEnumerated, 0x6e756d65);}
+ (AEBSymbol *)punctuation {AEB_RETURN_SYMBOL(@"punctuation", typeEnumerated, 0x70756e63);}
+ (AEBSymbol *)readOnly {AEB_RETURN_SYMBOL(@"readOnly", typeEnumerated, 0x72656164);}
+ (AEBSymbol *)readWrite {AEB_RETURN_SYMBOL(@"readWrite", typeEnumerated, 0x72647772);}
+ (AEBSymbol *)reversed {AEB_RETURN_SYMBOL(@"reversed", typeEnumerated, 0x73727673);}
+ (AEBSymbol *)right {AEB_RETURN_SYMBOL(@"right", typeEnumerated, 0x6c726774);}
+ (AEBSymbol *)size {AEB_RETURN_SYMBOL(@"size", typeEnumerated, 0x70687973);}
+ (AEBSymbol *)sizeColumn {AEB_RETURN_SYMBOL(@"sizeColumn", typeEnumerated, 0x656c7373);}
+ (AEBSymbol *)small {AEB_RETURN_SYMBOL(@"small", typeEnumerated, 0x736d6963);}
+ (AEBSymbol *)smallIcon {AEB_RETURN_SYMBOL(@"smallIcon", typeEnumerated, 0x736d6963);}
+ (AEBSymbol *)snapToGrid {AEB_RETURN_SYMBOL(@"snapToGrid", typeEnumerated, 0x67726461);}
+ (AEBSymbol *)unknownFormat {AEB_RETURN_SYMBOL(@"unknownFormat", typeEnumerated, 0x64663f3f);}
+ (AEBSymbol *)versionColumn {AEB_RETURN_SYMBOL(@"versionColumn", typeEnumerated, 0x656c7376);}
+ (AEBSymbol *)version_ {AEB_RETURN_SYMBOL(@"version_", typeEnumerated, 0x76657273);}
+ (AEBSymbol *)whitespace {AEB_RETURN_SYMBOL(@"whitespace", typeEnumerated, 0x77686974);}
+ (AEBSymbol *)writeOnly {AEB_RETURN_SYMBOL(@"writeOnly", typeEnumerated, 0x77726974);}
+ (AEBSymbol *)yes {AEB_RETURN_SYMBOL(@"yes", typeEnumerated, 0x79657320);}
@end




@implementation FINActivateCommand
- (NSString *)aebCommandName {
    return @"activate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINCleanUpCommand
- (instancetype)by:(id)value {
    [self setParameter: value forKeyword: 0x62792020];
    return self;
}
- (NSString *)aebCommandName {
    return @"cleanUp";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x62792020: return @"by";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINCloseCommand
- (NSString *)aebCommandName {
    return @"close";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINCopy_Command
- (NSString *)aebCommandName {
    return @"copy_";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINCountCommand
- (instancetype)each:(id)value {
    [self setParameter: value forKeyword: 0x6b6f636c];
    return self;
}
- (NSString *)aebCommandName {
    return @"count";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x6b6f636c: return @"each";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINDataSizeCommand
- (instancetype)as:(id)value {
    [self setParameter: value forKeyword: 0x72747970];
    return self;
}
- (NSString *)aebCommandName {
    return @"dataSize";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x72747970: return @"as";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINDeleteCommand
- (NSString *)aebCommandName {
    return @"delete";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINDuplicateCommand
- (instancetype)replacing:(id)value {
    [self setParameter: value forKeyword: 0x616c7270];
    return self;
}
- (instancetype)exactCopy:(id)value {
    [self setParameter: value forKeyword: 0x65786374];
    return self;
}
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (instancetype)routingSuppressed:(id)value {
    [self setParameter: value forKeyword: 0x726f7574];
    return self;
}
- (NSString *)aebCommandName {
    return @"duplicate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x616c7270: return @"replacing";
        case 0x65786374: return @"exactCopy";
        case 0x696e7368: return @"to";
        case 0x726f7574: return @"routingSuppressed";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINEjectCommand
- (NSString *)aebCommandName {
    return @"eject";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINEmptyCommand
- (instancetype)security:(id)value {
    [self setParameter: value forKeyword: 0x7365633f];
    return self;
}
- (NSString *)aebCommandName {
    return @"empty";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x7365633f: return @"security";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINEraseCommand
- (NSString *)aebCommandName {
    return @"erase";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINExistsCommand
- (NSString *)aebCommandName {
    return @"exists";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINGetCommand
- (NSString *)aebCommandName {
    return @"get";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINLaunchCommand
- (NSString *)aebCommandName {
    return @"launch";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINMakeCommand
- (instancetype)at:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (instancetype)new_:(id)value {
    [self setParameter: value forKeyword: 0x6b6f636c];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x746f2020];
    return self;
}
- (NSString *)aebCommandName {
    return @"make";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"at";
        case 0x6b6f636c: return @"new_";
        case 0x70726474: return @"withProperties";
        case 0x746f2020: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINMoveCommand
- (instancetype)replacing:(id)value {
    [self setParameter: value forKeyword: 0x616c7270];
    return self;
}
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (instancetype)positionedAt:(id)value {
    [self setParameter: value forKeyword: 0x6d76706c];
    return self;
}
- (instancetype)routingSuppressed:(id)value {
    [self setParameter: value forKeyword: 0x726f7574];
    return self;
}
- (NSString *)aebCommandName {
    return @"move";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x616c7270: return @"replacing";
        case 0x696e7368: return @"to";
        case 0x6d76706c: return @"positionedAt";
        case 0x726f7574: return @"routingSuppressed";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINOpenCommand
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (instancetype)using:(id)value {
    [self setParameter: value forKeyword: 0x7573696e];
    return self;
}
- (NSString *)aebCommandName {
    return @"open";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x70726474: return @"withProperties";
        case 0x7573696e: return @"using";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINOpenLocationCommand
- (instancetype)window:(id)value {
    [self setParameter: value forKeyword: 0x57494e44];
    return self;
}
- (NSString *)aebCommandName {
    return @"openLocation";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x57494e44: return @"window";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINPrintCommand
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (NSString *)aebCommandName {
    return @"print";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINQuitCommand
- (NSString *)aebCommandName {
    return @"quit";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINReopenCommand
- (NSString *)aebCommandName {
    return @"reopen";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINRestartCommand
- (NSString *)aebCommandName {
    return @"restart";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINRevealCommand
- (NSString *)aebCommandName {
    return @"reveal";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINRunCommand
- (NSString *)aebCommandName {
    return @"run";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINSelectCommand
- (NSString *)aebCommandName {
    return @"select";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINSetCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x64617461];
    return self;
}
- (NSString *)aebCommandName {
    return @"set";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x64617461: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINShutDownCommand
- (NSString *)aebCommandName {
    return @"shutDown";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINSleepCommand
- (NSString *)aebCommandName {
    return @"sleep";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINSortCommand
- (instancetype)by:(id)value {
    [self setParameter: value forKeyword: 0x62792020];
    return self;
}
- (NSString *)aebCommandName {
    return @"sort";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x62792020: return @"by";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation FINUpdateCommand
- (instancetype)necessity:(id)value {
    [self setParameter: value forKeyword: 0x6e65633f];
    return self;
}
- (instancetype)registeringApplications:(id)value {
    [self setParameter: value forKeyword: 0x7265673f];
    return self;
}
- (NSString *)aebCommandName {
    return @"update";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x6e65633f: return @"necessity";
        case 0x7265673f: return @"registeringApplications";
    }
    return [super aebParameterNameForCode: code];
}
@end




@implementation FINSpecifier
- (NSString *)description {
    return [FINFormatter formatObject: self.aemQuery appData: self.aebAppData];
}
// Properties
- (instancetype)FinderPreferences {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70667270]];
}
- (instancetype)URL {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7055524c]];
}
- (instancetype)acceptsHighLevelEvents {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69736162]];
}
- (instancetype)acceptsRemoteEvents {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x72657674]];
}
- (instancetype)allNameExtensionsShowing {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70736e78]];
}
- (instancetype)applicationFile {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61707066]];
}
- (instancetype)arrangement {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69617272]];
}
- (instancetype)backgroundColor {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636f6c72]];
}
- (instancetype)backgroundPicture {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69626b67]];
}
- (instancetype)bounds {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70626e64]];
}
- (instancetype)calculatesFolderSizes {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7366737a]];
}
- (instancetype)capacity {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63617061]];
}
- (instancetype)class_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70636c73]];
}
- (instancetype)clipboard {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70636c69]];
}
- (instancetype)clippingWindow {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776e64]];
}
- (instancetype)closeable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x68636c62]];
}
- (instancetype)collapsed {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x77736864]];
}
- (instancetype)color {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636f6c72]];
}
- (instancetype)columnViewOptions {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63766f70]];
}
- (instancetype)comment {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636f6d74]];
}
- (instancetype)completelyExpanded {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70657863]];
}
- (instancetype)computerContainer {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70636d70]];
}
- (instancetype)container {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63746e72]];
}
- (instancetype)containerWindow {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63776e64]];
}
- (instancetype)creationDate {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61736364]];
}
- (instancetype)creatorType {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x66637274]];
}
- (instancetype)currentPanel {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70616e6c]];
}
- (instancetype)currentView {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70766577]];
}
- (instancetype)delayBeforeSpringing {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64656c61]];
}
- (instancetype)description_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64736372]];
}
- (instancetype)deskAccessoryFile {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64616669]];
}
- (instancetype)desktop {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6465736b]];
}
- (instancetype)desktopPicture {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64706963]];
}
- (instancetype)desktopPosition {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64706f73]];
}
- (instancetype)desktopShowsConnectedServers {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70647376]];
}
- (instancetype)desktopShowsExternalHardDisks {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70656864]];
}
- (instancetype)desktopShowsHardDisks {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70646864]];
}
- (instancetype)desktopShowsRemovableMedia {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7064726d]];
}
- (instancetype)disclosesPreviewPane {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64737072]];
}
- (instancetype)disk {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63646973]];
}
- (instancetype)displayedName {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x646e616d]];
}
- (instancetype)ejectable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6973656a]];
}
- (instancetype)entireContents {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x65637473]];
}
- (instancetype)everyonesPrivileges {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x67737470]];
}
- (instancetype)expandable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70657861]];
}
- (instancetype)expanded {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70657870]];
}
- (instancetype)extensionHidden {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x68696478]];
}
- (instancetype)file {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x66696c65]];
}
- (instancetype)fileType {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61737479]];
}
- (instancetype)floating {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6973666c]];
}
- (instancetype)foldersOpenInNewTabs {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706f6e74]];
}
- (instancetype)foldersOpenInNewWindows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706f6e77]];
}
- (instancetype)foldersSpringOpen {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73707267]];
}
- (instancetype)format {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x64666d74]];
}
- (instancetype)freeSpace {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x66727370]];
}
- (instancetype)frontmost {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70697366]];
}
- (instancetype)group {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73677270]];
}
- (instancetype)groupPrivileges {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x67707072]];
}
- (instancetype)hasScriptingTerminology {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x68736372]];
}
- (instancetype)home {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x686f6d65]];
}
- (instancetype)icon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69696d67]];
}
- (instancetype)iconSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c766973]];
}
- (instancetype)iconViewOptions {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69636f70]];
}
- (instancetype)id_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x49442020]];
}
- (instancetype)ignorePrivileges {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69677072]];
}
- (instancetype)index {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70696478]];
}
- (instancetype)informationWindow {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69776e64]];
}
- (instancetype)insertionLocation {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70696e73]];
}
- (instancetype)item {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636f626a]];
}
- (instancetype)journalingEnabled {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x4a726e6c]];
}
- (instancetype)kind {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6b696e64]];
}
- (instancetype)labelIndex {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c616269]];
}
- (instancetype)labelPosition {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c706f73]];
}
- (instancetype)large32BitIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x696c3332]];
}
- (instancetype)large4BitIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69636c34]];
}
- (instancetype)large8BitIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69636c38]];
}
- (instancetype)large8BitMask {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c386d6b]];
}
- (instancetype)largeMonochromeIconAndMask {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x49434e23]];
}
- (instancetype)listViewOptions {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c766f70]];
}
- (instancetype)localVolume {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69737276]];
}
- (instancetype)location {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x696c6f63]];
}
- (instancetype)locked {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61736c6b]];
}
- (instancetype)maximumWidth {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636c776d]];
}
- (instancetype)minimumSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6d707274]];
}
- (instancetype)minimumWidth {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636c776e]];
}
- (instancetype)modal {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706d6f64]];
}
- (instancetype)modificationDate {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61736d6f]];
}
- (instancetype)name {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706e616d]];
}
- (instancetype)nameExtension {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6e6d7874]];
}
- (instancetype)newWindowTarget {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706e7774]];
}
- (instancetype)newWindowsOpenInColumnView {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706f6376]];
}
- (instancetype)opensInClassic {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x436c7363]];
}
- (instancetype)originalItem {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6f726967]];
}
- (instancetype)owner {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x736f776e]];
}
- (instancetype)ownerPrivileges {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6f776e72]];
}
- (instancetype)partitionSpaceUsed {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70757364]];
}
- (instancetype)physicalSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70687973]];
}
- (instancetype)position {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706f736e]];
}
- (instancetype)preferredSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61707074]];
}
- (instancetype)productVersion {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x76657232]];
}
- (instancetype)properties {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70414c4c]];
}
- (instancetype)resizable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7072737a]];
}
- (instancetype)selection {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73656c65]];
}
- (instancetype)showsIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73686963]];
}
- (instancetype)showsIconPreview {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70727677]];
}
- (instancetype)showsItemInfo {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6d6e666f]];
}
- (instancetype)showsPreviewColumn {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73687072]];
}
- (instancetype)sidebarWidth {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73627769]];
}
- (instancetype)size {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7074737a]];
}
- (instancetype)small32BitIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69733332]];
}
- (instancetype)small4BitIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69637334]];
}
- (instancetype)small8BitIcon {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69637338]];
}
- (instancetype)small8BitMask {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69637338]];
}
- (instancetype)smallMonochromeIconAndMask {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69637323]];
}
- (instancetype)sortColumn {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73727463]];
}
- (instancetype)sortDirection {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x736f7264]];
}
- (instancetype)startup {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69737464]];
}
- (instancetype)startupDisk {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7364736b]];
}
- (instancetype)stationery {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70737064]];
}
- (instancetype)statusbarVisible {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73747669]];
}
- (instancetype)suggestedSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73707274]];
}
- (instancetype)target {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x66767467]];
}
- (instancetype)textSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6673697a]];
}
- (instancetype)titled {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70746974]];
}
- (instancetype)toolbarVisible {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x74627669]];
}
- (instancetype)totalPartitionSize {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61707074]];
}
- (instancetype)trash {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x74727368]];
}
- (instancetype)usesRelativeDates {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x75726474]];
}
- (instancetype)version_ {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x76657273]];
}
- (instancetype)visible {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70766973]];
}
- (instancetype)warnsBeforeEmptying {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7761726e]];
}
- (instancetype)width {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x636c7764]];
}
- (instancetype)window {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6377696e]];
}
- (instancetype)zoomable {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69737a6d]];
}
- (instancetype)zoomed {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x707a756d]];
}
// Elements
- (instancetype)FinderWindows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x62726f77]];
}
- (instancetype)aliasFiles {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x616c6961]];
}
- (instancetype)aliasLists {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x616c7374]];
}
- (instancetype)applicationFiles {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x61707066]];
}
- (instancetype)applicationProcesses {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70636170]];
}
- (instancetype)applications {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63617070]];
}
- (instancetype)clippingWindows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6c776e64]];
}
- (instancetype)clippings {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636c7066]];
}
- (instancetype)columnViewOptionss {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63766f70]];
}
- (instancetype)columns {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6c76636c]];
}
- (instancetype)computerObjects {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63636d70]];
}
- (instancetype)containers {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63746e72]];
}
- (instancetype)deskAccessoryProcesses {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70636461]];
}
- (instancetype)desktopObjects {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6364736b]];
}
- (instancetype)desktopWindows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x646b7477]];
}
- (instancetype)disks {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63646973]];
}
- (instancetype)documentFiles {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x646f6366]];
}
- (instancetype)files {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x66696c65]];
}
- (instancetype)folders {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63666f6c]];
}
- (instancetype)iconFamilys {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6966616d]];
}
- (instancetype)iconViewOptionss {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x69636f70]];
}
- (instancetype)informationWindows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x69776e64]];
}
- (instancetype)internetLocationFiles {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x696e6c66]];
}
- (instancetype)items {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636f626a]];
}
- (instancetype)labels {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636c626c]];
}
- (instancetype)listViewOptionss {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6c766f70]];
}
- (instancetype)packages {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x7061636b]];
}
- (instancetype)preferencesWindows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70776e64]];
}
- (instancetype)preferencess {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63707266]];
}
- (instancetype)processes {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70726373]];
}
- (instancetype)trashObjects {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63747273]];
}
- (instancetype)windows {
    return [[self.class alloc] initWithAppData: self.aebAppData
                                      aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6377696e]];
}
// Commands
- (FINActivateCommand *)activate {
    return [FINActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINActivateCommand *)activate:(id)directParameter {
    return [FINActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINCleanUpCommand *)cleanUp {
    return [FINCleanUpCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x66636c75
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINCleanUpCommand *)cleanUp:(id)directParameter {
    return [FINCleanUpCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x66636c75
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINCloseCommand *)close {
    return [FINCloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINCloseCommand *)close:(id)directParameter {
    return [FINCloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINCopy_Command *)copy_ {
    return [FINCopy_Command commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x636f7079
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINCopy_Command *)copy_:(id)directParameter {
    return [FINCopy_Command commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x636f7079
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINCountCommand *)count {
    return [FINCountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINCountCommand *)count:(id)directParameter {
    return [FINCountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINDataSizeCommand *)dataSize {
    return [FINDataSizeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6473697a
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINDataSizeCommand *)dataSize:(id)directParameter {
    return [FINDataSizeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6473697a
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINDeleteCommand *)delete {
    return [FINDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINDeleteCommand *)delete:(id)directParameter {
    return [FINDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINDuplicateCommand *)duplicate {
    return [FINDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINDuplicateCommand *)duplicate:(id)directParameter {
    return [FINDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINEjectCommand *)eject {
    return [FINEjectCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x656a6374
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINEjectCommand *)eject:(id)directParameter {
    return [FINEjectCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x656a6374
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINEmptyCommand *)empty {
    return [FINEmptyCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x656d7074
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINEmptyCommand *)empty:(id)directParameter {
    return [FINEmptyCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x656d7074
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINEraseCommand *)erase {
    return [FINEraseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x66657261
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINEraseCommand *)erase:(id)directParameter {
    return [FINEraseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x66657261
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINExistsCommand *)exists {
    return [FINExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINExistsCommand *)exists:(id)directParameter {
    return [FINExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINGetCommand *)get {
    return [FINGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINGetCommand *)get:(id)directParameter {
    return [FINGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINLaunchCommand *)launch {
    return [FINLaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINLaunchCommand *)launch:(id)directParameter {
    return [FINLaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINMakeCommand *)make {
    return [FINMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINMakeCommand *)make:(id)directParameter {
    return [FINMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINMoveCommand *)move {
    return [FINMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINMoveCommand *)move:(id)directParameter {
    return [FINMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINOpenCommand *)open {
    return [FINOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINOpenCommand *)open:(id)directParameter {
    return [FINOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINOpenLocationCommand *)openLocation {
    return [FINOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINOpenLocationCommand *)openLocation:(id)directParameter {
    return [FINOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINPrintCommand *)print {
    return [FINPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINPrintCommand *)print:(id)directParameter {
    return [FINPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINQuitCommand *)quit {
    return [FINQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINQuitCommand *)quit:(id)directParameter {
    return [FINQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINReopenCommand *)reopen {
    return [FINReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINReopenCommand *)reopen:(id)directParameter {
    return [FINReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINRestartCommand *)restart {
    return [FINRestartCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x72657374
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINRestartCommand *)restart:(id)directParameter {
    return [FINRestartCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x72657374
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINRevealCommand *)reveal {
    return [FINRevealCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x6d766973
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINRevealCommand *)reveal:(id)directParameter {
    return [FINRevealCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x6d766973
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINRunCommand *)run {
    return [FINRunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINRunCommand *)run:(id)directParameter {
    return [FINRunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINSelectCommand *)select {
    return [FINSelectCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x736c6374
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINSelectCommand *)select:(id)directParameter {
    return [FINSelectCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x736c6374
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINSetCommand *)set {
    return [FINSetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINSetCommand *)set:(id)directParameter {
    return [FINSetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINShutDownCommand *)shutDown {
    return [FINShutDownCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x73687574
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINShutDownCommand *)shutDown:(id)directParameter {
    return [FINShutDownCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x73687574
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINSleepCommand *)sleep {
    return [FINSleepCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x736c6570
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINSleepCommand *)sleep:(id)directParameter {
    return [FINSleepCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x736c6570
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINSortCommand *)sort {
    return [FINSortCommand commandWithAppData: self.aebAppData
                       eventClass: 0x44415441
                          eventID: 0x534f5254
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINSortCommand *)sort:(id)directParameter {
    return [FINSortCommand commandWithAppData: self.aebAppData
                       eventClass: 0x44415441
                          eventID: 0x534f5254
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (FINUpdateCommand *)update {
    return [FINUpdateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x66757064
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (FINUpdateCommand *)update:(id)directParameter {
    return [FINUpdateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x666e6472
                          eventID: 0x66757064
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
@end




@implementation FINApplication

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_ {
    AEBStaticAppData *data = [[AEBStaticAppData alloc] initWithTargetType: targetType_
                                                               targetData: targetData_
                                                            launchOptions: kAEMDefaultLaunchOptions
                                                             relaunchMode: AEBRelaunchLimited
                                                           specifierClass: FINSpecifier.class
                                                              symbolClass: FINSymbol.class]; // non-ARC: add autorelease
    return [super initWithAppData: data aemQuery: AEMApp];
}

/* initialisers */

+ (instancetype)application {
    return [[self alloc] init];
}
+ (instancetype)currentApplication {
    return [[self alloc] initCurrentApplication]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithName:(NSString *)name {
    return [[self alloc] initWithName: name]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithURL:(NSURL *)url {
    return [[self alloc] initWithURL: url]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithBundleID:(NSString *)bundleID {
    return [[self alloc] initWithBundleID: bundleID]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithProcessID:(pid_t)pid {
    return [[self alloc] initWithProcessID: pid]; // non-ARC: add autorelease
}
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [[self alloc] initWithDescriptor: desc]; // non-ARC: add autorelease
}
- (instancetype)init {
    return [self initWithBundleID: @"com.apple.finder"];
}
- (instancetype)initCurrentApplication {
    return [self initWithTargetType: AEBTargetCurrent data: nil];
}
- (instancetype)initWithName:(NSString *)name {
    return [self initWithTargetType: AEBTargetName data: name];
}
- (instancetype)initWithURL:(NSURL *)url {
    return [self initWithTargetType: AEBTargetURL data: url];
}
- (instancetype)initWithBundleID:(NSString *)bundleID {
    return [self initWithTargetType: AEBTargetBundleID data: bundleID];
}
- (instancetype)initWithProcessID:(pid_t)pid {
    return [self initWithTargetType: AEBTargetProcessID data: [NSNumber numberWithInteger: pid]];
}
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithTargetType: AEBTargetDescriptor data: desc];
}

/* misc */

- (FINSpecifier *)customRoot:(id)object {
    if ([object isKindOfClass: FINSpecifier.class]) {
        return [[FINSpecifier alloc] initWithAppData: self.aebAppData aemQuery: [object aemQuery]]; // non-ARC: add autorelease
    } else if ([object isKindOfClass: AEMQuery.class]) {
        return [[FINSpecifier alloc] initWithAppData: self.aebAppData aemQuery: object];  // non-ARC: add autorelease
    } else if (!object) {
        return [[FINSpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMApp];  // non-ARC: add autorelease
    } else {
        return [[FINSpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMRoot(object)]; // non-ARC: add autorelease
    }
}
@end

