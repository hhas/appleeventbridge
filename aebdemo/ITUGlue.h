//
// ITUGlue.h
// iTunes.app 12.1.2
// AppleEventBridge.framework 0.7.0
// aebglue -o -r iTunes
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"


// Generic specifier roots. These can be used to construct ITUSpecifiers for use in other ITUSpecifiers and ITUCommands,
// though only real specifiers constructed from a ITUApplication can be used to send commands to the target application.

#define ITUApp ([[ITUSpecifier alloc] initWithAppData: nil aemQuery: AEMApp])
#define ITUCon ([[ITUSpecifier alloc] initWithAppData: nil aemQuery: AEMCon])
#define ITUIts ([[ITUSpecifier alloc] initWithAppData: nil aemQuery: AEMIts])

// Symbol namespace
#define ITU ITUSymbol

// TO DO: rename/alias Application class, c.f. Swift glue


// Classes

@interface ITUFormatter : AEBObjCFormatter
@end


@interface ITUSymbol : AEBObjCSymbol
// Types and properties
+ (AEBSymbol *)Books;
+ (AEBSymbol *)Genius;
+ (AEBSymbol *)Library;
+ (AEBSymbol *)MP3CD;
+ (AEBSymbol *)Movies;
+ (AEBSymbol *)Music;
+ (AEBSymbol *)PartyShuffle;
+ (AEBSymbol *)Podcasts;
+ (AEBSymbol *)PurchasedMusic;
+ (AEBSymbol *)TVShow;
+ (AEBSymbol *)TVShows;
+ (AEBSymbol *)albumListing;
+ (AEBSymbol *)albums;
+ (AEBSymbol *)all;
+ (AEBSymbol *)applicationResponses;
+ (AEBSymbol *)artists;
+ (AEBSymbol *)ask;
+ (AEBSymbol *)audioCD;
+ (AEBSymbol *)case_;
+ (AEBSymbol *)cdInsert;
+ (AEBSymbol *)composers;
+ (AEBSymbol *)computed;
+ (AEBSymbol *)detailed;
+ (AEBSymbol *)device;
+ (AEBSymbol *)diacriticals;
+ (AEBSymbol *)displayed;
+ (AEBSymbol *)expansion;
+ (AEBSymbol *)fastForwarding;
+ (AEBSymbol *)folder;
+ (AEBSymbol *)hyphens;
+ (AEBSymbol *)iPod;
+ (AEBSymbol *)iTunesU;
+ (AEBSymbol *)large;
+ (AEBSymbol *)library;
+ (AEBSymbol *)medium;
+ (AEBSymbol *)movie;
+ (AEBSymbol *)musicVideo;
+ (AEBSymbol *)no;
+ (AEBSymbol *)none;
+ (AEBSymbol *)numericStrings;
+ (AEBSymbol *)off;
+ (AEBSymbol *)one;
+ (AEBSymbol *)paused;
+ (AEBSymbol *)playing;
+ (AEBSymbol *)punctuation;
+ (AEBSymbol *)radioTuner;
+ (AEBSymbol *)rewinding;
+ (AEBSymbol *)sharedLibrary;
+ (AEBSymbol *)small;
+ (AEBSymbol *)songs;
+ (AEBSymbol *)standard;
+ (AEBSymbol *)stopped;
+ (AEBSymbol *)trackListing;
+ (AEBSymbol *)unknown;
+ (AEBSymbol *)user;
+ (AEBSymbol *)whitespace;
+ (AEBSymbol *)yes;
// Enumerators
+ (AEBSymbol *)April;
+ (AEBSymbol *)August;
+ (AEBSymbol *)CString;
+ (AEBSymbol *)December;
+ (AEBSymbol *)EPSPicture;
+ (AEBSymbol *)EQ;
+ (AEBSymbol *)EQEnabled;
+ (AEBSymbol *)EQPreset;
+ (AEBSymbol *)EQWindow;
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
+ (AEBSymbol *)URLTrack;
+ (AEBSymbol *)UTF16Text;
+ (AEBSymbol *)UTF8Text;
+ (AEBSymbol *)UnicodeText;
+ (AEBSymbol *)Wednesday;
+ (AEBSymbol *)address;
+ (AEBSymbol *)album;
+ (AEBSymbol *)albumArtist;
+ (AEBSymbol *)albumRating;
+ (AEBSymbol *)albumRatingKind;
+ (AEBSymbol *)alias;
+ (AEBSymbol *)anything;
+ (AEBSymbol *)application;
+ (AEBSymbol *)applicationBundleID;
+ (AEBSymbol *)applicationSignature;
+ (AEBSymbol *)applicationURL;
+ (AEBSymbol *)artist;
+ (AEBSymbol *)artwork;
+ (AEBSymbol *)audioCDPlaylist;
+ (AEBSymbol *)audioCDTrack;
+ (AEBSymbol *)band1;
+ (AEBSymbol *)band10;
+ (AEBSymbol *)band2;
+ (AEBSymbol *)band3;
+ (AEBSymbol *)band4;
+ (AEBSymbol *)band5;
+ (AEBSymbol *)band6;
+ (AEBSymbol *)band7;
+ (AEBSymbol *)band8;
+ (AEBSymbol *)band9;
+ (AEBSymbol *)best;
+ (AEBSymbol *)bitRate;
+ (AEBSymbol *)bookmark;
+ (AEBSymbol *)bookmarkable;
+ (AEBSymbol *)boolean;
+ (AEBSymbol *)boundingRectangle;
+ (AEBSymbol *)bounds;
+ (AEBSymbol *)bpm;
+ (AEBSymbol *)browserWindow;
+ (AEBSymbol *)capacity;
+ (AEBSymbol *)category;
+ (AEBSymbol *)centimeters;
+ (AEBSymbol *)classInfo;
+ (AEBSymbol *)class_;
+ (AEBSymbol *)closeable;
+ (AEBSymbol *)collapseable;
+ (AEBSymbol *)collapsed;
+ (AEBSymbol *)collating;
+ (AEBSymbol *)colorTable;
+ (AEBSymbol *)comment;
+ (AEBSymbol *)compilation;
+ (AEBSymbol *)composer;
+ (AEBSymbol *)container;
+ (AEBSymbol *)copies;
+ (AEBSymbol *)cubicCentimeters;
+ (AEBSymbol *)cubicFeet;
+ (AEBSymbol *)cubicInches;
+ (AEBSymbol *)cubicMeters;
+ (AEBSymbol *)cubicYards;
+ (AEBSymbol *)currentEQPreset;
+ (AEBSymbol *)currentEncoder;
+ (AEBSymbol *)currentPlaylist;
+ (AEBSymbol *)currentStreamTitle;
+ (AEBSymbol *)currentStreamURL;
+ (AEBSymbol *)currentTrack;
+ (AEBSymbol *)currentVisual;
+ (AEBSymbol *)dashStyle;
+ (AEBSymbol *)data;
+ (AEBSymbol *)data_;
+ (AEBSymbol *)databaseID;
+ (AEBSymbol *)date;
+ (AEBSymbol *)dateAdded;
+ (AEBSymbol *)decimalStruct;
+ (AEBSymbol *)degreesCelsius;
+ (AEBSymbol *)degreesFahrenheit;
+ (AEBSymbol *)degreesKelvin;
+ (AEBSymbol *)description_;
+ (AEBSymbol *)devicePlaylist;
+ (AEBSymbol *)deviceTrack;
+ (AEBSymbol *)discCount;
+ (AEBSymbol *)discNumber;
+ (AEBSymbol *)doubleInteger;
+ (AEBSymbol *)downloaded;
+ (AEBSymbol *)duration;
+ (AEBSymbol *)elementInfo;
+ (AEBSymbol *)enabled;
+ (AEBSymbol *)encodedString;
+ (AEBSymbol *)encoder;
+ (AEBSymbol *)endingPage;
+ (AEBSymbol *)enumerator;
+ (AEBSymbol *)episodeID;
+ (AEBSymbol *)episodeNumber;
+ (AEBSymbol *)errorHandling;
+ (AEBSymbol *)eventInfo;
+ (AEBSymbol *)extendedFloat;
+ (AEBSymbol *)faxNumber;
+ (AEBSymbol *)feet;
+ (AEBSymbol *)fileRef;
+ (AEBSymbol *)fileSpecification;
+ (AEBSymbol *)fileTrack;
+ (AEBSymbol *)fileURL;
+ (AEBSymbol *)finish;
+ (AEBSymbol *)fixed;
+ (AEBSymbol *)fixedIndexing;
+ (AEBSymbol *)fixedPoint;
+ (AEBSymbol *)fixedRectangle;
+ (AEBSymbol *)float128bit;
+ (AEBSymbol *)float_;
+ (AEBSymbol *)folderPlaylist;
+ (AEBSymbol *)format;
+ (AEBSymbol *)freeSpace;
+ (AEBSymbol *)frontmost;
+ (AEBSymbol *)fullScreen;
+ (AEBSymbol *)gallons;
+ (AEBSymbol *)gapless;
+ (AEBSymbol *)genre;
+ (AEBSymbol *)grams;
+ (AEBSymbol *)graphicText;
+ (AEBSymbol *)grouping;
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
+ (AEBSymbol *)kind;
+ (AEBSymbol *)libraryPlaylist;
+ (AEBSymbol *)list;
+ (AEBSymbol *)liters;
+ (AEBSymbol *)location;
+ (AEBSymbol *)locationReference;
+ (AEBSymbol *)longDescription;
+ (AEBSymbol *)longFixed;
+ (AEBSymbol *)longFixedPoint;
+ (AEBSymbol *)longFixedRectangle;
+ (AEBSymbol *)longPoint;
+ (AEBSymbol *)longRectangle;
+ (AEBSymbol *)lyrics;
+ (AEBSymbol *)machPort;
+ (AEBSymbol *)machine;
+ (AEBSymbol *)machineLocation;
+ (AEBSymbol *)meters;
+ (AEBSymbol *)miles;
+ (AEBSymbol *)minimized;
+ (AEBSymbol *)missingValue;
+ (AEBSymbol *)modifiable;
+ (AEBSymbol *)modificationDate;
+ (AEBSymbol *)mute;
+ (AEBSymbol *)name;
+ (AEBSymbol *)null;
+ (AEBSymbol *)ounces;
+ (AEBSymbol *)pagesAcross;
+ (AEBSymbol *)pagesDown;
+ (AEBSymbol *)parameterInfo;
+ (AEBSymbol *)parent;
+ (AEBSymbol *)persistentID;
+ (AEBSymbol *)picture;
+ (AEBSymbol *)pixelMapRecord;
+ (AEBSymbol *)playedCount;
+ (AEBSymbol *)playedDate;
+ (AEBSymbol *)playerPosition;
+ (AEBSymbol *)playerState;
+ (AEBSymbol *)playlist;
+ (AEBSymbol *)playlistWindow;
+ (AEBSymbol *)podcast;
+ (AEBSymbol *)point;
+ (AEBSymbol *)position;
+ (AEBSymbol *)pounds;
+ (AEBSymbol *)preamp;
+ (AEBSymbol *)printSettings;
+ (AEBSymbol *)printerFeatures;
+ (AEBSymbol *)processSerialNumber;
+ (AEBSymbol *)properties;
+ (AEBSymbol *)property;
+ (AEBSymbol *)propertyInfo;
+ (AEBSymbol *)quarts;
+ (AEBSymbol *)radioTunerPlaylist;
+ (AEBSymbol *)rating;
+ (AEBSymbol *)ratingKind;
+ (AEBSymbol *)rawData;
+ (AEBSymbol *)record;
+ (AEBSymbol *)reference;
+ (AEBSymbol *)releaseDate;
+ (AEBSymbol *)requestedPrintTime;
+ (AEBSymbol *)resizable;
+ (AEBSymbol *)rotation;
+ (AEBSymbol *)sampleRate;
+ (AEBSymbol *)script;
+ (AEBSymbol *)seasonNumber;
+ (AEBSymbol *)selection;
+ (AEBSymbol *)shared;
+ (AEBSymbol *)sharedTrack;
+ (AEBSymbol *)shortFloat;
+ (AEBSymbol *)shortInteger;
+ (AEBSymbol *)show;
+ (AEBSymbol *)shufflable;
+ (AEBSymbol *)shuffle;
+ (AEBSymbol *)size;
+ (AEBSymbol *)skippedCount;
+ (AEBSymbol *)skippedDate;
+ (AEBSymbol *)smart;
+ (AEBSymbol *)songRepeat;
+ (AEBSymbol *)sortAlbum;
+ (AEBSymbol *)sortAlbumArtist;
+ (AEBSymbol *)sortArtist;
+ (AEBSymbol *)sortComposer;
+ (AEBSymbol *)sortName;
+ (AEBSymbol *)sortShow;
+ (AEBSymbol *)soundVolume;
+ (AEBSymbol *)source;
+ (AEBSymbol *)specialKind;
+ (AEBSymbol *)squareFeet;
+ (AEBSymbol *)squareKilometers;
+ (AEBSymbol *)squareMeters;
+ (AEBSymbol *)squareMiles;
+ (AEBSymbol *)squareYards;
+ (AEBSymbol *)start;
+ (AEBSymbol *)startingPage;
+ (AEBSymbol *)string;
+ (AEBSymbol *)styledClipboardText;
+ (AEBSymbol *)styledText;
+ (AEBSymbol *)styledUnicodeText;
+ (AEBSymbol *)suiteInfo;
+ (AEBSymbol *)targetPrinter;
+ (AEBSymbol *)textStyleInfo;
+ (AEBSymbol *)time;
+ (AEBSymbol *)track;
+ (AEBSymbol *)trackCount;
+ (AEBSymbol *)trackNumber;
+ (AEBSymbol *)typeClass;
+ (AEBSymbol *)unplayed;
+ (AEBSymbol *)unsignedInteger;
+ (AEBSymbol *)updateTracks;
+ (AEBSymbol *)userPlaylist;
+ (AEBSymbol *)version_;
+ (AEBSymbol *)videoKind;
+ (AEBSymbol *)view;
+ (AEBSymbol *)visible;
+ (AEBSymbol *)visual;
+ (AEBSymbol *)visualSize;
+ (AEBSymbol *)visualsEnabled;
+ (AEBSymbol *)volumeAdjustment;
+ (AEBSymbol *)window;
+ (AEBSymbol *)writingCode;
+ (AEBSymbol *)yards;
+ (AEBSymbol *)year;
+ (AEBSymbol *)zoomable;
+ (AEBSymbol *)zoomed;
@end


