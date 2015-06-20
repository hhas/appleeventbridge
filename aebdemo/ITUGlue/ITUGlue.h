//
// ITUGlue.h
// iTunes.app 12.1.2
// AppleEventBridge.framework 0.7.0
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"


// TO DO: finish API revisions (e.g. should symbol namespace drop 'k' prefix and provide app, con, its constructors as in Swift glues?)

// Generic specifier roots. These can be used to construct ITUSpecifiers for use in other ITUSpecifiers and ITUCommands,
// though only real specifiers constructed from a ITUApplication can be used to send commands to the target application.

#define ITUApp ([ITUSpecifier specifierWithAppData: nil aemQuery: AEMApp])
#define ITUCon ([ITUSpecifier specifierWithAppData: nil aemQuery: AEMCon])
#define ITUIts ([ITUSpecifier specifierWithAppData: nil aemQuery: AEMIts])

// Symbol namespace // TO DO: is macro appropriate?
#define ITU ITUSymbol

// Convenience constructor for application objects.
// TO DO: once created, Application instance should be cached and reused, and only recreated if app is no longer running
#define iTunes ([ITUApplication application])


// Classes

@interface ITUFormatter : AEBStaticFormatter
@end


@interface ITUSymbol : AEBStaticSymbol
// Types and properties
+ (instancetype)Books;
+ (instancetype)Genius;
+ (instancetype)Library;
+ (instancetype)MP3CD;
+ (instancetype)Movies;
+ (instancetype)Music;
+ (instancetype)PartyShuffle;
+ (instancetype)Podcasts;
+ (instancetype)PurchasedMusic;
+ (instancetype)TVShow;
+ (instancetype)TVShows;
+ (instancetype)albumListing;
+ (instancetype)albums;
+ (instancetype)all;
+ (instancetype)applicationResponses;
+ (instancetype)artists;
+ (instancetype)ask;
+ (instancetype)audioCD;
+ (instancetype)case_;
+ (instancetype)cdInsert;
+ (instancetype)composers;
+ (instancetype)computed;
+ (instancetype)detailed;
+ (instancetype)device;
+ (instancetype)diacriticals;
+ (instancetype)displayed;
+ (instancetype)expansion;
+ (instancetype)fastForwarding;
+ (instancetype)folder;
+ (instancetype)hyphens;
+ (instancetype)iPod;
+ (instancetype)iTunesU;
+ (instancetype)large;
+ (instancetype)library;
+ (instancetype)medium;
+ (instancetype)movie;
+ (instancetype)musicVideo;
+ (instancetype)no;
+ (instancetype)none;
+ (instancetype)numericStrings;
+ (instancetype)off;
+ (instancetype)one;
+ (instancetype)paused;
+ (instancetype)playing;
+ (instancetype)punctuation;
+ (instancetype)radioTuner;
+ (instancetype)rewinding;
+ (instancetype)sharedLibrary;
+ (instancetype)small;
+ (instancetype)songs;
+ (instancetype)standard;
+ (instancetype)stopped;
+ (instancetype)trackListing;
+ (instancetype)unknown;
+ (instancetype)user;
+ (instancetype)whitespace;
+ (instancetype)yes;
// Enumerators
+ (instancetype)April;
+ (instancetype)August;
+ (instancetype)CString;
+ (instancetype)December;
+ (instancetype)EPSPicture;
+ (instancetype)EQ;
+ (instancetype)EQEnabled;
+ (instancetype)EQPreset;
+ (instancetype)EQWindow;
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
+ (instancetype)URLTrack;
+ (instancetype)UTF16Text;
+ (instancetype)UTF8Text;
+ (instancetype)UnicodeText;
+ (instancetype)Wednesday;
+ (instancetype)address;
+ (instancetype)album;
+ (instancetype)albumArtist;
+ (instancetype)albumRating;
+ (instancetype)albumRatingKind;
+ (instancetype)alias;
+ (instancetype)anything;
+ (instancetype)application;
+ (instancetype)applicationBundleID;
+ (instancetype)applicationSignature;
+ (instancetype)applicationURL;
+ (instancetype)artist;
+ (instancetype)artwork;
+ (instancetype)audioCDPlaylist;
+ (instancetype)audioCDTrack;
+ (instancetype)band1;
+ (instancetype)band10;
+ (instancetype)band2;
+ (instancetype)band3;
+ (instancetype)band4;
+ (instancetype)band5;
+ (instancetype)band6;
+ (instancetype)band7;
+ (instancetype)band8;
+ (instancetype)band9;
+ (instancetype)best;
+ (instancetype)bitRate;
+ (instancetype)bookmark;
+ (instancetype)bookmarkable;
+ (instancetype)boolean;
+ (instancetype)boundingRectangle;
+ (instancetype)bounds;
+ (instancetype)bpm;
+ (instancetype)browserWindow;
+ (instancetype)capacity;
+ (instancetype)category;
+ (instancetype)centimeters;
+ (instancetype)classInfo;
+ (instancetype)class_;
+ (instancetype)closeable;
+ (instancetype)collapseable;
+ (instancetype)collapsed;
+ (instancetype)collating;
+ (instancetype)colorTable;
+ (instancetype)comment;
+ (instancetype)compilation;
+ (instancetype)composer;
+ (instancetype)container;
+ (instancetype)copies;
+ (instancetype)cubicCentimeters;
+ (instancetype)cubicFeet;
+ (instancetype)cubicInches;
+ (instancetype)cubicMeters;
+ (instancetype)cubicYards;
+ (instancetype)currentEQPreset;
+ (instancetype)currentEncoder;
+ (instancetype)currentPlaylist;
+ (instancetype)currentStreamTitle;
+ (instancetype)currentStreamURL;
+ (instancetype)currentTrack;
+ (instancetype)currentVisual;
+ (instancetype)dashStyle;
+ (instancetype)data;
+ (instancetype)data_;
+ (instancetype)databaseID;
+ (instancetype)date;
+ (instancetype)dateAdded;
+ (instancetype)decimalStruct;
+ (instancetype)degreesCelsius;
+ (instancetype)degreesFahrenheit;
+ (instancetype)degreesKelvin;
+ (instancetype)description_;
+ (instancetype)devicePlaylist;
+ (instancetype)deviceTrack;
+ (instancetype)discCount;
+ (instancetype)discNumber;
+ (instancetype)doubleInteger;
+ (instancetype)downloaded;
+ (instancetype)duration;
+ (instancetype)elementInfo;
+ (instancetype)enabled;
+ (instancetype)encodedString;
+ (instancetype)encoder;
+ (instancetype)endingPage;
+ (instancetype)enumerator;
+ (instancetype)episodeID;
+ (instancetype)episodeNumber;
+ (instancetype)errorHandling;
+ (instancetype)eventInfo;
+ (instancetype)extendedFloat;
+ (instancetype)faxNumber;
+ (instancetype)feet;
+ (instancetype)fileRef;
+ (instancetype)fileSpecification;
+ (instancetype)fileTrack;
+ (instancetype)fileURL;
+ (instancetype)finish;
+ (instancetype)fixed;
+ (instancetype)fixedIndexing;
+ (instancetype)fixedPoint;
+ (instancetype)fixedRectangle;
+ (instancetype)float128bit;
+ (instancetype)float_;
+ (instancetype)folderPlaylist;
+ (instancetype)format;
+ (instancetype)freeSpace;
+ (instancetype)frontmost;
+ (instancetype)fullScreen;
+ (instancetype)gallons;
+ (instancetype)gapless;
+ (instancetype)genre;
+ (instancetype)grams;
+ (instancetype)graphicText;
+ (instancetype)grouping;
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
+ (instancetype)kind;
+ (instancetype)libraryPlaylist;
+ (instancetype)list;
+ (instancetype)liters;
+ (instancetype)location;
+ (instancetype)locationReference;
+ (instancetype)longDescription;
+ (instancetype)longFixed;
+ (instancetype)longFixedPoint;
+ (instancetype)longFixedRectangle;
+ (instancetype)longPoint;
+ (instancetype)longRectangle;
+ (instancetype)lyrics;
+ (instancetype)machPort;
+ (instancetype)machine;
+ (instancetype)machineLocation;
+ (instancetype)meters;
+ (instancetype)miles;
+ (instancetype)minimized;
+ (instancetype)missingValue;
+ (instancetype)modifiable;
+ (instancetype)modificationDate;
+ (instancetype)mute;
+ (instancetype)name;
+ (instancetype)null;
+ (instancetype)ounces;
+ (instancetype)pagesAcross;
+ (instancetype)pagesDown;
+ (instancetype)parameterInfo;
+ (instancetype)parent;
+ (instancetype)persistentID;
+ (instancetype)picture;
+ (instancetype)pixelMapRecord;
+ (instancetype)playedCount;
+ (instancetype)playedDate;
+ (instancetype)playerPosition;
+ (instancetype)playerState;
+ (instancetype)playlist;
+ (instancetype)playlistWindow;
+ (instancetype)podcast;
+ (instancetype)point;
+ (instancetype)position;
+ (instancetype)pounds;
+ (instancetype)preamp;
+ (instancetype)printSettings;
+ (instancetype)printerFeatures;
+ (instancetype)processSerialNumber;
+ (instancetype)properties;
+ (instancetype)property;
+ (instancetype)propertyInfo;
+ (instancetype)quarts;
+ (instancetype)radioTunerPlaylist;
+ (instancetype)rating;
+ (instancetype)ratingKind;
+ (instancetype)rawData;
+ (instancetype)record;
+ (instancetype)reference;
+ (instancetype)releaseDate;
+ (instancetype)requestedPrintTime;
+ (instancetype)resizable;
+ (instancetype)rotation;
+ (instancetype)sampleRate;
+ (instancetype)script;
+ (instancetype)seasonNumber;
+ (instancetype)selection;
+ (instancetype)shared;
+ (instancetype)sharedTrack;
+ (instancetype)shortFloat;
+ (instancetype)shortInteger;
+ (instancetype)show;
+ (instancetype)shufflable;
+ (instancetype)shuffle;
+ (instancetype)size;
+ (instancetype)skippedCount;
+ (instancetype)skippedDate;
+ (instancetype)smart;
+ (instancetype)songRepeat;
+ (instancetype)sortAlbum;
+ (instancetype)sortAlbumArtist;
+ (instancetype)sortArtist;
+ (instancetype)sortComposer;
+ (instancetype)sortName;
+ (instancetype)sortShow;
+ (instancetype)soundVolume;
+ (instancetype)source;
+ (instancetype)specialKind;
+ (instancetype)squareFeet;
+ (instancetype)squareKilometers;
+ (instancetype)squareMeters;
+ (instancetype)squareMiles;
+ (instancetype)squareYards;
+ (instancetype)start;
+ (instancetype)startingPage;
+ (instancetype)string;
+ (instancetype)styledClipboardText;
+ (instancetype)styledText;
+ (instancetype)styledUnicodeText;
+ (instancetype)suiteInfo;
+ (instancetype)targetPrinter;
+ (instancetype)textStyleInfo;
+ (instancetype)time;
+ (instancetype)track;
+ (instancetype)trackCount;
+ (instancetype)trackNumber;
+ (instancetype)typeClass;
+ (instancetype)unplayed;
+ (instancetype)unsignedInteger;
+ (instancetype)updateTracks;
+ (instancetype)userPlaylist;
+ (instancetype)version_;
+ (instancetype)videoKind;
+ (instancetype)view;
+ (instancetype)visible;
+ (instancetype)visual;
+ (instancetype)visualSize;
+ (instancetype)visualsEnabled;
+ (instancetype)volumeAdjustment;
+ (instancetype)window;
+ (instancetype)writingCode;
+ (instancetype)yards;
+ (instancetype)year;
+ (instancetype)zoomable;
+ (instancetype)zoomed;
@end


