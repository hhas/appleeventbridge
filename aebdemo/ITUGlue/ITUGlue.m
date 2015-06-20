//
// ITUGlue.m
// iTunes.app 12.1.2
// AppleEventBridge.framework 0.7.0
//

#import "ITUGlue.h"


@implementation ITUFormatter
- (NSString *)propertyByCode:(OSType)code {
    switch (code) {
        case 0x70455170: return @"EQ";
        case 0x70455120: return @"EQEnabled";
        case 0x7055524c: return @"address";
        case 0x70416c62: return @"album";
        case 0x70416c41: return @"albumArtist";
        case 0x70416c52: return @"albumRating";
        case 0x7041526b: return @"albumRatingKind";
        case 0x70417274: return @"artist";
        case 0x70455131: return @"band1";
        case 0x70455130: return @"band10";
        case 0x70455132: return @"band2";
        case 0x70455133: return @"band3";
        case 0x70455134: return @"band4";
        case 0x70455135: return @"band5";
        case 0x70455136: return @"band6";
        case 0x70455137: return @"band7";
        case 0x70455138: return @"band8";
        case 0x70455139: return @"band9";
        case 0x70425274: return @"bitRate";
        case 0x70426b74: return @"bookmark";
        case 0x70426b6d: return @"bookmarkable";
        case 0x70626e64: return @"bounds";
        case 0x7042504d: return @"bpm";
        case 0x63617061: return @"capacity";
        case 0x70436174: return @"category";
        case 0x70636c73: return @"class_";
        case 0x68636c62: return @"closeable";
        case 0x70575368: return @"collapseable";
        case 0x77736864: return @"collapsed";
        case 0x6c77636c: return @"collating";
        case 0x70436d74: return @"comment";
        case 0x70416e74: return @"compilation";
        case 0x70436d70: return @"composer";
        case 0x63746e72: return @"container";
        case 0x6c776370: return @"copies";
        case 0x70455150: return @"currentEQPreset";
        case 0x70456e63: return @"currentEncoder";
        case 0x70506c61: return @"currentPlaylist";
        case 0x70537454: return @"currentStreamTitle";
        case 0x70537455: return @"currentStreamURL";
        case 0x7054726b: return @"currentTrack";
        case 0x70566973: return @"currentVisual";
        case 0x70504354: return @"data_";
        case 0x70444944: return @"databaseID";
        case 0x70416464: return @"dateAdded";
        case 0x70446573: return @"description_";
        case 0x70447343: return @"discCount";
        case 0x7044734e: return @"discNumber";
        case 0x70446c41: return @"downloaded";
        case 0x70447572: return @"duration";
        case 0x656e626c: return @"enabled";
        case 0x6c776c70: return @"endingPage";
        case 0x70457044: return @"episodeID";
        case 0x7045704e: return @"episodeNumber";
        case 0x6c776568: return @"errorHandling";
        case 0x6661786e: return @"faxNumber";
        case 0x70537470: return @"finish";
        case 0x70466978: return @"fixedIndexing";
        case 0x70466d74: return @"format";
        case 0x66727370: return @"freeSpace";
        case 0x70697366: return @"frontmost";
        case 0x70465363: return @"fullScreen";
        case 0x7047706c: return @"gapless";
        case 0x7047656e: return @"genre";
        case 0x70477270: return @"grouping";
        case 0x49442020: return @"id_";
        case 0x70696478: return @"index";
        case 0x704b6e64: return @"kind";
        case 0x704c6f63: return @"location";
        case 0x704c6473: return @"longDescription";
        case 0x704c7972: return @"lyrics";
        case 0x704d696e: return @"minimized";
        case 0x704d6f64: return @"modifiable";
        case 0x61736d6f: return @"modificationDate";
        case 0x704d7574: return @"mute";
        case 0x706e616d: return @"name";
        case 0x6c776c61: return @"pagesAcross";
        case 0x6c776c64: return @"pagesDown";
        case 0x70506c50: return @"parent";
        case 0x70504953: return @"persistentID";
        case 0x70506c43: return @"playedCount";
        case 0x70506c44: return @"playedDate";
        case 0x70506f73: return @"playerPosition";
        case 0x70506c53: return @"playerState";
        case 0x70545063: return @"podcast";
        case 0x70706f73: return @"position";
        case 0x70455141: return @"preamp";
        case 0x6c777066: return @"printerFeatures";
        case 0x70414c4c: return @"properties";
        case 0x70527465: return @"rating";
        case 0x7052746b: return @"ratingKind";
        case 0x70526177: return @"rawData";
        case 0x70526c44: return @"releaseDate";
        case 0x6c777174: return @"requestedPrintTime";
        case 0x7072737a: return @"resizable";
        case 0x70535274: return @"sampleRate";
        case 0x7053654e: return @"seasonNumber";
        case 0x73656c65: return @"selection";
        case 0x70536872: return @"shared";
        case 0x70536877: return @"show";
        case 0x70536661: return @"shufflable";
        case 0x70536866: return @"shuffle";
        case 0x7053697a: return @"size";
        case 0x70536b43: return @"skippedCount";
        case 0x70536b44: return @"skippedDate";
        case 0x70536d74: return @"smart";
        case 0x70527074: return @"songRepeat";
        case 0x7053416c: return @"sortAlbum";
        case 0x70534141: return @"sortAlbumArtist";
        case 0x70534172: return @"sortArtist";
        case 0x7053436d: return @"sortComposer";
        case 0x70534e6d: return @"sortName";
        case 0x7053534e: return @"sortShow";
        case 0x70566f6c: return @"soundVolume";
        case 0x7053704b: return @"specialKind";
        case 0x70537472: return @"start";
        case 0x6c776670: return @"startingPage";
        case 0x74727072: return @"targetPrinter";
        case 0x7054696d: return @"time";
        case 0x70547243: return @"trackCount";
        case 0x7054724e: return @"trackNumber";
        case 0x70556e70: return @"unplayed";
        case 0x70555443: return @"updateTracks";
        case 0x76657273: return @"version_";
        case 0x7056644b: return @"videoKind";
        case 0x70506c79: return @"view";
        case 0x70766973: return @"visible";
        case 0x7056537a: return @"visualSize";
        case 0x70567345: return @"visualsEnabled";
        case 0x7041646a: return @"volumeAdjustment";
        case 0x70597220: return @"year";
        case 0x69737a6d: return @"zoomable";
        case 0x707a756d: return @"zoomed";
        default: return [super propertyByCode: code];
    }
}
- (NSString *)elementsByCode:(OSType)code {
    switch (code) {
        case 0x63455150: return @"EQPresets";
        case 0x63455157: return @"EQWindows";
        case 0x63555254: return @"URLTracks";
        case 0x63617070: return @"applications";
        case 0x63417274: return @"artworks";
        case 0x63434450: return @"audioCDPlaylists";
        case 0x63434454: return @"audioCDTracks";
        case 0x63427257: return @"browserWindows";
        case 0x63447650: return @"devicePlaylists";
        case 0x63447654: return @"deviceTracks";
        case 0x63456e63: return @"encoders";
        case 0x63466c54: return @"fileTracks";
        case 0x63466f50: return @"folderPlaylists";
        case 0x636f626a: return @"items";
        case 0x634c6950: return @"libraryPlaylists";
        case 0x50494354: return @"picture";
        case 0x63506c57: return @"playlistWindows";
        case 0x63506c79: return @"playlists";
        case 0x70736574: return @"printSettings";
        case 0x63525450: return @"radioTunerPlaylists";
        case 0x74647461: return @"rawData";
        case 0x63536854: return @"sharedTracks";
        case 0x63537263: return @"sources";
        case 0x6354726b: return @"tracks";
        case 0x63557350: return @"userPlaylists";
        case 0x63566973: return @"visuals";
        case 0x6377696e: return @"windows";
        default: return [super elementsByCode: code];
    }
}
- (NSString *)prefix {
    return @"ITU";
}
@end