@interface ITUActivateCommand : AEBObjCCommand
@end

@interface ITUAddCommand : AEBObjCCommand
- (instancetype)to:(id)value;
@end

@interface ITUBackTrackCommand : AEBObjCCommand
@end

@interface ITUCloseCommand : AEBObjCCommand
@end

@interface ITUConvertCommand : AEBObjCCommand
@end

@interface ITUCountCommand : AEBObjCCommand
- (instancetype)each:(id)value;
@end

@interface ITUDeleteCommand : AEBObjCCommand
@end

@interface ITUDownloadCommand : AEBObjCCommand
@end

@interface ITUDuplicateCommand : AEBObjCCommand
- (instancetype)to:(id)value;
@end

@interface ITUEjectCommand : AEBObjCCommand
@end

@interface ITUExistsCommand : AEBObjCCommand
@end

@interface ITUFastForwardCommand : AEBObjCCommand
@end

@interface ITUGetCommand : AEBObjCCommand
@end

@interface ITULaunchCommand : AEBObjCCommand
@end

@interface ITUMakeCommand : AEBObjCCommand
- (instancetype)at:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface ITUMoveCommand : AEBObjCCommand
- (instancetype)to:(id)value;
@end

@interface ITUNextTrackCommand : AEBObjCCommand
@end