@interface ITUActivateCommand : AEBStaticCommand
@end

@interface ITUAddCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface ITUBackTrackCommand : AEBStaticCommand
@end

@interface ITUCloseCommand : AEBStaticCommand
@end

@interface ITUConvertCommand : AEBStaticCommand
@end

@interface ITUCountCommand : AEBStaticCommand
- (instancetype)each:(id)value;
@end

@interface ITUDeleteCommand : AEBStaticCommand
@end

@interface ITUDownloadCommand : AEBStaticCommand
@end

@interface ITUDuplicateCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface ITUEjectCommand : AEBStaticCommand
@end

@interface ITUExistsCommand : AEBStaticCommand
@end

@interface ITUFastForwardCommand : AEBStaticCommand
@end

@interface ITUGetCommand : AEBStaticCommand
@end

@interface ITULaunchCommand : AEBStaticCommand
@end

@interface ITUMakeCommand : AEBStaticCommand
- (instancetype)at_:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface ITUMoveCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface ITUNextTrackCommand : AEBStaticCommand
@end

@interface ITUOpenCommand : AEBStaticCommand
@end

@interface ITUOpenLocationCommand : AEBStaticCommand
@end

@interface ITUPauseCommand : AEBStaticCommand
@end

@interface ITUPlayCommand : AEBStaticCommand
- (instancetype)once:(id)value;
@end

