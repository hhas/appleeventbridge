//
// ITUGlue.swift
// iTunes.app 12.1.2
// AppleEventBridge.framework 0.7.0
// aebglue -r iTunes
//

import Foundation
import AppleEventBridge

// TO DO: decide if generic specifier roots should appear as app/con/its static vars on XXSymbol class, or as XXApp/XXCon/XXIts vars on module


class ITUFormatter: SwiftAEFormatter { // used internally to generate description strings

    override var prefix: String {return "ITU"}
    override var appClassName: String {return "ITunes"}
    override var symbolClass: AEBSymbol.Type {return ITUSymbol.self}
    
    override func propertyByCode(code: OSType) -> String? {
        switch code {
        case 0x70455170: return "EQ"
        case 0x70455120: return "EQEnabled"
        case 0x7055524c: return "address"
        case 0x70416c62: return "album"
        case 0x70416c41: return "albumArtist"
        case 0x70416c52: return "albumRating"
        case 0x7041526b: return "albumRatingKind"
        case 0x70417274: return "artist"
        case 0x70455131: return "band1"
        case 0x70455130: return "band10"
        case 0x70455132: return "band2"
        case 0x70455133: return "band3"
        case 0x70455134: return "band4"
        case 0x70455135: return "band5"
        case 0x70455136: return "band6"
        case 0x70455137: return "band7"
        case 0x70455138: return "band8"
        case 0x70455139: return "band9"
        case 0x70425274: return "bitRate"
        case 0x70426b74: return "bookmark"
        case 0x70426b6d: return "bookmarkable"
        case 0x70626e64: return "bounds"
        case 0x7042504d: return "bpm"
        case 0x63617061: return "capacity"
        case 0x70436174: return "category"
        case 0x70636c73: return "class_"
        case 0x68636c62: return "closeable"
        case 0x70575368: return "collapseable"
        case 0x77736864: return "collapsed"
        case 0x6c77636c: return "collating"
        case 0x70436d74: return "comment"
        case 0x70416e74: return "compilation"
        case 0x70436d70: return "composer"
        case 0x63746e72: return "container"
        case 0x6c776370: return "copies"
        case 0x70455150: return "currentEQPreset"
        case 0x70456e63: return "currentEncoder"
        case 0x70506c61: return "currentPlaylist"
        case 0x70537454: return "currentStreamTitle"
        case 0x70537455: return "currentStreamURL"
        case 0x7054726b: return "currentTrack"
        case 0x70566973: return "currentVisual"
        case 0x70504354: return "data_"
        case 0x70444944: return "databaseID"
        case 0x70416464: return "dateAdded"
        case 0x70446573: return "description_"
        case 0x70447343: return "discCount"
        case 0x7044734e: return "discNumber"
        case 0x70446c41: return "downloaded"
        case 0x70447572: return "duration"
        case 0x656e626c: return "enabled"
        case 0x6c776c70: return "endingPage"
        case 0x70457044: return "episodeID"
        case 0x7045704e: return "episodeNumber"
        case 0x6c776568: return "errorHandling"
        case 0x6661786e: return "faxNumber"
        case 0x70537470: return "finish"
        case 0x70466978: return "fixedIndexing"
        case 0x70466d74: return "format"
        case 0x66727370: return "freeSpace"
        case 0x70697366: return "frontmost"
        case 0x70465363: return "fullScreen"
        case 0x7047706c: return "gapless"
        case 0x7047656e: return "genre"
        case 0x70477270: return "grouping"
        case 0x49442020: return "id"
        case 0x70696478: return "index"
        case 0x704b6e64: return "kind"
        case 0x704c6f63: return "location"
        case 0x704c6473: return "longDescription"
        case 0x704c7972: return "lyrics"
        case 0x704d696e: return "minimized"
        case 0x704d6f64: return "modifiable"
        case 0x61736d6f: return "modificationDate"
        case 0x704d7574: return "mute"
        case 0x706e616d: return "name"
        case 0x6c776c61: return "pagesAcross"
        case 0x6c776c64: return "pagesDown"
        case 0x70506c50: return "parent"
        case 0x70504953: return "persistentID"
        case 0x70506c43: return "playedCount"
        case 0x70506c44: return "playedDate"
        case 0x70506f73: return "playerPosition"
        case 0x70506c53: return "playerState"
        case 0x70545063: return "podcast"
        case 0x70706f73: return "position"
        case 0x70455141: return "preamp"
        case 0x6c777066: return "printerFeatures"
        case 0x70414c4c: return "properties"
        case 0x70527465: return "rating"
        case 0x7052746b: return "ratingKind"
        case 0x70526177: return "rawData"
        case 0x70526c44: return "releaseDate"
        case 0x6c777174: return "requestedPrintTime"
        case 0x7072737a: return "resizable"
        case 0x70535274: return "sampleRate"
        case 0x7053654e: return "seasonNumber"
        case 0x73656c65: return "selection"
        case 0x70536872: return "shared"
        case 0x70536877: return "show"
        case 0x70536661: return "shufflable"
        case 0x70536866: return "shuffle"
        case 0x7053697a: return "size"
        case 0x70536b43: return "skippedCount"
        case 0x70536b44: return "skippedDate"
        case 0x70536d74: return "smart"
        case 0x70527074: return "songRepeat"
        case 0x7053416c: return "sortAlbum"
        case 0x70534141: return "sortAlbumArtist"
        case 0x70534172: return "sortArtist"
        case 0x7053436d: return "sortComposer"
        case 0x70534e6d: return "sortName"
        case 0x7053534e: return "sortShow"
        case 0x70566f6c: return "soundVolume"
        case 0x7053704b: return "specialKind"
        case 0x70537472: return "start"
        case 0x6c776670: return "startingPage"
        case 0x74727072: return "targetPrinter"
        case 0x7054696d: return "time"
        case 0x70547243: return "trackCount"
        case 0x7054724e: return "trackNumber"
        case 0x70556e70: return "unplayed"
        case 0x70555443: return "updateTracks"
        case 0x76657273: return "version_"
        case 0x7056644b: return "videoKind"
        case 0x70506c79: return "view"
        case 0x70766973: return "visible"
        case 0x7056537a: return "visualSize"
        case 0x70567345: return "visualsEnabled"
        case 0x7041646a: return "volumeAdjustment"
        case 0x70597220: return "year"
        case 0x69737a6d: return "zoomable"
        case 0x707a756d: return "zoomed"
        default: return super.propertyByCode(code)
        }
    }
    override func elementsByCode(code: OSType) -> String? {
        switch (code) {
        case 0x63455150: return "EQPresets"
        case 0x63455157: return "EQWindows"
        case 0x63555254: return "URLTracks"
        case 0x63617070: return "applications"
        case 0x63417274: return "artworks"
        case 0x63434450: return "audioCDPlaylists"
        case 0x63434454: return "audioCDTracks"
        case 0x63427257: return "browserWindows"
        case 0x63447650: return "devicePlaylists"
        case 0x63447654: return "deviceTracks"
        case 0x63456e63: return "encoders"
        case 0x63466c54: return "fileTracks"
        case 0x63466f50: return "folderPlaylists"
        case 0x636f626a: return "items"
        case 0x634c6950: return "libraryPlaylists"
        case 0x50494354: return "picture"
        case 0x63506c57: return "playlistWindows"
        case 0x63506c79: return "playlists"
        case 0x70736574: return "printSettings"
        case 0x63525450: return "radioTunerPlaylists"
        case 0x74647461: return "rawData"
        case 0x63536854: return "sharedTracks"
        case 0x63537263: return "sources"
        case 0x6354726b: return "tracks"
        case 0x63557350: return "userPlaylists"
        case 0x63566973: return "visuals"
        case 0x6377696e: return "windows"
        default: return super.elementsByCode(code)
        }
    }
}


class ITUSpecifier: SwiftAESpecifier {
        