@interface ITUOpenCommand : AEBObjCCommand
@end

@interface ITUOpenLocationCommand : AEBObjCCommand
@end

@interface ITUPauseCommand : AEBObjCCommand
@end

@interface ITUPlayCommand : AEBObjCCommand
- (instancetype)once:(id)value;
@end

@interface ITUPlaypauseCommand : AEBObjCCommand
@end

@interface ITUPreviousTrackCommand : AEBObjCCommand
@end

@interface ITUPrintCommand : AEBObjCCommand
- (instancetype)kind:(id)value;
- (instancetype)theme:(id)value;
- (instancetype)printDialog:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface ITUQuitCommand : AEBObjCCommand
@end

@interface ITURefreshCommand : AEBObjCCommand
@end

@interface ITUReopenCommand : AEBObjCCommand
@end

@interface ITUResumeCommand : AEBObjCCommand
@end

@interface ITURevealCommand : AEBObjCCommand
@end

@interface ITURewindCommand : AEBObjCCommand
@end

@interface ITURunCommand : AEBObjCCommand
@end

@interface ITUSearchCommand : AEBObjCCommand
- (instancetype)only:(id)value;
- (instancetype)for_:(id)value;
@end

@interface ITUSetCommand : AEBObjCCommand
- (instancetype)to:(id)value;
@end