@interface ITUPlaypauseCommand : AEBStaticCommand
@end

@interface ITUPreviousTrackCommand : AEBStaticCommand
@end

@interface ITUPrintCommand : AEBStaticCommand
- (instancetype)kind:(id)value;
- (instancetype)theme:(id)value;
- (instancetype)printDialog:(id)value;
- (instancetype)withProperties:(id)value;
@end

@interface ITUQuitCommand : AEBStaticCommand
@end

@interface ITURefreshCommand : AEBStaticCommand
@end

@interface ITUReopenCommand : AEBStaticCommand
@end

@interface ITUResumeCommand : AEBStaticCommand
@end

@interface ITURevealCommand : AEBStaticCommand
@end

@interface ITURewindCommand : AEBStaticCommand
@end

@interface ITURunCommand : AEBStaticCommand
@end

@interface ITUSearchCommand : AEBStaticCommand
- (instancetype)only:(id)value;
- (instancetype)for_:(id)value;
@end

@interface ITUSetCommand : AEBStaticCommand
- (instancetype)to:(id)value;
@end

@interface ITUStopCommand : AEBStaticCommand
@end

@interface ITUSubscribeCommand : AEBStaticCommand
@end

@interface ITUUpdateCommand : AEBStaticCommand
@end

@interface ITUUpdateAllPodcastsCommand : AEBStaticCommand
@end

@interface ITUUpdatePodcastCommand : AEBStaticCommand
@end


@interface ITUSpecifier : AEBStaticSpecifier
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
- (ITUSpecifier *)customRoot:(id)object;
@end


