//
// ITSGlue.swift
// iTunes 12.1.2
// AppleEventBridge.framework 0.7.0
//

import Foundation
import AppleEventBridge


class ITSFormatter: SwiftAEFormatter { // used internally to generate description strings
    
    override var prefix: String {return "ITS"}
    
    override func propertyByCode(code: OSType) -> String? {
        switch (code) {
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
        default: return super.propertyByCode(code) // TO DO: not sure about this; check if formatter throws across to other if not found
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
        default: return super.elementsByCode(code) // ditto
        }
    }
}


class ITSSymbol: SwiftAESymbol {
    
    override var description: String {return "kITS.\(self.aebName)"}
    
    override class func symbol(code: OSType) -> AEBSymbol {
        switch (code) {
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
        default: return super.symbol(code)
        }
    }

    // Types/properties    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var April: ITSSymbol {return ITSSymbol(name: "April", type: 0x74797065, code: 0x61707220)}
    static var August: ITSSymbol {return ITSSymbol(name: "August", type: 0x74797065, code: 0x61756720)}
    static var CString: ITSSymbol {return ITSSymbol(name: "CString", type: 0x74797065, code: 0x63737472)}
    static var December: ITSSymbol {return ITSSymbol(name: "December", type: 0x74797065, code: 0x64656320)}
    static var EPSPicture: ITSSymbol {return ITSSymbol(name: "EPSPicture", type: 0x74797065, code: 0x45505320)}
    static var EQ: ITSSymbol {return ITSSymbol(name: "EQ", type: 0x74797065, code: 0x70455170)}
    static var EQEnabled: ITSSymbol {return ITSSymbol(name: "EQEnabled", type: 0x74797065, code: 0x70455120)}
    static var EQPreset: ITSSymbol {return ITSSymbol(name: "EQPreset", type: 0x74797065, code: 0x63455150)}
    static var EQWindow: ITSSymbol {return ITSSymbol(name: "EQWindow", type: 0x74797065, code: 0x63455157)}
    static var February: ITSSymbol {return ITSSymbol(name: "February", type: 0x74797065, code: 0x66656220)}
    static var Friday: ITSSymbol {return ITSSymbol(name: "Friday", type: 0x74797065, code: 0x66726920)}
    static var GIFPicture: ITSSymbol {return ITSSymbol(name: "GIFPicture", type: 0x74797065, code: 0x47494666)}
    static var JPEGPicture: ITSSymbol {return ITSSymbol(name: "JPEGPicture", type: 0x74797065, code: 0x4a504547)}
    static var January: ITSSymbol {return ITSSymbol(name: "January", type: 0x74797065, code: 0x6a616e20)}
    static var July: ITSSymbol {return ITSSymbol(name: "July", type: 0x74797065, code: 0x6a756c20)}
    static var June: ITSSymbol {return ITSSymbol(name: "June", type: 0x74797065, code: 0x6a756e20)}
    static var March: ITSSymbol {return ITSSymbol(name: "March", type: 0x74797065, code: 0x6d617220)}
    static var May: ITSSymbol {return ITSSymbol(name: "May", type: 0x74797065, code: 0x6d617920)}
    static var Monday: ITSSymbol {return ITSSymbol(name: "Monday", type: 0x74797065, code: 0x6d6f6e20)}
    static var November: ITSSymbol {return ITSSymbol(name: "November", type: 0x74797065, code: 0x6e6f7620)}
    static var October: ITSSymbol {return ITSSymbol(name: "October", type: 0x74797065, code: 0x6f637420)}
    static var PICTPicture: ITSSymbol {return ITSSymbol(name: "PICTPicture", type: 0x74797065, code: 0x50494354)}
    static var PascalString: ITSSymbol {return ITSSymbol(name: "PascalString", type: 0x74797065, code: 0x70737472)}
    static var RGB16Color: ITSSymbol {return ITSSymbol(name: "RGB16Color", type: 0x74797065, code: 0x74723136)}
    static var RGB96Color: ITSSymbol {return ITSSymbol(name: "RGB96Color", type: 0x74797065, code: 0x74723936)}
    static var RGBColor: ITSSymbol {return ITSSymbol(name: "RGBColor", type: 0x74797065, code: 0x63524742)}
    static var Saturday: ITSSymbol {return ITSSymbol(name: "Saturday", type: 0x74797065, code: 0x73617420)}
    static var September: ITSSymbol {return ITSSymbol(name: "September", type: 0x74797065, code: 0x73657020)}
    static var Sunday: ITSSymbol {return ITSSymbol(name: "Sunday", type: 0x74797065, code: 0x73756e20)}
    static var TIFFPicture: ITSSymbol {return ITSSymbol(name: "TIFFPicture", type: 0x74797065, code: 0x54494646)}
    static var Thursday: ITSSymbol {return ITSSymbol(name: "Thursday", type: 0x74797065, code: 0x74687520)}
    static var Tuesday: ITSSymbol {return ITSSymbol(name: "Tuesday", type: 0x74797065, code: 0x74756520)}
    static var URLTrack: ITSSymbol {return ITSSymbol(name: "URLTrack", type: 0x74797065, code: 0x63555254)}
    static var UTF16Text: ITSSymbol {return ITSSymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
    static var UTF8Text: ITSSymbol {return ITSSymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
    static var UnicodeText: ITSSymbol {return ITSSymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
    static var Wednesday: ITSSymbol {return ITSSymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
    static var address: ITSSymbol {return ITSSymbol(name: "address", type: 0x74797065, code: 0x7055524c)}
    static var album: ITSSymbol {return ITSSymbol(name: "album", type: 0x74797065, code: 0x70416c62)}
    static var albumArtist: ITSSymbol {return ITSSymbol(name: "albumArtist", type: 0x74797065, code: 0x70416c41)}
    static var albumRating: ITSSymbol {return ITSSymbol(name: "albumRating", type: 0x74797065, code: 0x70416c52)}
    static var albumRatingKind: ITSSymbol {return ITSSymbol(name: "albumRatingKind", type: 0x74797065, code: 0x7041526b)}
    static var alias: ITSSymbol {return ITSSymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
    static var anything: ITSSymbol {return ITSSymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
    static var application: ITSSymbol {return ITSSymbol(name: "application", type: 0x74797065, code: 0x63617070)}
    static var applicationBundleID: ITSSymbol {return ITSSymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
    static var applicationSignature: ITSSymbol {return ITSSymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
    static var applicationURL: ITSSymbol {return ITSSymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
    static var artist: ITSSymbol {return ITSSymbol(name: "artist", type: 0x74797065, code: 0x70417274)}
    static var artwork: ITSSymbol {return ITSSymbol(name: "artwork", type: 0x74797065, code: 0x63417274)}
    static var audioCDPlaylist: ITSSymbol {return ITSSymbol(name: "audioCDPlaylist", type: 0x74797065, code: 0x63434450)}
    static var audioCDTrack: ITSSymbol {return ITSSymbol(name: "audioCDTrack", type: 0x74797065, code: 0x63434454)}
    static var band1: ITSSymbol {return ITSSymbol(name: "band1", type: 0x74797065, code: 0x70455131)}
    static var band10: ITSSymbol {return ITSSymbol(name: "band10", type: 0x74797065, code: 0x70455130)}
    static var band2: ITSSymbol {return ITSSymbol(name: "band2", type: 0x74797065, code: 0x70455132)}
    static var band3: ITSSymbol {return ITSSymbol(name: "band3", type: 0x74797065, code: 0x70455133)}
    static var band4: ITSSymbol {return ITSSymbol(name: "band4", type: 0x74797065, code: 0x70455134)}
    static var band5: ITSSymbol {return ITSSymbol(name: "band5", type: 0x74797065, code: 0x70455135)}
    static var band6: ITSSymbol {return ITSSymbol(name: "band6", type: 0x74797065, code: 0x70455136)}
    static var band7: ITSSymbol {return ITSSymbol(name: "band7", type: 0x74797065, code: 0x70455137)}
    static var band8: ITSSymbol {return ITSSymbol(name: "band8", type: 0x74797065, code: 0x70455138)}
    static var band9: ITSSymbol {return ITSSymbol(name: "band9", type: 0x74797065, code: 0x70455139)}
    static var best: ITSSymbol {return ITSSymbol(name: "best", type: 0x74797065, code: 0x62657374)}
    static var bitRate: ITSSymbol {return ITSSymbol(name: "bitRate", type: 0x74797065, code: 0x70425274)}
    static var bookmark: ITSSymbol {return ITSSymbol(name: "bookmark", type: 0x74797065, code: 0x70426b74)}
    static var bookmarkable: ITSSymbol {return ITSSymbol(name: "bookmarkable", type: 0x74797065, code: 0x70426b6d)}
    static var boolean: ITSSymbol {return ITSSymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
    static var boundingRectangle: ITSSymbol {return ITSSymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
    static var bounds: ITSSymbol {return ITSSymbol(name: "bounds", type: 0x74797065, code: 0x70626e64)}
    static var bpm: ITSSymbol {return ITSSymbol(name: "bpm", type: 0x74797065, code: 0x7042504d)}
    static var browserWindow: ITSSymbol {return ITSSymbol(name: "browserWindow", type: 0x74797065, code: 0x63427257)}
    static var capacity: ITSSymbol {return ITSSymbol(name: "capacity", type: 0x74797065, code: 0x63617061)}
    static var category: ITSSymbol {return ITSSymbol(name: "category", type: 0x74797065, code: 0x70436174)}
    static var centimeters: ITSSymbol {return ITSSymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
    static var classInfo: ITSSymbol {return ITSSymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
    static var class_: ITSSymbol {return ITSSymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
    static var closeable: ITSSymbol {return ITSSymbol(name: "closeable", type: 0x74797065, code: 0x68636c62)}
    static var collapseable: ITSSymbol {return ITSSymbol(name: "collapseable", type: 0x74797065, code: 0x70575368)}
    static var collapsed: ITSSymbol {return ITSSymbol(name: "collapsed", type: 0x74797065, code: 0x77736864)}
    static var collating: ITSSymbol {return ITSSymbol(name: "collating", type: 0x74797065, code: 0x6c77636c)}
    static var colorTable: ITSSymbol {return ITSSymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
    static var comment: ITSSymbol {return ITSSymbol(name: "comment", type: 0x74797065, code: 0x70436d74)}
    static var compilation: ITSSymbol {return ITSSymbol(name: "compilation", type: 0x74797065, code: 0x70416e74)}
    static var composer: ITSSymbol {return ITSSymbol(name: "composer", type: 0x74797065, code: 0x70436d70)}
    static var container: ITSSymbol {return ITSSymbol(name: "container", type: 0x74797065, code: 0x63746e72)}
    static var copies: ITSSymbol {return ITSSymbol(name: "copies", type: 0x74797065, code: 0x6c776370)}
    static var cubicCentimeters: ITSSymbol {return ITSSymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
    static var cubicFeet: ITSSymbol {return ITSSymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
    static var cubicInches: ITSSymbol {return ITSSymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
    static var cubicMeters: ITSSymbol {return ITSSymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
    static var cubicYards: ITSSymbol {return ITSSymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
    static var currentEQPreset: ITSSymbol {return ITSSymbol(name: "currentEQPreset", type: 0x74797065, code: 0x70455150)}
    static var currentEncoder: ITSSymbol {return ITSSymbol(name: "currentEncoder", type: 0x74797065, code: 0x70456e63)}
    static var currentPlaylist: ITSSymbol {return ITSSymbol(name: "currentPlaylist", type: 0x74797065, code: 0x70506c61)}
    static var currentStreamTitle: ITSSymbol {return ITSSymbol(name: "currentStreamTitle", type: 0x74797065, code: 0x70537454)}
    static var currentStreamURL: ITSSymbol {return ITSSymbol(name: "currentStreamURL", type: 0x74797065, code: 0x70537455)}
    static var currentTrack: ITSSymbol {return ITSSymbol(name: "currentTrack", type: 0x74797065, code: 0x7054726b)}
    static var currentVisual: ITSSymbol {return ITSSymbol(name: "currentVisual", type: 0x74797065, code: 0x70566973)}
    static var dashStyle: ITSSymbol {return ITSSymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
    static var data: ITSSymbol {return ITSSymbol(name: "data", type: 0x74797065, code: 0x72646174)}
    static var data_: ITSSymbol {return ITSSymbol(name: "data_", type: 0x74797065, code: 0x70504354)}
    static var databaseID: ITSSymbol {return ITSSymbol(name: "databaseID", type: 0x74797065, code: 0x70444944)}
    static var date: ITSSymbol {return ITSSymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
    static var dateAdded: ITSSymbol {return ITSSymbol(name: "dateAdded", type: 0x74797065, code: 0x70416464)}
    static var decimalStruct: ITSSymbol {return ITSSymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
    static var degreesCelsius: ITSSymbol {return ITSSymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
    static var degreesFahrenheit: ITSSymbol {return ITSSymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
    static var degreesKelvin: ITSSymbol {return ITSSymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
    static var description_: ITSSymbol {return ITSSymbol(name: "description_", type: 0x74797065, code: 0x70446573)}
    static var devicePlaylist: ITSSymbol {return ITSSymbol(name: "devicePlaylist", type: 0x74797065, code: 0x63447650)}
    static var deviceTrack: ITSSymbol {return ITSSymbol(name: "deviceTrack", type: 0x74797065, code: 0x63447654)}
    static var discCount: ITSSymbol {return ITSSymbol(name: "discCount", type: 0x74797065, code: 0x70447343)}
    static var discNumber: ITSSymbol {return ITSSymbol(name: "discNumber", type: 0x74797065, code: 0x7044734e)}
    static var doubleInteger: ITSSymbol {return ITSSymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
    static var downloaded: ITSSymbol {return ITSSymbol(name: "downloaded", type: 0x74797065, code: 0x70446c41)}
    static var duration: ITSSymbol {return ITSSymbol(name: "duration", type: 0x74797065, code: 0x70447572)}
    static var elementInfo: ITSSymbol {return ITSSymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
    static var enabled: ITSSymbol {return ITSSymbol(name: "enabled", type: 0x74797065, code: 0x656e626c)}
    static var encodedString: ITSSymbol {return ITSSymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
    static var encoder: ITSSymbol {return ITSSymbol(name: "encoder", type: 0x74797065, code: 0x63456e63)}
    static var endingPage: ITSSymbol {return ITSSymbol(name: "endingPage", type: 0x74797065, code: 0x6c776c70)}
    static var enumerator: ITSSymbol {return ITSSymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
    static var episodeID: ITSSymbol {return ITSSymbol(name: "episodeID", type: 0x74797065, code: 0x70457044)}
    static var episodeNumber: ITSSymbol {return ITSSymbol(name: "episodeNumber", type: 0x74797065, code: 0x7045704e)}
    static var errorHandling: ITSSymbol {return ITSSymbol(name: "errorHandling", type: 0x74797065, code: 0x6c776568)}
    static var eventInfo: ITSSymbol {return ITSSymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
    static var extendedFloat: ITSSymbol {return ITSSymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
    static var faxNumber: ITSSymbol {return ITSSymbol(name: "faxNumber", type: 0x74797065, code: 0x6661786e)}
    static var feet: ITSSymbol {return ITSSymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
    static var fileRef: ITSSymbol {return ITSSymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
    static var fileSpecification: ITSSymbol {return ITSSymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
    static var fileTrack: ITSSymbol {return ITSSymbol(name: "fileTrack", type: 0x74797065, code: 0x63466c54)}
    static var fileURL: ITSSymbol {return ITSSymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
    static var finish: ITSSymbol {return ITSSymbol(name: "finish", type: 0x74797065, code: 0x70537470)}
    static var fixed: ITSSymbol {return ITSSymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
    static var fixedIndexing: ITSSymbol {return ITSSymbol(name: "fixedIndexing", type: 0x74797065, code: 0x70466978)}
    static var fixedPoint: ITSSymbol {return ITSSymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
    static var fixedRectangle: ITSSymbol {return ITSSymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
    static var float: ITSSymbol {return ITSSymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
    static var float128bit: ITSSymbol {return ITSSymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
    static var folderPlaylist: ITSSymbol {return ITSSymbol(name: "folderPlaylist", type: 0x74797065, code: 0x63466f50)}
    static var format: ITSSymbol {return ITSSymbol(name: "format", type: 0x74797065, code: 0x70466d74)}
    static var freeSpace: ITSSymbol {return ITSSymbol(name: "freeSpace", type: 0x74797065, code: 0x66727370)}
    static var frontmost: ITSSymbol {return ITSSymbol(name: "frontmost", type: 0x74797065, code: 0x70697366)}
    static var fullScreen: ITSSymbol {return ITSSymbol(name: "fullScreen", type: 0x74797065, code: 0x70465363)}
    static var gallons: ITSSymbol {return ITSSymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
    static var gapless: ITSSymbol {return ITSSymbol(name: "gapless", type: 0x74797065, code: 0x7047706c)}
    static var genre: ITSSymbol {return ITSSymbol(name: "genre", type: 0x74797065, code: 0x7047656e)}
    static var grams: ITSSymbol {return ITSSymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
    static var graphicText: ITSSymbol {return ITSSymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
    static var grouping: ITSSymbol {return ITSSymbol(name: "grouping", type: 0x74797065, code: 0x70477270)}
    static var id: ITSSymbol {return ITSSymbol(name: "id", type: 0x74797065, code: 0x49442020)}
    static var inches: ITSSymbol {return ITSSymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
    static var index: ITSSymbol {return ITSSymbol(name: "index", type: 0x74797065, code: 0x70696478)}
    static var integer: ITSSymbol {return ITSSymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
    static var internationalText: ITSSymbol {return ITSSymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
    static var internationalWritingCode: ITSSymbol {return ITSSymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
    static var item: ITSSymbol {return ITSSymbol(name: "item", type: 0x74797065, code: 0x636f626a)}
    static var kernelProcessID: ITSSymbol {return ITSSymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
    static var kilograms: ITSSymbol {return ITSSymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
    static var kilometers: ITSSymbol {return ITSSymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
    static var kind: ITSSymbol {return ITSSymbol(name: "kind", type: 0x74797065, code: 0x704b6e64)}
    static var libraryPlaylist: ITSSymbol {return ITSSymbol(name: "libraryPlaylist", type: 0x74797065, code: 0x634c6950)}
    static var list: ITSSymbol {return ITSSymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
    static var liters: ITSSymbol {return ITSSymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
    static var location: ITSSymbol {return ITSSymbol(name: "location", type: 0x74797065, code: 0x704c6f63)}
    static var locationReference: ITSSymbol {return ITSSymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
    static var longDescription: ITSSymbol {return ITSSymbol(name: "longDescription", type: 0x74797065, code: 0x704c6473)}
    static var longFixed: ITSSymbol {return ITSSymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
    static var longFixedPoint: ITSSymbol {return ITSSymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
    static var longFixedRectangle: ITSSymbol {return ITSSymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
    static var longPoint: ITSSymbol {return ITSSymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
    static var longRectangle: ITSSymbol {return ITSSymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
    static var lyrics: ITSSymbol {return ITSSymbol(name: "lyrics", type: 0x74797065, code: 0x704c7972)}
    static var machPort: ITSSymbol {return ITSSymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
    static var machine: ITSSymbol {return ITSSymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
    static var machineLocation: ITSSymbol {return ITSSymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
    static var meters: ITSSymbol {return ITSSymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
    static var miles: ITSSymbol {return ITSSymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
    static var minimized: ITSSymbol {return ITSSymbol(name: "minimized", type: 0x74797065, code: 0x704d696e)}
    static var missingValue: ITSSymbol {return ITSSymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
    static var modifiable: ITSSymbol {return ITSSymbol(name: "modifiable", type: 0x74797065, code: 0x704d6f64)}
    static var modificationDate: ITSSymbol {return ITSSymbol(name: "modificationDate", type: 0x74797065, code: 0x61736d6f)}
    static var mute: ITSSymbol {return ITSSymbol(name: "mute", type: 0x74797065, code: 0x704d7574)}
    static var name: ITSSymbol {return ITSSymbol(name: "name", type: 0x74797065, code: 0x706e616d)}
    static var null: ITSSymbol {return ITSSymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
    static var ounces: ITSSymbol {return ITSSymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
    static var pagesAcross: ITSSymbol {return ITSSymbol(name: "pagesAcross", type: 0x74797065, code: 0x6c776c61)}
    static var pagesDown: ITSSymbol {return ITSSymbol(name: "pagesDown", type: 0x74797065, code: 0x6c776c64)}
    static var parameterInfo: ITSSymbol {return ITSSymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
    static var parent: ITSSymbol {return ITSSymbol(name: "parent", type: 0x74797065, code: 0x70506c50)}
    static var persistentID: ITSSymbol {return ITSSymbol(name: "persistentID", type: 0x74797065, code: 0x70504953)}
    static var picture: ITSSymbol {return ITSSymbol(name: "picture", type: 0x74797065, code: 0x50494354)}
    static var pixelMapRecord: ITSSymbol {return ITSSymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
    static var playedCount: ITSSymbol {return ITSSymbol(name: "playedCount", type: 0x74797065, code: 0x70506c43)}
    static var playedDate: ITSSymbol {return ITSSymbol(name: "playedDate", type: 0x74797065, code: 0x70506c44)}
    static var playerPosition: ITSSymbol {return ITSSymbol(name: "playerPosition", type: 0x74797065, code: 0x70506f73)}
    static var playerState: ITSSymbol {return ITSSymbol(name: "playerState", type: 0x74797065, code: 0x70506c53)}
    static var playlist: ITSSymbol {return ITSSymbol(name: "playlist", type: 0x74797065, code: 0x63506c79)}
    static var playlistWindow: ITSSymbol {return ITSSymbol(name: "playlistWindow", type: 0x74797065, code: 0x63506c57)}
    static var podcast: ITSSymbol {return ITSSymbol(name: "podcast", type: 0x74797065, code: 0x70545063)}
    static var point: ITSSymbol {return ITSSymbol(name: "point", type: 0x74797065, code: 0x51447074)}
    static var position: ITSSymbol {return ITSSymbol(name: "position", type: 0x74797065, code: 0x70706f73)}
    static var pounds: ITSSymbol {return ITSSymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
    static var preamp: ITSSymbol {return ITSSymbol(name: "preamp", type: 0x74797065, code: 0x70455141)}
    static var printSettings: ITSSymbol {return ITSSymbol(name: "printSettings", type: 0x74797065, code: 0x70736574)}
    static var printerFeatures: ITSSymbol {return ITSSymbol(name: "printerFeatures", type: 0x74797065, code: 0x6c777066)}
    static var processSerialNumber: ITSSymbol {return ITSSymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
    static var properties: ITSSymbol {return ITSSymbol(name: "properties", type: 0x74797065, code: 0x70414c4c)}
    static var property: ITSSymbol {return ITSSymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
    static var propertyInfo: ITSSymbol {return ITSSymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
    static var quarts: ITSSymbol {return ITSSymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
    static var radioTunerPlaylist: ITSSymbol {return ITSSymbol(name: "radioTunerPlaylist", type: 0x74797065, code: 0x63525450)}
    static var rating: ITSSymbol {return ITSSymbol(name: "rating", type: 0x74797065, code: 0x70527465)}
    static var ratingKind: ITSSymbol {return ITSSymbol(name: "ratingKind", type: 0x74797065, code: 0x7052746b)}
    static var rawData: ITSSymbol {return ITSSymbol(name: "rawData", type: 0x74797065, code: 0x74647461)}
    static var record: ITSSymbol {return ITSSymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
    static var reference: ITSSymbol {return ITSSymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
    static var releaseDate: ITSSymbol {return ITSSymbol(name: "releaseDate", type: 0x74797065, code: 0x70526c44)}
    static var requestedPrintTime: ITSSymbol {return ITSSymbol(name: "requestedPrintTime", type: 0x74797065, code: 0x6c777174)}
    static var resizable: ITSSymbol {return ITSSymbol(name: "resizable", type: 0x74797065, code: 0x7072737a)}
    static var rotation: ITSSymbol {return ITSSymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
    static var sampleRate: ITSSymbol {return ITSSymbol(name: "sampleRate", type: 0x74797065, code: 0x70535274)}
    static var script: ITSSymbol {return ITSSymbol(name: "script", type: 0x74797065, code: 0x73637074)}
    static var seasonNumber: ITSSymbol {return ITSSymbol(name: "seasonNumber", type: 0x74797065, code: 0x7053654e)}
    static var selection: ITSSymbol {return ITSSymbol(name: "selection", type: 0x74797065, code: 0x73656c65)}
    static var shared: ITSSymbol {return ITSSymbol(name: "shared", type: 0x74797065, code: 0x70536872)}
    static var sharedTrack: ITSSymbol {return ITSSymbol(name: "sharedTrack", type: 0x74797065, code: 0x63536854)}
    static var shortFloat: ITSSymbol {return ITSSymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
    static var shortInteger: ITSSymbol {return ITSSymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
    static var show: ITSSymbol {return ITSSymbol(name: "show", type: 0x74797065, code: 0x70536877)}
    static var shufflable: ITSSymbol {return ITSSymbol(name: "shufflable", type: 0x74797065, code: 0x70536661)}
    static var shuffle: ITSSymbol {return ITSSymbol(name: "shuffle", type: 0x74797065, code: 0x70536866)}
    static var size: ITSSymbol {return ITSSymbol(name: "size", type: 0x74797065, code: 0x7053697a)}
    static var skippedCount: ITSSymbol {return ITSSymbol(name: "skippedCount", type: 0x74797065, code: 0x70536b43)}
    static var skippedDate: ITSSymbol {return ITSSymbol(name: "skippedDate", type: 0x74797065, code: 0x70536b44)}
    static var smart: ITSSymbol {return ITSSymbol(name: "smart", type: 0x74797065, code: 0x70536d74)}
    static var songRepeat: ITSSymbol {return ITSSymbol(name: "songRepeat", type: 0x74797065, code: 0x70527074)}
    static var sortAlbum: ITSSymbol {return ITSSymbol(name: "sortAlbum", type: 0x74797065, code: 0x7053416c)}
    static var sortAlbumArtist: ITSSymbol {return ITSSymbol(name: "sortAlbumArtist", type: 0x74797065, code: 0x70534141)}
    static var sortArtist: ITSSymbol {return ITSSymbol(name: "sortArtist", type: 0x74797065, code: 0x70534172)}
    static var sortComposer: ITSSymbol {return ITSSymbol(name: "sortComposer", type: 0x74797065, code: 0x7053436d)}
    static var sortName: ITSSymbol {return ITSSymbol(name: "sortName", type: 0x74797065, code: 0x70534e6d)}
    static var sortShow: ITSSymbol {return ITSSymbol(name: "sortShow", type: 0x74797065, code: 0x7053534e)}
    static var soundVolume: ITSSymbol {return ITSSymbol(name: "soundVolume", type: 0x74797065, code: 0x70566f6c)}
    static var source: ITSSymbol {return ITSSymbol(name: "source", type: 0x74797065, code: 0x63537263)}
    static var specialKind: ITSSymbol {return ITSSymbol(name: "specialKind", type: 0x74797065, code: 0x7053704b)}
    static var squareFeet: ITSSymbol {return ITSSymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
    static var squareKilometers: ITSSymbol {return ITSSymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
    static var squareMeters: ITSSymbol {return ITSSymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
    static var squareMiles: ITSSymbol {return ITSSymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
    static var squareYards: ITSSymbol {return ITSSymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
    static var start: ITSSymbol {return ITSSymbol(name: "start", type: 0x74797065, code: 0x70537472)}
    static var startingPage: ITSSymbol {return ITSSymbol(name: "startingPage", type: 0x74797065, code: 0x6c776670)}
    static var string: ITSSymbol {return ITSSymbol(name: "string", type: 0x74797065, code: 0x54455854)}
    static var styledClipboardText: ITSSymbol {return ITSSymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
    static var styledText: ITSSymbol {return ITSSymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
    static var styledUnicodeText: ITSSymbol {return ITSSymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
    static var suiteInfo: ITSSymbol {return ITSSymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
    static var targetPrinter: ITSSymbol {return ITSSymbol(name: "targetPrinter", type: 0x74797065, code: 0x74727072)}
    static var textStyleInfo: ITSSymbol {return ITSSymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
    static var time: ITSSymbol {return ITSSymbol(name: "time", type: 0x74797065, code: 0x7054696d)}
    static var track: ITSSymbol {return ITSSymbol(name: "track", type: 0x74797065, code: 0x6354726b)}
    static var trackCount: ITSSymbol {return ITSSymbol(name: "trackCount", type: 0x74797065, code: 0x70547243)}
    static var trackNumber: ITSSymbol {return ITSSymbol(name: "trackNumber", type: 0x74797065, code: 0x7054724e)}
    static var typeClass: ITSSymbol {return ITSSymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
    static var unplayed: ITSSymbol {return ITSSymbol(name: "unplayed", type: 0x74797065, code: 0x70556e70)}
    static var unsignedInteger: ITSSymbol {return ITSSymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
    static var updateTracks: ITSSymbol {return ITSSymbol(name: "updateTracks", type: 0x74797065, code: 0x70555443)}
    static var userPlaylist: ITSSymbol {return ITSSymbol(name: "userPlaylist", type: 0x74797065, code: 0x63557350)}
    static var version_: ITSSymbol {return ITSSymbol(name: "version_", type: 0x74797065, code: 0x76657273)}
    static var videoKind: ITSSymbol {return ITSSymbol(name: "videoKind", type: 0x74797065, code: 0x7056644b)}
    static var view: ITSSymbol {return ITSSymbol(name: "view", type: 0x74797065, code: 0x70506c79)}
    static var visible: ITSSymbol {return ITSSymbol(name: "visible", type: 0x74797065, code: 0x70766973)}
    static var visual: ITSSymbol {return ITSSymbol(name: "visual", type: 0x74797065, code: 0x63566973)}
    static var visualSize: ITSSymbol {return ITSSymbol(name: "visualSize", type: 0x74797065, code: 0x7056537a)}
    static var visualsEnabled: ITSSymbol {return ITSSymbol(name: "visualsEnabled", type: 0x74797065, code: 0x70567345)}
    static var volumeAdjustment: ITSSymbol {return ITSSymbol(name: "volumeAdjustment", type: 0x74797065, code: 0x7041646a)}
    static var window: ITSSymbol {return ITSSymbol(name: "window", type: 0x74797065, code: 0x6377696e)}
    static var writingCode: ITSSymbol {return ITSSymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
    static var yards: ITSSymbol {return ITSSymbol(name: "yards", type: 0x74797065, code: 0x79617264)}
    static var year: ITSSymbol {return ITSSymbol(name: "year", type: 0x74797065, code: 0x70597220)}
    static var zoomable: ITSSymbol {return ITSSymbol(name: "zoomable", type: 0x74797065, code: 0x69737a6d)}
    static var zoomed: ITSSymbol {return ITSSymbol(name: "zoomed", type: 0x74797065, code: 0x707a756d)}
    
    // Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var Books: ITSSymbol {return ITSSymbol(name: "Books", type: 0x656e756d, code: 0x6b537041)}
    static var Genius: ITSSymbol {return ITSSymbol(name: "Genius", type: 0x656e756d, code: 0x6b537047)}
    static var Library: ITSSymbol {return ITSSymbol(name: "Library", type: 0x656e756d, code: 0x6b53704c)}
    static var MP3CD: ITSSymbol {return ITSSymbol(name: "MP3CD", type: 0x656e756d, code: 0x6b4d4344)}
    static var Movies: ITSSymbol {return ITSSymbol(name: "Movies", type: 0x656e756d, code: 0x6b537049)}
    static var Music: ITSSymbol {return ITSSymbol(name: "Music", type: 0x656e756d, code: 0x6b53705a)}
    static var PartyShuffle: ITSSymbol {return ITSSymbol(name: "PartyShuffle", type: 0x656e756d, code: 0x6b537053)}
    static var Podcasts: ITSSymbol {return ITSSymbol(name: "Podcasts", type: 0x656e756d, code: 0x6b537050)}
    static var PurchasedMusic: ITSSymbol {return ITSSymbol(name: "PurchasedMusic", type: 0x656e756d, code: 0x6b53704d)}
    static var TVShow: ITSSymbol {return ITSSymbol(name: "TVShow", type: 0x656e756d, code: 0x6b566454)}
    static var TVShows: ITSSymbol {return ITSSymbol(name: "TVShows", type: 0x656e756d, code: 0x6b537054)}
    static var albumListing: ITSSymbol {return ITSSymbol(name: "albumListing", type: 0x656e756d, code: 0x6b416c62)}
    static var albums: ITSSymbol {return ITSSymbol(name: "albums", type: 0x656e756d, code: 0x6b53724c)}
    static var all: ITSSymbol {return ITSSymbol(name: "all", type: 0x656e756d, code: 0x6b416c6c)}
    static var applicationResponses: ITSSymbol {return ITSSymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
    static var artists: ITSSymbol {return ITSSymbol(name: "artists", type: 0x656e756d, code: 0x6b537252)}
    static var ask: ITSSymbol {return ITSSymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
    static var audioCD: ITSSymbol {return ITSSymbol(name: "audioCD", type: 0x656e756d, code: 0x6b414344)}
    static var case_: ITSSymbol {return ITSSymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
    static var cdInsert: ITSSymbol {return ITSSymbol(name: "cdInsert", type: 0x656e756d, code: 0x6b434469)}
    static var composers: ITSSymbol {return ITSSymbol(name: "composers", type: 0x656e756d, code: 0x6b537243)}
    static var computed: ITSSymbol {return ITSSymbol(name: "computed", type: 0x656e756d, code: 0x6b527443)}
    static var detailed: ITSSymbol {return ITSSymbol(name: "detailed", type: 0x656e756d, code: 0x6c776474)}
    static var device: ITSSymbol {return ITSSymbol(name: "device", type: 0x656e756d, code: 0x6b446576)}
    static var diacriticals: ITSSymbol {return ITSSymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
    static var displayed: ITSSymbol {return ITSSymbol(name: "displayed", type: 0x656e756d, code: 0x6b537256)}
    static var expansion: ITSSymbol {return ITSSymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
    static var fastForwarding: ITSSymbol {return ITSSymbol(name: "fastForwarding", type: 0x656e756d, code: 0x6b505346)}
    static var folder: ITSSymbol {return ITSSymbol(name: "folder", type: 0x656e756d, code: 0x6b537046)}
    static var hyphens: ITSSymbol {return ITSSymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
    static var iPod: ITSSymbol {return ITSSymbol(name: "iPod", type: 0x656e756d, code: 0x6b506f64)}
    static var iTunesU: ITSSymbol {return ITSSymbol(name: "iTunesU", type: 0x656e756d, code: 0x6b537055)}
    static var large: ITSSymbol {return ITSSymbol(name: "large", type: 0x656e756d, code: 0x6b56534c)}
    static var library: ITSSymbol {return ITSSymbol(name: "library", type: 0x656e756d, code: 0x6b4c6962)}
    static var medium: ITSSymbol {return ITSSymbol(name: "medium", type: 0x656e756d, code: 0x6b56534d)}
    static var movie: ITSSymbol {return ITSSymbol(name: "movie", type: 0x656e756d, code: 0x6b56644d)}
    static var musicVideo: ITSSymbol {return ITSSymbol(name: "musicVideo", type: 0x656e756d, code: 0x6b566456)}
    static var no: ITSSymbol {return ITSSymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
    static var none_: ITSSymbol {return ITSSymbol(name: "none_", type: 0x656e756d, code: 0x6b4e6f6e)}
    static var numericStrings: ITSSymbol {return ITSSymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
    static var off: ITSSymbol {return ITSSymbol(name: "off", type: 0x656e756d, code: 0x6b52704f)}
    static var one: ITSSymbol {return ITSSymbol(name: "one", type: 0x656e756d, code: 0x6b527031)}
    static var paused: ITSSymbol {return ITSSymbol(name: "paused", type: 0x656e756d, code: 0x6b505370)}
    static var playing: ITSSymbol {return ITSSymbol(name: "playing", type: 0x656e756d, code: 0x6b505350)}
    static var punctuation: ITSSymbol {return ITSSymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
    static var radioTuner: ITSSymbol {return ITSSymbol(name: "radioTuner", type: 0x656e756d, code: 0x6b54756e)}
    static var rewinding: ITSSymbol {return ITSSymbol(name: "rewinding", type: 0x656e756d, code: 0x6b505352)}
    static var sharedLibrary: ITSSymbol {return ITSSymbol(name: "sharedLibrary", type: 0x656e756d, code: 0x6b536864)}
    static var small: ITSSymbol {return ITSSymbol(name: "small", type: 0x656e756d, code: 0x6b565353)}
    static var songs: ITSSymbol {return ITSSymbol(name: "songs", type: 0x656e756d, code: 0x6b537253)}
    static var standard: ITSSymbol {return ITSSymbol(name: "standard", type: 0x656e756d, code: 0x6c777374)}
    static var stopped: ITSSymbol {return ITSSymbol(name: "stopped", type: 0x656e756d, code: 0x6b505353)}
    static var trackListing: ITSSymbol {return ITSSymbol(name: "trackListing", type: 0x656e756d, code: 0x6b54726b)}
    static var unknown: ITSSymbol {return ITSSymbol(name: "unknown", type: 0x656e756d, code: 0x6b556e6b)}
    static var user: ITSSymbol {return ITSSymbol(name: "user", type: 0x656e756d, code: 0x6b527455)}
    static var whitespace: ITSSymbol {return ITSSymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
    static var yes: ITSSymbol {return ITSSymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


class ITSSpecifier: SwiftAESpecifier {
        
    override var description: String { return ITSFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Element(s) selectors
    // important: by-index selectors use Apple event-style 1-indexing, NOT Swift-style 0-indexing

    subscript(index: AnyObject!) -> ITSSpecifier! { // by-index, by-name, by-test
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        switch (index) {
        case is String:
            return ITSSpecifier(appData: aebAppData, aemQuery:  baseQuery.byName(index))
        case is ITSSpecifier:
            let testClause = (index is AEBSpecifier ? (index as! AEBSpecifier).aemQuery : aemQuery) as! AEMTestClause
            return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.byTest(testClause))
        default:
            return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.byIndex(index))
        }
    }
    func ID(uid: AnyObject) -> ITSSpecifier { // by-id
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.byID(uid))
    }
    subscript(from: AnyObject!, to: AnyObject!) -> ITSSpecifier! { // by-range
        let newQuery = (self.aemQuery as! AEMMultipleElementsSpecifier).byRange(from, to: to)
        return ITSSpecifier(appData: aebAppData, aemQuery: newQuery)
    }
    
    func previous(class_: AEBSymbol) -> ITSSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.previous(class_.aebCode))
    }
    func next(class_: AEBSymbol) -> ITSSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.next(class_.aebCode))
    }
    
    var first:  ITSSpecifier {return ITSSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).first())}
    var middle: ITSSpecifier {return ITSSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).middle())}
    var last:   ITSSpecifier {return ITSSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).last())}
    var any:    ITSSpecifier {return ITSSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).any())}
    
    func beginning() -> ITSSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.beginning())
    }
    func end() -> ITSSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.end())
    }
    func before() -> ITSSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.before())
    }
    func after() -> ITSSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return ITSSpecifier(appData: aebAppData, aemQuery: baseQuery.after())
    }
    
    // Property and element specifiers
    
    func propertyByCode(code: OSType) -> ITSSpecifier {
        return ITSSpecifier(appData: aebAppData, aemQuery: (aemQuery as! AEMObjectSpecifier).property(code))
    }
    func elementsByCode(code: OSType) -> ITSSpecifier {
        return ITSSpecifier(appData: aebAppData, aemQuery: (aemQuery as! AEMObjectSpecifier).elements(code))
    }
    func propertyByFourCharCode(code: String) -> ITSSpecifier {
        return self.propertyByCode(AEM4CC(code))
    }
    func elementsByFourCharCode(code: String) -> ITSSpecifier {
        return self.elementsByCode(AEM4CC(code))
    }
    
    // Properties
    
    var EQ: ITSSpecifier {return self.propertyByCode(0x70455170)}
    var EQEnabled: ITSSpecifier {return self.propertyByCode(0x70455120)}
    var address: ITSSpecifier {return self.propertyByCode(0x7055524c)}
    var album: ITSSpecifier {return self.propertyByCode(0x70416c62)}
    var albumArtist: ITSSpecifier {return self.propertyByCode(0x70416c41)}
    var albumRating: ITSSpecifier {return self.propertyByCode(0x70416c52)}
    var albumRatingKind: ITSSpecifier {return self.propertyByCode(0x7041526b)}
    var artist: ITSSpecifier {return self.propertyByCode(0x70417274)}
    var band1: ITSSpecifier {return self.propertyByCode(0x70455131)}
    var band10: ITSSpecifier {return self.propertyByCode(0x70455130)}
    var band2: ITSSpecifier {return self.propertyByCode(0x70455132)}
    var band3: ITSSpecifier {return self.propertyByCode(0x70455133)}
    var band4: ITSSpecifier {return self.propertyByCode(0x70455134)}
    var band5: ITSSpecifier {return self.propertyByCode(0x70455135)}
    var band6: ITSSpecifier {return self.propertyByCode(0x70455136)}
    var band7: ITSSpecifier {return self.propertyByCode(0x70455137)}
    var band8: ITSSpecifier {return self.propertyByCode(0x70455138)}
    var band9: ITSSpecifier {return self.propertyByCode(0x70455139)}
    var bitRate: ITSSpecifier {return self.propertyByCode(0x70425274)}
    var bookmark: ITSSpecifier {return self.propertyByCode(0x70426b74)}
    var bookmarkable: ITSSpecifier {return self.propertyByCode(0x70426b6d)}
    var bounds: ITSSpecifier {return self.propertyByCode(0x70626e64)}
    var bpm: ITSSpecifier {return self.propertyByCode(0x7042504d)}
    var capacity: ITSSpecifier {return self.propertyByCode(0x63617061)}
    var category: ITSSpecifier {return self.propertyByCode(0x70436174)}
    var class_: ITSSpecifier {return self.propertyByCode(0x70636c73)}
    var closeable: ITSSpecifier {return self.propertyByCode(0x68636c62)}
    var collapseable: ITSSpecifier {return self.propertyByCode(0x70575368)}
    var collapsed: ITSSpecifier {return self.propertyByCode(0x77736864)}
    var collating: ITSSpecifier {return self.propertyByCode(0x6c77636c)}
    var comment: ITSSpecifier {return self.propertyByCode(0x70436d74)}
    var compilation: ITSSpecifier {return self.propertyByCode(0x70416e74)}
    var composer: ITSSpecifier {return self.propertyByCode(0x70436d70)}
    var container: ITSSpecifier {return self.propertyByCode(0x63746e72)}
    var copies: ITSSpecifier {return self.propertyByCode(0x6c776370)}
    var currentEQPreset: ITSSpecifier {return self.propertyByCode(0x70455150)}
    var currentEncoder: ITSSpecifier {return self.propertyByCode(0x70456e63)}
    var currentPlaylist: ITSSpecifier {return self.propertyByCode(0x70506c61)}
    var currentStreamTitle: ITSSpecifier {return self.propertyByCode(0x70537454)}
    var currentStreamURL: ITSSpecifier {return self.propertyByCode(0x70537455)}
    var currentTrack: ITSSpecifier {return self.propertyByCode(0x7054726b)}
    var currentVisual: ITSSpecifier {return self.propertyByCode(0x70566973)}
    var data_: ITSSpecifier {return self.propertyByCode(0x70504354)}
    var databaseID: ITSSpecifier {return self.propertyByCode(0x70444944)}
    var dateAdded: ITSSpecifier {return self.propertyByCode(0x70416464)}
    var description_: ITSSpecifier {return self.propertyByCode(0x70446573)}
    var discCount: ITSSpecifier {return self.propertyByCode(0x70447343)}
    var discNumber: ITSSpecifier {return self.propertyByCode(0x7044734e)}
    var downloaded: ITSSpecifier {return self.propertyByCode(0x70446c41)}
    var duration: ITSSpecifier {return self.propertyByCode(0x70447572)}
    var enabled: ITSSpecifier {return self.propertyByCode(0x656e626c)}
    var endingPage: ITSSpecifier {return self.propertyByCode(0x6c776c70)}
    var episodeID: ITSSpecifier {return self.propertyByCode(0x70457044)}
    var episodeNumber: ITSSpecifier {return self.propertyByCode(0x7045704e)}
    var errorHandling: ITSSpecifier {return self.propertyByCode(0x6c776568)}
    var faxNumber: ITSSpecifier {return self.propertyByCode(0x6661786e)}
    var finish: ITSSpecifier {return self.propertyByCode(0x70537470)}
    var fixedIndexing: ITSSpecifier {return self.propertyByCode(0x70466978)}
    var format: ITSSpecifier {return self.propertyByCode(0x70466d74)}
    var freeSpace: ITSSpecifier {return self.propertyByCode(0x66727370)}
    var frontmost: ITSSpecifier {return self.propertyByCode(0x70697366)}
    var fullScreen: ITSSpecifier {return self.propertyByCode(0x70465363)}
    var gapless: ITSSpecifier {return self.propertyByCode(0x7047706c)}
    var genre: ITSSpecifier {return self.propertyByCode(0x7047656e)}
    var grouping: ITSSpecifier {return self.propertyByCode(0x70477270)}
    var id: ITSSpecifier {return self.propertyByCode(0x49442020)}
    var index: ITSSpecifier {return self.propertyByCode(0x70696478)}
    var kind: ITSSpecifier {return self.propertyByCode(0x704b6e64)}
    var location: ITSSpecifier {return self.propertyByCode(0x704c6f63)}
    var longDescription: ITSSpecifier {return self.propertyByCode(0x704c6473)}
    var lyrics: ITSSpecifier {return self.propertyByCode(0x704c7972)}
    var minimized: ITSSpecifier {return self.propertyByCode(0x704d696e)}
    var modifiable: ITSSpecifier {return self.propertyByCode(0x704d6f64)}
    var modificationDate: ITSSpecifier {return self.propertyByCode(0x61736d6f)}
    var mute: ITSSpecifier {return self.propertyByCode(0x704d7574)}
    var name: ITSSpecifier {return self.propertyByCode(0x706e616d)}
    var pagesAcross: ITSSpecifier {return self.propertyByCode(0x6c776c61)}
    var pagesDown: ITSSpecifier {return self.propertyByCode(0x6c776c64)}
    var parent: ITSSpecifier {return self.propertyByCode(0x70506c50)}
    var persistentID: ITSSpecifier {return self.propertyByCode(0x70504953)}
    var playedCount: ITSSpecifier {return self.propertyByCode(0x70506c43)}
    var playedDate: ITSSpecifier {return self.propertyByCode(0x70506c44)}
    var playerPosition: ITSSpecifier {return self.propertyByCode(0x70506f73)}
    var playerState: ITSSpecifier {return self.propertyByCode(0x70506c53)}
    var podcast: ITSSpecifier {return self.propertyByCode(0x70545063)}
    var position: ITSSpecifier {return self.propertyByCode(0x70706f73)}
    var preamp: ITSSpecifier {return self.propertyByCode(0x70455141)}
    var printerFeatures: ITSSpecifier {return self.propertyByCode(0x6c777066)}
    var properties: ITSSpecifier {return self.propertyByCode(0x70414c4c)}
    var rating: ITSSpecifier {return self.propertyByCode(0x70527465)}
    var ratingKind: ITSSpecifier {return self.propertyByCode(0x7052746b)}
    var rawData: ITSSpecifier {return self.propertyByCode(0x70526177)}
    var releaseDate: ITSSpecifier {return self.propertyByCode(0x70526c44)}
    var requestedPrintTime: ITSSpecifier {return self.propertyByCode(0x6c777174)}
    var resizable: ITSSpecifier {return self.propertyByCode(0x7072737a)}
    var sampleRate: ITSSpecifier {return self.propertyByCode(0x70535274)}
    var seasonNumber: ITSSpecifier {return self.propertyByCode(0x7053654e)}
    var selection: ITSSpecifier {return self.propertyByCode(0x73656c65)}
    var shared: ITSSpecifier {return self.propertyByCode(0x70536872)}
    var show: ITSSpecifier {return self.propertyByCode(0x70536877)}
    var shufflable: ITSSpecifier {return self.propertyByCode(0x70536661)}
    var shuffle: ITSSpecifier {return self.propertyByCode(0x70536866)}
    var size: ITSSpecifier {return self.propertyByCode(0x7053697a)}
    var skippedCount: ITSSpecifier {return self.propertyByCode(0x70536b43)}
    var skippedDate: ITSSpecifier {return self.propertyByCode(0x70536b44)}
    var smart: ITSSpecifier {return self.propertyByCode(0x70536d74)}
    var songRepeat: ITSSpecifier {return self.propertyByCode(0x70527074)}
    var sortAlbum: ITSSpecifier {return self.propertyByCode(0x7053416c)}
    var sortAlbumArtist: ITSSpecifier {return self.propertyByCode(0x70534141)}
    var sortArtist: ITSSpecifier {return self.propertyByCode(0x70534172)}
    var sortComposer: ITSSpecifier {return self.propertyByCode(0x7053436d)}
    var sortName: ITSSpecifier {return self.propertyByCode(0x70534e6d)}
    var sortShow: ITSSpecifier {return self.propertyByCode(0x7053534e)}
    var soundVolume: ITSSpecifier {return self.propertyByCode(0x70566f6c)}
    var specialKind: ITSSpecifier {return self.propertyByCode(0x7053704b)}
    var start: ITSSpecifier {return self.propertyByCode(0x70537472)}
    var startingPage: ITSSpecifier {return self.propertyByCode(0x6c776670)}
    var targetPrinter: ITSSpecifier {return self.propertyByCode(0x74727072)}
    var time: ITSSpecifier {return self.propertyByCode(0x7054696d)}
    var trackCount: ITSSpecifier {return self.propertyByCode(0x70547243)}
    var trackNumber: ITSSpecifier {return self.propertyByCode(0x7054724e)}
    var unplayed: ITSSpecifier {return self.propertyByCode(0x70556e70)}
    var updateTracks: ITSSpecifier {return self.propertyByCode(0x70555443)}
    var version_: ITSSpecifier {return self.propertyByCode(0x76657273)}
    var videoKind: ITSSpecifier {return self.propertyByCode(0x7056644b)}
    var view: ITSSpecifier {return self.propertyByCode(0x70506c79)}
    var visible: ITSSpecifier {return self.propertyByCode(0x70766973)}
    var visualSize: ITSSpecifier {return self.propertyByCode(0x7056537a)}
    var visualsEnabled: ITSSpecifier {return self.propertyByCode(0x70567345)}
    var volumeAdjustment: ITSSpecifier {return self.propertyByCode(0x7041646a)}
    var year: ITSSpecifier {return self.propertyByCode(0x70597220)}
    var zoomable: ITSSpecifier {return self.propertyByCode(0x69737a6d)}
    var zoomed: ITSSpecifier {return self.propertyByCode(0x707a756d)}
    
    // Elements
    
    var EQPresets: ITSSpecifier {return self.elementsByCode(0x63455150)}
    var EQWindows: ITSSpecifier {return self.elementsByCode(0x63455157)}
    var URLTracks: ITSSpecifier {return self.elementsByCode(0x63555254)}
    var applications: ITSSpecifier {return self.elementsByCode(0x63617070)}
    var artworks: ITSSpecifier {return self.elementsByCode(0x63417274)}
    var audioCDPlaylists: ITSSpecifier {return self.elementsByCode(0x63434450)}
    var audioCDTracks: ITSSpecifier {return self.elementsByCode(0x63434454)}
    var browserWindows: ITSSpecifier {return self.elementsByCode(0x63427257)}
    var devicePlaylists: ITSSpecifier {return self.elementsByCode(0x63447650)}
    var deviceTracks: ITSSpecifier {return self.elementsByCode(0x63447654)}
    var encoders: ITSSpecifier {return self.elementsByCode(0x63456e63)}
    var fileTracks: ITSSpecifier {return self.elementsByCode(0x63466c54)}
    var folderPlaylists: ITSSpecifier {return self.elementsByCode(0x63466f50)}
    var items: ITSSpecifier {return self.elementsByCode(0x636f626a)}
    var libraryPlaylists: ITSSpecifier {return self.elementsByCode(0x634c6950)}
    var picture: ITSSpecifier {return self.elementsByCode(0x50494354)}
    var playlistWindows: ITSSpecifier {return self.elementsByCode(0x63506c57)}
    var playlists: ITSSpecifier {return self.elementsByCode(0x63506c79)}
    var printSettings: ITSSpecifier {return self.elementsByCode(0x70736574)}
    var radioTunerPlaylists: ITSSpecifier {return self.elementsByCode(0x63525450)}
    var sharedTracks: ITSSpecifier {return self.elementsByCode(0x63536854)}
    var sources: ITSSpecifier {return self.elementsByCode(0x63537263)}
    var tracks: ITSSpecifier {return self.elementsByCode(0x6354726b)}
    var userPlaylists: ITSSpecifier {return self.elementsByCode(0x63557350)}
    var visuals: ITSSpecifier {return self.elementsByCode(0x63566973)}
    var windows: ITSSpecifier {return self.elementsByCode(0x6377696e)}
    
    // Commands
    
    func activate(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x61637476, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func add(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x41646420, parameters: [
            SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func backTrack(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x4261636b, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func close(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f73, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func convert(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x436f6e76, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func count(directParameter: AnyObject = kAEBNoParameter,
            each: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636e7465, parameters: [
            SwiftAEParameter(name: "each", code: 0x6b6f636c, value: each),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func delete(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x64656c6f, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func download(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x44776e6c, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func duplicate(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f6e, parameters: [
            SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func eject(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x456a6374, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func exists(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x646f6578, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func fastForward(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x46617374, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func get(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x67657464, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func launch(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61736372, eventID: 0x6e6f6f70, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func make(directParameter: AnyObject = kAEBNoParameter,
            at: AnyObject = kAEBNoParameter,
            new: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6372656c, parameters: [
            SwiftAEParameter(name: "at", code: 0x696e7368, value: at),
            SwiftAEParameter(name: "new", code: 0x6b6f636c, value: new),
            SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func move(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6d6f7665, parameters: [
            SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func nextTrack(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x4e657874, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func open(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f646f63, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func openLocation(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x4755524c, eventID: 0x4755524c, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func pause(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x50617573, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func play(directParameter: AnyObject = kAEBNoParameter,
            once: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x506c6179, parameters: [
            SwiftAEParameter(name: "once", code: 0x504f6e65, value: once),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func playpause(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x506c5073, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func previousTrack(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x50726576, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func print(directParameter: AnyObject = kAEBNoParameter,
            kind: AnyObject = kAEBNoParameter,
            theme: AnyObject = kAEBNoParameter,
            printDialog: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x70646f63, parameters: [
            SwiftAEParameter(name: "kind", code: 0x704b6e64, value: kind),
            SwiftAEParameter(name: "theme", code: 0x7054686d, value: theme),
            SwiftAEParameter(name: "printDialog", code: 0x70646c67, value: printDialog),
            SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func quit(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x71756974, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func refresh(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x52667273, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func reopen(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x72617070, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func resume(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x52657375, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func reveal(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x5265766c, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func rewind(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x52776e64, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func run(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f617070, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func search(directParameter: AnyObject = kAEBNoParameter,
            only: AnyObject = kAEBNoParameter,
            for_: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x53726368, parameters: [
            SwiftAEParameter(name: "only", code: 0x70417265, value: only),
            SwiftAEParameter(name: "for_", code: 0x7054726d, value: for_),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func set(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x73657464, parameters: [
            SwiftAEParameter(name: "to", code: 0x64617461, value: to),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func stop(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x53746f70, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func subscribe(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x70537562, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func update(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x55706474, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func updateAllPodcasts(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x55706470, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func updatePodcast(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x686f6f6b, eventID: 0x55706431, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
}


class ITSApplication: ITSSpecifier {
    private init(targetType: AEBTargetType, targetData: AnyObject?) {
        let data = AppleEventBridge.AEBStaticAppData(applicationClass: AEMApplication.self,
                                                          symbolClass: ITSSymbol.self,
                                                       specifierClass: ITSSpecifier.self,
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
    class func currentApplication() -> ITSApplication {
        return self.init(targetType: kAEBTargetCurrent, targetData: nil)
    }
    
    // Construct a ITSSpecifier using a raw AEMQuery or other custom object
    // (e.g. if app's terminology is broken or when dealing with especially cranky old apps)
    
    func customRoot(object: AnyObject!) -> ITSSpecifier {
        if object is ITSSpecifier {
            return ITSSpecifier(appData: aebAppData, aemQuery: (object as! ITSSpecifier).aemQuery)
        } else if object is AppleEventBridge.AEMQuery {
            return ITSSpecifier(appData: aebAppData, aemQuery: object as! AppleEventBridge.AEMQuery)
        } else if object == nil {
            return ITSSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.app())
        } else {
            return ITSSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.customRoot(object))
        }
    }
}


// Generic specifier roots. These can be used to construct ITSSpecifiers for use in other ITSSpecifiers and ITSCommands,
// though only real specifiers constructed from a ITSApplication can be used to send commands to the target application.

let ITSApp = ITSSpecifier(appData: nil, aemQuery: AEMQuery.app())
let ITSCon = ITSSpecifier(appData: nil, aemQuery: AEMQuery.con())
let ITSIts = ITSSpecifier(appData: nil, aemQuery: AEMQuery.its())

// Symbol namespace

let kITS = ITSSymbol.self

// Convenience constructor for application objects.

var iTunes: ITSApplication {return ITSApplication()}