@interface ITUStopCommand : AEBObjCCommand
@end

@interface ITUSubscribeCommand : AEBObjCCommand
@end

@interface ITUUpdateCommand : AEBObjCCommand
@end

@interface ITUUpdateAllPodcastsCommand : AEBObjCCommand
@end

@interface ITUUpdatePodcastCommand : AEBObjCCommand
@end


@interface ITUSpecifier : AEBObjCSpecifier
// Properties
- (instancetype)EQ;
- (instancetype)EQEnabled;
- (instancetype)address;
- (instancetype)album;
- (instancetype)albumArtist;
- (instancetype)albumRating;
- (instancetype)albumRatingKind;
- (instancetype)artist;
- (instancetype)band1;
- (instancetype)band10;
- (instancetype)band2;
- (instancetype)band3;
- (instancetype)band4;
- (instancetype)band5;
- (instancetype)band6;
- (instancetype)band7;
- (instancetype)band8;
- (instancetype)band9;
- (instancetype)bitRate;
- (instancetype)bookmark;
- (instancetype)bookmarkable;
- (instancetype)bounds;
- (instancetype)bpm;
- (instancetype)capacity;
- (instancetype)category;
- (instancetype)class_;
- (instancetype)closeable;
- (instancetype)collapseable;
- (instancetype)collapsed;
- (instancetype)collating;
- (instancetype)comment;
- (instancetype)compilation;
- (instancetype)composer;
- (instancetype)container;
- (instancetype)copies;
- (instancetype)currentEQPreset;
- (instancetype)currentEncoder;
- (instancetype)currentPlaylist;
- (instancetype)currentStreamTitle;
- (instancetype)currentStreamURL;
- (instancetype)currentTrack;
- (instancetype)currentVisual;
- (instancetype)data_;
- (instancetype)databaseID;
- (instancetype)dateAdded;
- (instancetype)description_;
- (instancetype)discCount;
- (instancetype)discNumber;
- (instancetype)downloaded;
- (instancetype)duration;
- (instancetype)enabled;
- (instancetype)endingPage;
- (instancetype)episodeID;
- (instancetype)episodeNumber;
- (instancetype)errorHandling;
- (instancetype)faxNumber;
- (instancetype)finish;
- (instancetype)fixedIndexing;
- (instancetype)format;
- (instancetype)freeSpace;
- (instancetype)frontmost;
- (instancetype)fullScreen;
- (instancetype)gapless;
- (instancetype)genre;
- (instancetype)grouping;
- (instancetype)id_;
- (instancetype)index;
- (instancetype)kind;
- (instancetype)location;
- (instancetype)longDescription;
- (instancetype)lyrics;
- (instancetype)minimized;
- (instancetype)modifiable;
- (instancetype)modificationDate;
- (instancetype)mute;
- (instancetype)name;
- (instancetype)pagesAcross;
- (instancetype)pagesDown;
- (instancetype)parent;
- (instancetype)persistentID;
- (instancetype)playedCount;
- (instancetype)playedDate;
- (instancetype)playerPosition;
- (instancetype)playerState;
- (instancetype)podcast;
- (instancetype)position;
- (instancetype)preamp;
- (instancetype)printerFeatures;
- (instancetype)properties;
- (instancetype)rating;
- (instancetype)ratingKind;
- (instancetype)rawData;
- (instancetype)releaseDate;
- (instancetype)requestedPrintTime;
- (instancetype)resizable;
- (instancetype)sampleRate;
- (instancetype)seasonNumber;
- (instancetype)selection;
- (instancetype)shared;
- (instancetype)show;
- (instancetype)shufflable;
- (instancetype)shuffle;
- (instancetype)size;
- (instancetype)skippedCount;
- (instancetype)skippedDate;
- (instancetype)smart;
- (instancetype)songRepeat;
- (instancetype)sortAlbum;
- (instancetype)sortAlbumArtist;
- (instancetype)sortArtist;
- (instancetype)sortComposer;
- (instancetype)sortName;
- (instancetype)sortShow;
- (instancetype)soundVolume;
- (instancetype)specialKind;
- (instancetype)start;
- (instancetype)startingPage;
- (instancetype)targetPrinter;
- (instancetype)time;
- (instancetype)trackCount;
- (instancetype)trackNumber;
- (instancetype)unplayed;
- (instancetype)updateTracks;
- (instancetype)version_;
- (instancetype)videoKind;
- (instancetype)view;
- (instancetype)visible;
- (instancetype)visualSize;
- (instancetype)visualsEnabled;
- (instancetype)volumeAdjustment;
- (instancetype)year;
- (instancetype)zoomable;
- (instancetype)zoomed;
// Elements
- (instancetype)EQPresets;
- (instancetype)EQWindows;
- (instancetype)URLTracks;
- (instancetype)applications;
- (instancetype)artworks;
- (instancetype)audioCDPlaylists;
- (instancetype)audioCDTracks;
- (instancetype)browserWindows;
- (instancetype)devicePlaylists;
- (instancetype)deviceTracks;
- (instancetype)encoders;
- (instancetype)fileTracks;
- (instancetype)folderPlaylists;
- (instancetype)items;
- (instancetype)libraryPlaylists;
- (instancetype)picture;
- (instancetype)playlistWindows;
- (instancetype)playlists;
- (instancetype)printSettings;
- (instancetype)radioTunerPlaylists;
- (instancetype)sharedTracks;
- (instancetype)sources;
- (instancetype)tracks;
- (instancetype)userPlaylists;
- (instancetype)visuals;
- (instancetype)windows;
// Commands
- (ITUActivateCommand *)activate;
- (ITUActivateCommand *)activate:(id)directParameter;
- (ITUAddCommand *)add;
- (ITUAddCommand *)add:(id)directParameter;
- (ITUBackTrackCommand *)backTrack;
- (ITUBackTrackCommand *)backTrack:(id)directParameter;
- (ITUCloseCommand *)close;
- (ITUCloseCommand *)close:(id)directParameter;
- (ITUConvertCommand *)convert;
- (ITUConvertCommand *)convert:(id)directParameter;
- (ITUCountCommand *)count;
- (ITUCountCommand *)count:(id)directParameter;
- (ITUDeleteCommand *)delete;
- (ITUDeleteCommand *)delete:(id)directParameter;
- (ITUDownloadCommand *)download;
- (ITUDownloadCommand *)download:(id)directParameter;
- (ITUDuplicateCommand *)duplicate;
- (ITUDuplicateCommand *)duplicate:(id)directParameter;
- (ITUEjectCommand *)eject;
- (ITUEjectCommand *)eject:(id)directParameter;
- (ITUExistsCommand *)exists;
- (ITUExistsCommand *)exists:(id)directParameter;
- (ITUFastForwardCommand *)fastForward;
- (ITUFastForwardCommand *)fastForward:(id)directParameter;
- (ITUGetCommand *)get;
- (ITUGetCommand *)get:(id)directParameter;
- (ITULaunchCommand *)launch;
- (ITULaunchCommand *)launch:(id)directParameter;
- (ITUMakeCommand *)make;
- (ITUMakeCommand *)make:(id)directParameter;
- (ITUMoveCommand *)move;
- (ITUMoveCommand *)move:(id)directParameter;
- (ITUNextTrackCommand *)nextTrack;
- (ITUNextTrackCommand *)nextTrack:(id)directParameter;
- (ITUOpenCommand *)open;
- (ITUOpenCommand *)open:(id)directParameter;
- (ITUOpenLocationCommand *)openLocation;
- (ITUOpenLocationCommand *)openLocation:(id)directParameter;
- (ITUPauseCommand *)pause;
- (ITUPauseCommand *)pause:(id)directParameter;
- (ITUPlayCommand *)play;
- (ITUPlayCommand *)play:(id)directParameter;
- (ITUPlaypauseCommand *)playpause;
- (ITUPlaypauseCommand *)playpause:(id)directParameter;
- (ITUPreviousTrackCommand *)previousTrack;
- (ITUPreviousTrackCommand *)previousTrack:(id)directParameter;
- (ITUPrintCommand *)print;
- (ITUPrintCommand *)print:(id)directParameter;
- (ITUQuitCommand *)quit;
- (ITUQuitCommand *)quit:(id)directParameter;
- (ITURefreshCommand *)refresh;
- (ITURefreshCommand *)refresh:(id)directParameter;
- (ITUReopenCommand *)reopen;
- (ITUReopenCommand *)reopen:(id)directParameter;
- (ITUResumeCommand *)resume;
- (ITUResumeCommand *)resume:(id)directParameter;
- (ITURevealCommand *)reveal;
- (ITURevealCommand *)reveal:(id)directParameter;
- (ITURewindCommand *)rewind;
- (ITURewindCommand *)rewind:(id)directParameter;
- (ITURunCommand *)run;
- (ITURunCommand *)run:(id)directParameter;
- (ITUSearchCommand *)search;
- (ITUSearchCommand *)search:(id)directParameter;
- (ITUSetCommand *)set;
- (ITUSetCommand *)set:(id)directParameter;
- (ITUStopCommand *)stop;
- (ITUStopCommand *)stop:(id)directParameter;
- (ITUSubscribeCommand *)subscribe;
- (ITUSubscribeCommand *)subscribe:(id)directParameter;
- (ITUUpdateCommand *)update;
- (ITUUpdateCommand *)update:(id)directParameter;
- (ITUUpdateAllPodcastsCommand *)updateAllPodcasts;
- (ITUUpdateAllPodcastsCommand *)updateAllPodcasts:(id)directParameter;
- (ITUUpdatePodcastCommand *)updatePodcast;
- (ITUUpdatePodcastCommand *)updatePodcast:(id)directParameter;
@end


@interface ITUApplication : ITUSpecifier
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
- (ITUSpecifier *)customRoot:(id)object;
@end


