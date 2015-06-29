//
// FINGlue.swift
// Finder.app 10.11
// AppleEventBridge.framework 0.7.0
// aebglue -s -r Finder
//

import Foundation
import AppleEventBridge

// TO DO: decide if generic specifier roots should appear as app/con/its static vars on XXSymbol class, or as XXApp/XXCon/XXIts vars on module


class FINFormatter: SwiftAEFormatter { // used internally to generate description strings

    override var prefix: String {return "FIN"}
    override var appClassName: String {return "Finder"}
    
    override func propertyByCode(code: OSType) -> String? {
        switch code {
        case 0x70667270: return "FinderPreferences"
        case 0x7055524c: return "URL"
        case 0x69736162: return "acceptsHighLevelEvents"
        case 0x72657674: return "acceptsRemoteEvents"
        case 0x70736e78: return "allNameExtensionsShowing"
        case 0x61707066: return "applicationFile"
        case 0x69617272: return "arrangement"
        case 0x636f6c72: return "backgroundColor"
        case 0x69626b67: return "backgroundPicture"
        case 0x70626e64: return "bounds"
        case 0x7366737a: return "calculatesFolderSizes"
        case 0x63617061: return "capacity"
        case 0x70636c73: return "class_"
        case 0x70636c69: return "clipboard"
        case 0x6c776e64: return "clippingWindow"
        case 0x68636c62: return "closeable"
        case 0x77736864: return "collapsed"
        case 0x63766f70: return "columnViewOptions"
        case 0x636f6d74: return "comment"
        case 0x70657863: return "completelyExpanded"
        case 0x70636d70: return "computerContainer"
        case 0x63746e72: return "container"
        case 0x63776e64: return "containerWindow"
        case 0x61736364: return "creationDate"
        case 0x66637274: return "creatorType"
        case 0x70616e6c: return "currentPanel"
        case 0x70766577: return "currentView"
        case 0x64656c61: return "delayBeforeSpringing"
        case 0x64736372: return "description_"
        case 0x64616669: return "deskAccessoryFile"
        case 0x6465736b: return "desktop"
        case 0x64706963: return "desktopPicture"
        case 0x64706f73: return "desktopPosition"
        case 0x70647376: return "desktopShowsConnectedServers"
        case 0x70656864: return "desktopShowsExternalHardDisks"
        case 0x70646864: return "desktopShowsHardDisks"
        case 0x7064726d: return "desktopShowsRemovableMedia"
        case 0x64737072: return "disclosesPreviewPane"
        case 0x63646973: return "disk"
        case 0x646e616d: return "displayedName"
        case 0x6973656a: return "ejectable"
        case 0x65637473: return "entireContents"
        case 0x67737470: return "everyonesPrivileges"
        case 0x70657861: return "expandable"
        case 0x70657870: return "expanded"
        case 0x68696478: return "extensionHidden"
        case 0x66696c65: return "file"
        case 0x61737479: return "fileType"
        case 0x6973666c: return "floating"
        case 0x706f6e74: return "foldersOpenInNewTabs"
        case 0x706f6e77: return "foldersOpenInNewWindows"
        case 0x73707267: return "foldersSpringOpen"
        case 0x64666d74: return "format"
        case 0x66727370: return "freeSpace"
        case 0x70697366: return "frontmost"
        case 0x73677270: return "group"
        case 0x67707072: return "groupPrivileges"
        case 0x68736372: return "hasScriptingTerminology"
        case 0x686f6d65: return "home"
        case 0x69696d67: return "icon"
        case 0x6c766973: return "iconSize"
        case 0x69636f70: return "iconViewOptions"
        case 0x49442020: return "id"
        case 0x69677072: return "ignorePrivileges"
        case 0x70696478: return "index"
        case 0x69776e64: return "informationWindow"
        case 0x70696e73: return "insertionLocation"
        case 0x636f626a: return "item"
        case 0x4a726e6c: return "journalingEnabled"
        case 0x6b696e64: return "kind"
        case 0x6c616269: return "labelIndex"
        case 0x6c706f73: return "labelPosition"
        case 0x696c3332: return "large32BitIcon"
        case 0x69636c34: return "large4BitIcon"
        case 0x69636c38: return "large8BitIcon"
        case 0x6c386d6b: return "large8BitMask"
        case 0x49434e23: return "largeMonochromeIconAndMask"
        case 0x6c766f70: return "listViewOptions"
        case 0x69737276: return "localVolume"
        case 0x696c6f63: return "location"
        case 0x61736c6b: return "locked"
        case 0x636c776d: return "maximumWidth"
        case 0x6d707274: return "minimumSize"
        case 0x636c776e: return "minimumWidth"
        case 0x706d6f64: return "modal"
        case 0x61736d6f: return "modificationDate"
        case 0x706e616d: return "name"
        case 0x6e6d7874: return "nameExtension"
        case 0x706e7774: return "newWindowTarget"
        case 0x706f6376: return "newWindowsOpenInColumnView"
        case 0x436c7363: return "opensInClassic"
        case 0x6f726967: return "originalItem"
        case 0x736f776e: return "owner"
        case 0x6f776e72: return "ownerPrivileges"
        case 0x70757364: return "partitionSpaceUsed"
        case 0x70687973: return "physicalSize"
        case 0x706f736e: return "position"
        case 0x76657232: return "productVersion"
        case 0x70414c4c: return "properties"
        case 0x7072737a: return "resizable"
        case 0x73656c65: return "selection"
        case 0x73686963: return "showsIcon"
        case 0x70727677: return "showsIconPreview"
        case 0x6d6e666f: return "showsItemInfo"
        case 0x73687072: return "showsPreviewColumn"
        case 0x73627769: return "sidebarWidth"
        case 0x7074737a: return "size"
        case 0x69733332: return "small32BitIcon"
        case 0x69637334: return "small4BitIcon"
        case 0x69637338: return "small8BitIcon"
        case 0x69637323: return "smallMonochromeIconAndMask"
        case 0x73727463: return "sortColumn"
        case 0x736f7264: return "sortDirection"
        case 0x69737464: return "startup"
        case 0x7364736b: return "startupDisk"
        case 0x70737064: return "stationery"
        case 0x73747669: return "statusbarVisible"
        case 0x73707274: return "suggestedSize"
        case 0x66767467: return "target"
        case 0x6673697a: return "textSize"
        case 0x70746974: return "titled"
        case 0x74627669: return "toolbarVisible"
        case 0x61707074: return "totalPartitionSize"
        case 0x74727368: return "trash"
        case 0x75726474: return "usesRelativeDates"
        case 0x76657273: return "version_"
        case 0x70766973: return "visible"
        case 0x7761726e: return "warnsBeforeEmptying"
        case 0x636c7764: return "width"
        case 0x6377696e: return "window"
        case 0x69737a6d: return "zoomable"
        case 0x707a756d: return "zoomed"
        default: return super.propertyByCode(code)
        }
    }
    override func elementsByCode(code: OSType) -> String? {
        switch (code) {
        case 0x62726f77: return "Finder windows"
        case 0x616c6961: return "alias files"
        case 0x616c7374: return "aliasLists"
        case 0x61707066: return "application files"
        case 0x70636170: return "application processes"
        case 0x63617070: return "applications"
        case 0x6c776e64: return "clipping windows"
        case 0x636c7066: return "clippings"
        case 0x63766f70: return "columnViewOptionss"
        case 0x6c76636c: return "columns"
        case 0x63636d70: return "computerObjects"
        case 0x63746e72: return "containers"
        case 0x70636461: return "desk accessory processes"
        case 0x6364736b: return "desktopObjects"
        case 0x646b7477: return "desktopWindows"
        case 0x63646973: return "disks"
        case 0x646f6366: return "document files"
        case 0x66696c65: return "files"
        case 0x63666f6c: return "folders"
        case 0x6966616d: return "iconFamilys"
        case 0x69636f70: return "iconViewOptionss"
        case 0x69776e64: return "informationWindows"
        case 0x696e6c66: return "internet location files"
        case 0x636f626a: return "items"
        case 0x636c626c: return "labels"
        case 0x6c766f70: return "listViewOptionss"
        case 0x7061636b: return "packages"
        case 0x70776e64: return "preferencesWindows"
        case 0x63707266: return "preferencess"
        case 0x70726373: return "processes"
        case 0x63747273: return "trashObjects"
        case 0x6377696e: return "windows"
        default: return super.elementsByCode(code)
        }
    }
}


class FINSpecifier: SwiftAESpecifier {
        