@implementation ITUSymbol
+ (instancetype)symbolWithCode:(OSType)code_ {
    switch (code_) {
        case 0x61707220: return self.April;
        case 0x61756720: return self.August;
        case 0x6b537041: return self.Books;
        case 0x63737472: return self.CString;
        case 0x64656320: return self.December;
        case 0x45505320: return self.EPSPicture;
        case 0x70455170: return self.EQ;
        case 0x70455120: return self.EQEnabled;
        case 0x63455150: return self.EQPreset;
        case 0x63455157: return self.EQWindow;
        case 0x66656220: return self.February;
        case 0x66726920: return self.Friday;
        case 0x47494666: return self.GIFPicture;
        case 0x6b537047: return self.Genius;
        case 0x4a504547: return self.JPEGPicture;
        case 0x6a616e20: return self.January;
        case 0x6a756c20: return self.July;
        case 0x6a756e20: return self.June;
        case 0x6b53704c: return self.Library;
        case 0x6b4d4344: return self.MP3CD;
        case 0x6d617220: return self.March;
        case 0x6d617920: return self.May;
        case 0x6d6f6e20: return self.Monday;
        case 0x6b537049: return self.Movies;
        case 0x6b53705a: return self.Music;
        case 0x6e6f7620: return self.November;
        case 0x6f637420: return self.October;
        case 0x6b537053: return self.PartyShuffle;
        case 0x70737472: return self.PascalString;
        case 0x6b537050: return self.Podcasts;
        case 0x6b53704d: return self.PurchasedMusic;
        case 0x74723136: return self.RGB16Color;
        case 0x74723936: return self.RGB96Color;
        case 0x63524742: return self.RGBColor;
        case 0x73617420: return self.Saturday;
        case 0x73657020: return self.September;
        case 0x73756e20: return self.Sunday;
        case 0x54494646: return self.TIFFPicture;
        case 0x6b566454: return self.TVShow;
        case 0x6b537054: return self.TVShows;
        case 0x74687520: return self.Thursday;
        case 0x74756520: return self.Tuesday;
        case 0x63555254: return self.URLTrack;
        case 0x75743136: return self.UTF16Text;
        case 0x75746638: return self.UTF8Text;
        case 0x75747874: return self.UnicodeText;
        case 0x77656420: return self.Wednesday;
        case 0x7055524c: return self.address;
        case 0x70416c62: return self.album;
        case 0x70416c41: return self.albumArtist;
        case 0x6b416c62: return self.albumListing;
        case 0x70416c52: return self.albumRating;
        case 0x7041526b: return self.albumRatingKind;
        case 0x6b53724c: return self.albums;
        case 0x616c6973: return self.alias;
        case 0x6b416c6c: return self.all;
        case 0x2a2a2a2a: return self.anything;
        case 0x63617070: return self.application;
        case 0x62756e64: return self.applicationBundleID;
        case 0x726d7465: return self.applicationResponses;
        case 0x7369676e: return self.applicationSignature;
        case 0x6170726c: return self.applicationURL;
        case 0x70417274: return self.artist;
        case 0x6b537252: return self.artists;
        case 0x63417274: return self.artwork;
        case 0x61736b20: return self.ask;
        case 0x6b414344: return self.audioCD;
        case 0x63434450: return self.audioCDPlaylist;
        case 0x63434454: return self.audioCDTrack;
        case 0x70455131: return self.band1;
        case 0x70455130: return self.band10;
        case 0x70455132: return self.band2;
        case 0x70455133: return self.band3;
        case 0x70455134: return self.band4;
        case 0x70455135: return self.band5;
        case 0x70455136: return self.band6;
        case 0x70455137: return self.band7;
        case 0x70455138: return self.band8;
        case 0x70455139: return self.band9;
        case 0x62657374: return self.best;
        case 0x70425274: return self.bitRate;
        case 0x70426b74: return self.bookmark;
        case 0x70426b6d: return self.bookmarkable;
        case 0x626f6f6c: return self.boolean;
        case 0x71647274: return self.boundingRectangle;
        case 0x70626e64: return self.bounds;
        case 0x7042504d: return self.bpm;
        case 0x63427257: return self.browserWindow;
        case 0x63617061: return self.capacity;
        case 0x63617365: return self.case_;
        case 0x70436174: return self.category;
        case 0x6b434469: return self.cdInsert;
        case 0x636d7472: return self.centimeters;
        case 0x67636c69: return self.classInfo;
        case 0x70636c73: return self.class_;
        case 0x68636c62: return self.closeable;
        case 0x70575368: return self.collapseable;
        case 0x77736864: return self.collapsed;
        case 0x6c77636c: return self.collating;
        case 0x636c7274: return self.colorTable;
        case 0x70436d74: return self.comment;
        case 0x70416e74: return self.compilation;
        case 0x70436d70: return self.composer;
        case 0x6b537243: return self.composers;
        case 0x6b527443: return self.computed;
        case 0x63746e72: return self.container;
        case 0x6c776370: return self.copies;
        case 0x63636d74: return self.cubicCentimeters;
        case 0x63666574: return self.cubicFeet;
        case 0x6375696e: return self.cubicInches;
        case 0x636d6574: return self.cubicMeters;
        case 0x63797264: return self.cubicYards;
        case 0x70455150: return self.currentEQPreset;
        case 0x70456e63: return self.currentEncoder;
        case 0x70506c61: return self.currentPlaylist;
        case 0x70537454: return self.currentStreamTitle;
        case 0x70537455: return self.currentStreamURL;
        case 0x7054726b: return self.currentTrack;
        case 0x70566973: return self.currentVisual;
        case 0x74646173: return self.dashStyle;
        case 0x72646174: return self.data;
        case 0x70504354: return self.data_;
        case 0x70444944: return self.databaseID;
        case 0x6c647420: return self.date;
        case 0x70416464: return self.dateAdded;
        case 0x6465636d: return self.decimalStruct;
        case 0x64656763: return self.degreesCelsius;
        case 0x64656766: return self.degreesFahrenheit;
        case 0x6465676b: return self.degreesKelvin;
        case 0x70446573: return self.description_;
        case 0x6c776474: return self.detailed;
        case 0x6b446576: return self.device;
        case 0x63447650: return self.devicePlaylist;
        case 0x63447654: return self.deviceTrack;
        case 0x64696163: return self.diacriticals;
        case 0x70447343: return self.discCount;
        case 0x7044734e: return self.discNumber;
        case 0x6b537256: return self.displayed;
        case 0x636f6d70: return self.doubleInteger;
        case 0x70446c41: return self.downloaded;
        case 0x70447572: return self.duration;
        case 0x656c696e: return self.elementInfo;
        case 0x656e626c: return self.enabled;
        case 0x656e6373: return self.encodedString;
        case 0x63456e63: return self.encoder;
        case 0x6c776c70: return self.endingPage;
        case 0x656e756d: return self.enumerator;
        case 0x70457044: return self.episodeID;
        case 0x7045704e: return self.episodeNumber;
        case 0x6c776568: return self.errorHandling;
        case 0x6576696e: return self.eventInfo;
        case 0x65787061: return self.expansion;
        case 0x65787465: return self.extendedFloat;
        case 0x6b505346: return self.fastForwarding;
        case 0x6661786e: return self.faxNumber;
        case 0x66656574: return self.feet;
        case 0x66737266: return self.fileRef;
        case 0x66737320: return self.fileSpecification;
        case 0x63466c54: return self.fileTrack;
        case 0x6675726c: return self.fileURL;
        case 0x70537470: return self.finish;
        case 0x66697864: return self.fixed;
        case 0x70466978: return self.fixedIndexing;
        case 0x66706e74: return self.fixedPoint;
        case 0x66726374: return self.fixedRectangle;
        case 0x6c64626c: return self.float128bit;
        case 0x646f7562: return self.float_;
        case 0x6b537046: return self.folder;
        case 0x63466f50: return self.folderPlaylist;
        case 0x70466d74: return self.format;
        case 0x66727370: return self.freeSpace;
        case 0x70697366: return self.frontmost;
        case 0x70465363: return self.fullScreen;
        case 0x67616c6e: return self.gallons;
        case 0x7047706c: return self.gapless;
        case 0x7047656e: return self.genre;
        case 0x6772616d: return self.grams;
        case 0x63677478: return self.graphicText;
        case 0x70477270: return self.grouping;
        case 0x68797068: return self.hyphens;
        case 0x6b506f64: return self.iPod;
        case 0x6b537055: return self.iTunesU;
        case 0x49442020: return self.id_;
        case 0x696e6368: return self.inches;
        case 0x70696478: return self.index;
        case 0x6c6f6e67: return self.integer;
        case 0x69747874: return self.internationalText;
        case 0x696e746c: return self.internationalWritingCode;
        case 0x636f626a: return self.item;
        case 0x6b706964: return self.kernelProcessID;
        case 0x6b67726d: return self.kilograms;
        case 0x6b6d7472: return self.kilometers;
        case 0x704b6e64: return self.kind;
        case 0x6b56534c: return self.large;
        case 0x6b4c6962: return self.library;
        case 0x634c6950: return self.libraryPlaylist;
        case 0x6c697374: return self.list;
        case 0x6c697472: return self.liters;
        case 0x704c6f63: return self.location;
        case 0x696e736c: return self.locationReference;
        case 0x704c6473: return self.longDescription;
        case 0x6c667864: return self.longFixed;
        case 0x6c667074: return self.longFixedPoint;
        case 0x6c667263: return self.longFixedRectangle;
        case 0x6c706e74: return self.longPoint;
        case 0x6c726374: return self.longRectangle;
        case 0x704c7972: return self.lyrics;
        case 0x706f7274: return self.machPort;
        case 0x6d616368: return self.machine;
        case 0x6d4c6f63: return self.machineLocation;
        case 0x6b56534d: return self.medium;
        case 0x6d657472: return self.meters;
        case 0x6d696c65: return self.miles;
        case 0x704d696e: return self.minimized;
        case 0x6d736e67: return self.missingValue;
        case 0x704d6f64: return self.modifiable;
        case 0x61736d6f: return self.modificationDate;
        case 0x6b56644d: return self.movie;
        case 0x6b566456: return self.musicVideo;
        case 0x704d7574: return self.mute;
        case 0x706e616d: return self.name;
        case 0x6e6f2020: return self.no;
        case 0x6b4e6f6e: return self.none;
        case 0x6e756c6c: return self.null;
        case 0x6e756d65: return self.numericStrings;
        case 0x6b52704f: return self.off;
        case 0x6b527031: return self.one;
        case 0x6f7a7320: return self.ounces;
        case 0x6c776c61: return self.pagesAcross;
        case 0x6c776c64: return self.pagesDown;
        case 0x706d696e: return self.parameterInfo;
        case 0x70506c50: return self.parent;
        case 0x6b505370: return self.paused;
        case 0x70504953: return self.persistentID;
        case 0x50494354: return self.picture;
        case 0x74706d6d: return self.pixelMapRecord;
        case 0x70506c43: return self.playedCount;
        case 0x70506c44: return self.playedDate;
        case 0x70506f73: return self.playerPosition;
        case 0x70506c53: return self.playerState;
        case 0x6b505350: return self.playing;
        case 0x63506c79: return self.playlist;
        case 0x63506c57: return self.playlistWindow;
        case 0x70545063: return self.podcast;
        case 0x51447074: return self.point;
        case 0x70706f73: return self.position;
        case 0x6c627320: return self.pounds;
        case 0x70455141: return self.preamp;
        case 0x70736574: return self.printSettings;
        case 0x6c777066: return self.printerFeatures;
        case 0x70736e20: return self.processSerialNumber;
        case 0x70414c4c: return self.properties;
        case 0x70726f70: return self.property;
        case 0x70696e66: return self.propertyInfo;
        case 0x70756e63: return self.punctuation;
        case 0x71727473: return self.quarts;
        case 0x6b54756e: return self.radioTuner;
        case 0x63525450: return self.radioTunerPlaylist;
        case 0x70527465: return self.rating;
        case 0x7052746b: return self.ratingKind;
        case 0x74647461: return self.rawData;
        case 0x70526177: return self.rawData;
        case 0x7265636f: return self.record;
        case 0x6f626a20: return self.reference;
        case 0x70526c44: return self.releaseDate;
        case 0x6c777174: return self.requestedPrintTime;
        case 0x7072737a: return self.resizable;
        case 0x6b505352: return self.rewinding;
        case 0x74726f74: return self.rotation;
        case 0x70535274: return self.sampleRate;
        case 0x73637074: return self.script;
        case 0x7053654e: return self.seasonNumber;
        case 0x73656c65: return self.selection;
        case 0x70536872: return self.shared;
        case 0x6b536864: return self.sharedLibrary;
        case 0x63536854: return self.sharedTrack;
        case 0x73696e67: return self.shortFloat;
        case 0x73686f72: return self.shortInteger;
        case 0x70536877: return self.show;
        case 0x70536661: return self.shufflable;
        case 0x70536866: return self.shuffle;
        case 0x7053697a: return self.size;
        case 0x70536b43: return self.skippedCount;
        case 0x70536b44: return self.skippedDate;
        case 0x6b565353: return self.small;
        case 0x70536d74: return self.smart;
        case 0x70527074: return self.songRepeat;
        case 0x6b537253: return self.songs;
        case 0x7053416c: return self.sortAlbum;
        case 0x70534141: return self.sortAlbumArtist;
        case 0x70534172: return self.sortArtist;
        case 0x7053436d: return self.sortComposer;
        case 0x70534e6d: return self.sortName;
        case 0x7053534e: return self.sortShow;
        case 0x70566f6c: return self.soundVolume;
        case 0x63537263: return self.source;
        case 0x7053704b: return self.specialKind;
        case 0x73716674: return self.squareFeet;
        case 0x73716b6d: return self.squareKilometers;
        case 0x7371726d: return self.squareMeters;
        case 0x73716d69: return self.squareMiles;
        case 0x73717964: return self.squareYards;
        case 0x6c777374: return self.standard;
        case 0x70537472: return self.start;
        case 0x6c776670: return self.startingPage;
        case 0x6b505353: return self.stopped;
        case 0x54455854: return self.string;
        case 0x7374796c: return self.styledClipboardText;
        case 0x53545854: return self.styledText;
        case 0x73757478: return self.styledUnicodeText;
        case 0x7375696e: return self.suiteInfo;
        case 0x74727072: return self.targetPrinter;
        case 0x74737479: return self.textStyleInfo;
        case 0x7054696d: return self.time;
        case 0x6354726b: return self.track;
        case 0x70547243: return self.trackCount;
        case 0x6b54726b: return self.trackListing;
        case 0x7054724e: return self.trackNumber;
        case 0x74797065: return self.typeClass;
        case 0x6b556e6b: return self.unknown;
        case 0x70556e70: return self.unplayed;
        case 0x6d61676e: return self.unsignedInteger;
        case 0x70555443: return self.updateTracks;
        case 0x6b527455: return self.user;
        case 0x63557350: return self.userPlaylist;
        case 0x76657273: return self.version_;
        case 0x7056644b: return self.videoKind;
        case 0x70506c79: return self.view;
        case 0x70766973: return self.visible;
        case 0x63566973: return self.visual;
        case 0x7056537a: return self.visualSize;
        case 0x70567345: return self.visualsEnabled;
        case 0x7041646a: return self.volumeAdjustment;
        case 0x77686974: return self.whitespace;
        case 0x6377696e: return self.window;
        case 0x70736374: return self.writingCode;
        case 0x79617264: return self.yards;
        case 0x70597220: return self.year;
        case 0x79657320: return self.yes;
        case 0x69737a6d: return self.zoomable;
        case 0x707a756d: return self.zoomed;
        default: return [super symbolWithCode: code_];
    }
}
// Types/properties 
+ (instancetype)April {AEB_RETURN_SYMBOL(@"April", typeType, 0x61707220);}
+ (instancetype)August {AEB_RETURN_SYMBOL(@"August", typeType, 0x61756720);}
+ (instancetype)CString {AEB_RETURN_SYMBOL(@"CString", typeType, 0x63737472);}
+ (instancetype)December {AEB_RETURN_SYMBOL(@"December", typeType, 0x64656320);}
+ (instancetype)EPSPicture {AEB_RETURN_SYMBOL(@"EPSPicture", typeType, 0x45505320);}
+ (instancetype)EQ {AEB_RETURN_SYMBOL(@"EQ", typeType, 0x70455170);}
+ (instancetype)EQEnabled {AEB_RETURN_SYMBOL(@"EQEnabled", typeType, 0x70455120);}
+ (instancetype)EQPreset {AEB_RETURN_SYMBOL(@"EQPreset", typeType, 0x63455150);}
+ (instancetype)EQWindow {AEB_RETURN_SYMBOL(@"EQWindow", typeType, 0x63455157);}
+ (instancetype)February {AEB_RETURN_SYMBOL(@"February", typeType, 0x66656220);}
+ (instancetype)Friday {AEB_RETURN_SYMBOL(@"Friday", typeType, 0x66726920);}
+ (instancetype)GIFPicture {AEB_RETURN_SYMBOL(@"GIFPicture", typeType, 0x47494666);}
+ (instancetype)JPEGPicture {AEB_RETURN_SYMBOL(@"JPEGPicture", typeType, 0x4a504547);}
+ (instancetype)January {AEB_RETURN_SYMBOL(@"January", typeType, 0x6a616e20);}
+ (instancetype)July {AEB_RETURN_SYMBOL(@"July", typeType, 0x6a756c20);}
+ (instancetype)June {AEB_RETURN_SYMBOL(@"June", typeType, 0x6a756e20);}
+ (instancetype)March {AEB_RETURN_SYMBOL(@"March", typeType, 0x6d617220);}
+ (instancetype)May {AEB_RETURN_SYMBOL(@"May", typeType, 0x6d617920);}
+ (instancetype)Monday {AEB_RETURN_SYMBOL(@"Monday", typeType, 0x6d6f6e20);}
+ (instancetype)November {AEB_RETURN_SYMBOL(@"November", typeType, 0x6e6f7620);}
+ (instancetype)October {AEB_RETURN_SYMBOL(@"October", typeType, 0x6f637420);}
+ (instancetype)PICTPicture {AEB_RETURN_SYMBOL(@"PICTPicture", typeType, 0x50494354);}
+ (instancetype)PascalString {AEB_RETURN_SYMBOL(@"PascalString", typeType, 0x70737472);}
+ (instancetype)RGB16Color {AEB_RETURN_SYMBOL(@"RGB16Color", typeType, 0x74723136);}
+ (instancetype)RGB96Color {AEB_RETURN_SYMBOL(@"RGB96Color", typeType, 0x74723936);}
+ (instancetype)RGBColor {AEB_RETURN_SYMBOL(@"RGBColor", typeType, 0x63524742);}
+ (instancetype)Saturday {AEB_RETURN_SYMBOL(@"Saturday", typeType, 0x73617420);}
+ (instancetype)September {AEB_RETURN_SYMBOL(@"September", typeType, 0x73657020);}
+ (instancetype)Sunday {AEB_RETURN_SYMBOL(@"Sunday", typeType, 0x73756e20);}
+ (instancetype)TIFFPicture {AEB_RETURN_SYMBOL(@"TIFFPicture", typeType, 0x54494646);}
+ (instancetype)Thursday {AEB_RETURN_SYMBOL(@"Thursday", typeType, 0x74687520);}
+ (instancetype)Tuesday {AEB_RETURN_SYMBOL(@"Tuesday", typeType, 0x74756520);}
+ (instancetype)URLTrack {AEB_RETURN_SYMBOL(@"URLTrack", typeType, 0x63555254);}
+ (instancetype)UTF16Text {AEB_RETURN_SYMBOL(@"UTF16Text", typeType, 0x75743136);}
+ (instancetype)UTF8Text {AEB_RETURN_SYMBOL(@"UTF8Text", typeType, 0x75746638);}
+ (instancetype)UnicodeText {AEB_RETURN_SYMBOL(@"UnicodeText", typeType, 0x75747874);}
+ (instancetype)Wednesday {AEB_RETURN_SYMBOL(@"Wednesday", typeType, 0x77656420);}
+ (instancetype)address {AEB_RETURN_SYMBOL(@"address", typeType, 0x7055524c);}
+ (instancetype)album {AEB_RETURN_SYMBOL(@"album", typeType, 0x70416c62);}
+ (instancetype)albumArtist {AEB_RETURN_SYMBOL(@"albumArtist", typeType, 0x70416c41);}
+ (instancetype)albumRating {AEB_RETURN_SYMBOL(@"albumRating", typeType, 0x70416c52);}
+ (instancetype)albumRatingKind {AEB_RETURN_SYMBOL(@"albumRatingKind", typeType, 0x7041526b);}
+ (instancetype)alias {AEB_RETURN_SYMBOL(@"alias", typeType, 0x616c6973);}
+ (instancetype)anything {AEB_RETURN_SYMBOL(@"anything", typeType, 0x2a2a2a2a);}
+ (instancetype)application {AEB_RETURN_SYMBOL(@"application", typeType, 0x63617070);}
+ (instancetype)applicationBundleID {AEB_RETURN_SYMBOL(@"applicationBundleID", typeType, 0x62756e64);}
+ (instancetype)applicationSignature {AEB_RETURN_SYMBOL(@"applicationSignature", typeType, 0x7369676e);}
+ (instancetype)applicationURL {AEB_RETURN_SYMBOL(@"applicationURL", typeType, 0x6170726c);}
+ (instancetype)artist {AEB_RETURN_SYMBOL(@"artist", typeType, 0x70417274);}
+ (instancetype)artwork {AEB_RETURN_SYMBOL(@"artwork", typeType, 0x63417274);}
+ (instancetype)audioCDPlaylist {AEB_RETURN_SYMBOL(@"audioCDPlaylist", typeType, 0x63434450);}
+ (instancetype)audioCDTrack {AEB_RETURN_SYMBOL(@"audioCDTrack", typeType, 0x63434454);}
+ (instancetype)band1 {AEB_RETURN_SYMBOL(@"band1", typeType, 0x70455131);}
+ (instancetype)band10 {AEB_RETURN_SYMBOL(@"band10", typeType, 0x70455130);}
+ (instancetype)band2 {AEB_RETURN_SYMBOL(@"band2", typeType, 0x70455132);}
+ (instancetype)band3 {AEB_RETURN_SYMBOL(@"band3", typeType, 0x70455133);}
+ (instancetype)band4 {AEB_RETURN_SYMBOL(@"band4", typeType, 0x70455134);}
+ (instancetype)band5 {AEB_RETURN_SYMBOL(@"band5", typeType, 0x70455135);}
+ (instancetype)band6 {AEB_RETURN_SYMBOL(@"band6", typeType, 0x70455136);}
+ (instancetype)band7 {AEB_RETURN_SYMBOL(@"band7", typeType, 0x70455137);}
+ (instancetype)band8 {AEB_RETURN_SYMBOL(@"band8", typeType, 0x70455138);}
+ (instancetype)band9 {AEB_RETURN_SYMBOL(@"band9", typeType, 0x70455139);}
+ (instancetype)best {AEB_RETURN_SYMBOL(@"best", typeType, 0x62657374);}
+ (instancetype)bitRate {AEB_RETURN_SYMBOL(@"bitRate", typeType, 0x70425274);}
+ (instancetype)bookmark {AEB_RETURN_SYMBOL(@"bookmark", typeType, 0x70426b74);}
+ (instancetype)bookmarkable {AEB_RETURN_SYMBOL(@"bookmarkable", typeType, 0x70426b6d);}
+ (instancetype)boolean {AEB_RETURN_SYMBOL(@"boolean", typeType, 0x626f6f6c);}
+ (instancetype)boundingRectangle {AEB_RETURN_SYMBOL(@"boundingRectangle", typeType, 0x71647274);}
+ (instancetype)bounds {AEB_RETURN_SYMBOL(@"bounds", typeType, 0x70626e64);}
+ (instancetype)bpm {AEB_RETURN_SYMBOL(@"bpm", typeType, 0x7042504d);}
+ (instancetype)browserWindow {AEB_RETURN_SYMBOL(@"browserWindow", typeType, 0x63427257);}
+ (instancetype)capacity {AEB_RETURN_SYMBOL(@"capacity", typeType, 0x63617061);}
+ (instancetype)category {AEB_RETURN_SYMBOL(@"category", typeType, 0x70436174);}
+ (instancetype)centimeters {AEB_RETURN_SYMBOL(@"centimeters", typeType, 0x636d7472);}
+ (instancetype)classInfo {AEB_RETURN_SYMBOL(@"classInfo", typeType, 0x67636c69);}
+ (instancetype)class_ {AEB_RETURN_SYMBOL(@"class_", typeType, 0x70636c73);}
+ (instancetype)closeable {AEB_RETURN_SYMBOL(@"closeable", typeType, 0x68636c62);}
+ (instancetype)collapseable {AEB_RETURN_SYMBOL(@"collapseable", typeType, 0x70575368);}
+ (instancetype)collapsed {AEB_RETURN_SYMBOL(@"collapsed", typeType, 0x77736864);}
+ (instancetype)collating {AEB_RETURN_SYMBOL(@"collating", typeType, 0x6c77636c);}
+ (instancetype)colorTable {AEB_RETURN_SYMBOL(@"colorTable", typeType, 0x636c7274);}
+ (instancetype)comment {AEB_RETURN_SYMBOL(@"comment", typeType, 0x70436d74);}
+ (instancetype)compilation {AEB_RETURN_SYMBOL(@"compilation", typeType, 0x70416e74);}
+ (instancetype)composer {AEB_RETURN_SYMBOL(@"composer", typeType, 0x70436d70);}
+ (instancetype)container {AEB_RETURN_SYMBOL(@"container", typeType, 0x63746e72);}
+ (instancetype)copies {AEB_RETURN_SYMBOL(@"copies", typeType, 0x6c776370);}
+ (instancetype)cubicCentimeters {AEB_RETURN_SYMBOL(@"cubicCentimeters", typeType, 0x63636d74);}
+ (instancetype)cubicFeet {AEB_RETURN_SYMBOL(@"cubicFeet", typeType, 0x63666574);}
+ (instancetype)cubicInches {AEB_RETURN_SYMBOL(@"cubicInches", typeType, 0x6375696e);}
+ (instancetype)cubicMeters {AEB_RETURN_SYMBOL(@"cubicMeters", typeType, 0x636d6574);}
+ (instancetype)cubicYards {AEB_RETURN_SYMBOL(@"cubicYards", typeType, 0x63797264);}
+ (instancetype)currentEQPreset {AEB_RETURN_SYMBOL(@"currentEQPreset", typeType, 0x70455150);}
+ (instancetype)currentEncoder {AEB_RETURN_SYMBOL(@"currentEncoder", typeType, 0x70456e63);}
+ (instancetype)currentPlaylist {AEB_RETURN_SYMBOL(@"currentPlaylist", typeType, 0x70506c61);}
+ (instancetype)currentStreamTitle {AEB_RETURN_SYMBOL(@"currentStreamTitle", typeType, 0x70537454);}
+ (instancetype)currentStreamURL {AEB_RETURN_SYMBOL(@"currentStreamURL", typeType, 0x70537455);}
+ (instancetype)currentTrack {AEB_RETURN_SYMBOL(@"currentTrack", typeType, 0x7054726b);}
+ (instancetype)currentVisual {AEB_RETURN_SYMBOL(@"currentVisual", typeType, 0x70566973);}
+ (instancetype)dashStyle {AEB_RETURN_SYMBOL(@"dashStyle", typeType, 0x74646173);}
+ (instancetype)data {AEB_RETURN_SYMBOL(@"data", typeType, 0x72646174);}
+ (instancetype)data_ {AEB_RETURN_SYMBOL(@"data_", typeType, 0x70504354);}
+ (instancetype)databaseID {AEB_RETURN_SYMBOL(@"databaseID", typeType, 0x70444944);}
+ (instancetype)date {AEB_RETURN_SYMBOL(@"date", typeType, 0x6c647420);}
+ (instancetype)dateAdded {AEB_RETURN_SYMBOL(@"dateAdded", typeType, 0x70416464);}
+ (instancetype)decimalStruct {AEB_RETURN_SYMBOL(@"decimalStruct", typeType, 0x6465636d);}
+ (instancetype)degreesCelsius {AEB_RETURN_SYMBOL(@"degreesCelsius", typeType, 0x64656763);}
+ (instancetype)degreesFahrenheit {AEB_RETURN_SYMBOL(@"degreesFahrenheit", typeType, 0x64656766);}
+ (instancetype)degreesKelvin {AEB_RETURN_SYMBOL(@"degreesKelvin", typeType, 0x6465676b);}
+ (instancetype)description_ {AEB_RETURN_SYMBOL(@"description_", typeType, 0x70446573);}
+ (instancetype)devicePlaylist {AEB_RETURN_SYMBOL(@"devicePlaylist", typeType, 0x63447650);}
+ (instancetype)deviceTrack {AEB_RETURN_SYMBOL(@"deviceTrack", typeType, 0x63447654);}
+ (instancetype)discCount {AEB_RETURN_SYMBOL(@"discCount", typeType, 0x70447343);}
+ (instancetype)discNumber {AEB_RETURN_SYMBOL(@"discNumber", typeType, 0x7044734e);}
+ (instancetype)doubleInteger {AEB_RETURN_SYMBOL(@"doubleInteger", typeType, 0x636f6d70);}
+ (instancetype)downloaded {AEB_RETURN_SYMBOL(@"downloaded", typeType, 0x70446c41);}
+ (instancetype)duration {AEB_RETURN_SYMBOL(@"duration", typeType, 0x70447572);}
+ (instancetype)elementInfo {AEB_RETURN_SYMBOL(@"elementInfo", typeType, 0x656c696e);}
+ (instancetype)enabled {AEB_RETURN_SYMBOL(@"enabled", typeType, 0x656e626c);}
+ (instancetype)encodedString {AEB_RETURN_SYMBOL(@"encodedString", typeType, 0x656e6373);}
+ (instancetype)encoder {AEB_RETURN_SYMBOL(@"encoder", typeType, 0x63456e63);}
+ (instancetype)endingPage {AEB_RETURN_SYMBOL(@"endingPage", typeType, 0x6c776c70);}
+ (instancetype)enumerator {AEB_RETURN_SYMBOL(@"enumerator", typeType, 0x656e756d);}
+ (instancetype)episodeID {AEB_RETURN_SYMBOL(@"episodeID", typeType, 0x70457044);}
+ (instancetype)episodeNumber {AEB_RETURN_SYMBOL(@"episodeNumber", typeType, 0x7045704e);}
+ (instancetype)errorHandling {AEB_RETURN_SYMBOL(@"errorHandling", typeType, 0x6c776568);}
+ (instancetype)eventInfo {AEB_RETURN_SYMBOL(@"eventInfo", typeType, 0x6576696e);}
+ (instancetype)extendedFloat {AEB_RETURN_SYMBOL(@"extendedFloat", typeType, 0x65787465);}
+ (instancetype)faxNumber {AEB_RETURN_SYMBOL(@"faxNumber", typeType, 0x6661786e);}
+ (instancetype)feet {AEB_RETURN_SYMBOL(@"feet", typeType, 0x66656574);}
+ (instancetype)fileRef {AEB_RETURN_SYMBOL(@"fileRef", typeType, 0x66737266);}
+ (instancetype)fileSpecification {AEB_RETURN_SYMBOL(@"fileSpecification", typeType, 0x66737320);}
+ (instancetype)fileTrack {AEB_RETURN_SYMBOL(@"fileTrack", typeType, 0x63466c54);}
+ (instancetype)fileURL {AEB_RETURN_SYMBOL(@"fileURL", typeType, 0x6675726c);}
+ (instancetype)finish {AEB_RETURN_SYMBOL(@"finish", typeType, 0x70537470);}
+ (instancetype)fixed {AEB_RETURN_SYMBOL(@"fixed", typeType, 0x66697864);}
+ (instancetype)fixedIndexing {AEB_RETURN_SYMBOL(@"fixedIndexing", typeType, 0x70466978);}
+ (instancetype)fixedPoint {AEB_RETURN_SYMBOL(@"fixedPoint", typeType, 0x66706e74);}
+ (instancetype)fixedRectangle {AEB_RETURN_SYMBOL(@"fixedRectangle", typeType, 0x66726374);}
+ (instancetype)float128bit {AEB_RETURN_SYMBOL(@"float128bit", typeType, 0x6c64626c);}
+ (instancetype)float_ {AEB_RETURN_SYMBOL(@"float_", typeType, 0x646f7562);}
+ (instancetype)folderPlaylist {AEB_RETURN_SYMBOL(@"folderPlaylist", typeType, 0x63466f50);}
+ (instancetype)format {AEB_RETURN_SYMBOL(@"format", typeType, 0x70466d74);}
+ (instancetype)freeSpace {AEB_RETURN_SYMBOL(@"freeSpace", typeType, 0x66727370);}
+ (instancetype)frontmost {AEB_RETURN_SYMBOL(@"frontmost", typeType, 0x70697366);}
+ (instancetype)fullScreen {AEB_RETURN_SYMBOL(@"fullScreen", typeType, 0x70465363);}
+ (instancetype)gallons {AEB_RETURN_SYMBOL(@"gallons", typeType, 0x67616c6e);}
+ (instancetype)gapless {AEB_RETURN_SYMBOL(@"gapless", typeType, 0x7047706c);}
+ (instancetype)genre {AEB_RETURN_SYMBOL(@"genre", typeType, 0x7047656e);}
+ (instancetype)grams {AEB_RETURN_SYMBOL(@"grams", typeType, 0x6772616d);}
+ (instancetype)graphicText {AEB_RETURN_SYMBOL(@"graphicText", typeType, 0x63677478);}
+ (instancetype)grouping {AEB_RETURN_SYMBOL(@"grouping", typeType, 0x70477270);}
+ (instancetype)id_ {AEB_RETURN_SYMBOL(@"id_", typeType, 0x49442020);}
+ (instancetype)inches {AEB_RETURN_SYMBOL(@"inches", typeType, 0x696e6368);}
+ (instancetype)index {AEB_RETURN_SYMBOL(@"index", typeType, 0x70696478);}
+ (instancetype)integer {AEB_RETURN_SYMBOL(@"integer", typeType, 0x6c6f6e67);}
+ (instancetype)internationalText {AEB_RETURN_SYMBOL(@"internationalText", typeType, 0x69747874);}
+ (instancetype)internationalWritingCode {AEB_RETURN_SYMBOL(@"internationalWritingCode", typeType, 0x696e746c);}
+ (instancetype)item {AEB_RETURN_SYMBOL(@"item", typeType, 0x636f626a);}
+ (instancetype)kernelProcessID {AEB_RETURN_SYMBOL(@"kernelProcessID", typeType, 0x6b706964);}
+ (instancetype)kilograms {AEB_RETURN_SYMBOL(@"kilograms", typeType, 0x6b67726d);}
+ (instancetype)kilometers {AEB_RETURN_SYMBOL(@"kilometers", typeType, 0x6b6d7472);}
+ (instancetype)kind {AEB_RETURN_SYMBOL(@"kind", typeType, 0x704b6e64);}
+ (instancetype)libraryPlaylist {AEB_RETURN_SYMBOL(@"libraryPlaylist", typeType, 0x634c6950);}
+ (instancetype)list {AEB_RETURN_SYMBOL(@"list", typeType, 0x6c697374);}
+ (instancetype)liters {AEB_RETURN_SYMBOL(@"liters", typeType, 0x6c697472);}
+ (instancetype)location {AEB_RETURN_SYMBOL(@"location", typeType, 0x704c6f63);}
+ (instancetype)locationReference {AEB_RETURN_SYMBOL(@"locationReference", typeType, 0x696e736c);}
+ (instancetype)longDescription {AEB_RETURN_SYMBOL(@"longDescription", typeType, 0x704c6473);}
+ (instancetype)longFixed {AEB_RETURN_SYMBOL(@"longFixed", typeType, 0x6c667864);}
+ (instancetype)longFixedPoint {AEB_RETURN_SYMBOL(@"longFixedPoint", typeType, 0x6c667074);}
+ (instancetype)longFixedRectangle {AEB_RETURN_SYMBOL(@"longFixedRectangle", typeType, 0x6c667263);}
+ (instancetype)longPoint {AEB_RETURN_SYMBOL(@"longPoint", typeType, 0x6c706e74);}
+ (instancetype)longRectangle {AEB_RETURN_SYMBOL(@"longRectangle", typeType, 0x6c726374);}
+ (instancetype)lyrics {AEB_RETURN_SYMBOL(@"lyrics", typeType, 0x704c7972);}
+ (instancetype)machPort {AEB_RETURN_SYMBOL(@"machPort", typeType, 0x706f7274);}
+ (instancetype)machine {AEB_RETURN_SYMBOL(@"machine", typeType, 0x6d616368);}
+ (instancetype)machineLocation {AEB_RETURN_SYMBOL(@"machineLocation", typeType, 0x6d4c6f63);}
+ (instancetype)meters {AEB_RETURN_SYMBOL(@"meters", typeType, 0x6d657472);}
+ (instancetype)miles {AEB_RETURN_SYMBOL(@"miles", typeType, 0x6d696c65);}
+ (instancetype)minimized {AEB_RETURN_SYMBOL(@"minimized", typeType, 0x704d696e);}
+ (instancetype)missingValue {AEB_RETURN_SYMBOL(@"missingValue", typeType, 0x6d736e67);}
+ (instancetype)modifiable {AEB_RETURN_SYMBOL(@"modifiable", typeType, 0x704d6f64);}
+ (instancetype)modificationDate {AEB_RETURN_SYMBOL(@"modificationDate", typeType, 0x61736d6f);}
+ (instancetype)mute {AEB_RETURN_SYMBOL(@"mute", typeType, 0x704d7574);}
+ (instancetype)name {AEB_RETURN_SYMBOL(@"name", typeType, 0x706e616d);}
+ (instancetype)null {AEB_RETURN_SYMBOL(@"null", typeType, 0x6e756c6c);}
+ (instancetype)ounces {AEB_RETURN_SYMBOL(@"ounces", typeType, 0x6f7a7320);}
+ (instancetype)pagesAcross {AEB_RETURN_SYMBOL(@"pagesAcross", typeType, 0x6c776c61);}
+ (instancetype)pagesDown {AEB_RETURN_SYMBOL(@"pagesDown", typeType, 0x6c776c64);}
+ (instancetype)parameterInfo {AEB_RETURN_SYMBOL(@"parameterInfo", typeType, 0x706d696e);}
+ (instancetype)parent {AEB_RETURN_SYMBOL(@"parent", typeType, 0x70506c50);}
+ (instancetype)persistentID {AEB_RETURN_SYMBOL(@"persistentID", typeType, 0x70504953);}
+ (instancetype)picture {AEB_RETURN_SYMBOL(@"picture", typeType, 0x50494354);}
+ (instancetype)pixelMapRecord {AEB_RETURN_SYMBOL(@"pixelMapRecord", typeType, 0x74706d6d);}
+ (instancetype)playedCount {AEB_RETURN_SYMBOL(@"playedCount", typeType, 0x70506c43);}
+ (instancetype)playedDate {AEB_RETURN_SYMBOL(@"playedDate", typeType, 0x70506c44);}
+ (instancetype)playerPosition {AEB_RETURN_SYMBOL(@"playerPosition", typeType, 0x70506f73);}
+ (instancetype)playerState {AEB_RETURN_SYMBOL(@"playerState", typeType, 0x70506c53);}
+ (instancetype)playlist {AEB_RETURN_SYMBOL(@"playlist", typeType, 0x63506c79);}
+ (instancetype)playlistWindow {AEB_RETURN_SYMBOL(@"playlistWindow", typeType, 0x63506c57);}
+ (instancetype)podcast {AEB_RETURN_SYMBOL(@"podcast", typeType, 0x70545063);}
+ (instancetype)point {AEB_RETURN_SYMBOL(@"point", typeType, 0x51447074);}
+ (instancetype)position {AEB_RETURN_SYMBOL(@"position", typeType, 0x70706f73);}
+ (instancetype)pounds {AEB_RETURN_SYMBOL(@"pounds", typeType, 0x6c627320);}
+ (instancetype)preamp {AEB_RETURN_SYMBOL(@"preamp", typeType, 0x70455141);}
+ (instancetype)printSettings {AEB_RETURN_SYMBOL(@"printSettings", typeType, 0x70736574);}
+ (instancetype)printerFeatures {AEB_RETURN_SYMBOL(@"printerFeatures", typeType, 0x6c777066);}
+ (instancetype)processSerialNumber {AEB_RETURN_SYMBOL(@"processSerialNumber", typeType, 0x70736e20);}
+ (instancetype)properties {AEB_RETURN_SYMBOL(@"properties", typeType, 0x70414c4c);}
+ (instancetype)property {AEB_RETURN_SYMBOL(@"property", typeType, 0x70726f70);}
+ (instancetype)propertyInfo {AEB_RETURN_SYMBOL(@"propertyInfo", typeType, 0x70696e66);}
+ (instancetype)quarts {AEB_RETURN_SYMBOL(@"quarts", typeType, 0x71727473);}
+ (instancetype)radioTunerPlaylist {AEB_RETURN_SYMBOL(@"radioTunerPlaylist", typeType, 0x63525450);}
+ (instancetype)rating {AEB_RETURN_SYMBOL(@"rating", typeType, 0x70527465);}
+ (instancetype)ratingKind {AEB_RETURN_SYMBOL(@"ratingKind", typeType, 0x7052746b);}
+ (instancetype)rawData {AEB_RETURN_SYMBOL(@"rawData", typeType, 0x74647461);}
+ (instancetype)record {AEB_RETURN_SYMBOL(@"record", typeType, 0x7265636f);}
+ (instancetype)reference {AEB_RETURN_SYMBOL(@"reference", typeType, 0x6f626a20);}
+ (instancetype)releaseDate {AEB_RETURN_SYMBOL(@"releaseDate", typeType, 0x70526c44);}
+ (instancetype)requestedPrintTime {AEB_RETURN_SYMBOL(@"requestedPrintTime", typeType, 0x6c777174);}
+ (instancetype)resizable {AEB_RETURN_SYMBOL(@"resizable", typeType, 0x7072737a);}
+ (instancetype)rotation {AEB_RETURN_SYMBOL(@"rotation", typeType, 0x74726f74);}
+ (instancetype)sampleRate {AEB_RETURN_SYMBOL(@"sampleRate", typeType, 0x70535274);}
+ (instancetype)script {AEB_RETURN_SYMBOL(@"script", typeType, 0x73637074);}
+ (instancetype)seasonNumber {AEB_RETURN_SYMBOL(@"seasonNumber", typeType, 0x7053654e);}
+ (instancetype)selection {AEB_RETURN_SYMBOL(@"selection", typeType, 0x73656c65);}
+ (instancetype)shared {AEB_RETURN_SYMBOL(@"shared", typeType, 0x70536872);}
+ (instancetype)sharedTrack {AEB_RETURN_SYMBOL(@"sharedTrack", typeType, 0x63536854);}
+ (instancetype)shortFloat {AEB_RETURN_SYMBOL(@"shortFloat", typeType, 0x73696e67);}
+ (instancetype)shortInteger {AEB_RETURN_SYMBOL(@"shortInteger", typeType, 0x73686f72);}
+ (instancetype)show {AEB_RETURN_SYMBOL(@"show", typeType, 0x70536877);}
+ (instancetype)shufflable {AEB_RETURN_SYMBOL(@"shufflable", typeType, 0x70536661);}
+ (instancetype)shuffle {AEB_RETURN_SYMBOL(@"shuffle", typeType, 0x70536866);}
+ (instancetype)size {AEB_RETURN_SYMBOL(@"size", typeType, 0x7053697a);}
+ (instancetype)skippedCount {AEB_RETURN_SYMBOL(@"skippedCount", typeType, 0x70536b43);}
+ (instancetype)skippedDate {AEB_RETURN_SYMBOL(@"skippedDate", typeType, 0x70536b44);}
+ (instancetype)smart {AEB_RETURN_SYMBOL(@"smart", typeType, 0x70536d74);}
+ (instancetype)songRepeat {AEB_RETURN_SYMBOL(@"songRepeat", typeType, 0x70527074);}
+ (instancetype)sortAlbum {AEB_RETURN_SYMBOL(@"sortAlbum", typeType, 0x7053416c);}
+ (instancetype)sortAlbumArtist {AEB_RETURN_SYMBOL(@"sortAlbumArtist", typeType, 0x70534141);}
+ (instancetype)sortArtist {AEB_RETURN_SYMBOL(@"sortArtist", typeType, 0x70534172);}
+ (instancetype)sortComposer {AEB_RETURN_SYMBOL(@"sortComposer", typeType, 0x7053436d);}
+ (instancetype)sortName {AEB_RETURN_SYMBOL(@"sortName", typeType, 0x70534e6d);}
+ (instancetype)sortShow {AEB_RETURN_SYMBOL(@"sortShow", typeType, 0x7053534e);}
+ (instancetype)soundVolume {AEB_RETURN_SYMBOL(@"soundVolume", typeType, 0x70566f6c);}
+ (instancetype)source {AEB_RETURN_SYMBOL(@"source", typeType, 0x63537263);}
+ (instancetype)specialKind {AEB_RETURN_SYMBOL(@"specialKind", typeType, 0x7053704b);}
+ (instancetype)squareFeet {AEB_RETURN_SYMBOL(@"squareFeet", typeType, 0x73716674);}
+ (instancetype)squareKilometers {AEB_RETURN_SYMBOL(@"squareKilometers", typeType, 0x73716b6d);}
+ (instancetype)squareMeters {AEB_RETURN_SYMBOL(@"squareMeters", typeType, 0x7371726d);}
+ (instancetype)squareMiles {AEB_RETURN_SYMBOL(@"squareMiles", typeType, 0x73716d69);}
+ (instancetype)squareYards {AEB_RETURN_SYMBOL(@"squareYards", typeType, 0x73717964);}
+ (instancetype)start {AEB_RETURN_SYMBOL(@"start", typeType, 0x70537472);}
+ (instancetype)startingPage {AEB_RETURN_SYMBOL(@"startingPage", typeType, 0x6c776670);}
+ (instancetype)string {AEB_RETURN_SYMBOL(@"string", typeType, 0x54455854);}
+ (instancetype)styledClipboardText {AEB_RETURN_SYMBOL(@"styledClipboardText", typeType, 0x7374796c);}
+ (instancetype)styledText {AEB_RETURN_SYMBOL(@"styledText", typeType, 0x53545854);}
+ (instancetype)styledUnicodeText {AEB_RETURN_SYMBOL(@"styledUnicodeText", typeType, 0x73757478);}
+ (instancetype)suiteInfo {AEB_RETURN_SYMBOL(@"suiteInfo", typeType, 0x7375696e);}
+ (instancetype)targetPrinter {AEB_RETURN_SYMBOL(@"targetPrinter", typeType, 0x74727072);}
+ (instancetype)textStyleInfo {AEB_RETURN_SYMBOL(@"textStyleInfo", typeType, 0x74737479);}
+ (instancetype)time {AEB_RETURN_SYMBOL(@"time", typeType, 0x7054696d);}
+ (instancetype)track {AEB_RETURN_SYMBOL(@"track", typeType, 0x6354726b);}
+ (instancetype)trackCount {AEB_RETURN_SYMBOL(@"trackCount", typeType, 0x70547243);}
+ (instancetype)trackNumber {AEB_RETURN_SYMBOL(@"trackNumber", typeType, 0x7054724e);}
+ (instancetype)typeClass {AEB_RETURN_SYMBOL(@"typeClass", typeType, 0x74797065);}
+ (instancetype)unplayed {AEB_RETURN_SYMBOL(@"unplayed", typeType, 0x70556e70);}
+ (instancetype)unsignedInteger {AEB_RETURN_SYMBOL(@"unsignedInteger", typeType, 0x6d61676e);}
+ (instancetype)updateTracks {AEB_RETURN_SYMBOL(@"updateTracks", typeType, 0x70555443);}
+ (instancetype)userPlaylist {AEB_RETURN_SYMBOL(@"userPlaylist", typeType, 0x63557350);}
+ (instancetype)version_ {AEB_RETURN_SYMBOL(@"version_", typeType, 0x76657273);}
+ (instancetype)videoKind {AEB_RETURN_SYMBOL(@"videoKind", typeType, 0x7056644b);}
+ (instancetype)view {AEB_RETURN_SYMBOL(@"view", typeType, 0x70506c79);}
+ (instancetype)visible {AEB_RETURN_SYMBOL(@"visible", typeType, 0x70766973);}
+ (instancetype)visual {AEB_RETURN_SYMBOL(@"visual", typeType, 0x63566973);}
+ (instancetype)visualSize {AEB_RETURN_SYMBOL(@"visualSize", typeType, 0x7056537a);}
+ (instancetype)visualsEnabled {AEB_RETURN_SYMBOL(@"visualsEnabled", typeType, 0x70567345);}
+ (instancetype)volumeAdjustment {AEB_RETURN_SYMBOL(@"volumeAdjustment", typeType, 0x7041646a);}
+ (instancetype)window {AEB_RETURN_SYMBOL(@"window", typeType, 0x6377696e);}
+ (instancetype)writingCode {AEB_RETURN_SYMBOL(@"writingCode", typeType, 0x70736374);}
+ (instancetype)yards {AEB_RETURN_SYMBOL(@"yards", typeType, 0x79617264);}
+ (instancetype)year {AEB_RETURN_SYMBOL(@"year", typeType, 0x70597220);}
+ (instancetype)zoomable {AEB_RETURN_SYMBOL(@"zoomable", typeType, 0x69737a6d);}
+ (instancetype)zoomed {AEB_RETURN_SYMBOL(@"zoomed", typeType, 0x707a756d);}
// Enumerators
+ (instancetype)Books {AEB_RETURN_SYMBOL(@"Books", typeEnumerated, 0x6b537041);}
+ (instancetype)Genius {AEB_RETURN_SYMBOL(@"Genius", typeEnumerated, 0x6b537047);}
+ (instancetype)Library {AEB_RETURN_SYMBOL(@"Library", typeEnumerated, 0x6b53704c);}
+ (instancetype)MP3CD {AEB_RETURN_SYMBOL(@"MP3CD", typeEnumerated, 0x6b4d4344);}
+ (instancetype)Movies {AEB_RETURN_SYMBOL(@"Movies", typeEnumerated, 0x6b537049);}
+ (instancetype)Music {AEB_RETURN_SYMBOL(@"Music", typeEnumerated, 0x6b53705a);}
+ (instancetype)PartyShuffle {AEB_RETURN_SYMBOL(@"PartyShuffle", typeEnumerated, 0x6b537053);}
+ (instancetype)Podcasts {AEB_RETURN_SYMBOL(@"Podcasts", typeEnumerated, 0x6b537050);}
+ (instancetype)PurchasedMusic {AEB_RETURN_SYMBOL(@"PurchasedMusic", typeEnumerated, 0x6b53704d);}
+ (instancetype)TVShow {AEB_RETURN_SYMBOL(@"TVShow", typeEnumerated, 0x6b566454);}
+ (instancetype)TVShows {AEB_RETURN_SYMBOL(@"TVShows", typeEnumerated, 0x6b537054);}
+ (instancetype)albumListing {AEB_RETURN_SYMBOL(@"albumListing", typeEnumerated, 0x6b416c62);}
+ (instancetype)albums {AEB_RETURN_SYMBOL(@"albums", typeEnumerated, 0x6b53724c);}
+ (instancetype)all {AEB_RETURN_SYMBOL(@"all", typeEnumerated, 0x6b416c6c);}
+ (instancetype)applicationResponses {AEB_RETURN_SYMBOL(@"applicationResponses", typeEnumerated, 0x726d7465);}
+ (instancetype)artists {AEB_RETURN_SYMBOL(@"artists", typeEnumerated, 0x6b537252);}
+ (instancetype)ask {AEB_RETURN_SYMBOL(@"ask", typeEnumerated, 0x61736b20);}
+ (instancetype)audioCD {AEB_RETURN_SYMBOL(@"audioCD", typeEnumerated, 0x6b414344);}
+ (instancetype)case_ {AEB_RETURN_SYMBOL(@"case_", typeEnumerated, 0x63617365);}
+ (instancetype)cdInsert {AEB_RETURN_SYMBOL(@"cdInsert", typeEnumerated, 0x6b434469);}
+ (instancetype)composers {AEB_RETURN_SYMBOL(@"composers", typeEnumerated, 0x6b537243);}
+ (instancetype)computed {AEB_RETURN_SYMBOL(@"computed", typeEnumerated, 0x6b527443);}
+ (instancetype)detailed {AEB_RETURN_SYMBOL(@"detailed", typeEnumerated, 0x6c776474);}
+ (instancetype)device {AEB_RETURN_SYMBOL(@"device", typeEnumerated, 0x6b446576);}
+ (instancetype)diacriticals {AEB_RETURN_SYMBOL(@"diacriticals", typeEnumerated, 0x64696163);}
+ (instancetype)displayed {AEB_RETURN_SYMBOL(@"displayed", typeEnumerated, 0x6b537256);}
+ (instancetype)expansion {AEB_RETURN_SYMBOL(@"expansion", typeEnumerated, 0x65787061);}
+ (instancetype)fastForwarding {AEB_RETURN_SYMBOL(@"fastForwarding", typeEnumerated, 0x6b505346);}
+ (instancetype)folder {AEB_RETURN_SYMBOL(@"folder", typeEnumerated, 0x6b537046);}
+ (instancetype)hyphens {AEB_RETURN_SYMBOL(@"hyphens", typeEnumerated, 0x68797068);}
+ (instancetype)iPod {AEB_RETURN_SYMBOL(@"iPod", typeEnumerated, 0x6b506f64);}
+ (instancetype)iTunesU {AEB_RETURN_SYMBOL(@"iTunesU", typeEnumerated, 0x6b537055);}
+ (instancetype)large {AEB_RETURN_SYMBOL(@"large", typeEnumerated, 0x6b56534c);}
+ (instancetype)library {AEB_RETURN_SYMBOL(@"library", typeEnumerated, 0x6b4c6962);}
+ (instancetype)medium {AEB_RETURN_SYMBOL(@"medium", typeEnumerated, 0x6b56534d);}
+ (instancetype)movie {AEB_RETURN_SYMBOL(@"movie", typeEnumerated, 0x6b56644d);}
+ (instancetype)musicVideo {AEB_RETURN_SYMBOL(@"musicVideo", typeEnumerated, 0x6b566456);}
+ (instancetype)no {AEB_RETURN_SYMBOL(@"no", typeEnumerated, 0x6e6f2020);}
+ (instancetype)none {AEB_RETURN_SYMBOL(@"none", typeEnumerated, 0x6b4e6f6e);}
+ (instancetype)numericStrings {AEB_RETURN_SYMBOL(@"numericStrings", typeEnumerated, 0x6e756d65);}
+ (instancetype)off {AEB_RETURN_SYMBOL(@"off", typeEnumerated, 0x6b52704f);}
+ (instancetype)one {AEB_RETURN_SYMBOL(@"one", typeEnumerated, 0x6b527031);}
+ (instancetype)paused {AEB_RETURN_SYMBOL(@"paused", typeEnumerated, 0x6b505370);}
+ (instancetype)playing {AEB_RETURN_SYMBOL(@"playing", typeEnumerated, 0x6b505350);}
+ (instancetype)punctuation {AEB_RETURN_SYMBOL(@"punctuation", typeEnumerated, 0x70756e63);}
+ (instancetype)radioTuner {AEB_RETURN_SYMBOL(@"radioTuner", typeEnumerated, 0x6b54756e);}
+ (instancetype)rewinding {AEB_RETURN_SYMBOL(@"rewinding", typeEnumerated, 0x6b505352);}
+ (instancetype)sharedLibrary {AEB_RETURN_SYMBOL(@"sharedLibrary", typeEnumerated, 0x6b536864);}
+ (instancetype)small {AEB_RETURN_SYMBOL(@"small", typeEnumerated, 0x6b565353);}
+ (instancetype)songs {AEB_RETURN_SYMBOL(@"songs", typeEnumerated, 0x6b537253);}
+ (instancetype)standard {AEB_RETURN_SYMBOL(@"standard", typeEnumerated, 0x6c777374);}
+ (instancetype)stopped {AEB_RETURN_SYMBOL(@"stopped", typeEnumerated, 0x6b505353);}
+ (instancetype)trackListing {AEB_RETURN_SYMBOL(@"trackListing", typeEnumerated, 0x6b54726b);}
+ (instancetype)unknown {AEB_RETURN_SYMBOL(@"unknown", typeEnumerated, 0x6b556e6b);}
+ (instancetype)user {AEB_RETURN_SYMBOL(@"user", typeEnumerated, 0x6b527455);}
+ (instancetype)whitespace {AEB_RETURN_SYMBOL(@"whitespace", typeEnumerated, 0x77686974);}
+ (instancetype)yes {AEB_RETURN_SYMBOL(@"yes", typeEnumerated, 0x79657320);}
@end