    override var description: String { return ITUFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Raw property and element specifiers, e.g. TextEdit.elementsByFourCharCode("docu") => TextEdit.documents
    
    func propertyByCode(code: OSType) -> ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify a property")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.property(code), queryError: queryError)
    }
    func elementsByCode(code: OSType) -> ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify elements")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.elements(code), queryError: queryError)
    }
    func propertyByFourCharCode(code: String) -> ITUSpecifier {
        return self.propertyByCode(AEM4CC(code))
    }
    func elementsByFourCharCode(code: String) -> ITUSpecifier {
        return self.elementsByCode(AEM4CC(code))
    }
    
    // Element(s) selectors
    // important: by-index selectors use Apple event-style 1-indexing, NOT Swift-style 0-indexing

    subscript(index: AnyObject!) -> ITUSpecifier! { // by-index, by-name, by-test

        var baseQuery: AEMMultipleElementsSpecifier?, newQuery: AEMQuery?, queryError: NSError?
        switch (index) {
        case is String:
            (baseQuery, queryError) = self.aemElementsSpecifer("select element named \(index)")
            newQuery = baseQuery?.byName(index)
        case is AEMQueryProtocol: // TO DO: use AEMTestClauseProtocol
            (baseQuery, queryError) = self.aemElementsSpecifer("select elements where \(index)")
            if let testClause = (index as! AEMQueryProtocol).aemQuery as? AEMTestClause {
                newQuery = baseQuery?.byTest(testClause)
            }
        default:
            (baseQuery, queryError) = self.aemElementsSpecifer("select element \(index)")
            newQuery = baseQuery?.byIndex(index)
        }
        return ITUSpecifier(appData: aebAppData, aemQuery: newQuery, queryError: queryError)
    }
    func ID(uid: AnyObject) -> ITUSpecifier { // by-id
        let (baseQuery, queryError) = self.aemElementsSpecifer("select element with id \(uid)")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.byID(uid), queryError: queryError)
    }
    subscript(from: AnyObject!, to: AnyObject!) -> ITUSpecifier! { // by-range
        let (baseQuery, queryError) = self.aemElementsSpecifer("select elements \(from) thru \(to)")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.byRange(from, to: to), queryError: queryError)
    }

    func previous(class_: AEBSymbol) -> ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select previous element")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.previous(class_.aebCode), queryError: queryError)
    }
    func next(class_: AEBSymbol) -> ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select next element")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.next(class_.aebCode), queryError: queryError)
    }
    
    var first: ITUSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select first element")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.first(), queryError: queryError)
    }
    var middle: ITUSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select middle element")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.middle(), queryError: queryError)
    }
    var last: ITUSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select last element")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.last(), queryError: queryError)
    }
    var any: ITUSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select any element")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.any(), queryError: queryError)
    }

    var beginning: ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select beginning")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginning(), queryError: queryError)
    }
    var end: ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select end")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.end(), queryError: queryError)
    }
    var before: ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select before")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.before(), queryError: queryError)
    }
    var after: ITUSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select after")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.after(), queryError: queryError)
    }

    // Test clause constructors, e.g. ITUits.name.beginsWith("foo")
    
    func beginsWith(input: AnyObject!) -> ITUSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginsWith(input), queryError: queryError)
    }
    func endsWith(input: AnyObject!) -> ITUSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.endsWith(input), queryError: queryError)
    }
    func contains(input: AnyObject!) -> ITUSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.contains(input), queryError: queryError)
    }
    func isIn(input: AnyObject!) -> ITUSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return ITUSpecifier(appData: aebAppData, aemQuery: baseQuery?.isIn(input), queryError: queryError)
    }
    
    // Properties
    
    var EQ: ITUSpecifier {return self.propertyByCode(0x70455170)}
    var EQEnabled: ITUSpecifier {return self.propertyByCode(0x70455120)}
    var address: ITUSpecifier {return self.propertyByCode(0x7055524c)}
    var album: ITUSpecifier {return self.propertyByCode(0x70416c62)}
    var albumArtist: ITUSpecifier {return self.propertyByCode(0x70416c41)}
    var albumRating: ITUSpecifier {return self.propertyByCode(0x70416c52)}
    var albumRatingKind: ITUSpecifier {return self.propertyByCode(0x7041526b)}
    var artist: ITUSpecifier {return self.propertyByCode(0x70417274)}
    var band1: ITUSpecifier {return self.propertyByCode(0x70455131)}
    var band10: ITUSpecifier {return self.propertyByCode(0x70455130)}
    var band2: ITUSpecifier {return self.propertyByCode(0x70455132)}
    var band3: ITUSpecifier {return self.propertyByCode(0x70455133)}
    var band4: ITUSpecifier {return self.propertyByCode(0x70455134)}
    var band5: ITUSpecifier {return self.propertyByCode(0x70455135)}
    var band6: ITUSpecifier {return self.propertyByCode(0x70455136)}
    var band7: ITUSpecifier {return self.propertyByCode(0x70455137)}
    var band8: ITUSpecifier {return self.propertyByCode(0x70455138)}
    var band9: ITUSpecifier {return self.propertyByCode(0x70455139)}
    var bitRate: ITUSpecifier {return self.propertyByCode(0x70425274)}
    var bookmark: ITUSpecifier {return self.propertyByCode(0x70426b74)}
    var bookmarkable: ITUSpecifier {return self.propertyByCode(0x70426b6d)}
    var bounds: ITUSpecifier {return self.propertyByCode(0x70626e64)}
    var bpm: ITUSpecifier {return self.propertyByCode(0x7042504d)}
    var capacity: ITUSpecifier {return self.propertyByCode(0x63617061)}
    var category: ITUSpecifier {return self.propertyByCode(0x70436174)}
    var class_: ITUSpecifier {return self.propertyByCode(0x70636c73)}
    var closeable: ITUSpecifier {return self.propertyByCode(0x68636c62)}
    var collapseable: ITUSpecifier {return self.propertyByCode(0x70575368)}
    var collapsed: ITUSpecifier {return self.propertyByCode(0x77736864)}
    var collating: ITUSpecifier {return self.propertyByCode(0x6c77636c)}
    var comment: ITUSpecifier {return self.propertyByCode(0x70436d74)}
    var compilation: ITUSpecifier {return self.propertyByCode(0x70416e74)}
    var composer: ITUSpecifier {return self.propertyByCode(0x70436d70)}
    var container: ITUSpecifier {return self.propertyByCode(0x63746e72)}
    var copies: ITUSpecifier {return self.propertyByCode(0x6c776370)}
    var currentEQPreset: ITUSpecifier {return self.propertyByCode(0x70455150)}
    var currentEncoder: ITUSpecifier {return self.propertyByCode(0x70456e63)}
    var currentPlaylist: ITUSpecifier {return self.propertyByCode(0x70506c61)}
    var currentStreamTitle: ITUSpecifier {return self.propertyByCode(0x70537454)}
    var currentStreamURL: ITUSpecifier {return self.propertyByCode(0x70537455)}
    var currentTrack: ITUSpecifier {return self.propertyByCode(0x7054726b)}
    var currentVisual: ITUSpecifier {return self.propertyByCode(0x70566973)}
    var data_: ITUSpecifier {return self.propertyByCode(0x70504354)}
    var databaseID: ITUSpecifier {return self.propertyByCode(0x70444944)}
    var dateAdded: ITUSpecifier {return self.propertyByCode(0x70416464)}
    var description_: ITUSpecifier {return self.propertyByCode(0x70446573)}
    var discCount: ITUSpecifier {return self.propertyByCode(0x70447343)}
    var discNumber: ITUSpecifier {return self.propertyByCode(0x7044734e)}
    var downloaded: ITUSpecifier {return self.propertyByCode(0x70446c41)}
    var duration: ITUSpecifier {return self.propertyByCode(0x70447572)}
    var enabled: ITUSpecifier {return self.propertyByCode(0x656e626c)}
    var endingPage: ITUSpecifier {return self.propertyByCode(0x6c776c70)}
    var episodeID: ITUSpecifier {return self.propertyByCode(0x70457044)}
    var episodeNumber: ITUSpecifier {return self.propertyByCode(0x7045704e)}
    var errorHandling: ITUSpecifier {return self.propertyByCode(0x6c776568)}
    var faxNumber: ITUSpecifier {return self.propertyByCode(0x6661786e)}
    var finish: ITUSpecifier {return self.propertyByCode(0x70537470)}
    var fixedIndexing: ITUSpecifier {return self.propertyByCode(0x70466978)}
    var format: ITUSpecifier {return self.propertyByCode(0x70466d74)}
    var freeSpace: ITUSpecifier {return self.propertyByCode(0x66727370)}
    var frontmost: ITUSpecifier {return self.propertyByCode(0x70697366)}
    var fullScreen: ITUSpecifier {return self.propertyByCode(0x70465363)}
    var gapless: ITUSpecifier {return self.propertyByCode(0x7047706c)}
    var genre: ITUSpecifier {return self.propertyByCode(0x7047656e)}
    var grouping: ITUSpecifier {return self.propertyByCode(0x70477270)}
    var id: ITUSpecifier {return self.propertyByCode(0x49442020)}
    var index: ITUSpecifier {return self.propertyByCode(0x70696478)}
    var kind: ITUSpecifier {return self.propertyByCode(0x704b6e64)}
    var location: ITUSpecifier {return self.propertyByCode(0x704c6f63)}
    var longDescription: ITUSpecifier {return self.propertyByCode(0x704c6473)}
    var lyrics: ITUSpecifier {return self.propertyByCode(0x704c7972)}
    var minimized: ITUSpecifier {return self.propertyByCode(0x704d696e)}
    var modifiable: ITUSpecifier {return self.propertyByCode(0x704d6f64)}
    var modificationDate: ITUSpecifier {return self.propertyByCode(0x61736d6f)}
    var mute: ITUSpecifier {return self.propertyByCode(0x704d7574)}
    var name: ITUSpecifier {return self.propertyByCode(0x706e616d)}
    var pagesAcross: ITUSpecifier {return self.propertyByCode(0x6c776c61)}
    var pagesDown: ITUSpecifier {return self.propertyByCode(0x6c776c64)}
    var parent: ITUSpecifier {return self.propertyByCode(0x70506c50)}
    var persistentID: ITUSpecifier {return self.propertyByCode(0x70504953)}
    var playedCount: ITUSpecifier {return self.propertyByCode(0x70506c43)}
    var playedDate: ITUSpecifier {return self.propertyByCode(0x70506c44)}
    var playerPosition: ITUSpecifier {return self.propertyByCode(0x70506f73)}
    var playerState: ITUSpecifier {return self.propertyByCode(0x70506c53)}
    var podcast: ITUSpecifier {return self.propertyByCode(0x70545063)}
    var position: ITUSpecifier {return self.propertyByCode(0x70706f73)}
    var preamp: ITUSpecifier {return self.propertyByCode(0x70455141)}
    var printerFeatures: ITUSpecifier {return self.propertyByCode(0x6c777066)}
    var properties: ITUSpecifier {return self.propertyByCode(0x70414c4c)}
    var rating: ITUSpecifier {return self.propertyByCode(0x70527465)}
    var ratingKind: ITUSpecifier {return self.propertyByCode(0x7052746b)}
    var rawData: ITUSpecifier {return self.propertyByCode(0x70526177)}
    var releaseDate: ITUSpecifier {return self.propertyByCode(0x70526c44)}
    var requestedPrintTime: ITUSpecifier {return self.propertyByCode(0x6c777174)}
    var resizable: ITUSpecifier {return self.propertyByCode(0x7072737a)}
    var sampleRate: ITUSpecifier {return self.propertyByCode(0x70535274)}
    var seasonNumber: ITUSpecifier {return self.propertyByCode(0x7053654e)}
    var selection: ITUSpecifier {return self.propertyByCode(0x73656c65)}
    var shared: ITUSpecifier {return self.propertyByCode(0x70536872)}
    var show: ITUSpecifier {return self.propertyByCode(0x70536877)}
    var shufflable: ITUSpecifier {return self.propertyByCode(0x70536661)}
    var shuffle: ITUSpecifier {return self.propertyByCode(0x70536866)}
    var size: ITUSpecifier {return self.propertyByCode(0x7053697a)}
    var skippedCount: ITUSpecifier {return self.propertyByCode(0x70536b43)}
    var skippedDate: ITUSpecifier {return self.propertyByCode(0x70536b44)}
    var smart: ITUSpecifier {return self.propertyByCode(0x70536d74)}
    var songRepeat: ITUSpecifier {return self.propertyByCode(0x70527074)}
    var sortAlbum: ITUSpecifier {return self.propertyByCode(0x7053416c)}
    var sortAlbumArtist: ITUSpecifier {return self.propertyByCode(0x70534141)}
    var sortArtist: ITUSpecifier {return self.propertyByCode(0x70534172)}
    var sortComposer: ITUSpecifier {return self.propertyByCode(0x7053436d)}
    var sortName: ITUSpecifier {return self.propertyByCode(0x70534e6d)}
    var sortShow: ITUSpecifier {return self.propertyByCode(0x7053534e)}
    var soundVolume: ITUSpecifier {return self.propertyByCode(0x70566f6c)}
    var specialKind: ITUSpecifier {return self.propertyByCode(0x7053704b)}
    var start: ITUSpecifier {return self.propertyByCode(0x70537472)}
    var startingPage: ITUSpecifier {return self.propertyByCode(0x6c776670)}
    var targetPrinter: ITUSpecifier {return self.propertyByCode(0x74727072)}
    var time: ITUSpecifier {return self.propertyByCode(0x7054696d)}
    var trackCount: ITUSpecifier {return self.propertyByCode(0x70547243)}
    var trackNumber: ITUSpecifier {return self.propertyByCode(0x7054724e)}
    var unplayed: ITUSpecifier {return self.propertyByCode(0x70556e70)}
    var updateTracks: ITUSpecifier {return self.propertyByCode(0x70555443)}
    var version_: ITUSpecifier {return self.propertyByCode(0x76657273)}
    var videoKind: ITUSpecifier {return self.propertyByCode(0x7056644b)}
    var view: ITUSpecifier {return self.propertyByCode(0x70506c79)}
    var visible: ITUSpecifier {return self.propertyByCode(0x70766973)}
    var visualSize: ITUSpecifier {return self.propertyByCode(0x7056537a)}
    var visualsEnabled: ITUSpecifier {return self.propertyByCode(0x70567345)}
    var volumeAdjustment: ITUSpecifier {return self.propertyByCode(0x7041646a)}
    var year: ITUSpecifier {return self.propertyByCode(0x70597220)}
    var zoomable: ITUSpecifier {return self.propertyByCode(0x69737a6d)}
    var zoomed: ITUSpecifier {return self.propertyByCode(0x707a756d)}
    
    // Elements
    
    var EQPresets: ITUSpecifier {return self.elementsByCode(0x63455150)}
    var EQWindows: ITUSpecifier {return self.elementsByCode(0x63455157)}
    var URLTracks: ITUSpecifier {return self.elementsByCode(0x63555254)}
    var applications: ITUSpecifier {return self.elementsByCode(0x63617070)}
    var artworks: ITUSpecifier {return self.elementsByCode(0x63417274)}
    var audioCDPlaylists: ITUSpecifier {return self.elementsByCode(0x63434450)}
    var audioCDTracks: ITUSpecifier {return self.elementsByCode(0x63434454)}
    var browserWindows: ITUSpecifier {return self.elementsByCode(0x63427257)}
    var devicePlaylists: ITUSpecifier {return self.elementsByCode(0x63447650)}
    var deviceTracks: ITUSpecifier {return self.elementsByCode(0x63447654)}
    var encoders: ITUSpecifier {return self.elementsByCode(0x63456e63)}
    var fileTracks: ITUSpecifier {return self.elementsByCode(0x63466c54)}
    var folderPlaylists: ITUSpecifier {return self.elementsByCode(0x63466f50)}
    var items: ITUSpecifier {return self.elementsByCode(0x636f626a)}
    var libraryPlaylists: ITUSpecifier {return self.elementsByCode(0x634c6950)}
    var picture: ITUSpecifier {return self.elementsByCode(0x50494354)}
    var playlistWindows: ITUSpecifier {return self.elementsByCode(0x63506c57)}
    var playlists: ITUSpecifier {return self.elementsByCode(0x63506c79)}
    var printSettings: ITUSpecifier {return self.elementsByCode(0x70736574)}
    var radioTunerPlaylists: ITUSpecifier {return self.elementsByCode(0x63525450)}
    var sharedTracks: ITUSpecifier {return self.elementsByCode(0x63536854)}
    var sources: ITUSpecifier {return self.elementsByCode(0x63537263)}
    var tracks: ITUSpecifier {return self.elementsByCode(0x6354726b)}
    var userPlaylists: ITUSpecifier {return self.elementsByCode(0x63557350)}
    var visuals: ITUSpecifier {return self.elementsByCode(0x63566973)}
    var windows: ITUSpecifier {return self.elementsByCode(0x6377696e)}
    
    // Commands
    
    func activate(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x61637476, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func add(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x41646420, parameters: [
                SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func backTrack(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x4261636b, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func close(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f73, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func convert(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x436f6e76, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func count(directParameter: AnyObject = kAEBNoParameter,
            each: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636e7465, parameters: [
                SwiftAEParameter(name: "each", code: 0x6b6f636c, value: each),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func delete(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x64656c6f, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func download(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x44776e6c, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func duplicate(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f6e, parameters: [
                SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func eject(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x456a6374, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func exists(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x646f6578, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func fastForward(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x46617374, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func get(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x67657464, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func launch(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61736372, eventID: 0x6e6f6f70, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func make(directParameter: AnyObject = kAEBNoParameter,
            at: AnyObject = kAEBNoParameter,
            new: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6372656c, parameters: [
                SwiftAEParameter(name: "at", code: 0x696e7368, value: at),
                SwiftAEParameter(name: "new", code: 0x6b6f636c, value: new),
                SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func move(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6d6f7665, parameters: [
                SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func nextTrack(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x4e657874, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func open(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f646f63, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func openLocation(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x4755524c, eventID: 0x4755524c, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func pause(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x50617573, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func play(directParameter: AnyObject = kAEBNoParameter,
            once: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x506c6179, parameters: [
                SwiftAEParameter(name: "once", code: 0x504f6e65, value: once),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func playpause(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x506c5073, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func previousTrack(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x50726576, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func print(directParameter: AnyObject = kAEBNoParameter,
            kind: AnyObject = kAEBNoParameter,
            theme: AnyObject = kAEBNoParameter,
            printDialog: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x70646f63, parameters: [
                SwiftAEParameter(name: "kind", code: 0x704b6e64, value: kind),
                SwiftAEParameter(name: "theme", code: 0x7054686d, value: theme),
                SwiftAEParameter(name: "printDialog", code: 0x70646c67, value: printDialog),
                SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func quit(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x71756974, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func refresh(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x52667273, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func reopen(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x72617070, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func resume(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x52657375, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func reveal(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x5265766c, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func rewind(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x52776e64, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func run(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f617070, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func search(directParameter: AnyObject = kAEBNoParameter,
            only: AnyObject = kAEBNoParameter,
            for_: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x53726368, parameters: [
                SwiftAEParameter(name: "only", code: 0x70417265, value: only),
                SwiftAEParameter(name: "for_", code: 0x7054726d, value: for_),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func set(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x73657464, parameters: [
                SwiftAEParameter(name: "to", code: 0x64617461, value: to),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func stop(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x53746f70, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func subscribe(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x70537562, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func update(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x55706474, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func updateAllPodcasts(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x55706470, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func updatePodcast(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x55706431, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
}


class ITunes: ITUSpecifier {
    private init(targetType: AEBTargetType, targetData: AnyObject?) {
        let data = SwiftAEAppData(applicationClass: AEMApplication.self,
                                       symbolClass: ITUSymbol.self,
                                    specifierClass: ITUSpecifier.self,
                                        targetType: targetType,
                                        targetData: targetData)
        super.init(appData: data, aemQuery: AppleEventBridge.AEMQuery.app())
    }
    override convenience init() { // TO DO: delete/raise error if bundle id not given
        self.init(bundleIdentifier: "com.apple.iTunes")
    }
    convenience init(name: NSString) {
        self.init(targetType: kAEBTargetName, targetData: name)
    }
    convenience init(url: NSURL) {
        self.init(targetType: kAEBTargetURL, targetData: url)
    }
    convenience init(bundleIdentifier: NSString) {
        self.init(targetType: kAEBTargetBundleID, targetData: bundleIdentifier)
    }
    convenience init(processIdentifier: Int) {
        self.init(targetType: kAEBTargetProcessID, targetData: processIdentifier)
    }
    convenience init(descriptor: NSAppleEventDescriptor) {
        self.init(targetType: kAEBTargetDescriptor, targetData: descriptor)
    }
    class func currentApplication() -> ITunes {
        return ITunes(targetType: kAEBTargetCurrent, targetData: nil)
    }
    
    // Construct a ITUSpecifier using a raw AEMQuery or other custom object
    // (e.g. if app's terminology is broken or when dealing with especially cranky old apps)
    
    func customRoot(object: AnyObject!) -> ITUSpecifier {
        if object is ITUSpecifier {
            return ITUSpecifier(appData: aebAppData, aemQuery: (object as! ITUSpecifier).aemQuery)
        } else if object is AppleEventBridge.AEMQuery {
            return ITUSpecifier(appData: aebAppData, aemQuery: object as! AppleEventBridge.AEMQuery)
        } else if object == nil {
            return ITUSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.app())
        } else {
            return ITUSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.customRoot(object))
        }
    }
}


// test clause constructors, e.g. ITUits.name != "foo"
// note: the == operator will return a ITUSpecifier when used in elements[...] specifier; however, when
// binding its result to a variable, it must be explicitly typed as (e.g.) AnyObject or Swift will infer Bool

func == (left: ITUSpecifier!, right: AnyObject!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.equals(right), queryError: queryError)
}
func != (left: ITUSpecifier!, right: AnyObject!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.notEquals(right), queryError: queryError)
}
func < (left: ITUSpecifier!, right: AnyObject!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessThan(right), queryError: queryError)
}
func > (left: ITUSpecifier!, right: AnyObject!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterThan(right), queryError: queryError)
}
func <= (left: ITUSpecifier!, right: AnyObject!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessOrEquals(right), queryError: queryError)
}
func >= (left: ITUSpecifier!, right: AnyObject!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterOrEquals(right), queryError: queryError)
}
func && (left: ITUSpecifier!, right: ITUSpecifier!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.AND(right), queryError: queryError)
}
func || (left: ITUSpecifier!, right: ITUSpecifier!) -> ITUSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return ITUSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.OR(right), queryError: queryError)
}
prefix func ! (input: ITUSpecifier!) -> ITUSpecifier! {
    let (baseQuery, queryError) = input.aemTestClause("test")
    return ITUSpecifier(appData: input.aebAppData, aemQuery: baseQuery?.NOT(), queryError: queryError)
}


/******************************************************************************/
// SYMBOLS


class ITUSymbol: SwiftAESymbol {

    override var aebPrefix: String {return "ITU"}

    override class func aebSymbolForCode(code_: OSType) -> AEBSymbol {
        switch (code_) {
        case 0x61707220: return self.April
        case 0x61756720: return self.August
        case 0x6b537041: return self.Books
        case 0x63737472: return self.CString
        case 0x64656320: return self.December
        case 0x45505320: return self.EPSPicture
        case 0x70455170: return self.EQ
        case 0x70455120: return self.EQEnabled
        case 0x63455150: return self.EQPreset
        case 0x63455157: return self.EQWindow
        case 0x66656220: return self.February
        case 0x66726920: return self.Friday
        case 0x47494666: return self.GIFPicture
        case 0x6b537047: return self.Genius
        case 0x4a504547: return self.JPEGPicture
        case 0x6a616e20: return self.January
        case 0x6a756c20: return self.July
        case 0x6a756e20: return self.June
        case 0x6b53704c: return self.Library
        case 0x6b4d4344: return self.MP3CD
        case 0x6d617220: return self.March
        case 0x6d617920: return self.May
        case 0x6d6f6e20: return self.Monday
        case 0x6b537049: return self.Movies
        case 0x6b53705a: return self.Music
        case 0x6e6f7620: return self.November
        case 0x6f637420: return self.October
        case 0x6b537053: return self.PartyShuffle
        case 0x70737472: return self.PascalString
        case 0x6b537050: return self.Podcasts
        case 0x6b53704d: return self.PurchasedMusic
        case 0x74723136: return self.RGB16Color
        case 0x74723936: return self.RGB96Color
        case 0x63524742: return self.RGBColor
        case 0x73617420: return self.Saturday
        case 0x73657020: return self.September
        case 0x73756e20: return self.Sunday
        case 0x54494646: return self.TIFFPicture
        case 0x6b566454: return self.TVShow
        case 0x6b537054: return self.TVShows
        case 0x74687520: return self.Thursday
        case 0x74756520: return self.Tuesday
        case 0x63555254: return self.URLTrack
        case 0x75743136: return self.UTF16Text
        case 0x75746638: return self.UTF8Text
        case 0x75747874: return self.UnicodeText
        case 0x77656420: return self.Wednesday
        case 0x7055524c: return self.address
        case 0x70416c62: return self.album
        case 0x70416c41: return self.albumArtist
        case 0x6b416c62: return self.albumListing
        case 0x70416c52: return self.albumRating
        case 0x7041526b: return self.albumRatingKind
        case 0x6b53724c: return self.albums
        case 0x616c6973: return self.alias
        case 0x6b416c6c: return self.all
        case 0x2a2a2a2a: return self.anything
        case 0x63617070: return self.application
        case 0x62756e64: return self.applicationBundleID
        case 0x726d7465: return self.applicationResponses
        case 0x7369676e: return self.applicationSignature
        case 0x6170726c: return self.applicationURL
        case 0x70417274: return self.artist
        case 0x6b537252: return self.artists
        case 0x63417274: return self.artwork
        case 0x61736b20: return self.ask
        case 0x6b414344: return self.audioCD
        case 0x63434450: return self.audioCDPlaylist
        case 0x63434454: return self.audioCDTrack
        case 0x70455131: return self.band1
        case 0x70455130: return self.band10
        case 0x70455132: return self.band2
        case 0x70455133: return self.band3
        case 0x70455134: return self.band4
        case 0x70455135: return self.band5
        case 0x70455136: return self.band6
        case 0x70455137: return self.band7
        case 0x70455138: return self.band8
        case 0x70455139: return self.band9
        case 0x62657374: return self.best
        case 0x70425274: return self.bitRate
        case 0x70426b74: return self.bookmark
        case 0x70426b6d: return self.bookmarkable
        case 0x626f6f6c: return self.boolean
        case 0x71647274: return self.boundingRectangle
        case 0x70626e64: return self.bounds
        case 0x7042504d: return self.bpm
        case 0x63427257: return self.browserWindow
        case 0x63617061: return self.capacity
        case 0x63617365: return self.case_
        case 0x70436174: return self.category
        case 0x6b434469: return self.cdInsert
        case 0x636d7472: return self.centimeters
        case 0x67636c69: return self.classInfo
        case 0x70636c73: return self.class_
        case 0x68636c62: return self.closeable
        case 0x70575368: return self.collapseable
        case 0x77736864: return self.collapsed
        case 0x6c77636c: return self.collating
        case 0x636c7274: return self.colorTable
        case 0x70436d74: return self.comment
        case 0x70416e74: return self.compilation
        case 0x70436d70: return self.composer
        case 0x6b537243: return self.composers
        case 0x6b527443: return self.computed
        case 0x63746e72: return self.container
        case 0x6c776370: return self.copies
        case 0x63636d74: return self.cubicCentimeters
        case 0x63666574: return self.cubicFeet
        case 0x6375696e: return self.cubicInches
        case 0x636d6574: return self.cubicMeters
        case 0x63797264: return self.cubicYards
        case 0x70455150: return self.currentEQPreset
        case 0x70456e63: return self.currentEncoder
        case 0x70506c61: return self.currentPlaylist
        case 0x70537454: return self.currentStreamTitle
        case 0x70537455: return self.currentStreamURL
        case 0x7054726b: return self.currentTrack
        case 0x70566973: return self.currentVisual
        case 0x74646173: return self.dashStyle
        case 0x72646174: return self.data
        case 0x70504354: return self.data_
        case 0x70444944: return self.databaseID
        case 0x6c647420: return self.date
        case 0x70416464: return self.dateAdded
        case 0x6465636d: return self.decimalStruct
        case 0x64656763: return self.degreesCelsius
        case 0x64656766: return self.degreesFahrenheit
        case 0x6465676b: return self.degreesKelvin
        case 0x70446573: return self.description_
        case 0x6c776474: return self.detailed
        case 0x6b446576: return self.device
        case 0x63447650: return self.devicePlaylist
        case 0x63447654: return self.deviceTrack
        case 0x64696163: return self.diacriticals
        case 0x70447343: return self.discCount
        case 0x7044734e: return self.discNumber
        case 0x6b537256: return self.displayed
        case 0x636f6d70: return self.doubleInteger
        case 0x70446c41: return self.downloaded
        case 0x70447572: return self.duration
        case 0x656c696e: return self.elementInfo
        case 0x656e626c: return self.enabled
        case 0x656e6373: return self.encodedString
        case 0x63456e63: return self.encoder
        case 0x6c776c70: return self.endingPage
        case 0x656e756d: return self.enumerator
        case 0x70457044: return self.episodeID
        case 0x7045704e: return self.episodeNumber
        case 0x6c776568: return self.errorHandling
        case 0x6576696e: return self.eventInfo
        case 0x65787061: return self.expansion
        case 0x65787465: return self.extendedFloat
        case 0x6b505346: return self.fastForwarding
        case 0x6661786e: return self.faxNumber
        case 0x66656574: return self.feet
        case 0x66737266: return self.fileRef
        case 0x66737320: return self.fileSpecification
        case 0x63466c54: return self.fileTrack
        case 0x6675726c: return self.fileURL
        case 0x70537470: return self.finish
        case 0x66697864: return self.fixed
        case 0x70466978: return self.fixedIndexing
        case 0x66706e74: return self.fixedPoint
        case 0x66726374: return self.fixedRectangle
        case 0x646f7562: return self.float
        case 0x6c64626c: return self.float128bit
        case 0x6b537046: return self.folder
        case 0x63466f50: return self.folderPlaylist
        case 0x70466d74: return self.format
        case 0x66727370: return self.freeSpace
        case 0x70697366: return self.frontmost
        case 0x70465363: return self.fullScreen
        case 0x67616c6e: return self.gallons
        case 0x7047706c: return self.gapless
        case 0x7047656e: return self.genre
        case 0x6772616d: return self.grams
        case 0x63677478: return self.graphicText
        case 0x70477270: return self.grouping
        case 0x68797068: return self.hyphens
        case 0x6b506f64: return self.iPod
        case 0x6b537055: return self.iTunesU
        case 0x49442020: return self.id
        case 0x696e6368: return self.inches
        case 0x70696478: return self.index
        case 0x6c6f6e67: return self.integer
        case 0x69747874: return self.internationalText
        case 0x696e746c: return self.internationalWritingCode
        case 0x636f626a: return self.item
        case 0x6b706964: return self.kernelProcessID
        case 0x6b67726d: return self.kilograms
        case 0x6b6d7472: return self.kilometers
        case 0x704b6e64: return self.kind
        case 0x6b56534c: return self.large
        case 0x6b4c6962: return self.library
        case 0x634c6950: return self.libraryPlaylist
        case 0x6c697374: return self.list
        case 0x6c697472: return self.liters
        case 0x704c6f63: return self.location
        case 0x696e736c: return self.locationReference
        case 0x704c6473: return self.longDescription
        case 0x6c667864: return self.longFixed
        case 0x6c667074: return self.longFixedPoint
        case 0x6c667263: return self.longFixedRectangle
        case 0x6c706e74: return self.longPoint
        case 0x6c726374: return self.longRectangle
        case 0x704c7972: return self.lyrics
        case 0x706f7274: return self.machPort
        case 0x6d616368: return self.machine
        case 0x6d4c6f63: return self.machineLocation
        case 0x6b56534d: return self.medium
        case 0x6d657472: return self.meters
        case 0x6d696c65: return self.miles
        case 0x704d696e: return self.minimized
        case 0x6d736e67: return self.missingValue
        case 0x704d6f64: return self.modifiable
        case 0x61736d6f: return self.modificationDate
        case 0x6b56644d: return self.movie
        case 0x6b566456: return self.musicVideo
        case 0x704d7574: return self.mute
        case 0x706e616d: return self.name
        case 0x6e6f2020: return self.no
        case 0x6b4e6f6e: return self.none_
        case 0x6e756c6c: return self.null
        case 0x6e756d65: return self.numericStrings
        case 0x6b52704f: return self.off
        case 0x6b527031: return self.one
        case 0x6f7a7320: return self.ounces
        case 0x6c776c61: return self.pagesAcross
        case 0x6c776c64: return self.pagesDown
        case 0x706d696e: return self.parameterInfo
        case 0x70506c50: return self.parent
        case 0x6b505370: return self.paused
        case 0x70504953: return self.persistentID
        case 0x50494354: return self.picture
        case 0x74706d6d: return self.pixelMapRecord
        case 0x70506c43: return self.playedCount
        case 0x70506c44: return self.playedDate
        case 0x70506f73: return self.playerPosition
        case 0x70506c53: return self.playerState
        case 0x6b505350: return self.playing
        case 0x63506c79: return self.playlist
        case 0x63506c57: return self.playlistWindow
        case 0x70545063: return self.podcast
        case 0x51447074: return self.point
        case 0x70706f73: return self.position
        case 0x6c627320: return self.pounds
        case 0x70455141: return self.preamp
        case 0x70736574: return self.printSettings
        case 0x6c777066: return self.printerFeatures
        case 0x70736e20: return self.processSerialNumber
        case 0x70414c4c: return self.properties
        case 0x70726f70: return self.property
        case 0x70696e66: return self.propertyInfo
        case 0x70756e63: return self.punctuation
        case 0x71727473: return self.quarts
        case 0x6b54756e: return self.radioTuner
        case 0x63525450: return self.radioTunerPlaylist
        case 0x70527465: return self.rating
        case 0x7052746b: return self.ratingKind
        case 0x74647461: return self.rawData
        case 0x70526177: return self.rawData
        case 0x7265636f: return self.record
        case 0x6f626a20: return self.reference
        case 0x70526c44: return self.releaseDate
        case 0x6c777174: return self.requestedPrintTime
        case 0x7072737a: return self.resizable
        case 0x6b505352: return self.rewinding
        case 0x74726f74: return self.rotation
        case 0x70535274: return self.sampleRate
        case 0x73637074: return self.script
        case 0x7053654e: return self.seasonNumber
        case 0x73656c65: return self.selection
        case 0x70536872: return self.shared
        case 0x6b536864: return self.sharedLibrary
        case 0x63536854: return self.sharedTrack
        case 0x73696e67: return self.shortFloat
        case 0x73686f72: return self.shortInteger
        case 0x70536877: return self.show
        case 0x70536661: return self.shufflable
        case 0x70536866: return self.shuffle
        case 0x7053697a: return self.size
        case 0x70536b43: return self.skippedCount
        case 0x70536b44: return self.skippedDate
        case 0x6b565353: return self.small
        case 0x70536d74: return self.smart
        case 0x70527074: return self.songRepeat
        case 0x6b537253: return self.songs
        case 0x7053416c: return self.sortAlbum
        case 0x70534141: return self.sortAlbumArtist
        case 0x70534172: return self.sortArtist
        case 0x7053436d: return self.sortComposer
        case 0x70534e6d: return self.sortName
        case 0x7053534e: return self.sortShow
        case 0x70566f6c: return self.soundVolume
        case 0x63537263: return self.source
        case 0x7053704b: return self.specialKind
        case 0x73716674: return self.squareFeet
        case 0x73716b6d: return self.squareKilometers
        case 0x7371726d: return self.squareMeters
        case 0x73716d69: return self.squareMiles
        case 0x73717964: return self.squareYards
        case 0x6c777374: return self.standard
        case 0x70537472: return self.start
        case 0x6c776670: return self.startingPage
        case 0x6b505353: return self.stopped
        case 0x54455854: return self.string
        case 0x7374796c: return self.styledClipboardText
        case 0x53545854: return self.styledText
        case 0x73757478: return self.styledUnicodeText
        case 0x7375696e: return self.suiteInfo
        case 0x74727072: return self.targetPrinter
        case 0x74737479: return self.textStyleInfo
        case 0x7054696d: return self.time
        case 0x6354726b: return self.track
        case 0x70547243: return self.trackCount
        case 0x6b54726b: return self.trackListing
        case 0x7054724e: return self.trackNumber
        case 0x74797065: return self.typeClass
        case 0x6b556e6b: return self.unknown
        case 0x70556e70: return self.unplayed
        case 0x6d61676e: return self.unsignedInteger
        case 0x70555443: return self.updateTracks
        case 0x6b527455: return self.user
        case 0x63557350: return self.userPlaylist
        case 0x76657273: return self.version_
        case 0x7056644b: return self.videoKind
        case 0x70506c79: return self.view
        case 0x70766973: return self.visible
        case 0x63566973: return self.visual
        case 0x7056537a: return self.visualSize
        case 0x70567345: return self.visualsEnabled
        case 0x7041646a: return self.volumeAdjustment
        case 0x77686974: return self.whitespace
        case 0x6377696e: return self.window
        case 0x70736374: return self.writingCode
        case 0x79617264: return self.yards
        case 0x70597220: return self.year
        case 0x79657320: return self.yes
        case 0x69737a6d: return self.zoomable
        case 0x707a756d: return self.zoomed
        default: return super.aebSymbolForCode(code_)
        }
    }

    // Types/properties    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var April: ITUSymbol {return ITUSymbol(name: "April", type: 0x74797065, code: 0x61707220)}
    static var August: ITUSymbol {return ITUSymbol(name: "August", type: 0x74797065, code: 0x61756720)}
    static var CString: ITUSymbol {return ITUSymbol(name: "CString", type: 0x74797065, code: 0x63737472)}
    static var December: ITUSymbol {return ITUSymbol(name: "December", type: 0x74797065, code: 0x64656320)}
    static var EPSPicture: ITUSymbol {return ITUSymbol(name: "EPSPicture", type: 0x74797065, code: 0x45505320)}
    static var EQ: ITUSymbol {return ITUSymbol(name: "EQ", type: 0x74797065, code: 0x70455170)}
    static var EQEnabled: ITUSymbol {return ITUSymbol(name: "EQEnabled", type: 0x74797065, code: 0x70455120)}
    static var EQPreset: ITUSymbol {return ITUSymbol(name: "EQPreset", type: 0x74797065, code: 0x63455150)}
    static var EQWindow: ITUSymbol {return ITUSymbol(name: "EQWindow", type: 0x74797065, code: 0x63455157)}
    static var February: ITUSymbol {return ITUSymbol(name: "February", type: 0x74797065, code: 0x66656220)}
    static var Friday: ITUSymbol {return ITUSymbol(name: "Friday", type: 0x74797065, code: 0x66726920)}
    static var GIFPicture: ITUSymbol {return ITUSymbol(name: "GIFPicture", type: 0x74797065, code: 0x47494666)}
    static var JPEGPicture: ITUSymbol {return ITUSymbol(name: "JPEGPicture", type: 0x74797065, code: 0x4a504547)}
    static var January: ITUSymbol {return ITUSymbol(name: "January", type: 0x74797065, code: 0x6a616e20)}
    static var July: ITUSymbol {return ITUSymbol(name: "July", type: 0x74797065, code: 0x6a756c20)}
    static var June: ITUSymbol {return ITUSymbol(name: "June", type: 0x74797065, code: 0x6a756e20)}
    static var March: ITUSymbol {return ITUSymbol(name: "March", type: 0x74797065, code: 0x6d617220)}
    static var May: ITUSymbol {return ITUSymbol(name: "May", type: 0x74797065, code: 0x6d617920)}
    static var Monday: ITUSymbol {return ITUSymbol(name: "Monday", type: 0x74797065, code: 0x6d6f6e20)}
    static var November: ITUSymbol {return ITUSymbol(name: "November", type: 0x74797065, code: 0x6e6f7620)}
    static var October: ITUSymbol {return ITUSymbol(name: "October", type: 0x74797065, code: 0x6f637420)}
    static var PICTPicture: ITUSymbol {return ITUSymbol(name: "PICTPicture", type: 0x74797065, code: 0x50494354)}
    static var PascalString: ITUSymbol {return ITUSymbol(name: "PascalString", type: 0x74797065, code: 0x70737472)}
    static var RGB16Color: ITUSymbol {return ITUSymbol(name: "RGB16Color", type: 0x74797065, code: 0x74723136)}
    static var RGB96Color: ITUSymbol {return ITUSymbol(name: "RGB96Color", type: 0x74797065, code: 0x74723936)}
    static var RGBColor: ITUSymbol {return ITUSymbol(name: "RGBColor", type: 0x74797065, code: 0x63524742)}
    static var Saturday: ITUSymbol {return ITUSymbol(name: "Saturday", type: 0x74797065, code: 0x73617420)}
    static var September: ITUSymbol {return ITUSymbol(name: "September", type: 0x74797065, code: 0x73657020)}
    static var Sunday: ITUSymbol {return ITUSymbol(name: "Sunday", type: 0x74797065, code: 0x73756e20)}
    static var TIFFPicture: ITUSymbol {return ITUSymbol(name: "TIFFPicture", type: 0x74797065, code: 0x54494646)}
    static var Thursday: ITUSymbol {return ITUSymbol(name: "Thursday", type: 0x74797065, code: 0x74687520)}
    static var Tuesday: ITUSymbol {return ITUSymbol(name: "Tuesday", type: 0x74797065, code: 0x74756520)}
    static var URLTrack: ITUSymbol {return ITUSymbol(name: "URLTrack", type: 0x74797065, code: 0x63555254)}
    static var UTF16Text: ITUSymbol {return ITUSymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
    static var UTF8Text: ITUSymbol {return ITUSymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
    static var UnicodeText: ITUSymbol {return ITUSymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
    static var Wednesday: ITUSymbol {return ITUSymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
    static var address: ITUSymbol {return ITUSymbol(name: "address", type: 0x74797065, code: 0x7055524c)}
    static var album: ITUSymbol {return ITUSymbol(name: "album", type: 0x74797065, code: 0x70416c62)}
    static var albumArtist: ITUSymbol {return ITUSymbol(name: "albumArtist", type: 0x74797065, code: 0x70416c41)}
    static var albumRating: ITUSymbol {return ITUSymbol(name: "albumRating", type: 0x74797065, code: 0x70416c52)}
    static var albumRatingKind: ITUSymbol {return ITUSymbol(name: "albumRatingKind", type: 0x74797065, code: 0x7041526b)}
    static var alias: ITUSymbol {return ITUSymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
    static var anything: ITUSymbol {return ITUSymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
    static var application: ITUSymbol {return ITUSymbol(name: "application", type: 0x74797065, code: 0x63617070)}
    static var applicationBundleID: ITUSymbol {return ITUSymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
    static var applicationSignature: ITUSymbol {return ITUSymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
    static var applicationURL: ITUSymbol {return ITUSymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
    static var artist: ITUSymbol {return ITUSymbol(name: "artist", type: 0x74797065, code: 0x70417274)}
    static var artwork: ITUSymbol {return ITUSymbol(name: "artwork", type: 0x74797065, code: 0x63417274)}
    static var audioCDPlaylist: ITUSymbol {return ITUSymbol(name: "audioCDPlaylist", type: 0x74797065, code: 0x63434450)}
    static var audioCDTrack: ITUSymbol {return ITUSymbol(name: "audioCDTrack", type: 0x74797065, code: 0x63434454)}
    static var band1: ITUSymbol {return ITUSymbol(name: "band1", type: 0x74797065, code: 0x70455131)}
    static var band10: ITUSymbol {return ITUSymbol(name: "band10", type: 0x74797065, code: 0x70455130)}
    static var band2: ITUSymbol {return ITUSymbol(name: "band2", type: 0x74797065, code: 0x70455132)}
    static var band3: ITUSymbol {return ITUSymbol(name: "band3", type: 0x74797065, code: 0x70455133)}
    static var band4: ITUSymbol {return ITUSymbol(name: "band4", type: 0x74797065, code: 0x70455134)}
    static var band5: ITUSymbol {return ITUSymbol(name: "band5", type: 0x74797065, code: 0x70455135)}
    static var band6: ITUSymbol {return ITUSymbol(name: "band6", type: 0x74797065, code: 0x70455136)}
    static var band7: ITUSymbol {return ITUSymbol(name: "band7", type: 0x74797065, code: 0x70455137)}
    static var band8: ITUSymbol {return ITUSymbol(name: "band8", type: 0x74797065, code: 0x70455138)}
    static var band9: ITUSymbol {return ITUSymbol(name: "band9", type: 0x74797065, code: 0x70455139)}
    static var best: ITUSymbol {return ITUSymbol(name: "best", type: 0x74797065, code: 0x62657374)}
    static var bitRate: ITUSymbol {return ITUSymbol(name: "bitRate", type: 0x74797065, code: 0x70425274)}
    static var bookmark: ITUSymbol {return ITUSymbol(name: "bookmark", type: 0x74797065, code: 0x70426b74)}
    static var bookmarkable: ITUSymbol {return ITUSymbol(name: "bookmarkable", type: 0x74797065, code: 0x70426b6d)}
    static var boolean: ITUSymbol {return ITUSymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
    static var boundingRectangle: ITUSymbol {return ITUSymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
    static var bounds: ITUSymbol {return ITUSymbol(name: "bounds", type: 0x74797065, code: 0x70626e64)}
    static var bpm: ITUSymbol {return ITUSymbol(name: "bpm", type: 0x74797065, code: 0x7042504d)}
    static var browserWindow: ITUSymbol {return ITUSymbol(name: "browserWindow", type: 0x74797065, code: 0x63427257)}
    static var capacity: ITUSymbol {return ITUSymbol(name: "capacity", type: 0x74797065, code: 0x63617061)}
    static var category: ITUSymbol {return ITUSymbol(name: "category", type: 0x74797065, code: 0x70436174)}
    static var centimeters: ITUSymbol {return ITUSymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
    static var classInfo: ITUSymbol {return ITUSymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
    static var class_: ITUSymbol {return ITUSymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
    static var closeable: ITUSymbol {return ITUSymbol(name: "closeable", type: 0x74797065, code: 0x68636c62)}
    static var collapseable: ITUSymbol {return ITUSymbol(name: "collapseable", type: 0x74797065, code: 0x70575368)}
    static var collapsed: ITUSymbol {return ITUSymbol(name: "collapsed", type: 0x74797065, code: 0x77736864)}
    static var collating: ITUSymbol {return ITUSymbol(name: "collating", type: 0x74797065, code: 0x6c77636c)}
    static var colorTable: ITUSymbol {return ITUSymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
    static var comment: ITUSymbol {return ITUSymbol(name: "comment", type: 0x74797065, code: 0x70436d74)}
    static var compilation: ITUSymbol {return ITUSymbol(name: "compilation", type: 0x74797065, code: 0x70416e74)}
    static var composer: ITUSymbol {return ITUSymbol(name: "composer", type: 0x74797065, code: 0x70436d70)}
    static var container: ITUSymbol {return ITUSymbol(name: "container", type: 0x74797065, code: 0x63746e72)}
    static var copies: ITUSymbol {return ITUSymbol(name: "copies", type: 0x74797065, code: 0x6c776370)}
    static var cubicCentimeters: ITUSymbol {return ITUSymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
    static var cubicFeet: ITUSymbol {return ITUSymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
    static var cubicInches: ITUSymbol {return ITUSymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
    static var cubicMeters: ITUSymbol {return ITUSymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
    static var cubicYards: ITUSymbol {return ITUSymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
    static var currentEQPreset: ITUSymbol {return ITUSymbol(name: "currentEQPreset", type: 0x74797065, code: 0x70455150)}
    static var currentEncoder: ITUSymbol {return ITUSymbol(name: "currentEncoder", type: 0x74797065, code: 0x70456e63)}
    static var currentPlaylist: ITUSymbol {return ITUSymbol(name: "currentPlaylist", type: 0x74797065, code: 0x70506c61)}
    static var currentStreamTitle: ITUSymbol {return ITUSymbol(name: "currentStreamTitle", type: 0x74797065, code: 0x70537454)}
    static var currentStreamURL: ITUSymbol {return ITUSymbol(name: "currentStreamURL", type: 0x74797065, code: 0x70537455)}
    static var currentTrack: ITUSymbol {return ITUSymbol(name: "currentTrack", type: 0x74797065, code: 0x7054726b)}
    static var currentVisual: ITUSymbol {return ITUSymbol(name: "currentVisual", type: 0x74797065, code: 0x70566973)}
    static var dashStyle: ITUSymbol {return ITUSymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
    static var data: ITUSymbol {return ITUSymbol(name: "data", type: 0x74797065, code: 0x72646174)}
    static var data_: ITUSymbol {return ITUSymbol(name: "data_", type: 0x74797065, code: 0x70504354)}
    static var databaseID: ITUSymbol {return ITUSymbol(name: "databaseID", type: 0x74797065, code: 0x70444944)}
    static var date: ITUSymbol {return ITUSymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
    static var dateAdded: ITUSymbol {return ITUSymbol(name: "dateAdded", type: 0x74797065, code: 0x70416464)}
    static var decimalStruct: ITUSymbol {return ITUSymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
    static var degreesCelsius: ITUSymbol {return ITUSymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
    static var degreesFahrenheit: ITUSymbol {return ITUSymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
    static var degreesKelvin: ITUSymbol {return ITUSymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
    static var description_: ITUSymbol {return ITUSymbol(name: "description_", type: 0x74797065, code: 0x70446573)}
    static var devicePlaylist: ITUSymbol {return ITUSymbol(name: "devicePlaylist", type: 0x74797065, code: 0x63447650)}
    static var deviceTrack: ITUSymbol {return ITUSymbol(name: "deviceTrack", type: 0x74797065, code: 0x63447654)}
    static var discCount: ITUSymbol {return ITUSymbol(name: "discCount", type: 0x74797065, code: 0x70447343)}
    static var discNumber: ITUSymbol {return ITUSymbol(name: "discNumber", type: 0x74797065, code: 0x7044734e)}
    static var doubleInteger: ITUSymbol {return ITUSymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
    static var downloaded: ITUSymbol {return ITUSymbol(name: "downloaded", type: 0x74797065, code: 0x70446c41)}
    static var duration: ITUSymbol {return ITUSymbol(name: "duration", type: 0x74797065, code: 0x70447572)}
    static var elementInfo: ITUSymbol {return ITUSymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
    static var enabled: ITUSymbol {return ITUSymbol(name: "enabled", type: 0x74797065, code: 0x656e626c)}
    static var encodedString: ITUSymbol {return ITUSymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
    static var encoder: ITUSymbol {return ITUSymbol(name: "encoder", type: 0x74797065, code: 0x63456e63)}
    static var endingPage: ITUSymbol {return ITUSymbol(name: "endingPage", type: 0x74797065, code: 0x6c776c70)}
    static var enumerator: ITUSymbol {return ITUSymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
    static var episodeID: ITUSymbol {return ITUSymbol(name: "episodeID", type: 0x74797065, code: 0x70457044)}
    static var episodeNumber: ITUSymbol {return ITUSymbol(name: "episodeNumber", type: 0x74797065, code: 0x7045704e)}
    static var errorHandling: ITUSymbol {return ITUSymbol(name: "errorHandling", type: 0x74797065, code: 0x6c776568)}
    static var eventInfo: ITUSymbol {return ITUSymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
    static var extendedFloat: ITUSymbol {return ITUSymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
    static var faxNumber: ITUSymbol {return ITUSymbol(name: "faxNumber", type: 0x74797065, code: 0x6661786e)}
    static var feet: ITUSymbol {return ITUSymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
    static var fileRef: ITUSymbol {return ITUSymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
    static var fileSpecification: ITUSymbol {return ITUSymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
    static var fileTrack: ITUSymbol {return ITUSymbol(name: "fileTrack", type: 0x74797065, code: 0x63466c54)}
    static var fileURL: ITUSymbol {return ITUSymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
    static var finish: ITUSymbol {return ITUSymbol(name: "finish", type: 0x74797065, code: 0x70537470)}
    static var fixed: ITUSymbol {return ITUSymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
    static var fixedIndexing: ITUSymbol {return ITUSymbol(name: "fixedIndexing", type: 0x74797065, code: 0x70466978)}
    static var fixedPoint: ITUSymbol {return ITUSymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
    static var fixedRectangle: ITUSymbol {return ITUSymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
    static var float: ITUSymbol {return ITUSymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
    static var float128bit: ITUSymbol {return ITUSymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
    static var folderPlaylist: ITUSymbol {return ITUSymbol(name: "folderPlaylist", type: 0x74797065, code: 0x63466f50)}
    static var format: ITUSymbol {return ITUSymbol(name: "format", type: 0x74797065, code: 0x70466d74)}
    static var freeSpace: ITUSymbol {return ITUSymbol(name: "freeSpace", type: 0x74797065, code: 0x66727370)}
    static var frontmost: ITUSymbol {return ITUSymbol(name: "frontmost", type: 0x74797065, code: 0x70697366)}
    static var fullScreen: ITUSymbol {return ITUSymbol(name: "fullScreen", type: 0x74797065, code: 0x70465363)}
    static var gallons: ITUSymbol {return ITUSymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
    static var gapless: ITUSymbol {return ITUSymbol(name: "gapless", type: 0x74797065, code: 0x7047706c)}
    static var genre: ITUSymbol {return ITUSymbol(name: "genre", type: 0x74797065, code: 0x7047656e)}
    static var grams: ITUSymbol {return ITUSymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
    static var graphicText: ITUSymbol {return ITUSymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
    static var grouping: ITUSymbol {return ITUSymbol(name: "grouping", type: 0x74797065, code: 0x70477270)}
    static var id: ITUSymbol {return ITUSymbol(name: "id", type: 0x74797065, code: 0x49442020)}
    static var inches: ITUSymbol {return ITUSymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
    static var index: ITUSymbol {return ITUSymbol(name: "index", type: 0x74797065, code: 0x70696478)}
    static var integer: ITUSymbol {return ITUSymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
    static var internationalText: ITUSymbol {return ITUSymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
    static var internationalWritingCode: ITUSymbol {return ITUSymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
    static var item: ITUSymbol {return ITUSymbol(name: "item", type: 0x74797065, code: 0x636f626a)}
    static var kernelProcessID: ITUSymbol {return ITUSymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
    static var kilograms: ITUSymbol {return ITUSymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
    static var kilometers: ITUSymbol {return ITUSymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
    static var kind: ITUSymbol {return ITUSymbol(name: "kind", type: 0x74797065, code: 0x704b6e64)}
    static var libraryPlaylist: ITUSymbol {return ITUSymbol(name: "libraryPlaylist", type: 0x74797065, code: 0x634c6950)}
    static var list: ITUSymbol {return ITUSymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
    static var liters: ITUSymbol {return ITUSymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
    static var location: ITUSymbol {return ITUSymbol(name: "location", type: 0x74797065, code: 0x704c6f63)}
    static var locationReference: ITUSymbol {return ITUSymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
    static var longDescription: ITUSymbol {return ITUSymbol(name: "longDescription", type: 0x74797065, code: 0x704c6473)}
    static var longFixed: ITUSymbol {return ITUSymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
    static var longFixedPoint: ITUSymbol {return ITUSymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
    static var longFixedRectangle: ITUSymbol {return ITUSymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
    static var longPoint: ITUSymbol {return ITUSymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
    static var longRectangle: ITUSymbol {return ITUSymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
    static var lyrics: ITUSymbol {return ITUSymbol(name: "lyrics", type: 0x74797065, code: 0x704c7972)}
    static var machPort: ITUSymbol {return ITUSymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
    static var machine: ITUSymbol {return ITUSymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
    static var machineLocation: ITUSymbol {return ITUSymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
    static var meters: ITUSymbol {return ITUSymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
    static var miles: ITUSymbol {return ITUSymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
    static var minimized: ITUSymbol {return ITUSymbol(name: "minimized", type: 0x74797065, code: 0x704d696e)}
    static var missingValue: ITUSymbol {return ITUSymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
    static var modifiable: ITUSymbol {return ITUSymbol(name: "modifiable", type: 0x74797065, code: 0x704d6f64)}
    static var modificationDate: ITUSymbol {return ITUSymbol(name: "modificationDate", type: 0x74797065, code: 0x61736d6f)}
    static var mute: ITUSymbol {return ITUSymbol(name: "mute", type: 0x74797065, code: 0x704d7574)}
    static var name: ITUSymbol {return ITUSymbol(name: "name", type: 0x74797065, code: 0x706e616d)}
    static var null: ITUSymbol {return ITUSymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
    static var ounces: ITUSymbol {return ITUSymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
    static var pagesAcross: ITUSymbol {return ITUSymbol(name: "pagesAcross", type: 0x74797065, code: 0x6c776c61)}
    static var pagesDown: ITUSymbol {return ITUSymbol(name: "pagesDown", type: 0x74797065, code: 0x6c776c64)}
    static var parameterInfo: ITUSymbol {return ITUSymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
    static var parent: ITUSymbol {return ITUSymbol(name: "parent", type: 0x74797065, code: 0x70506c50)}
    static var persistentID: ITUSymbol {return ITUSymbol(name: "persistentID", type: 0x74797065, code: 0x70504953)}
    static var picture: ITUSymbol {return ITUSymbol(name: "picture", type: 0x74797065, code: 0x50494354)}
    static var pixelMapRecord: ITUSymbol {return ITUSymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
    static var playedCount: ITUSymbol {return ITUSymbol(name: "playedCount", type: 0x74797065, code: 0x70506c43)}
    static var playedDate: ITUSymbol {return ITUSymbol(name: "playedDate", type: 0x74797065, code: 0x70506c44)}
    static var playerPosition: ITUSymbol {return ITUSymbol(name: "playerPosition", type: 0x74797065, code: 0x70506f73)}
    static var playerState: ITUSymbol {return ITUSymbol(name: "playerState", type: 0x74797065, code: 0x70506c53)}
    static var playlist: ITUSymbol {return ITUSymbol(name: "playlist", type: 0x74797065, code: 0x63506c79)}
    static var playlistWindow: ITUSymbol {return ITUSymbol(name: "playlistWindow", type: 0x74797065, code: 0x63506c57)}
    static var podcast: ITUSymbol {return ITUSymbol(name: "podcast", type: 0x74797065, code: 0x70545063)}
    static var point: ITUSymbol {return ITUSymbol(name: "point", type: 0x74797065, code: 0x51447074)}
    static var position: ITUSymbol {return ITUSymbol(name: "position", type: 0x74797065, code: 0x70706f73)}
    static var pounds: ITUSymbol {return ITUSymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
    static var preamp: ITUSymbol {return ITUSymbol(name: "preamp", type: 0x74797065, code: 0x70455141)}
    static var printSettings: ITUSymbol {return ITUSymbol(name: "printSettings", type: 0x74797065, code: 0x70736574)}
    static var printerFeatures: ITUSymbol {return ITUSymbol(name: "printerFeatures", type: 0x74797065, code: 0x6c777066)}
    static var processSerialNumber: ITUSymbol {return ITUSymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
    static var properties: ITUSymbol {return ITUSymbol(name: "properties", type: 0x74797065, code: 0x70414c4c)}
    static var property: ITUSymbol {return ITUSymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
    static var propertyInfo: ITUSymbol {return ITUSymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
    static var quarts: ITUSymbol {return ITUSymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
    static var radioTunerPlaylist: ITUSymbol {return ITUSymbol(name: "radioTunerPlaylist", type: 0x74797065, code: 0x63525450)}
    static var rating: ITUSymbol {return ITUSymbol(name: "rating", type: 0x74797065, code: 0x70527465)}
    static var ratingKind: ITUSymbol {return ITUSymbol(name: "ratingKind", type: 0x74797065, code: 0x7052746b)}
    static var rawData: ITUSymbol {return ITUSymbol(name: "rawData", type: 0x74797065, code: 0x74647461)}
    static var record: ITUSymbol {return ITUSymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
    static var reference: ITUSymbol {return ITUSymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
    static var releaseDate: ITUSymbol {return ITUSymbol(name: "releaseDate", type: 0x74797065, code: 0x70526c44)}
    static var requestedPrintTime: ITUSymbol {return ITUSymbol(name: "requestedPrintTime", type: 0x74797065, code: 0x6c777174)}
    static var resizable: ITUSymbol {return ITUSymbol(name: "resizable", type: 0x74797065, code: 0x7072737a)}
    static var rotation: ITUSymbol {return ITUSymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
    static var sampleRate: ITUSymbol {return ITUSymbol(name: "sampleRate", type: 0x74797065, code: 0x70535274)}
    static var script: ITUSymbol {return ITUSymbol(name: "script", type: 0x74797065, code: 0x73637074)}
    static var seasonNumber: ITUSymbol {return ITUSymbol(name: "seasonNumber", type: 0x74797065, code: 0x7053654e)}
    static var selection: ITUSymbol {return ITUSymbol(name: "selection", type: 0x74797065, code: 0x73656c65)}
    static var shared: ITUSymbol {return ITUSymbol(name: "shared", type: 0x74797065, code: 0x70536872)}
    static var sharedTrack: ITUSymbol {return ITUSymbol(name: "sharedTrack", type: 0x74797065, code: 0x63536854)}
    static var shortFloat: ITUSymbol {return ITUSymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
    static var shortInteger: ITUSymbol {return ITUSymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
    static var show: ITUSymbol {return ITUSymbol(name: "show", type: 0x74797065, code: 0x70536877)}
    static var shufflable: ITUSymbol {return ITUSymbol(name: "shufflable", type: 0x74797065, code: 0x70536661)}
    static var shuffle: ITUSymbol {return ITUSymbol(name: "shuffle", type: 0x74797065, code: 0x70536866)}
    static var size: ITUSymbol {return ITUSymbol(name: "size", type: 0x74797065, code: 0x7053697a)}
    static var skippedCount: ITUSymbol {return ITUSymbol(name: "skippedCount", type: 0x74797065, code: 0x70536b43)}
    static var skippedDate: ITUSymbol {return ITUSymbol(name: "skippedDate", type: 0x74797065, code: 0x70536b44)}
    static var smart: ITUSymbol {return ITUSymbol(name: "smart", type: 0x74797065, code: 0x70536d74)}
    static var songRepeat: ITUSymbol {return ITUSymbol(name: "songRepeat", type: 0x74797065, code: 0x70527074)}
    static var sortAlbum: ITUSymbol {return ITUSymbol(name: "sortAlbum", type: 0x74797065, code: 0x7053416c)}
    static var sortAlbumArtist: ITUSymbol {return ITUSymbol(name: "sortAlbumArtist", type: 0x74797065, code: 0x70534141)}
    static var sortArtist: ITUSymbol {return ITUSymbol(name: "sortArtist", type: 0x74797065, code: 0x70534172)}
    static var sortComposer: ITUSymbol {return ITUSymbol(name: "sortComposer", type: 0x74797065, code: 0x7053436d)}
    static var sortName: ITUSymbol {return ITUSymbol(name: "sortName", type: 0x74797065, code: 0x70534e6d)}
    static var sortShow: ITUSymbol {return ITUSymbol(name: "sortShow", type: 0x74797065, code: 0x7053534e)}
    static var soundVolume: ITUSymbol {return ITUSymbol(name: "soundVolume", type: 0x74797065, code: 0x70566f6c)}
    static var source: ITUSymbol {return ITUSymbol(name: "source", type: 0x74797065, code: 0x63537263)}
    static var specialKind: ITUSymbol {return ITUSymbol(name: "specialKind", type: 0x74797065, code: 0x7053704b)}
    static var squareFeet: ITUSymbol {return ITUSymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
    static var squareKilometers: ITUSymbol {return ITUSymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
    static var squareMeters: ITUSymbol {return ITUSymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
    static var squareMiles: ITUSymbol {return ITUSymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
    static var squareYards: ITUSymbol {return ITUSymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
    static var start: ITUSymbol {return ITUSymbol(name: "start", type: 0x74797065, code: 0x70537472)}
    static var startingPage: ITUSymbol {return ITUSymbol(name: "startingPage", type: 0x74797065, code: 0x6c776670)}
    static var string: ITUSymbol {return ITUSymbol(name: "string", type: 0x74797065, code: 0x54455854)}
    static var styledClipboardText: ITUSymbol {return ITUSymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
    static var styledText: ITUSymbol {return ITUSymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
    static var styledUnicodeText: ITUSymbol {return ITUSymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
    static var suiteInfo: ITUSymbol {return ITUSymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
    static var targetPrinter: ITUSymbol {return ITUSymbol(name: "targetPrinter", type: 0x74797065, code: 0x74727072)}
    static var textStyleInfo: ITUSymbol {return ITUSymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
    static var time: ITUSymbol {return ITUSymbol(name: "time", type: 0x74797065, code: 0x7054696d)}
    static var track: ITUSymbol {return ITUSymbol(name: "track", type: 0x74797065, code: 0x6354726b)}
    static var trackCount: ITUSymbol {return ITUSymbol(name: "trackCount", type: 0x74797065, code: 0x70547243)}
    static var trackNumber: ITUSymbol {return ITUSymbol(name: "trackNumber", type: 0x74797065, code: 0x7054724e)}
    static var typeClass: ITUSymbol {return ITUSymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
    static var unplayed: ITUSymbol {return ITUSymbol(name: "unplayed", type: 0x74797065, code: 0x70556e70)}
    static var unsignedInteger: ITUSymbol {return ITUSymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
    static var updateTracks: ITUSymbol {return ITUSymbol(name: "updateTracks", type: 0x74797065, code: 0x70555443)}
    static var userPlaylist: ITUSymbol {return ITUSymbol(name: "userPlaylist", type: 0x74797065, code: 0x63557350)}
    static var version_: ITUSymbol {return ITUSymbol(name: "version_", type: 0x74797065, code: 0x76657273)}
    static var videoKind: ITUSymbol {return ITUSymbol(name: "videoKind", type: 0x74797065, code: 0x7056644b)}
    static var view: ITUSymbol {return ITUSymbol(name: "view", type: 0x74797065, code: 0x70506c79)}
    static var visible: ITUSymbol {return ITUSymbol(name: "visible", type: 0x74797065, code: 0x70766973)}
    static var visual: ITUSymbol {return ITUSymbol(name: "visual", type: 0x74797065, code: 0x63566973)}
    static var visualSize: ITUSymbol {return ITUSymbol(name: "visualSize", type: 0x74797065, code: 0x7056537a)}
    static var visualsEnabled: ITUSymbol {return ITUSymbol(name: "visualsEnabled", type: 0x74797065, code: 0x70567345)}
    static var volumeAdjustment: ITUSymbol {return ITUSymbol(name: "volumeAdjustment", type: 0x74797065, code: 0x7041646a)}
    static var window: ITUSymbol {return ITUSymbol(name: "window", type: 0x74797065, code: 0x6377696e)}
    static var writingCode: ITUSymbol {return ITUSymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
    static var yards: ITUSymbol {return ITUSymbol(name: "yards", type: 0x74797065, code: 0x79617264)}
    static var year: ITUSymbol {return ITUSymbol(name: "year", type: 0x74797065, code: 0x70597220)}
    static var zoomable: ITUSymbol {return ITUSymbol(name: "zoomable", type: 0x74797065, code: 0x69737a6d)}
    static var zoomed: ITUSymbol {return ITUSymbol(name: "zoomed", type: 0x74797065, code: 0x707a756d)}

    // Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var Books: ITUSymbol {return ITUSymbol(name: "Books", type: 0x656e756d, code: 0x6b537041)}
    static var Genius: ITUSymbol {return ITUSymbol(name: "Genius", type: 0x656e756d, code: 0x6b537047)}
    static var Library: ITUSymbol {return ITUSymbol(name: "Library", type: 0x656e756d, code: 0x6b53704c)}
    static var MP3CD: ITUSymbol {return ITUSymbol(name: "MP3CD", type: 0x656e756d, code: 0x6b4d4344)}
    static var Movies: ITUSymbol {return ITUSymbol(name: "Movies", type: 0x656e756d, code: 0x6b537049)}
    static var Music: ITUSymbol {return ITUSymbol(name: "Music", type: 0x656e756d, code: 0x6b53705a)}
    static var PartyShuffle: ITUSymbol {return ITUSymbol(name: "PartyShuffle", type: 0x656e756d, code: 0x6b537053)}
    static var Podcasts: ITUSymbol {return ITUSymbol(name: "Podcasts", type: 0x656e756d, code: 0x6b537050)}
    static var PurchasedMusic: ITUSymbol {return ITUSymbol(name: "PurchasedMusic", type: 0x656e756d, code: 0x6b53704d)}
    static var TVShow: ITUSymbol {return ITUSymbol(name: "TVShow", type: 0x656e756d, code: 0x6b566454)}
    static var TVShows: ITUSymbol {return ITUSymbol(name: "TVShows", type: 0x656e756d, code: 0x6b537054)}
    static var albumListing: ITUSymbol {return ITUSymbol(name: "albumListing", type: 0x656e756d, code: 0x6b416c62)}
    static var albums: ITUSymbol {return ITUSymbol(name: "albums", type: 0x656e756d, code: 0x6b53724c)}
    static var all: ITUSymbol {return ITUSymbol(name: "all", type: 0x656e756d, code: 0x6b416c6c)}
    static var applicationResponses: ITUSymbol {return ITUSymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
    static var artists: ITUSymbol {return ITUSymbol(name: "artists", type: 0x656e756d, code: 0x6b537252)}
    static var ask: ITUSymbol {return ITUSymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
    static var audioCD: ITUSymbol {return ITUSymbol(name: "audioCD", type: 0x656e756d, code: 0x6b414344)}
    static var case_: ITUSymbol {return ITUSymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
    static var cdInsert: ITUSymbol {return ITUSymbol(name: "cdInsert", type: 0x656e756d, code: 0x6b434469)}
    static var composers: ITUSymbol {return ITUSymbol(name: "composers", type: 0x656e756d, code: 0x6b537243)}
    static var computed: ITUSymbol {return ITUSymbol(name: "computed", type: 0x656e756d, code: 0x6b527443)}
    static var detailed: ITUSymbol {return ITUSymbol(name: "detailed", type: 0x656e756d, code: 0x6c776474)}
    static var device: ITUSymbol {return ITUSymbol(name: "device", type: 0x656e756d, code: 0x6b446576)}
    static var diacriticals: ITUSymbol {return ITUSymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
    static var displayed: ITUSymbol {return ITUSymbol(name: "displayed", type: 0x656e756d, code: 0x6b537256)}
    static var expansion: ITUSymbol {return ITUSymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
    static var fastForwarding: ITUSymbol {return ITUSymbol(name: "fastForwarding", type: 0x656e756d, code: 0x6b505346)}
    static var folder: ITUSymbol {return ITUSymbol(name: "folder", type: 0x656e756d, code: 0x6b537046)}
    static var hyphens: ITUSymbol {return ITUSymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
    static var iPod: ITUSymbol {return ITUSymbol(name: "iPod", type: 0x656e756d, code: 0x6b506f64)}
    static var iTunesU: ITUSymbol {return ITUSymbol(name: "iTunesU", type: 0x656e756d, code: 0x6b537055)}
    static var large: ITUSymbol {return ITUSymbol(name: "large", type: 0x656e756d, code: 0x6b56534c)}
    static var library: ITUSymbol {return ITUSymbol(name: "library", type: 0x656e756d, code: 0x6b4c6962)}
    static var medium: ITUSymbol {return ITUSymbol(name: "medium", type: 0x656e756d, code: 0x6b56534d)}
    static var movie: ITUSymbol {return ITUSymbol(name: "movie", type: 0x656e756d, code: 0x6b56644d)}
    static var musicVideo: ITUSymbol {return ITUSymbol(name: "musicVideo", type: 0x656e756d, code: 0x6b566456)}
    static var no: ITUSymbol {return ITUSymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
    static var none_: ITUSymbol {return ITUSymbol(name: "none_", type: 0x656e756d, code: 0x6b4e6f6e)}
    static var numericStrings: ITUSymbol {return ITUSymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
    static var off: ITUSymbol {return ITUSymbol(name: "off", type: 0x656e756d, code: 0x6b52704f)}
    static var one: ITUSymbol {return ITUSymbol(name: "one", type: 0x656e756d, code: 0x6b527031)}
    static var paused: ITUSymbol {return ITUSymbol(name: "paused", type: 0x656e756d, code: 0x6b505370)}
    static var playing: ITUSymbol {return ITUSymbol(name: "playing", type: 0x656e756d, code: 0x6b505350)}
    static var punctuation: ITUSymbol {return ITUSymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
    static var radioTuner: ITUSymbol {return ITUSymbol(name: "radioTuner", type: 0x656e756d, code: 0x6b54756e)}
    static var rewinding: ITUSymbol {return ITUSymbol(name: "rewinding", type: 0x656e756d, code: 0x6b505352)}
    static var sharedLibrary: ITUSymbol {return ITUSymbol(name: "sharedLibrary", type: 0x656e756d, code: 0x6b536864)}
    static var small: ITUSymbol {return ITUSymbol(name: "small", type: 0x656e756d, code: 0x6b565353)}
    static var songs: ITUSymbol {return ITUSymbol(name: "songs", type: 0x656e756d, code: 0x6b537253)}
    static var standard: ITUSymbol {return ITUSymbol(name: "standard", type: 0x656e756d, code: 0x6c777374)}
    static var stopped: ITUSymbol {return ITUSymbol(name: "stopped", type: 0x656e756d, code: 0x6b505353)}
    static var trackListing: ITUSymbol {return ITUSymbol(name: "trackListing", type: 0x656e756d, code: 0x6b54726b)}
    static var unknown: ITUSymbol {return ITUSymbol(name: "unknown", type: 0x656e756d, code: 0x6b556e6b)}
    static var user: ITUSymbol {return ITUSymbol(name: "user", type: 0x656e756d, code: 0x6b527455)}
    static var whitespace: ITUSymbol {return ITUSymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
    static var yes: ITUSymbol {return ITUSymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


/******************************************************************************/
// TOP-LEVEL CONSTANTS

// Namespace for built-in and application-defined symbols, e.g. ITU.documentFile, ITU.unicodeText
let ITU = ITUSymbol.self


// Generic specifier roots. These can be used to construct ITUSpecifiers for use in other
// ITUSpecifiers and ITUCommands, though only real specifiers constructed from a
// ITunes application instance can be used to send commands to the target application.
let ITUapp = ITUSpecifier(appData: nil, aemQuery: AEMQuery.app())
let ITUcon = ITUSpecifier(appData: nil, aemQuery: AEMQuery.con())
let ITUits = ITUSpecifier(appData: nil, aemQuery: AEMQuery.its())