    override var description: String { return FINFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Raw property and element specifiers, e.g. TextEdit.elementsByFourCharCode("docu") => TextEdit.documents
    
    func propertyByCode(code: OSType) -> FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify a property")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.property(code), queryError: queryError)
    }
    func elementsByCode(code: OSType) -> FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify elements")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.elements(code), queryError: queryError)
    }
    func propertyByFourCharCode(code: String) -> FINSpecifier {
        return self.propertyByCode(AEM4CC(code))
    }
    func elementsByFourCharCode(code: String) -> FINSpecifier {
        return self.elementsByCode(AEM4CC(code))
    }
    
    // Element(s) selectors
    // important: by-index selectors use Apple event-style 1-indexing, NOT Swift-style 0-indexing

    subscript(index: AnyObject!) -> FINSpecifier! { // by-index, by-name, by-test

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
        return FINSpecifier(appData: aebAppData, aemQuery: newQuery, queryError: queryError)
    }
    func ID(uid: AnyObject) -> FINSpecifier { // by-id
        let (baseQuery, queryError) = self.aemElementsSpecifer("select element with id \(uid)")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.byID(uid), queryError: queryError)
    }
    subscript(from: AnyObject!, to: AnyObject!) -> FINSpecifier! { // by-range
        let (baseQuery, queryError) = self.aemElementsSpecifer("select elements \(from) thru \(to)")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.byRange(from, to: to), queryError: queryError)
    }

    func previous(class_: AEBSymbol) -> FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select previous element")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.previous(class_.aebCode), queryError: queryError)
    }
    func next(class_: AEBSymbol) -> FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select next element")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.next(class_.aebCode), queryError: queryError)
    }
    
    var first: FINSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select first element")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.first(), queryError: queryError)
    }
    var middle: FINSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select middle element")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.middle(), queryError: queryError)
    }
    var last: FINSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select last element")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.last(), queryError: queryError)
    }
    var any: FINSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select any element")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.any(), queryError: queryError)
    }

    var beginning: FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select beginning")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginning(), queryError: queryError)
    }
    var end: FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select end")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.end(), queryError: queryError)
    }
    var before: FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select before")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.before(), queryError: queryError)
    }
    var after: FINSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select after")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.after(), queryError: queryError)
    }

    // Test clause constructors, e.g. FIN.its.name.beginsWith("foo")
    
    func beginsWith(input: AnyObject!) -> FINSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginsWith(input), queryError: queryError)
    }
    func endsWith(input: AnyObject!) -> FINSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.endsWith(input), queryError: queryError)
    }
    func contains(input: AnyObject!) -> FINSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.contains(input), queryError: queryError)
    }
    func isIn(input: AnyObject!) -> FINSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery?.isIn(input), queryError: queryError)
    }
    
    // Properties
    
    var FinderPreferences: FINSpecifier {return self.propertyByCode(0x70667270)}
    var URL: FINSpecifier {return self.propertyByCode(0x7055524c)}
    var acceptsHighLevelEvents: FINSpecifier {return self.propertyByCode(0x69736162)}
    var acceptsRemoteEvents: FINSpecifier {return self.propertyByCode(0x72657674)}
    var allNameExtensionsShowing: FINSpecifier {return self.propertyByCode(0x70736e78)}
    var applicationFile: FINSpecifier {return self.propertyByCode(0x61707066)}
    var arrangement: FINSpecifier {return self.propertyByCode(0x69617272)}
    var backgroundColor: FINSpecifier {return self.propertyByCode(0x636f6c72)}
    var backgroundPicture: FINSpecifier {return self.propertyByCode(0x69626b67)}
    var bounds: FINSpecifier {return self.propertyByCode(0x70626e64)}
    var calculatesFolderSizes: FINSpecifier {return self.propertyByCode(0x7366737a)}
    var capacity: FINSpecifier {return self.propertyByCode(0x63617061)}
    var class_: FINSpecifier {return self.propertyByCode(0x70636c73)}
    var clipboard: FINSpecifier {return self.propertyByCode(0x70636c69)}
    var clippingWindow: FINSpecifier {return self.propertyByCode(0x6c776e64)}
    var closeable: FINSpecifier {return self.propertyByCode(0x68636c62)}
    var collapsed: FINSpecifier {return self.propertyByCode(0x77736864)}
    var color: FINSpecifier {return self.propertyByCode(0x636f6c72)}
    var columnViewOptions: FINSpecifier {return self.propertyByCode(0x63766f70)}
    var comment: FINSpecifier {return self.propertyByCode(0x636f6d74)}
    var completelyExpanded: FINSpecifier {return self.propertyByCode(0x70657863)}
    var computerContainer: FINSpecifier {return self.propertyByCode(0x70636d70)}
    var container: FINSpecifier {return self.propertyByCode(0x63746e72)}
    var containerWindow: FINSpecifier {return self.propertyByCode(0x63776e64)}
    var creationDate: FINSpecifier {return self.propertyByCode(0x61736364)}
    var creatorType: FINSpecifier {return self.propertyByCode(0x66637274)}
    var currentPanel: FINSpecifier {return self.propertyByCode(0x70616e6c)}
    var currentView: FINSpecifier {return self.propertyByCode(0x70766577)}
    var delayBeforeSpringing: FINSpecifier {return self.propertyByCode(0x64656c61)}
    var description_: FINSpecifier {return self.propertyByCode(0x64736372)}
    var deskAccessoryFile: FINSpecifier {return self.propertyByCode(0x64616669)}
    var desktop: FINSpecifier {return self.propertyByCode(0x6465736b)}
    var desktopPicture: FINSpecifier {return self.propertyByCode(0x64706963)}
    var desktopPosition: FINSpecifier {return self.propertyByCode(0x64706f73)}
    var desktopShowsConnectedServers: FINSpecifier {return self.propertyByCode(0x70647376)}
    var desktopShowsExternalHardDisks: FINSpecifier {return self.propertyByCode(0x70656864)}
    var desktopShowsHardDisks: FINSpecifier {return self.propertyByCode(0x70646864)}
    var desktopShowsRemovableMedia: FINSpecifier {return self.propertyByCode(0x7064726d)}
    var disclosesPreviewPane: FINSpecifier {return self.propertyByCode(0x64737072)}
    var disk: FINSpecifier {return self.propertyByCode(0x63646973)}
    var displayedName: FINSpecifier {return self.propertyByCode(0x646e616d)}
    var ejectable: FINSpecifier {return self.propertyByCode(0x6973656a)}
    var entireContents: FINSpecifier {return self.propertyByCode(0x65637473)}
    var everyonesPrivileges: FINSpecifier {return self.propertyByCode(0x67737470)}
    var expandable: FINSpecifier {return self.propertyByCode(0x70657861)}
    var expanded: FINSpecifier {return self.propertyByCode(0x70657870)}
    var extensionHidden: FINSpecifier {return self.propertyByCode(0x68696478)}
    var file: FINSpecifier {return self.propertyByCode(0x66696c65)}
    var fileType: FINSpecifier {return self.propertyByCode(0x61737479)}
    var floating: FINSpecifier {return self.propertyByCode(0x6973666c)}
    var foldersOpenInNewTabs: FINSpecifier {return self.propertyByCode(0x706f6e74)}
    var foldersOpenInNewWindows: FINSpecifier {return self.propertyByCode(0x706f6e77)}
    var foldersSpringOpen: FINSpecifier {return self.propertyByCode(0x73707267)}
    var format: FINSpecifier {return self.propertyByCode(0x64666d74)}
    var freeSpace: FINSpecifier {return self.propertyByCode(0x66727370)}
    var frontmost: FINSpecifier {return self.propertyByCode(0x70697366)}
    var group: FINSpecifier {return self.propertyByCode(0x73677270)}
    var groupPrivileges: FINSpecifier {return self.propertyByCode(0x67707072)}
    var hasScriptingTerminology: FINSpecifier {return self.propertyByCode(0x68736372)}
    var home: FINSpecifier {return self.propertyByCode(0x686f6d65)}
    var icon: FINSpecifier {return self.propertyByCode(0x69696d67)}
    var iconSize: FINSpecifier {return self.propertyByCode(0x6c766973)}
    var iconViewOptions: FINSpecifier {return self.propertyByCode(0x69636f70)}
    var id: FINSpecifier {return self.propertyByCode(0x49442020)}
    var ignorePrivileges: FINSpecifier {return self.propertyByCode(0x69677072)}
    var index: FINSpecifier {return self.propertyByCode(0x70696478)}
    var informationWindow: FINSpecifier {return self.propertyByCode(0x69776e64)}
    var insertionLocation: FINSpecifier {return self.propertyByCode(0x70696e73)}
    var item: FINSpecifier {return self.propertyByCode(0x636f626a)}
    var journalingEnabled: FINSpecifier {return self.propertyByCode(0x4a726e6c)}
    var kind: FINSpecifier {return self.propertyByCode(0x6b696e64)}
    var labelIndex: FINSpecifier {return self.propertyByCode(0x6c616269)}
    var labelPosition: FINSpecifier {return self.propertyByCode(0x6c706f73)}
    var large32BitIcon: FINSpecifier {return self.propertyByCode(0x696c3332)}
    var large4BitIcon: FINSpecifier {return self.propertyByCode(0x69636c34)}
    var large8BitIcon: FINSpecifier {return self.propertyByCode(0x69636c38)}
    var large8BitMask: FINSpecifier {return self.propertyByCode(0x6c386d6b)}
    var largeMonochromeIconAndMask: FINSpecifier {return self.propertyByCode(0x49434e23)}
    var listViewOptions: FINSpecifier {return self.propertyByCode(0x6c766f70)}
    var localVolume: FINSpecifier {return self.propertyByCode(0x69737276)}
    var location: FINSpecifier {return self.propertyByCode(0x696c6f63)}
    var locked: FINSpecifier {return self.propertyByCode(0x61736c6b)}
    var maximumWidth: FINSpecifier {return self.propertyByCode(0x636c776d)}
    var minimumSize: FINSpecifier {return self.propertyByCode(0x6d707274)}
    var minimumWidth: FINSpecifier {return self.propertyByCode(0x636c776e)}
    var modal: FINSpecifier {return self.propertyByCode(0x706d6f64)}
    var modificationDate: FINSpecifier {return self.propertyByCode(0x61736d6f)}
    var name: FINSpecifier {return self.propertyByCode(0x706e616d)}
    var nameExtension: FINSpecifier {return self.propertyByCode(0x6e6d7874)}
    var newWindowTarget: FINSpecifier {return self.propertyByCode(0x706e7774)}
    var newWindowsOpenInColumnView: FINSpecifier {return self.propertyByCode(0x706f6376)}
    var opensInClassic: FINSpecifier {return self.propertyByCode(0x436c7363)}
    var originalItem: FINSpecifier {return self.propertyByCode(0x6f726967)}
    var owner: FINSpecifier {return self.propertyByCode(0x736f776e)}
    var ownerPrivileges: FINSpecifier {return self.propertyByCode(0x6f776e72)}
    var partitionSpaceUsed: FINSpecifier {return self.propertyByCode(0x70757364)}
    var physicalSize: FINSpecifier {return self.propertyByCode(0x70687973)}
    var position: FINSpecifier {return self.propertyByCode(0x706f736e)}
    var preferredSize: FINSpecifier {return self.propertyByCode(0x61707074)}
    var productVersion: FINSpecifier {return self.propertyByCode(0x76657232)}
    var properties: FINSpecifier {return self.propertyByCode(0x70414c4c)}
    var resizable: FINSpecifier {return self.propertyByCode(0x7072737a)}
    var selection: FINSpecifier {return self.propertyByCode(0x73656c65)}
    var showsIcon: FINSpecifier {return self.propertyByCode(0x73686963)}
    var showsIconPreview: FINSpecifier {return self.propertyByCode(0x70727677)}
    var showsItemInfo: FINSpecifier {return self.propertyByCode(0x6d6e666f)}
    var showsPreviewColumn: FINSpecifier {return self.propertyByCode(0x73687072)}
    var sidebarWidth: FINSpecifier {return self.propertyByCode(0x73627769)}
    var size: FINSpecifier {return self.propertyByCode(0x7074737a)}
    var small32BitIcon: FINSpecifier {return self.propertyByCode(0x69733332)}
    var small4BitIcon: FINSpecifier {return self.propertyByCode(0x69637334)}
    var small8BitIcon: FINSpecifier {return self.propertyByCode(0x69637338)}
    var small8BitMask: FINSpecifier {return self.propertyByCode(0x69637338)}
    var smallMonochromeIconAndMask: FINSpecifier {return self.propertyByCode(0x69637323)}
    var sortColumn: FINSpecifier {return self.propertyByCode(0x73727463)}
    var sortDirection: FINSpecifier {return self.propertyByCode(0x736f7264)}
    var startup: FINSpecifier {return self.propertyByCode(0x69737464)}
    var startupDisk: FINSpecifier {return self.propertyByCode(0x7364736b)}
    var stationery: FINSpecifier {return self.propertyByCode(0x70737064)}
    var statusbarVisible: FINSpecifier {return self.propertyByCode(0x73747669)}
    var suggestedSize: FINSpecifier {return self.propertyByCode(0x73707274)}
    var target: FINSpecifier {return self.propertyByCode(0x66767467)}
    var textSize: FINSpecifier {return self.propertyByCode(0x6673697a)}
    var titled: FINSpecifier {return self.propertyByCode(0x70746974)}
    var toolbarVisible: FINSpecifier {return self.propertyByCode(0x74627669)}
    var totalPartitionSize: FINSpecifier {return self.propertyByCode(0x61707074)}
    var trash: FINSpecifier {return self.propertyByCode(0x74727368)}
    var usesRelativeDates: FINSpecifier {return self.propertyByCode(0x75726474)}
    var version_: FINSpecifier {return self.propertyByCode(0x76657273)}
    var visible: FINSpecifier {return self.propertyByCode(0x70766973)}
    var warnsBeforeEmptying: FINSpecifier {return self.propertyByCode(0x7761726e)}
    var width: FINSpecifier {return self.propertyByCode(0x636c7764)}
    var window: FINSpecifier {return self.propertyByCode(0x6377696e)}
    var zoomable: FINSpecifier {return self.propertyByCode(0x69737a6d)}
    var zoomed: FINSpecifier {return self.propertyByCode(0x707a756d)}
    
    // Elements
    
    var Finder windows: FINSpecifier {return self.elementsByCode(0x62726f77)}
    var alias files: FINSpecifier {return self.elementsByCode(0x616c6961)}
    var aliasLists: FINSpecifier {return self.elementsByCode(0x616c7374)}
    var application files: FINSpecifier {return self.elementsByCode(0x61707066)}
    var application processes: FINSpecifier {return self.elementsByCode(0x70636170)}
    var applications: FINSpecifier {return self.elementsByCode(0x63617070)}
    var clipping windows: FINSpecifier {return self.elementsByCode(0x6c776e64)}
    var clippings: FINSpecifier {return self.elementsByCode(0x636c7066)}
    var columnViewOptionss: FINSpecifier {return self.elementsByCode(0x63766f70)}
    var columns: FINSpecifier {return self.elementsByCode(0x6c76636c)}
    var computerObjects: FINSpecifier {return self.elementsByCode(0x63636d70)}
    var containers: FINSpecifier {return self.elementsByCode(0x63746e72)}
    var desk accessory processes: FINSpecifier {return self.elementsByCode(0x70636461)}
    var desktopObjects: FINSpecifier {return self.elementsByCode(0x6364736b)}
    var desktopWindows: FINSpecifier {return self.elementsByCode(0x646b7477)}
    var disks: FINSpecifier {return self.elementsByCode(0x63646973)}
    var document files: FINSpecifier {return self.elementsByCode(0x646f6366)}
    var files: FINSpecifier {return self.elementsByCode(0x66696c65)}
    var folders: FINSpecifier {return self.elementsByCode(0x63666f6c)}
    var iconFamilys: FINSpecifier {return self.elementsByCode(0x6966616d)}
    var iconViewOptionss: FINSpecifier {return self.elementsByCode(0x69636f70)}
    var informationWindows: FINSpecifier {return self.elementsByCode(0x69776e64)}
    var internet location files: FINSpecifier {return self.elementsByCode(0x696e6c66)}
    var items: FINSpecifier {return self.elementsByCode(0x636f626a)}
    var labels: FINSpecifier {return self.elementsByCode(0x636c626c)}
    var listViewOptionss: FINSpecifier {return self.elementsByCode(0x6c766f70)}
    var packages: FINSpecifier {return self.elementsByCode(0x7061636b)}
    var preferencesWindows: FINSpecifier {return self.elementsByCode(0x70776e64)}
    var preferencess: FINSpecifier {return self.elementsByCode(0x63707266)}
    var processes: FINSpecifier {return self.elementsByCode(0x70726373)}
    var trashObjects: FINSpecifier {return self.elementsByCode(0x63747273)}
    var windows: FINSpecifier {return self.elementsByCode(0x6377696e)}
    
    // Commands
    
    func activate(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x61637476, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func cleanUp(directParameter: AnyObject = kAEBNoParameter,
            by: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x66636c75, parameters: [
                SwiftAEParameter(name: "by", code: 0x62792020, value: by),
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
    func copy_(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x636f7079, parameters: [
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
    func dataSize(directParameter: AnyObject = kAEBNoParameter,
            as_: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6473697a, parameters: [
                SwiftAEParameter(name: "as_", code: 0x72747970, value: as_),
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
    func duplicate(directParameter: AnyObject = kAEBNoParameter,
            replacing: AnyObject = kAEBNoParameter,
            exactCopy: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            routingSuppressed: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f6e, parameters: [
                SwiftAEParameter(name: "replacing", code: 0x616c7270, value: replacing),
                SwiftAEParameter(name: "exactCopy", code: 0x65786374, value: exactCopy),
                SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
                SwiftAEParameter(name: "routingSuppressed", code: 0x726f7574, value: routingSuppressed),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func eject(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x656a6374, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func empty(directParameter: AnyObject = kAEBNoParameter,
            security: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x656d7074, parameters: [
                SwiftAEParameter(name: "security", code: 0x7365633f, value: security),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func erase(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x66657261, parameters: [
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
            to: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6372656c, parameters: [
                SwiftAEParameter(name: "at", code: 0x696e7368, value: at),
                SwiftAEParameter(name: "new", code: 0x6b6f636c, value: new),
                SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
                SwiftAEParameter(name: "to", code: 0x746f2020, value: to),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func move(directParameter: AnyObject = kAEBNoParameter,
            replacing: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            positionedAt: AnyObject = kAEBNoParameter,
            routingSuppressed: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6d6f7665, parameters: [
                SwiftAEParameter(name: "replacing", code: 0x616c7270, value: replacing),
                SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
                SwiftAEParameter(name: "positionedAt", code: 0x6d76706c, value: positionedAt),
                SwiftAEParameter(name: "routingSuppressed", code: 0x726f7574, value: routingSuppressed),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func open(directParameter: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            using: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f646f63, parameters: [
                SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
                SwiftAEParameter(name: "using", code: 0x7573696e, value: using),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func openLocation(directParameter: AnyObject = kAEBNoParameter,
            window: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x4755524c, eventID: 0x4755524c, parameters: [
                SwiftAEParameter(name: "window", code: 0x57494e44, value: window),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func print(directParameter: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x70646f63, parameters: [
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
    func reopen(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x72617070, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func restart(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x72657374, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func reveal(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x6d766973, parameters: [
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
    func select(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x736c6374, parameters: [
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
    func shutDown(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x73687574, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func sleep(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x736c6570, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func sort(directParameter: AnyObject = kAEBNoParameter,
            by: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x44415441, eventID: 0x534f5254, parameters: [
                SwiftAEParameter(name: "by", code: 0x62792020, value: by),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func update(directParameter: AnyObject = kAEBNoParameter,
            necessity: AnyObject = kAEBNoParameter,
            registeringApplications: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x666e6472, eventID: 0x66757064, parameters: [
                SwiftAEParameter(name: "necessity", code: 0x6e65633f, value: necessity),
                SwiftAEParameter(name: "registeringApplications", code: 0x7265673f, value: registeringApplications),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
}


class Finder: FINSpecifier {
    private init(targetType: AEBTargetType, targetData: AnyObject?) {
        let data = SwiftAEAppData(applicationClass: AEMApplication.self,
                                       symbolClass: FINSymbol.self,
                                    specifierClass: FINSpecifier.self,
                                        targetType: targetType,
                                        targetData: targetData)
        super.init(appData: data, aemQuery: AppleEventBridge.AEMQuery.app())
    }
    override convenience init() { // TO DO: delete/raise error if bundle id not given
        self.init(bundleIdentifier: "com.apple.finder")
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
    class func currentApplication() -> Finder {
        return Finder(targetType: kAEBTargetCurrent, targetData: nil)
    }
    
    // Construct a FINSpecifier using a raw AEMQuery or other custom object
    // (e.g. if app's terminology is broken or when dealing with especially cranky old apps)
    
    func customRoot(object: AnyObject!) -> FINSpecifier {
        if object is FINSpecifier {
            return FINSpecifier(appData: aebAppData, aemQuery: (object as! FINSpecifier).aemQuery)
        } else if object is AppleEventBridge.AEMQuery {
            return FINSpecifier(appData: aebAppData, aemQuery: object as! AppleEventBridge.AEMQuery)
        } else if object == nil {
            return FINSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.app())
        } else {
            return FINSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.customRoot(object))
        }
    }
}


// test clause constructors, e.g. FIN.its.name != "foo"
// note: the == operator will return a FINSpecifier when used in elements[...] specifier; however, when
// binding its result to a variable, it must be explicitly typed as (e.g.) AnyObject or Swift will infer Bool

func == (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.equals(right), queryError: queryError)
}
func != (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.notEquals(right), queryError: queryError)
}
func < (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessThan(right), queryError: queryError)
}
func > (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterThan(right), queryError: queryError)
}
func <= (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessOrEquals(right), queryError: queryError)
}
func >= (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterOrEquals(right), queryError: queryError)
}
func && (left: FINSpecifier!, right: FINSpecifier!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.AND(right), queryError: queryError)
}
func || (left: FINSpecifier!, right: FINSpecifier!) -> FINSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.OR(right), queryError: queryError)
}
prefix func ! (input: FINSpecifier!) -> FINSpecifier! {
    let (baseQuery, queryError) = input.aemTestClause("test")
    return FINSpecifier(appData: input.aebAppData, aemQuery: baseQuery?.NOT(), queryError: queryError)
}


/******************************************************************************/
// SYMBOLS


class FINSymbol: SwiftAESymbol {

    override var description: String {return "FIN.\(self.aebName)"}

    // Generic specifier roots. These can be used to construct FINSpecifiers for use in other
    // FINSpecifiers and FINCommands, though only real specifiers constructed from a
    // Finder application instance can be used to send commands to the target application.

    // TO DO: where best to put these root vars?

    static let app = FINSpecifier(appData: nil, aemQuery: AEMQuery.app())
    static let con = FINSpecifier(appData: nil, aemQuery: AEMQuery.con())
    static let its = FINSpecifier(appData: nil, aemQuery: AEMQuery.its())

    override class func symbol(code: OSType) -> AEBSymbol {
        switch (code) {
        case 0x70616476: return self.AdvancedPreferencesPanel
        case 0x64667068: return self.ApplePhotoFormat
        case 0x64666173: return self.AppleShareFormat
        case 0x61706e6c: return self.ApplicationPanel
        case 0x61707220: return self.April
        case 0x61756720: return self.August
        case 0x62706e6c: return self.BurningPanel
        case 0x63737472: return self.CString
        case 0x63706e6c: return self.CommentsPanel
        case 0x63696e6c: return self.ContentIndexPanel
        case 0x64656320: return self.December
        case 0x45505320: return self.EPSPicture
        case 0x64666674: return self.FTPFormat
        case 0x66656220: return self.February
        case 0x70667270: return self.FinderPreferences
        case 0x62726f77: return self.FinderWindow
        case 0x66726920: return self.Friday
        case 0x47494666: return self.GIFPicture
        case 0x67706e6c: return self.GeneralInformationPanel
        case 0x70676e70: return self.GeneralPreferencesPanel
        case 0x64666873: return self.HighSierraFormat
        case 0x64663936: return self.ISO9660Format
        case 0x4a504547: return self.JPEGPicture
        case 0x6a616e20: return self.January
        case 0x6a756c20: return self.July
        case 0x6a756e20: return self.June
        case 0x706c6270: return self.LabelPreferencesPanel
        case 0x706b6c67: return self.LanguagesPanel
        case 0x64666d73: return self.MSDOSFormat
        case 0x6466682b: return self.MacOSExtendedFormat
        case 0x64666866: return self.MacOSFormat
        case 0x6d617220: return self.March
        case 0x6d617920: return self.May
        case 0x6d706e6c: return self.MemoryPanel
        case 0x6d6f6e20: return self.Monday
        case 0x6d696e6c: return self.MoreInfoPanel
        case 0x64666e66: return self.NFSFormat
        case 0x64666e74: return self.NTFSFormat
        case 0x6e706e6c: return self.NameAndExtensionPanel
        case 0x6e6f7620: return self.November
        case 0x6f637420: return self.October
        case 0x50494354: return self.PICTPicture
        case 0x64667075: return self.PacketWrittenUDFFormat
        case 0x70737472: return self.PascalString
        case 0x706b7067: return self.PluginsPanel
        case 0x76706e6c: return self.PreviewPanel
        case 0x64667072: return self.ProDOSFormat
        case 0x64667174: return self.QuickTakeFormat
        case 0x74723136: return self.RGB16Color
        case 0x74723936: return self.RGB96Color
        case 0x63524742: return self.RGBColor
        case 0x73617420: return self.Saturday
        case 0x73657020: return self.September
        case 0x73706e6c: return self.SharingPanel
        case 0x70736964: return self.SidebarPreferencesPanel
        case 0x73686e6c: return self.SimpleHeaderPanel
        case 0x73756e20: return self.Sunday
        case 0x54494646: return self.TIFFPicture
        case 0x74687520: return self.Thursday
        case 0x74756520: return self.Tuesday
        case 0x64667564: return self.UDFFormat
        case 0x64667566: return self.UFSFormat
        case 0x7055524c: return self.URL
        case 0x75743136: return self.UTF16Text
        case 0x75746638: return self.UTF8Text
        case 0x75747874: return self.UnicodeText
        case 0x64667764: return self.WebDAVFormat
        case 0x77656420: return self.Wednesday
        case 0x64666163: return self.XsanFormat
        case 0x69736162: return self.acceptsHighLevelEvents
        case 0x72657674: return self.acceptsRemoteEvents
        case 0x616c6973: return self.alias
        case 0x616c6961: return self.aliasFile
        case 0x616c7374: return self.aliasList
        case 0x70736e78: return self.allNameExtensionsShowing
        case 0x2a2a2a2a: return self.anything
        case 0x63617070: return self.application
        case 0x62756e64: return self.applicationBundleID
        case 0x61707066: return self.applicationFile
        case 0x70636170: return self.applicationProcess
        case 0x726d7465: return self.applicationResponses
        case 0x7369676e: return self.applicationSignature
        case 0x6170726c: return self.applicationURL
        case 0x63647461: return self.arrangedByCreationDate
        case 0x6b696e61: return self.arrangedByKind
        case 0x6c616261: return self.arrangedByLabel
        case 0x6d647461: return self.arrangedByModificationDate
        case 0x6e616d61: return self.arrangedByName
        case 0x73697a61: return self.arrangedBySize
        case 0x69617272: return self.arrangement
        case 0x61736b20: return self.ask
        case 0x64666175: return self.audioFormat
        case 0x636f6c72: return self.backgroundColor
        case 0x69626b67: return self.backgroundPicture
        case 0x62657374: return self.best
        case 0x626f6f6c: return self.boolean
        case 0x6c626f74: return self.bottom
        case 0x71647274: return self.boundingRectangle
        case 0x70626e64: return self.bounds
        case 0x7366737a: return self.calculatesFolderSizes
        case 0x63617061: return self.capacity
        case 0x63617365: return self.case_
        case 0x636d7472: return self.centimeters
        case 0x67636c69: return self.classInfo
        case 0x70636c73: return self.class_
        case 0x70636c69: return self.clipboard
        case 0x636c7066: return self.clipping
        case 0x6c776e64: return self.clippingWindow
        case 0x68636c62: return self.closeable
        case 0x77736864: return self.collapsed
        case 0x636c7274: return self.colorTable
        case 0x6c76636c: return self.column
        case 0x636c7677: return self.columnView
        case 0x63766f70: return self.columnViewOptions
        case 0x636f6d74: return self.comment
        case 0x656c7343: return self.commentColumn
        case 0x70657863: return self.completelyExpanded
        case 0x70636d70: return self.computerContainer
        case 0x63636d70: return self.computerObject
        case 0x63746e72: return self.container
        case 0x63776e64: return self.containerWindow
        case 0x61736364: return self.creationDate
        case 0x656c7363: return self.creationDateColumn
        case 0x66637274: return self.creatorType
        case 0x63636d74: return self.cubicCentimeters
        case 0x63666574: return self.cubicFeet
        case 0x6375696e: return self.cubicInches
        case 0x636d6574: return self.cubicMeters
        case 0x63797264: return self.cubicYards
        case 0x70616e6c: return self.currentPanel
        case 0x70766577: return self.currentView
        case 0x74646173: return self.dashStyle
        case 0x72646174: return self.data
        case 0x6c647420: return self.date
        case 0x6465636d: return self.decimalStruct
        case 0x64656763: return self.degreesCelsius
        case 0x64656766: return self.degreesFahrenheit
        case 0x6465676b: return self.degreesKelvin
        case 0x64656c61: return self.delayBeforeSpringing
        case 0x64736372: return self.description_
        case 0x64616669: return self.deskAccessoryFile
        case 0x70636461: return self.deskAccessoryProcess
        case 0x6465736b: return self.desktop
        case 0x6364736b: return self.desktopObject
        case 0x64706963: return self.desktopPicture
        case 0x64706f73: return self.desktopPosition
        case 0x70647376: return self.desktopShowsConnectedServers
        case 0x70656864: return self.desktopShowsExternalHardDisks
        case 0x70646864: return self.desktopShowsHardDisks
        case 0x7064726d: return self.desktopShowsRemovableMedia
        case 0x646b7477: return self.desktopWindow
        case 0x64696163: return self.diacriticals
        case 0x64737072: return self.disclosesPreviewPane
        case 0x63646973: return self.disk
        case 0x646e616d: return self.displayedName
        case 0x646f6366: return self.documentFile
        case 0x636f6d70: return self.doubleInteger
        case 0x6973656a: return self.ejectable
        case 0x656c696e: return self.elementInfo
        case 0x656e6373: return self.encodedString
        case 0x65637473: return self.entireContents
        case 0x656e756d: return self.enumerator
        case 0x6576696e: return self.eventInfo
        case 0x67737470: return self.everyonesPrivileges
        case 0x70657861: return self.expandable
        case 0x70657870: return self.expanded
        case 0x65787061: return self.expansion
        case 0x65787465: return self.extendedFloat
        case 0x68696478: return self.extensionHidden
        case 0x66656574: return self.feet
        case 0x66696c65: return self.file
        case 0x66737266: return self.fileRef
        case 0x66737320: return self.fileSpecification
        case 0x61737479: return self.fileType
        case 0x6675726c: return self.fileURL
        case 0x66697864: return self.fixed
        case 0x66706e74: return self.fixedPoint
        case 0x66726374: return self.fixedRectangle
        case 0x646f7562: return self.float
        case 0x6c64626c: return self.float128bit
        case 0x6973666c: return self.floating
        case 0x666c7677: return self.flowView
        case 0x63666f6c: return self.folder
        case 0x706f6e74: return self.foldersOpenInNewTabs
        case 0x706f6e77: return self.foldersOpenInNewWindows
        case 0x73707267: return self.foldersSpringOpen
        case 0x64666d74: return self.format
        case 0x66727370: return self.freeSpace
        case 0x70697366: return self.frontmost
        case 0x67616c6e: return self.gallons
        case 0x6772616d: return self.grams
        case 0x63677478: return self.graphicText
        case 0x73677270: return self.group
        case 0x67707072: return self.groupPrivileges
        case 0x67727677: return self.groupView
        case 0x68736372: return self.hasScriptingTerminology
        case 0x686f6d65: return self.home
        case 0x68797068: return self.hyphens
        case 0x69696d67: return self.icon
        case 0x6966616d: return self.iconFamily
        case 0x6c766973: return self.iconSize
        case 0x69636e76: return self.iconView
        case 0x69636f70: return self.iconViewOptions
        case 0x49442020: return self.id
        case 0x69677072: return self.ignorePrivileges
        case 0x696e6368: return self.inches
        case 0x70696478: return self.index
        case 0x69776e64: return self.informationWindow
        case 0x70696e73: return self.insertionLocation
        case 0x6c6f6e67: return self.integer
        case 0x69747874: return self.internationalText
        case 0x696e746c: return self.internationalWritingCode
        case 0x696e6c66: return self.internetLocationFile
        case 0x636f626a: return self.item
        case 0x4a726e6c: return self.journalingEnabled
        case 0x6b706964: return self.kernelProcessID
        case 0x6b67726d: return self.kilograms
        case 0x6b6d7472: return self.kilometers
        case 0x6b696e64: return self.kind
        case 0x656c736b: return self.kindColumn
        case 0x636c626c: return self.label
        case 0x656c736c: return self.labelColumn
        case 0x6c616269: return self.labelIndex
        case 0x6c706f73: return self.labelPosition
        case 0x6c676963: return self.large
        case 0x696c3332: return self.large32BitIcon
        case 0x69636c34: return self.large4BitIcon
        case 0x69636c38: return self.large8BitIcon
        case 0x6c386d6b: return self.large8BitMask
        case 0x49434e23: return self.largeMonochromeIconAndMask
        case 0x6c697374: return self.list
        case 0x6c737677: return self.listView
        case 0x6c766f70: return self.listViewOptions
        case 0x6c697472: return self.liters
        case 0x69737276: return self.localVolume
        case 0x696c6f63: return self.location
        case 0x696e736c: return self.locationReference
        case 0x61736c6b: return self.locked
        case 0x6c667864: return self.longFixed
        case 0x6c667074: return self.longFixedPoint
        case 0x6c667263: return self.longFixedRectangle
        case 0x6c706e74: return self.longPoint
        case 0x6c726374: return self.longRectangle
        case 0x706f7274: return self.machPort
        case 0x6d616368: return self.machine
        case 0x6d4c6f63: return self.machineLocation
        case 0x636c776d: return self.maximumWidth
        case 0x6d657472: return self.meters
        case 0x6d696c65: return self.miles
        case 0x6d696963: return self.mini
        case 0x6d707274: return self.minimumSize
        case 0x636c776e: return self.minimumWidth
        case 0x6d736e67: return self.missingValue
        case 0x706d6f64: return self.modal
        case 0x61736d6f: return self.modificationDate
        case 0x656c736d: return self.modificationDateColumn
        case 0x706e616d: return self.name
        case 0x656c736e: return self.nameColumn
        case 0x6e6d7874: return self.nameExtension
        case 0x706e7774: return self.newWindowTarget
        case 0x706f6376: return self.newWindowsOpenInColumnView
        case 0x6e6f2020: return self.no
        case 0x6e6f6e65: return self.none_
        case 0x736e726d: return self.normal
        case 0x6e617272: return self.notArranged
        case 0x6e756c6c: return self.null
        case 0x6e756d65: return self.numericStrings
        case 0x436c7363: return self.opensInClassic
        case 0x6f726967: return self.originalItem
        case 0x6f7a7320: return self.ounces
        case 0x736f776e: return self.owner
        case 0x6f776e72: return self.ownerPrivileges
        case 0x7061636b: return self.package
        case 0x706d696e: return self.parameterInfo
        case 0x70757364: return self.partitionSpaceUsed
        case 0x74706d6d: return self.pixelMapRecord
        case 0x51447074: return self.point
        case 0x706f736e: return self.position
        case 0x6c627320: return self.pounds
        case 0x63707266: return self.preferences
        case 0x70776e64: return self.preferencesWindow
        case 0x70726373: return self.process
        case 0x70736e20: return self.processSerialNumber
        case 0x76657232: return self.productVersion
        case 0x70414c4c: return self.properties
        case 0x70726f70: return self.property
        case 0x70696e66: return self.propertyInfo
        case 0x70756e63: return self.punctuation
        case 0x71727473: return self.quarts
        case 0x72656164: return self.readOnly
        case 0x72647772: return self.readWrite
        case 0x7265636f: return self.record
        case 0x6f626a20: return self.reference
        case 0x7072737a: return self.resizable
        case 0x73727673: return self.reversed
        case 0x6c726774: return self.right_
        case 0x74726f74: return self.rotation
        case 0x73637074: return self.script
        case 0x73656c65: return self.selection
        case 0x73696e67: return self.shortFloat
        case 0x73686f72: return self.shortInteger
        case 0x73686963: return self.showsIcon
        case 0x70727677: return self.showsIconPreview
        case 0x6d6e666f: return self.showsItemInfo
        case 0x73687072: return self.showsPreviewColumn
        case 0x73627769: return self.sidebarWidth
        case 0x7074737a: return self.size
        case 0x70687973: return self.size
        case 0x656c7373: return self.sizeColumn
        case 0x736d6963: return self.small
        case 0x69733332: return self.small32BitIcon
        case 0x69637334: return self.small4BitIcon
        case 0x69637338: return self.small8BitIcon
        case 0x69637323: return self.smallMonochromeIconAndMask
        case 0x67726461: return self.snapToGrid
        case 0x73727463: return self.sortColumn
        case 0x736f7264: return self.sortDirection
        case 0x73716674: return self.squareFeet
        case 0x73716b6d: return self.squareKilometers
        case 0x7371726d: return self.squareMeters
        case 0x73716d69: return self.squareMiles
        case 0x73717964: return self.squareYards
        case 0x69737464: return self.startup
        case 0x7364736b: return self.startupDisk
        case 0x70737064: return self.stationery
        case 0x73747669: return self.statusbarVisible
        case 0x54455854: return self.string
        case 0x7374796c: return self.styledClipboardText
        case 0x53545854: return self.styledText
        case 0x73757478: return self.styledUnicodeText
        case 0x73707274: return self.suggestedSize
        case 0x7375696e: return self.suiteInfo
        case 0x66767467: return self.target
        case 0x6673697a: return self.textSize
        case 0x74737479: return self.textStyleInfo
        case 0x70746974: return self.titled
        case 0x74627669: return self.toolbarVisible
        case 0x61707074: return self.totalPartitionSize
        case 0x74727368: return self.trash
        case 0x63747273: return self.trashObject
        case 0x74797065: return self.typeClass
        case 0x64663f3f: return self.unknownFormat
        case 0x6d61676e: return self.unsignedInteger
        case 0x75726474: return self.usesRelativeDates
        case 0x656c7376: return self.versionColumn
        case 0x76657273: return self.version_
        case 0x70766973: return self.visible
        case 0x7761726e: return self.warnsBeforeEmptying
        case 0x77686974: return self.whitespace
        case 0x636c7764: return self.width
        case 0x6377696e: return self.window
        case 0x77726974: return self.writeOnly
        case 0x70736374: return self.writingCode
        case 0x79617264: return self.yards
        case 0x79657320: return self.yes
        case 0x69737a6d: return self.zoomable
        case 0x707a756d: return self.zoomed
        default: return super.symbol(code)
        }
    }

    // Types/properties    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var April: FINSymbol {return FINSymbol(name: "April", type: 0x74797065, code: 0x61707220)}
    static var August: FINSymbol {return FINSymbol(name: "August", type: 0x74797065, code: 0x61756720)}
    static var CString: FINSymbol {return FINSymbol(name: "CString", type: 0x74797065, code: 0x63737472)}
    static var December: FINSymbol {return FINSymbol(name: "December", type: 0x74797065, code: 0x64656320)}
    static var EPSPicture: FINSymbol {return FINSymbol(name: "EPSPicture", type: 0x74797065, code: 0x45505320)}
    static var February: FINSymbol {return FINSymbol(name: "February", type: 0x74797065, code: 0x66656220)}
    static var FinderPreferences: FINSymbol {return FINSymbol(name: "FinderPreferences", type: 0x74797065, code: 0x70667270)}
    static var FinderWindow: FINSymbol {return FINSymbol(name: "FinderWindow", type: 0x74797065, code: 0x62726f77)}
    static var Friday: FINSymbol {return FINSymbol(name: "Friday", type: 0x74797065, code: 0x66726920)}
    static var GIFPicture: FINSymbol {return FINSymbol(name: "GIFPicture", type: 0x74797065, code: 0x47494666)}
    static var JPEGPicture: FINSymbol {return FINSymbol(name: "JPEGPicture", type: 0x74797065, code: 0x4a504547)}
    static var January: FINSymbol {return FINSymbol(name: "January", type: 0x74797065, code: 0x6a616e20)}
    static var July: FINSymbol {return FINSymbol(name: "July", type: 0x74797065, code: 0x6a756c20)}
    static var June: FINSymbol {return FINSymbol(name: "June", type: 0x74797065, code: 0x6a756e20)}
    static var March: FINSymbol {return FINSymbol(name: "March", type: 0x74797065, code: 0x6d617220)}
    static var May: FINSymbol {return FINSymbol(name: "May", type: 0x74797065, code: 0x6d617920)}
    static var Monday: FINSymbol {return FINSymbol(name: "Monday", type: 0x74797065, code: 0x6d6f6e20)}
    static var November: FINSymbol {return FINSymbol(name: "November", type: 0x74797065, code: 0x6e6f7620)}
    static var October: FINSymbol {return FINSymbol(name: "October", type: 0x74797065, code: 0x6f637420)}
    static var PICTPicture: FINSymbol {return FINSymbol(name: "PICTPicture", type: 0x74797065, code: 0x50494354)}
    static var PascalString: FINSymbol {return FINSymbol(name: "PascalString", type: 0x74797065, code: 0x70737472)}
    static var RGB16Color: FINSymbol {return FINSymbol(name: "RGB16Color", type: 0x74797065, code: 0x74723136)}
    static var RGB96Color: FINSymbol {return FINSymbol(name: "RGB96Color", type: 0x74797065, code: 0x74723936)}
    static var RGBColor: FINSymbol {return FINSymbol(name: "RGBColor", type: 0x74797065, code: 0x63524742)}
    static var Saturday: FINSymbol {return FINSymbol(name: "Saturday", type: 0x74797065, code: 0x73617420)}
    static var September: FINSymbol {return FINSymbol(name: "September", type: 0x74797065, code: 0x73657020)}
    static var Sunday: FINSymbol {return FINSymbol(name: "Sunday", type: 0x74797065, code: 0x73756e20)}
    static var TIFFPicture: FINSymbol {return FINSymbol(name: "TIFFPicture", type: 0x74797065, code: 0x54494646)}
    static var Thursday: FINSymbol {return FINSymbol(name: "Thursday", type: 0x74797065, code: 0x74687520)}
    static var Tuesday: FINSymbol {return FINSymbol(name: "Tuesday", type: 0x74797065, code: 0x74756520)}
    static var URL: FINSymbol {return FINSymbol(name: "URL", type: 0x74797065, code: 0x7055524c)}
    static var UTF16Text: FINSymbol {return FINSymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
    static var UTF8Text: FINSymbol {return FINSymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
    static var UnicodeText: FINSymbol {return FINSymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
    static var Wednesday: FINSymbol {return FINSymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
    static var acceptsHighLevelEvents: FINSymbol {return FINSymbol(name: "acceptsHighLevelEvents", type: 0x74797065, code: 0x69736162)}
    static var acceptsRemoteEvents: FINSymbol {return FINSymbol(name: "acceptsRemoteEvents", type: 0x74797065, code: 0x72657674)}
    static var alias: FINSymbol {return FINSymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
    static var aliasFile: FINSymbol {return FINSymbol(name: "aliasFile", type: 0x74797065, code: 0x616c6961)}
    static var aliasList: FINSymbol {return FINSymbol(name: "aliasList", type: 0x74797065, code: 0x616c7374)}
    static var allNameExtensionsShowing: FINSymbol {return FINSymbol(name: "allNameExtensionsShowing", type: 0x74797065, code: 0x70736e78)}
    static var anything: FINSymbol {return FINSymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
    static var application: FINSymbol {return FINSymbol(name: "application", type: 0x74797065, code: 0x63617070)}
    static var applicationBundleID: FINSymbol {return FINSymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
    static var applicationFile: FINSymbol {return FINSymbol(name: "applicationFile", type: 0x74797065, code: 0x61707066)}
    static var applicationProcess: FINSymbol {return FINSymbol(name: "applicationProcess", type: 0x74797065, code: 0x70636170)}
    static var applicationSignature: FINSymbol {return FINSymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
    static var applicationURL: FINSymbol {return FINSymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
    static var arrangement: FINSymbol {return FINSymbol(name: "arrangement", type: 0x74797065, code: 0x69617272)}
    static var backgroundColor: FINSymbol {return FINSymbol(name: "backgroundColor", type: 0x74797065, code: 0x636f6c72)}
    static var backgroundPicture: FINSymbol {return FINSymbol(name: "backgroundPicture", type: 0x74797065, code: 0x69626b67)}
    static var best: FINSymbol {return FINSymbol(name: "best", type: 0x74797065, code: 0x62657374)}
    static var boolean: FINSymbol {return FINSymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
    static var boundingRectangle: FINSymbol {return FINSymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
    static var bounds: FINSymbol {return FINSymbol(name: "bounds", type: 0x74797065, code: 0x70626e64)}
    static var calculatesFolderSizes: FINSymbol {return FINSymbol(name: "calculatesFolderSizes", type: 0x74797065, code: 0x7366737a)}
    static var capacity: FINSymbol {return FINSymbol(name: "capacity", type: 0x74797065, code: 0x63617061)}
    static var centimeters: FINSymbol {return FINSymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
    static var classInfo: FINSymbol {return FINSymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
    static var class_: FINSymbol {return FINSymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
    static var clipboard: FINSymbol {return FINSymbol(name: "clipboard", type: 0x74797065, code: 0x70636c69)}
    static var clipping: FINSymbol {return FINSymbol(name: "clipping", type: 0x74797065, code: 0x636c7066)}
    static var clippingWindow: FINSymbol {return FINSymbol(name: "clippingWindow", type: 0x74797065, code: 0x6c776e64)}
    static var closeable: FINSymbol {return FINSymbol(name: "closeable", type: 0x74797065, code: 0x68636c62)}
    static var collapsed: FINSymbol {return FINSymbol(name: "collapsed", type: 0x74797065, code: 0x77736864)}
    static var color: FINSymbol {return FINSymbol(name: "color", type: 0x74797065, code: 0x636f6c72)}
    static var colorTable: FINSymbol {return FINSymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
    static var column: FINSymbol {return FINSymbol(name: "column", type: 0x74797065, code: 0x6c76636c)}
    static var columnViewOptions: FINSymbol {return FINSymbol(name: "columnViewOptions", type: 0x74797065, code: 0x63766f70)}
    static var completelyExpanded: FINSymbol {return FINSymbol(name: "completelyExpanded", type: 0x74797065, code: 0x70657863)}
    static var computerContainer: FINSymbol {return FINSymbol(name: "computerContainer", type: 0x74797065, code: 0x70636d70)}
    static var computerObject: FINSymbol {return FINSymbol(name: "computerObject", type: 0x74797065, code: 0x63636d70)}
    static var container: FINSymbol {return FINSymbol(name: "container", type: 0x74797065, code: 0x63746e72)}
    static var containerWindow: FINSymbol {return FINSymbol(name: "containerWindow", type: 0x74797065, code: 0x63776e64)}
    static var creatorType: FINSymbol {return FINSymbol(name: "creatorType", type: 0x74797065, code: 0x66637274)}
    static var cubicCentimeters: FINSymbol {return FINSymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
    static var cubicFeet: FINSymbol {return FINSymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
    static var cubicInches: FINSymbol {return FINSymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
    static var cubicMeters: FINSymbol {return FINSymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
    static var cubicYards: FINSymbol {return FINSymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
    static var currentPanel: FINSymbol {return FINSymbol(name: "currentPanel", type: 0x74797065, code: 0x70616e6c)}
    static var currentView: FINSymbol {return FINSymbol(name: "currentView", type: 0x74797065, code: 0x70766577)}
    static var dashStyle: FINSymbol {return FINSymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
    static var data: FINSymbol {return FINSymbol(name: "data", type: 0x74797065, code: 0x72646174)}
    static var date: FINSymbol {return FINSymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
    static var decimalStruct: FINSymbol {return FINSymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
    static var degreesCelsius: FINSymbol {return FINSymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
    static var degreesFahrenheit: FINSymbol {return FINSymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
    static var degreesKelvin: FINSymbol {return FINSymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
    static var delayBeforeSpringing: FINSymbol {return FINSymbol(name: "delayBeforeSpringing", type: 0x74797065, code: 0x64656c61)}
    static var description_: FINSymbol {return FINSymbol(name: "description_", type: 0x74797065, code: 0x64736372)}
    static var deskAccessoryFile: FINSymbol {return FINSymbol(name: "deskAccessoryFile", type: 0x74797065, code: 0x64616669)}
    static var deskAccessoryProcess: FINSymbol {return FINSymbol(name: "deskAccessoryProcess", type: 0x74797065, code: 0x70636461)}
    static var desktop: FINSymbol {return FINSymbol(name: "desktop", type: 0x74797065, code: 0x6465736b)}
    static var desktopObject: FINSymbol {return FINSymbol(name: "desktopObject", type: 0x74797065, code: 0x6364736b)}
    static var desktopPicture: FINSymbol {return FINSymbol(name: "desktopPicture", type: 0x74797065, code: 0x64706963)}
    static var desktopPosition: FINSymbol {return FINSymbol(name: "desktopPosition", type: 0x74797065, code: 0x64706f73)}
    static var desktopShowsConnectedServers: FINSymbol {return FINSymbol(name: "desktopShowsConnectedServers", type: 0x74797065, code: 0x70647376)}
    static var desktopShowsExternalHardDisks: FINSymbol {return FINSymbol(name: "desktopShowsExternalHardDisks", type: 0x74797065, code: 0x70656864)}
    static var desktopShowsHardDisks: FINSymbol {return FINSymbol(name: "desktopShowsHardDisks", type: 0x74797065, code: 0x70646864)}
    static var desktopShowsRemovableMedia: FINSymbol {return FINSymbol(name: "desktopShowsRemovableMedia", type: 0x74797065, code: 0x7064726d)}
    static var desktopWindow: FINSymbol {return FINSymbol(name: "desktopWindow", type: 0x74797065, code: 0x646b7477)}
    static var disclosesPreviewPane: FINSymbol {return FINSymbol(name: "disclosesPreviewPane", type: 0x74797065, code: 0x64737072)}
    static var disk: FINSymbol {return FINSymbol(name: "disk", type: 0x74797065, code: 0x63646973)}
    static var displayedName: FINSymbol {return FINSymbol(name: "displayedName", type: 0x74797065, code: 0x646e616d)}
    static var documentFile: FINSymbol {return FINSymbol(name: "documentFile", type: 0x74797065, code: 0x646f6366)}
    static var doubleInteger: FINSymbol {return FINSymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
    static var ejectable: FINSymbol {return FINSymbol(name: "ejectable", type: 0x74797065, code: 0x6973656a)}
    static var elementInfo: FINSymbol {return FINSymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
    static var encodedString: FINSymbol {return FINSymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
    static var entireContents: FINSymbol {return FINSymbol(name: "entireContents", type: 0x74797065, code: 0x65637473)}
    static var enumerator: FINSymbol {return FINSymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
    static var eventInfo: FINSymbol {return FINSymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
    static var everyonesPrivileges: FINSymbol {return FINSymbol(name: "everyonesPrivileges", type: 0x74797065, code: 0x67737470)}
    static var expandable: FINSymbol {return FINSymbol(name: "expandable", type: 0x74797065, code: 0x70657861)}
    static var expanded: FINSymbol {return FINSymbol(name: "expanded", type: 0x74797065, code: 0x70657870)}
    static var extendedFloat: FINSymbol {return FINSymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
    static var extensionHidden: FINSymbol {return FINSymbol(name: "extensionHidden", type: 0x74797065, code: 0x68696478)}
    static var feet: FINSymbol {return FINSymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
    static var file: FINSymbol {return FINSymbol(name: "file", type: 0x74797065, code: 0x66696c65)}
    static var fileRef: FINSymbol {return FINSymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
    static var fileSpecification: FINSymbol {return FINSymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
    static var fileType: FINSymbol {return FINSymbol(name: "fileType", type: 0x74797065, code: 0x61737479)}
    static var fileURL: FINSymbol {return FINSymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
    static var fixed: FINSymbol {return FINSymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
    static var fixedPoint: FINSymbol {return FINSymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
    static var fixedRectangle: FINSymbol {return FINSymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
    static var float: FINSymbol {return FINSymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
    static var float128bit: FINSymbol {return FINSymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
    static var floating: FINSymbol {return FINSymbol(name: "floating", type: 0x74797065, code: 0x6973666c)}
    static var folder: FINSymbol {return FINSymbol(name: "folder", type: 0x74797065, code: 0x63666f6c)}
    static var foldersOpenInNewTabs: FINSymbol {return FINSymbol(name: "foldersOpenInNewTabs", type: 0x74797065, code: 0x706f6e74)}
    static var foldersOpenInNewWindows: FINSymbol {return FINSymbol(name: "foldersOpenInNewWindows", type: 0x74797065, code: 0x706f6e77)}
    static var foldersSpringOpen: FINSymbol {return FINSymbol(name: "foldersSpringOpen", type: 0x74797065, code: 0x73707267)}
    static var format: FINSymbol {return FINSymbol(name: "format", type: 0x74797065, code: 0x64666d74)}
    static var freeSpace: FINSymbol {return FINSymbol(name: "freeSpace", type: 0x74797065, code: 0x66727370)}
    static var frontmost: FINSymbol {return FINSymbol(name: "frontmost", type: 0x74797065, code: 0x70697366)}
    static var gallons: FINSymbol {return FINSymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
    static var grams: FINSymbol {return FINSymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
    static var graphicText: FINSymbol {return FINSymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
    static var group: FINSymbol {return FINSymbol(name: "group", type: 0x74797065, code: 0x73677270)}
    static var groupPrivileges: FINSymbol {return FINSymbol(name: "groupPrivileges", type: 0x74797065, code: 0x67707072)}
    static var hasScriptingTerminology: FINSymbol {return FINSymbol(name: "hasScriptingTerminology", type: 0x74797065, code: 0x68736372)}
    static var home: FINSymbol {return FINSymbol(name: "home", type: 0x74797065, code: 0x686f6d65)}
    static var icon: FINSymbol {return FINSymbol(name: "icon", type: 0x74797065, code: 0x69696d67)}
    static var iconFamily: FINSymbol {return FINSymbol(name: "iconFamily", type: 0x74797065, code: 0x6966616d)}
    static var iconSize: FINSymbol {return FINSymbol(name: "iconSize", type: 0x74797065, code: 0x6c766973)}
    static var iconViewOptions: FINSymbol {return FINSymbol(name: "iconViewOptions", type: 0x74797065, code: 0x69636f70)}
    static var id: FINSymbol {return FINSymbol(name: "id", type: 0x74797065, code: 0x49442020)}
    static var ignorePrivileges: FINSymbol {return FINSymbol(name: "ignorePrivileges", type: 0x74797065, code: 0x69677072)}
    static var inches: FINSymbol {return FINSymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
    static var index: FINSymbol {return FINSymbol(name: "index", type: 0x74797065, code: 0x70696478)}
    static var informationWindow: FINSymbol {return FINSymbol(name: "informationWindow", type: 0x74797065, code: 0x69776e64)}
    static var insertionLocation: FINSymbol {return FINSymbol(name: "insertionLocation", type: 0x74797065, code: 0x70696e73)}
    static var integer: FINSymbol {return FINSymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
    static var internationalText: FINSymbol {return FINSymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
    static var internationalWritingCode: FINSymbol {return FINSymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
    static var internetLocationFile: FINSymbol {return FINSymbol(name: "internetLocationFile", type: 0x74797065, code: 0x696e6c66)}
    static var item: FINSymbol {return FINSymbol(name: "item", type: 0x74797065, code: 0x636f626a)}
    static var journalingEnabled: FINSymbol {return FINSymbol(name: "journalingEnabled", type: 0x74797065, code: 0x4a726e6c)}
    static var kernelProcessID: FINSymbol {return FINSymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
    static var kilograms: FINSymbol {return FINSymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
    static var kilometers: FINSymbol {return FINSymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
    static var label: FINSymbol {return FINSymbol(name: "label", type: 0x74797065, code: 0x636c626c)}
    static var labelPosition: FINSymbol {return FINSymbol(name: "labelPosition", type: 0x74797065, code: 0x6c706f73)}
    static var large32BitIcon: FINSymbol {return FINSymbol(name: "large32BitIcon", type: 0x74797065, code: 0x696c3332)}
    static var large4BitIcon: FINSymbol {return FINSymbol(name: "large4BitIcon", type: 0x74797065, code: 0x69636c34)}
    static var large8BitIcon: FINSymbol {return FINSymbol(name: "large8BitIcon", type: 0x74797065, code: 0x69636c38)}
    static var large8BitMask: FINSymbol {return FINSymbol(name: "large8BitMask", type: 0x74797065, code: 0x6c386d6b)}
    static var largeMonochromeIconAndMask: FINSymbol {return FINSymbol(name: "largeMonochromeIconAndMask", type: 0x74797065, code: 0x49434e23)}
    static var list: FINSymbol {return FINSymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
    static var listViewOptions: FINSymbol {return FINSymbol(name: "listViewOptions", type: 0x74797065, code: 0x6c766f70)}
    static var liters: FINSymbol {return FINSymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
    static var localVolume: FINSymbol {return FINSymbol(name: "localVolume", type: 0x74797065, code: 0x69737276)}
    static var location: FINSymbol {return FINSymbol(name: "location", type: 0x74797065, code: 0x696c6f63)}
    static var locationReference: FINSymbol {return FINSymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
    static var locked: FINSymbol {return FINSymbol(name: "locked", type: 0x74797065, code: 0x61736c6b)}
    static var longFixed: FINSymbol {return FINSymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
    static var longFixedPoint: FINSymbol {return FINSymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
    static var longFixedRectangle: FINSymbol {return FINSymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
    static var longPoint: FINSymbol {return FINSymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
    static var longRectangle: FINSymbol {return FINSymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
    static var machPort: FINSymbol {return FINSymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
    static var machine: FINSymbol {return FINSymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
    static var machineLocation: FINSymbol {return FINSymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
    static var maximumWidth: FINSymbol {return FINSymbol(name: "maximumWidth", type: 0x74797065, code: 0x636c776d)}
    static var meters: FINSymbol {return FINSymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
    static var miles: FINSymbol {return FINSymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
    static var minimumSize: FINSymbol {return FINSymbol(name: "minimumSize", type: 0x74797065, code: 0x6d707274)}
    static var minimumWidth: FINSymbol {return FINSymbol(name: "minimumWidth", type: 0x74797065, code: 0x636c776e)}
    static var missingValue: FINSymbol {return FINSymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
    static var modal: FINSymbol {return FINSymbol(name: "modal", type: 0x74797065, code: 0x706d6f64)}
    static var nameExtension: FINSymbol {return FINSymbol(name: "nameExtension", type: 0x74797065, code: 0x6e6d7874)}
    static var newWindowTarget: FINSymbol {return FINSymbol(name: "newWindowTarget", type: 0x74797065, code: 0x706e7774)}
    static var newWindowsOpenInColumnView: FINSymbol {return FINSymbol(name: "newWindowsOpenInColumnView", type: 0x74797065, code: 0x706f6376)}
    static var null: FINSymbol {return FINSymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
    static var opensInClassic: FINSymbol {return FINSymbol(name: "opensInClassic", type: 0x74797065, code: 0x436c7363)}
    static var originalItem: FINSymbol {return FINSymbol(name: "originalItem", type: 0x74797065, code: 0x6f726967)}
    static var ounces: FINSymbol {return FINSymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
    static var owner: FINSymbol {return FINSymbol(name: "owner", type: 0x74797065, code: 0x736f776e)}
    static var ownerPrivileges: FINSymbol {return FINSymbol(name: "ownerPrivileges", type: 0x74797065, code: 0x6f776e72)}
    static var package: FINSymbol {return FINSymbol(name: "package", type: 0x74797065, code: 0x7061636b)}
    static var parameterInfo: FINSymbol {return FINSymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
    static var partitionSpaceUsed: FINSymbol {return FINSymbol(name: "partitionSpaceUsed", type: 0x74797065, code: 0x70757364)}
    static var physicalSize: FINSymbol {return FINSymbol(name: "physicalSize", type: 0x74797065, code: 0x70687973)}
    static var pixelMapRecord: FINSymbol {return FINSymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
    static var point: FINSymbol {return FINSymbol(name: "point", type: 0x74797065, code: 0x51447074)}
    static var position: FINSymbol {return FINSymbol(name: "position", type: 0x74797065, code: 0x706f736e)}
    static var pounds: FINSymbol {return FINSymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
    static var preferences: FINSymbol {return FINSymbol(name: "preferences", type: 0x74797065, code: 0x63707266)}
    static var preferencesWindow: FINSymbol {return FINSymbol(name: "preferencesWindow", type: 0x74797065, code: 0x70776e64)}
    static var preferredSize: FINSymbol {return FINSymbol(name: "preferredSize", type: 0x74797065, code: 0x61707074)}
    static var process: FINSymbol {return FINSymbol(name: "process", type: 0x74797065, code: 0x70726373)}
    static var processSerialNumber: FINSymbol {return FINSymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
    static var productVersion: FINSymbol {return FINSymbol(name: "productVersion", type: 0x74797065, code: 0x76657232)}
    static var properties: FINSymbol {return FINSymbol(name: "properties", type: 0x74797065, code: 0x70414c4c)}
    static var property: FINSymbol {return FINSymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
    static var propertyInfo: FINSymbol {return FINSymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
    static var quarts: FINSymbol {return FINSymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
    static var record: FINSymbol {return FINSymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
    static var reference: FINSymbol {return FINSymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
    static var resizable: FINSymbol {return FINSymbol(name: "resizable", type: 0x74797065, code: 0x7072737a)}
    static var rotation: FINSymbol {return FINSymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
    static var script: FINSymbol {return FINSymbol(name: "script", type: 0x74797065, code: 0x73637074)}
    static var selection: FINSymbol {return FINSymbol(name: "selection", type: 0x74797065, code: 0x73656c65)}
    static var shortFloat: FINSymbol {return FINSymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
    static var shortInteger: FINSymbol {return FINSymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
    static var showsIcon: FINSymbol {return FINSymbol(name: "showsIcon", type: 0x74797065, code: 0x73686963)}
    static var showsIconPreview: FINSymbol {return FINSymbol(name: "showsIconPreview", type: 0x74797065, code: 0x70727677)}
    static var showsItemInfo: FINSymbol {return FINSymbol(name: "showsItemInfo", type: 0x74797065, code: 0x6d6e666f)}
    static var showsPreviewColumn: FINSymbol {return FINSymbol(name: "showsPreviewColumn", type: 0x74797065, code: 0x73687072)}
    static var sidebarWidth: FINSymbol {return FINSymbol(name: "sidebarWidth", type: 0x74797065, code: 0x73627769)}
    static var small32BitIcon: FINSymbol {return FINSymbol(name: "small32BitIcon", type: 0x74797065, code: 0x69733332)}
    static var small4BitIcon: FINSymbol {return FINSymbol(name: "small4BitIcon", type: 0x74797065, code: 0x69637334)}
    static var small8BitIcon: FINSymbol {return FINSymbol(name: "small8BitIcon", type: 0x74797065, code: 0x69637338)}
    static var small8BitMask: FINSymbol {return FINSymbol(name: "small8BitMask", type: 0x74797065, code: 0x69637338)}
    static var smallMonochromeIconAndMask: FINSymbol {return FINSymbol(name: "smallMonochromeIconAndMask", type: 0x74797065, code: 0x69637323)}
    static var sortColumn: FINSymbol {return FINSymbol(name: "sortColumn", type: 0x74797065, code: 0x73727463)}
    static var sortDirection: FINSymbol {return FINSymbol(name: "sortDirection", type: 0x74797065, code: 0x736f7264)}
    static var squareFeet: FINSymbol {return FINSymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
    static var squareKilometers: FINSymbol {return FINSymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
    static var squareMeters: FINSymbol {return FINSymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
    static var squareMiles: FINSymbol {return FINSymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
    static var squareYards: FINSymbol {return FINSymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
    static var startup: FINSymbol {return FINSymbol(name: "startup", type: 0x74797065, code: 0x69737464)}
    static var startupDisk: FINSymbol {return FINSymbol(name: "startupDisk", type: 0x74797065, code: 0x7364736b)}
    static var stationery: FINSymbol {return FINSymbol(name: "stationery", type: 0x74797065, code: 0x70737064)}
    static var statusbarVisible: FINSymbol {return FINSymbol(name: "statusbarVisible", type: 0x74797065, code: 0x73747669)}
    static var string: FINSymbol {return FINSymbol(name: "string", type: 0x74797065, code: 0x54455854)}
    static var styledClipboardText: FINSymbol {return FINSymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
    static var styledText: FINSymbol {return FINSymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
    static var styledUnicodeText: FINSymbol {return FINSymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
    static var suggestedSize: FINSymbol {return FINSymbol(name: "suggestedSize", type: 0x74797065, code: 0x73707274)}
    static var suiteInfo: FINSymbol {return FINSymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
    static var target: FINSymbol {return FINSymbol(name: "target", type: 0x74797065, code: 0x66767467)}
    static var textSize: FINSymbol {return FINSymbol(name: "textSize", type: 0x74797065, code: 0x6673697a)}
    static var textStyleInfo: FINSymbol {return FINSymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
    static var titled: FINSymbol {return FINSymbol(name: "titled", type: 0x74797065, code: 0x70746974)}
    static var toolbarVisible: FINSymbol {return FINSymbol(name: "toolbarVisible", type: 0x74797065, code: 0x74627669)}
    static var totalPartitionSize: FINSymbol {return FINSymbol(name: "totalPartitionSize", type: 0x74797065, code: 0x61707074)}
    static var trash: FINSymbol {return FINSymbol(name: "trash", type: 0x74797065, code: 0x74727368)}
    static var trashObject: FINSymbol {return FINSymbol(name: "trashObject", type: 0x74797065, code: 0x63747273)}
    static var typeClass: FINSymbol {return FINSymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
    static var unsignedInteger: FINSymbol {return FINSymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
    static var usesRelativeDates: FINSymbol {return FINSymbol(name: "usesRelativeDates", type: 0x74797065, code: 0x75726474)}
    static var visible: FINSymbol {return FINSymbol(name: "visible", type: 0x74797065, code: 0x70766973)}
    static var warnsBeforeEmptying: FINSymbol {return FINSymbol(name: "warnsBeforeEmptying", type: 0x74797065, code: 0x7761726e)}
    static var width: FINSymbol {return FINSymbol(name: "width", type: 0x74797065, code: 0x636c7764)}
    static var window: FINSymbol {return FINSymbol(name: "window", type: 0x74797065, code: 0x6377696e)}
    static var writingCode: FINSymbol {return FINSymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
    static var yards: FINSymbol {return FINSymbol(name: "yards", type: 0x74797065, code: 0x79617264)}
    static var zoomable: FINSymbol {return FINSymbol(name: "zoomable", type: 0x74797065, code: 0x69737a6d)}
    static var zoomed: FINSymbol {return FINSymbol(name: "zoomed", type: 0x74797065, code: 0x707a756d)}

    // Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var AdvancedPreferencesPanel: FINSymbol {return FINSymbol(name: "AdvancedPreferencesPanel", type: 0x656e756d, code: 0x70616476)}
    static var ApplePhotoFormat: FINSymbol {return FINSymbol(name: "ApplePhotoFormat", type: 0x656e756d, code: 0x64667068)}
    static var AppleShareFormat: FINSymbol {return FINSymbol(name: "AppleShareFormat", type: 0x656e756d, code: 0x64666173)}
    static var ApplicationPanel: FINSymbol {return FINSymbol(name: "ApplicationPanel", type: 0x656e756d, code: 0x61706e6c)}
    static var BurningPanel: FINSymbol {return FINSymbol(name: "BurningPanel", type: 0x656e756d, code: 0x62706e6c)}
    static var CommentsPanel: FINSymbol {return FINSymbol(name: "CommentsPanel", type: 0x656e756d, code: 0x63706e6c)}
    static var ContentIndexPanel: FINSymbol {return FINSymbol(name: "ContentIndexPanel", type: 0x656e756d, code: 0x63696e6c)}
    static var FTPFormat: FINSymbol {return FINSymbol(name: "FTPFormat", type: 0x656e756d, code: 0x64666674)}
    static var GeneralInformationPanel: FINSymbol {return FINSymbol(name: "GeneralInformationPanel", type: 0x656e756d, code: 0x67706e6c)}
    static var GeneralPreferencesPanel: FINSymbol {return FINSymbol(name: "GeneralPreferencesPanel", type: 0x656e756d, code: 0x70676e70)}
    static var HighSierraFormat: FINSymbol {return FINSymbol(name: "HighSierraFormat", type: 0x656e756d, code: 0x64666873)}
    static var ISO9660Format: FINSymbol {return FINSymbol(name: "ISO9660Format", type: 0x656e756d, code: 0x64663936)}
    static var LabelPreferencesPanel: FINSymbol {return FINSymbol(name: "LabelPreferencesPanel", type: 0x656e756d, code: 0x706c6270)}
    static var LanguagesPanel: FINSymbol {return FINSymbol(name: "LanguagesPanel", type: 0x656e756d, code: 0x706b6c67)}
    static var MSDOSFormat: FINSymbol {return FINSymbol(name: "MSDOSFormat", type: 0x656e756d, code: 0x64666d73)}
    static var MacOSExtendedFormat: FINSymbol {return FINSymbol(name: "MacOSExtendedFormat", type: 0x656e756d, code: 0x6466682b)}
    static var MacOSFormat: FINSymbol {return FINSymbol(name: "MacOSFormat", type: 0x656e756d, code: 0x64666866)}
    static var MemoryPanel: FINSymbol {return FINSymbol(name: "MemoryPanel", type: 0x656e756d, code: 0x6d706e6c)}
    static var MoreInfoPanel: FINSymbol {return FINSymbol(name: "MoreInfoPanel", type: 0x656e756d, code: 0x6d696e6c)}
    static var NFSFormat: FINSymbol {return FINSymbol(name: "NFSFormat", type: 0x656e756d, code: 0x64666e66)}
    static var NTFSFormat: FINSymbol {return FINSymbol(name: "NTFSFormat", type: 0x656e756d, code: 0x64666e74)}
    static var NameAndExtensionPanel: FINSymbol {return FINSymbol(name: "NameAndExtensionPanel", type: 0x656e756d, code: 0x6e706e6c)}
    static var PacketWrittenUDFFormat: FINSymbol {return FINSymbol(name: "PacketWrittenUDFFormat", type: 0x656e756d, code: 0x64667075)}
    static var PluginsPanel: FINSymbol {return FINSymbol(name: "PluginsPanel", type: 0x656e756d, code: 0x706b7067)}
    static var PreviewPanel: FINSymbol {return FINSymbol(name: "PreviewPanel", type: 0x656e756d, code: 0x76706e6c)}
    static var ProDOSFormat: FINSymbol {return FINSymbol(name: "ProDOSFormat", type: 0x656e756d, code: 0x64667072)}
    static var QuickTakeFormat: FINSymbol {return FINSymbol(name: "QuickTakeFormat", type: 0x656e756d, code: 0x64667174)}
    static var SharingPanel: FINSymbol {return FINSymbol(name: "SharingPanel", type: 0x656e756d, code: 0x73706e6c)}
    static var SidebarPreferencesPanel: FINSymbol {return FINSymbol(name: "SidebarPreferencesPanel", type: 0x656e756d, code: 0x70736964)}
    static var SimpleHeaderPanel: FINSymbol {return FINSymbol(name: "SimpleHeaderPanel", type: 0x656e756d, code: 0x73686e6c)}
    static var UDFFormat: FINSymbol {return FINSymbol(name: "UDFFormat", type: 0x656e756d, code: 0x64667564)}
    static var UFSFormat: FINSymbol {return FINSymbol(name: "UFSFormat", type: 0x656e756d, code: 0x64667566)}
    static var WebDAVFormat: FINSymbol {return FINSymbol(name: "WebDAVFormat", type: 0x656e756d, code: 0x64667764)}
    static var XsanFormat: FINSymbol {return FINSymbol(name: "XsanFormat", type: 0x656e756d, code: 0x64666163)}
    static var applicationResponses: FINSymbol {return FINSymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
    static var arrangedByCreationDate: FINSymbol {return FINSymbol(name: "arrangedByCreationDate", type: 0x656e756d, code: 0x63647461)}
    static var arrangedByKind: FINSymbol {return FINSymbol(name: "arrangedByKind", type: 0x656e756d, code: 0x6b696e61)}
    static var arrangedByLabel: FINSymbol {return FINSymbol(name: "arrangedByLabel", type: 0x656e756d, code: 0x6c616261)}
    static var arrangedByModificationDate: FINSymbol {return FINSymbol(name: "arrangedByModificationDate", type: 0x656e756d, code: 0x6d647461)}
    static var arrangedByName: FINSymbol {return FINSymbol(name: "arrangedByName", type: 0x656e756d, code: 0x6e616d61)}
    static var arrangedBySize: FINSymbol {return FINSymbol(name: "arrangedBySize", type: 0x656e756d, code: 0x73697a61)}
    static var ask: FINSymbol {return FINSymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
    static var audioFormat: FINSymbol {return FINSymbol(name: "audioFormat", type: 0x656e756d, code: 0x64666175)}
    static var bottom: FINSymbol {return FINSymbol(name: "bottom", type: 0x656e756d, code: 0x6c626f74)}
    static var case_: FINSymbol {return FINSymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
    static var columnView: FINSymbol {return FINSymbol(name: "columnView", type: 0x656e756d, code: 0x636c7677)}
    static var comment: FINSymbol {return FINSymbol(name: "comment", type: 0x656e756d, code: 0x636f6d74)}
    static var commentColumn: FINSymbol {return FINSymbol(name: "commentColumn", type: 0x656e756d, code: 0x656c7343)}
    static var creationDate: FINSymbol {return FINSymbol(name: "creationDate", type: 0x656e756d, code: 0x61736364)}
    static var creationDateColumn: FINSymbol {return FINSymbol(name: "creationDateColumn", type: 0x656e756d, code: 0x656c7363)}
    static var diacriticals: FINSymbol {return FINSymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
    static var expansion: FINSymbol {return FINSymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
    static var flowView: FINSymbol {return FINSymbol(name: "flowView", type: 0x656e756d, code: 0x666c7677)}
    static var groupView: FINSymbol {return FINSymbol(name: "groupView", type: 0x656e756d, code: 0x67727677)}
    static var hyphens: FINSymbol {return FINSymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
    static var iconView: FINSymbol {return FINSymbol(name: "iconView", type: 0x656e756d, code: 0x69636e76)}
    static var kind: FINSymbol {return FINSymbol(name: "kind", type: 0x656e756d, code: 0x6b696e64)}
    static var kindColumn: FINSymbol {return FINSymbol(name: "kindColumn", type: 0x656e756d, code: 0x656c736b)}
    static var labelColumn: FINSymbol {return FINSymbol(name: "labelColumn", type: 0x656e756d, code: 0x656c736c)}
    static var labelIndex: FINSymbol {return FINSymbol(name: "labelIndex", type: 0x656e756d, code: 0x6c616269)}
    static var large: FINSymbol {return FINSymbol(name: "large", type: 0x656e756d, code: 0x6c676963)}
    static var largeIcon: FINSymbol {return FINSymbol(name: "largeIcon", type: 0x656e756d, code: 0x6c676963)}
    static var listView: FINSymbol {return FINSymbol(name: "listView", type: 0x656e756d, code: 0x6c737677)}
    static var mini: FINSymbol {return FINSymbol(name: "mini", type: 0x656e756d, code: 0x6d696963)}
    static var modificationDate: FINSymbol {return FINSymbol(name: "modificationDate", type: 0x656e756d, code: 0x61736d6f)}
    static var modificationDateColumn: FINSymbol {return FINSymbol(name: "modificationDateColumn", type: 0x656e756d, code: 0x656c736d)}
    static var name: FINSymbol {return FINSymbol(name: "name", type: 0x656e756d, code: 0x706e616d)}
    static var nameColumn: FINSymbol {return FINSymbol(name: "nameColumn", type: 0x656e756d, code: 0x656c736e)}
    static var no: FINSymbol {return FINSymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
    static var none_: FINSymbol {return FINSymbol(name: "none_", type: 0x656e756d, code: 0x6e6f6e65)}
    static var normal: FINSymbol {return FINSymbol(name: "normal", type: 0x656e756d, code: 0x736e726d)}
    static var notArranged: FINSymbol {return FINSymbol(name: "notArranged", type: 0x656e756d, code: 0x6e617272)}
    static var numericStrings: FINSymbol {return FINSymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
    static var punctuation: FINSymbol {return FINSymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
    static var readOnly: FINSymbol {return FINSymbol(name: "readOnly", type: 0x656e756d, code: 0x72656164)}
    static var readWrite: FINSymbol {return FINSymbol(name: "readWrite", type: 0x656e756d, code: 0x72647772)}
    static var reversed: FINSymbol {return FINSymbol(name: "reversed", type: 0x656e756d, code: 0x73727673)}
    static var right_: FINSymbol {return FINSymbol(name: "right_", type: 0x656e756d, code: 0x6c726774)}
    static var size: FINSymbol {return FINSymbol(name: "size", type: 0x656e756d, code: 0x70687973)}
    static var sizeColumn: FINSymbol {return FINSymbol(name: "sizeColumn", type: 0x656e756d, code: 0x656c7373)}
    static var small: FINSymbol {return FINSymbol(name: "small", type: 0x656e756d, code: 0x736d6963)}
    static var smallIcon: FINSymbol {return FINSymbol(name: "smallIcon", type: 0x656e756d, code: 0x736d6963)}
    static var snapToGrid: FINSymbol {return FINSymbol(name: "snapToGrid", type: 0x656e756d, code: 0x67726461)}
    static var unknownFormat: FINSymbol {return FINSymbol(name: "unknownFormat", type: 0x656e756d, code: 0x64663f3f)}
    static var versionColumn: FINSymbol {return FINSymbol(name: "versionColumn", type: 0x656e756d, code: 0x656c7376)}
    static var version_: FINSymbol {return FINSymbol(name: "version_", type: 0x656e756d, code: 0x76657273)}
    static var whitespace: FINSymbol {return FINSymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
    static var writeOnly: FINSymbol {return FINSymbol(name: "writeOnly", type: 0x656e756d, code: 0x77726974)}
    static var yes: FINSymbol {return FINSymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


/******************************************************************************/
// TOP-LEVEL CONSTANTS

// Namespace for generic specifiers and symbols, e.g. FIN.app.name, FIN.unicodeText
let FIN = FINSymbol.self