@implementation ITUActivateCommand
- (NSString *)aebCommandName {
    return @"activate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUAddCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (NSString *)aebCommandName {
    return @"add";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUBackTrackCommand
- (NSString *)aebCommandName {
    return @"backTrack";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUCloseCommand
- (NSString *)aebCommandName {
    return @"close";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUConvertCommand
- (NSString *)aebCommandName {
    return @"convert";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUCountCommand
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

@implementation ITUDeleteCommand
- (NSString *)aebCommandName {
    return @"delete";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUDownloadCommand
- (NSString *)aebCommandName {
    return @"download";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUDuplicateCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (NSString *)aebCommandName {
    return @"duplicate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUEjectCommand
- (NSString *)aebCommandName {
    return @"eject";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUExistsCommand
- (NSString *)aebCommandName {
    return @"exists";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUFastForwardCommand
- (NSString *)aebCommandName {
    return @"fastForward";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUGetCommand
- (NSString *)aebCommandName {
    return @"get";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITULaunchCommand
- (NSString *)aebCommandName {
    return @"launch";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUMakeCommand
- (instancetype)at_:(id)value {
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
- (NSString *)aebCommandName {
    return @"make";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"at_";
        case 0x6b6f636c: return @"new_";
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUMoveCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 0x696e7368];
    return self;
}
- (NSString *)aebCommandName {
    return @"move";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x696e7368: return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUNextTrackCommand
- (NSString *)aebCommandName {
    return @"nextTrack";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUOpenCommand
- (NSString *)aebCommandName {
    return @"open";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUOpenLocationCommand
- (NSString *)aebCommandName {
    return @"openLocation";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUPauseCommand
- (NSString *)aebCommandName {
    return @"pause";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUPlayCommand
- (instancetype)once:(id)value {
    [self setParameter: value forKeyword: 0x504f6e65];
    return self;
}
- (NSString *)aebCommandName {
    return @"play";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x504f6e65: return @"once";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUPlaypauseCommand
- (NSString *)aebCommandName {
    return @"playpause";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUPreviousTrackCommand
- (NSString *)aebCommandName {
    return @"previousTrack";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUPrintCommand
- (instancetype)kind:(id)value {
    [self setParameter: value forKeyword: 0x704b6e64];
    return self;
}
- (instancetype)theme:(id)value {
    [self setParameter: value forKeyword: 0x7054686d];
    return self;
}
- (instancetype)printDialog:(id)value {
    [self setParameter: value forKeyword: 0x70646c67];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 0x70726474];
    return self;
}
- (NSString *)aebCommandName {
    return @"print";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x704b6e64: return @"kind";
        case 0x7054686d: return @"theme";
        case 0x70646c67: return @"printDialog";
        case 0x70726474: return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUQuitCommand
- (NSString *)aebCommandName {
    return @"quit";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITURefreshCommand
- (NSString *)aebCommandName {
    return @"refresh";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUReopenCommand
- (NSString *)aebCommandName {
    return @"reopen";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUResumeCommand
- (NSString *)aebCommandName {
    return @"resume";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITURevealCommand
- (NSString *)aebCommandName {
    return @"reveal";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITURewindCommand
- (NSString *)aebCommandName {
    return @"rewind";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITURunCommand
- (NSString *)aebCommandName {
    return @"run";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUSearchCommand
- (instancetype)only:(id)value {
    [self setParameter: value forKeyword: 0x70417265];
    return self;
}
- (instancetype)for_:(id)value {
    [self setParameter: value forKeyword: 0x7054726d];
    return self;
}
- (NSString *)aebCommandName {
    return @"search";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 0x70417265: return @"only";
        case 0x7054726d: return @"for_";
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUSetCommand
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

@implementation ITUStopCommand
- (NSString *)aebCommandName {
    return @"stop";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUSubscribeCommand
- (NSString *)aebCommandName {
    return @"subscribe";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUUpdateCommand
- (NSString *)aebCommandName {
    return @"update";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUUpdateAllPodcastsCommand
- (NSString *)aebCommandName {
    return @"updateAllPodcasts";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end

@implementation ITUUpdatePodcastCommand
- (NSString *)aebCommandName {
    return @"updatePodcast";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
    }
    return [super aebParameterNameForCode: code];
}
@end




@implementation ITUSpecifier
- (NSString *)description {
    return [ITUFormatter formatObject: self.aemQuery appData: self.aebAppData];
}
// Properties
- (instancetype)EQ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455170]];
}
- (instancetype)EQEnabled {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455120]];
}
- (instancetype)address {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7055524c]];
}
- (instancetype)album {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70416c62]];
}
- (instancetype)albumArtist {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70416c41]];
}
- (instancetype)albumRating {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70416c52]];
}
- (instancetype)albumRatingKind {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7041526b]];
}
- (instancetype)artist {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70417274]];
}
- (instancetype)band1 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455131]];
}
- (instancetype)band10 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455130]];
}
- (instancetype)band2 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455132]];
}
- (instancetype)band3 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455133]];
}
- (instancetype)band4 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455134]];
}
- (instancetype)band5 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455135]];
}
- (instancetype)band6 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455136]];
}
- (instancetype)band7 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455137]];
}
- (instancetype)band8 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455138]];
}
- (instancetype)band9 {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455139]];
}
- (instancetype)bitRate {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70425274]];
}
- (instancetype)bookmark {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70426b74]];
}
- (instancetype)bookmarkable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70426b6d]];
}
- (instancetype)bounds {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70626e64]];
}
- (instancetype)bpm {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7042504d]];
}
- (instancetype)capacity {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63617061]];
}
- (instancetype)category {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70436174]];
}
- (instancetype)class_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70636c73]];
}
- (instancetype)closeable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x68636c62]];
}
- (instancetype)collapseable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70575368]];
}
- (instancetype)collapsed {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x77736864]];
}
- (instancetype)collating {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c77636c]];
}
- (instancetype)comment {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70436d74]];
}
- (instancetype)compilation {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70416e74]];
}
- (instancetype)composer {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70436d70]];
}
- (instancetype)container {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x63746e72]];
}
- (instancetype)copies {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776370]];
}
- (instancetype)currentEQPreset {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455150]];
}
- (instancetype)currentEncoder {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70456e63]];
}
- (instancetype)currentPlaylist {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506c61]];
}
- (instancetype)currentStreamTitle {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70537454]];
}
- (instancetype)currentStreamURL {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70537455]];
}
- (instancetype)currentTrack {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7054726b]];
}
- (instancetype)currentVisual {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70566973]];
}
- (instancetype)data_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70504354]];
}
- (instancetype)databaseID {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70444944]];
}
- (instancetype)dateAdded {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70416464]];
}
- (instancetype)description_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70446573]];
}
- (instancetype)discCount {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70447343]];
}
- (instancetype)discNumber {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7044734e]];
}
- (instancetype)downloaded {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70446c41]];
}
- (instancetype)duration {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70447572]];
}
- (instancetype)enabled {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x656e626c]];
}
- (instancetype)endingPage {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c70]];
}
- (instancetype)episodeID {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70457044]];
}
- (instancetype)episodeNumber {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7045704e]];
}
- (instancetype)errorHandling {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776568]];
}
- (instancetype)faxNumber {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6661786e]];
}
- (instancetype)finish {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70537470]];
}
- (instancetype)fixedIndexing {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70466978]];
}
- (instancetype)format {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70466d74]];
}
- (instancetype)freeSpace {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x66727370]];
}
- (instancetype)frontmost {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70697366]];
}
- (instancetype)fullScreen {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70465363]];
}
- (instancetype)gapless {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7047706c]];
}
- (instancetype)genre {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7047656e]];
}
- (instancetype)grouping {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70477270]];
}
- (instancetype)id_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x49442020]];
}
- (instancetype)index {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70696478]];
}
- (instancetype)kind {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704b6e64]];
}
- (instancetype)location {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704c6f63]];
}
- (instancetype)longDescription {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704c6473]];
}
- (instancetype)lyrics {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704c7972]];
}
- (instancetype)minimized {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704d696e]];
}
- (instancetype)modifiable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704d6f64]];
}
- (instancetype)modificationDate {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x61736d6f]];
}
- (instancetype)mute {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x704d7574]];
}
- (instancetype)name {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x706e616d]];
}
- (instancetype)pagesAcross {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c61]];
}
- (instancetype)pagesDown {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776c64]];
}
- (instancetype)parent {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506c50]];
}
- (instancetype)persistentID {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70504953]];
}
- (instancetype)playedCount {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506c43]];
}
- (instancetype)playedDate {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506c44]];
}
- (instancetype)playerPosition {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506f73]];
}
- (instancetype)playerState {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506c53]];
}
- (instancetype)podcast {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70545063]];
}
- (instancetype)position {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70706f73]];
}
- (instancetype)preamp {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70455141]];
}
- (instancetype)printerFeatures {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c777066]];
}
- (instancetype)properties {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70414c4c]];
}
- (instancetype)rating {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70527465]];
}
- (instancetype)ratingKind {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7052746b]];
}
- (instancetype)rawData {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70526177]];
}
- (instancetype)releaseDate {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70526c44]];
}
- (instancetype)requestedPrintTime {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c777174]];
}
- (instancetype)resizable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7072737a]];
}
- (instancetype)sampleRate {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70535274]];
}
- (instancetype)seasonNumber {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7053654e]];
}
- (instancetype)selection {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x73656c65]];
}
- (instancetype)shared {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536872]];
}
- (instancetype)show {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536877]];
}
- (instancetype)shufflable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536661]];
}
- (instancetype)shuffle {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536866]];
}
- (instancetype)size {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7053697a]];
}
- (instancetype)skippedCount {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536b43]];
}
- (instancetype)skippedDate {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536b44]];
}
- (instancetype)smart {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70536d74]];
}
- (instancetype)songRepeat {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70527074]];
}
- (instancetype)sortAlbum {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7053416c]];
}
- (instancetype)sortAlbumArtist {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70534141]];
}
- (instancetype)sortArtist {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70534172]];
}
- (instancetype)sortComposer {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7053436d]];
}
- (instancetype)sortName {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70534e6d]];
}
- (instancetype)sortShow {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7053534e]];
}
- (instancetype)soundVolume {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70566f6c]];
}
- (instancetype)specialKind {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7053704b]];
}
- (instancetype)start {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70537472]];
}
- (instancetype)startingPage {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x6c776670]];
}
- (instancetype)targetPrinter {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x74727072]];
}
- (instancetype)time {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7054696d]];
}
- (instancetype)trackCount {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70547243]];
}
- (instancetype)trackNumber {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7054724e]];
}
- (instancetype)unplayed {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70556e70]];
}
- (instancetype)updateTracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70555443]];
}
- (instancetype)version_ {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x76657273]];
}
- (instancetype)videoKind {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7056644b]];
}
- (instancetype)view {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70506c79]];
}
- (instancetype)visible {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70766973]];
}
- (instancetype)visualSize {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7056537a]];
}
- (instancetype)visualsEnabled {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70567345]];
}
- (instancetype)volumeAdjustment {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x7041646a]];
}
- (instancetype)year {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x70597220]];
}
- (instancetype)zoomable {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x69737a6d]];
}
- (instancetype)zoomed {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery property: 0x707a756d]];
}
// Elements
- (instancetype)EQPresets {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63455150]];
}
- (instancetype)EQWindows {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63455157]];
}
- (instancetype)URLTracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63555254]];
}
- (instancetype)applications {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63617070]];
}
- (instancetype)artworks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63417274]];
}
- (instancetype)audioCDPlaylists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63434450]];
}
- (instancetype)audioCDTracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63434454]];
}
- (instancetype)browserWindows {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63427257]];
}
- (instancetype)devicePlaylists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63447650]];
}
- (instancetype)deviceTracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63447654]];
}
- (instancetype)encoders {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63456e63]];
}
- (instancetype)fileTracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63466c54]];
}
- (instancetype)folderPlaylists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63466f50]];
}
- (instancetype)items {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x636f626a]];
}
- (instancetype)libraryPlaylists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x634c6950]];
}
- (instancetype)picture {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x50494354]];
}
- (instancetype)playlistWindows {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63506c57]];
}
- (instancetype)playlists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63506c79]];
}
- (instancetype)printSettings {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x70736574]];
}
- (instancetype)radioTunerPlaylists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63525450]];
}
- (instancetype)sharedTracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63536854]];
}
- (instancetype)sources {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63537263]];
}
- (instancetype)tracks {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6354726b]];
}
- (instancetype)userPlaylists {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63557350]];
}
- (instancetype)visuals {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x63566973]];
}
- (instancetype)windows {
    return [self.class specifierWithAppData: self.aebAppData
                                   aemQuery: [(AEMObjectSpecifier *)self.aemQuery elements: 0x6377696e]];
}
// Commands
- (ITUActivateCommand *)activate {
    return [ITUActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUActivateCommand *)activate:(id)directParameter {
    return [ITUActivateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x6d697363
                          eventID: 0x61637476
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUAddCommand *)add {
    return [ITUAddCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x41646420
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUAddCommand *)add:(id)directParameter {
    return [ITUAddCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x41646420
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUBackTrackCommand *)backTrack {
    return [ITUBackTrackCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x4261636b
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUBackTrackCommand *)backTrack:(id)directParameter {
    return [ITUBackTrackCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x4261636b
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUCloseCommand *)close {
    return [ITUCloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUCloseCommand *)close:(id)directParameter {
    return [ITUCloseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f73
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUConvertCommand *)convert {
    return [ITUConvertCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x436f6e76
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUConvertCommand *)convert:(id)directParameter {
    return [ITUConvertCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x436f6e76
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUCountCommand *)count {
    return [ITUCountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUCountCommand *)count:(id)directParameter {
    return [ITUCountCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636e7465
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUDeleteCommand *)delete {
    return [ITUDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUDeleteCommand *)delete:(id)directParameter {
    return [ITUDeleteCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x64656c6f
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUDownloadCommand *)download {
    return [ITUDownloadCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x44776e6c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUDownloadCommand *)download:(id)directParameter {
    return [ITUDownloadCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x44776e6c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUDuplicateCommand *)duplicate {
    return [ITUDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUDuplicateCommand *)duplicate:(id)directParameter {
    return [ITUDuplicateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x636c6f6e
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUEjectCommand *)eject {
    return [ITUEjectCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x456a6374
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUEjectCommand *)eject:(id)directParameter {
    return [ITUEjectCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x456a6374
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUExistsCommand *)exists {
    return [ITUExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUExistsCommand *)exists:(id)directParameter {
    return [ITUExistsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x646f6578
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUFastForwardCommand *)fastForward {
    return [ITUFastForwardCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x46617374
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUFastForwardCommand *)fastForward:(id)directParameter {
    return [ITUFastForwardCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x46617374
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUGetCommand *)get {
    return [ITUGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUGetCommand *)get:(id)directParameter {
    return [ITUGetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x67657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITULaunchCommand *)launch {
    return [ITULaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITULaunchCommand *)launch:(id)directParameter {
    return [ITULaunchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61736372
                          eventID: 0x6e6f6f70
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUMakeCommand *)make {
    return [ITUMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUMakeCommand *)make:(id)directParameter {
    return [ITUMakeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6372656c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUMoveCommand *)move {
    return [ITUMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUMoveCommand *)move:(id)directParameter {
    return [ITUMoveCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x6d6f7665
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUNextTrackCommand *)nextTrack {
    return [ITUNextTrackCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x4e657874
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUNextTrackCommand *)nextTrack:(id)directParameter {
    return [ITUNextTrackCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x4e657874
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUOpenCommand *)open {
    return [ITUOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUOpenCommand *)open:(id)directParameter {
    return [ITUOpenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUOpenLocationCommand *)openLocation {
    return [ITUOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUOpenLocationCommand *)openLocation:(id)directParameter {
    return [ITUOpenLocationCommand commandWithAppData: self.aebAppData
                       eventClass: 0x4755524c
                          eventID: 0x4755524c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUPauseCommand *)pause {
    return [ITUPauseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x50617573
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUPauseCommand *)pause:(id)directParameter {
    return [ITUPauseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x50617573
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUPlayCommand *)play {
    return [ITUPlayCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x506c6179
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUPlayCommand *)play:(id)directParameter {
    return [ITUPlayCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x506c6179
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUPlaypauseCommand *)playpause {
    return [ITUPlaypauseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x506c5073
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUPlaypauseCommand *)playpause:(id)directParameter {
    return [ITUPlaypauseCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x506c5073
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUPreviousTrackCommand *)previousTrack {
    return [ITUPreviousTrackCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x50726576
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUPreviousTrackCommand *)previousTrack:(id)directParameter {
    return [ITUPreviousTrackCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x50726576
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUPrintCommand *)print {
    return [ITUPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUPrintCommand *)print:(id)directParameter {
    return [ITUPrintCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x70646f63
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUQuitCommand *)quit {
    return [ITUQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUQuitCommand *)quit:(id)directParameter {
    return [ITUQuitCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x71756974
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITURefreshCommand *)refresh {
    return [ITURefreshCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x52667273
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITURefreshCommand *)refresh:(id)directParameter {
    return [ITURefreshCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x52667273
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUReopenCommand *)reopen {
    return [ITUReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUReopenCommand *)reopen:(id)directParameter {
    return [ITUReopenCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x72617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUResumeCommand *)resume {
    return [ITUResumeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x52657375
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUResumeCommand *)resume:(id)directParameter {
    return [ITUResumeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x52657375
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITURevealCommand *)reveal {
    return [ITURevealCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x5265766c
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITURevealCommand *)reveal:(id)directParameter {
    return [ITURevealCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x5265766c
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITURewindCommand *)rewind {
    return [ITURewindCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x52776e64
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITURewindCommand *)rewind:(id)directParameter {
    return [ITURewindCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x52776e64
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITURunCommand *)run {
    return [ITURunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITURunCommand *)run:(id)directParameter {
    return [ITURunCommand commandWithAppData: self.aebAppData
                       eventClass: 0x61657674
                          eventID: 0x6f617070
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUSearchCommand *)search {
    return [ITUSearchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x53726368
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUSearchCommand *)search:(id)directParameter {
    return [ITUSearchCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x53726368
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUSetCommand *)set {
    return [ITUSetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUSetCommand *)set:(id)directParameter {
    return [ITUSetCommand commandWithAppData: self.aebAppData
                       eventClass: 0x636f7265
                          eventID: 0x73657464
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUStopCommand *)stop {
    return [ITUStopCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x53746f70
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUStopCommand *)stop:(id)directParameter {
    return [ITUStopCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x53746f70
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUSubscribeCommand *)subscribe {
    return [ITUSubscribeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x70537562
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUSubscribeCommand *)subscribe:(id)directParameter {
    return [ITUSubscribeCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x70537562
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUUpdateCommand *)update {
    return [ITUUpdateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x55706474
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUUpdateCommand *)update:(id)directParameter {
    return [ITUUpdateCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x55706474
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUUpdateAllPodcastsCommand *)updateAllPodcasts {
    return [ITUUpdateAllPodcastsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x55706470
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUUpdateAllPodcastsCommand *)updateAllPodcasts:(id)directParameter {
    return [ITUUpdateAllPodcastsCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x55706470
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
- (ITUUpdatePodcastCommand *)updatePodcast {
    return [ITUUpdatePodcastCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x55706431
                  directParameter: (__bridge id)kAEBNoDirectParameter
                      parentQuery: self.aemQuery];
}
- (ITUUpdatePodcastCommand *)updatePodcast:(id)directParameter {
    return [ITUUpdatePodcastCommand commandWithAppData: self.aebAppData
                       eventClass: 0x686f6f6b
                          eventID: 0x55706431
                  directParameter: directParameter
                      parentQuery: self.aemQuery];
}
@end




@implementation ITUApplication

/* note: clients shouldn't need to call -initWithTargetType:data: themselves */

- (instancetype)initWithTargetType:(AEBTargetType)targetType_ data:(id)targetData_ {
    AEBStaticAppData *data = [[AEBStaticAppData alloc] initWithApplicationClass: AEMApplication.class
                                                                    symbolClass: ITUSymbol.class
                                                                 specifierClass: ITUSpecifier.class
                                                                     targetType: targetType_
                                                                     targetData: targetData_];
    self = [super initWithAppData: data aemQuery: AEMApp];

    if (!self) return self;
    return self;
}

/* initialisers */

+ (instancetype)application {
    return [[self alloc] init];
}
+ (instancetype)currentApplication {
    return [[self alloc] initCurrentApplication];
}
+ (instancetype)applicationWithName:(NSString *)name {
    return [[self alloc] initWithName: name];
}
+ (instancetype)applicationWithURL:(NSURL *)url {
    return [[self alloc] initWithURL: url];
}
+ (instancetype)applicationWithBundleID:(NSString *)bundleID {
    return [[self alloc] initWithBundleID: bundleID];
}
+ (instancetype)applicationWithProcessID:(pid_t)pid {
    return [[self alloc] initWithProcessID: pid];
}
+ (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [[self alloc] initWithDescriptor: desc];
}
- (instancetype)init {
    return [self initWithBundleID: @"com.apple.iTunes"];
}
- (instancetype)initCurrentApplication {
    return [self initWithTargetType: kAEBTargetCurrent data: nil];
}
- (instancetype)initWithName:(NSString *)name {
    return [self initWithTargetType: kAEBTargetName data: name];
}
- (instancetype)initWithURL:(NSURL *)url {
    return [self initWithTargetType: kAEBTargetURL data: url];
}
- (instancetype)initWithBundleID:(NSString *)bundleID {
    return [self initWithTargetType: kAEBTargetBundleID data: bundleID];
}
- (instancetype)initWithProcessID:(pid_t)pid {
    return [self initWithTargetType: kAEBTargetProcessID data: [NSNumber numberWithInteger: pid]];
}
- (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc {
    return [self initWithTargetType: kAEBTargetDescriptor data: desc];
}

/* misc */

- (ITUSpecifier *)customRoot:(id)object {
    if ([object isKindOfClass: ITUSpecifier.class]) {
        return [[ITUSpecifier alloc] initWithAppData: self.aebAppData aemQuery: [object aemQuery]];
    } else if ([object isKindOfClass: AEMQuery.class]) {
        return [[ITUSpecifier alloc] initWithAppData: self.aebAppData aemQuery: object];
    } else if (!object) {
        return [[ITUSpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMApp];
    } else {
        return [[ITUSpecifier alloc] initWithAppData: self.aebAppData aemQuery: AEMRoot(object)];
    }
}
@end

