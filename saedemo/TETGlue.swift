//
// TETGlue.swift
// TextEdit.app 1.10
// AppleEventBridge.framework 0.7.0
//

import Foundation
import AppleEventBridge

// TO DO: decide if generic specifier roots should appear as app/con/its static vars on XXSymbol class, or as XXApp/XXCon/XXIts vars on module


class TETFormatter: SwiftAEFormatter { // used internally to generate description strings

    override var prefix: String {return "TET"}
    override var appClassName: String {return "TextEdit"}
    
    override func propertyByCode(code: OSType) -> String? {
        switch code {
        case 0x70626e64: return "bounds"
        case 0x70636c73: return "class_"
        case 0x68636c62: return "closeable"
        case 0x6c77636c: return "collating"
        case 0x636f6c72: return "color"
        case 0x6c776370: return "copies"
        case 0x646f6375: return "document"
        case 0x6c776c70: return "endingPage"
        case 0x6c776568: return "errorHandling"
        case 0x6661786e: return "faxNumber"
        case 0x6174666e: return "fileName"
        case 0x6973666c: return "floating"
        case 0x666f6e74: return "font"
        case 0x70697366: return "frontmost"
        case 0x49442020: return "id"
        case 0x70696478: return "index"
        case 0x69736d6e: return "miniaturizable"
        case 0x706d6e64: return "miniaturized"
        case 0x706d6f64: return "modal"
        case 0x696d6f64: return "modified"
        case 0x706e616d: return "name"
        case 0x6c776c61: return "pagesAcross"
        case 0x6c776c64: return "pagesDown"
        case 0x70707468: return "path"
        case 0x70414c4c: return "properties"
        case 0x6c777174: return "requestedPrintTime"
        case 0x7072737a: return "resizable"
        case 0x7074737a: return "size"
        case 0x6c776670: return "startingPage"
        case 0x74727072: return "targetPrinter"
        case 0x63747874: return "text"
        case 0x70746974: return "titled"
        case 0x76657273: return "version_"
        case 0x70766973: return "visible"
        case 0x69737a6d: return "zoomable"
        case 0x707a756d: return "zoomed"
        default: return super.propertyByCode(code)
        }
    }
    override func elementsByCode(code: OSType) -> String? {
        switch (code) {
        case 0x63617070: return "applications"
        case 0x61747473: return "attachment"
        case 0x63617472: return "attributeRuns"
        case 0x63686120: return "characters"
        case 0x636f6c72: return "colors"
        case 0x646f6375: return "documents"
        case 0x636f626a: return "items"
        case 0x63706172: return "paragraphs"
        case 0x70736574: return "printSettings"
        case 0x63747874: return "text"
        case 0x6377696e: return "windows"
        case 0x63776f72: return "words"
        default: return super.elementsByCode(code)
        }
    }
}


class TETSpecifier: SwiftAESpecifier {
        
    override var description: String { return TETFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Raw property and element specifiers, e.g. TextEdit.elementsByFourCharCode("docu") => TextEdit.documents
    
    func propertyByCode(code: OSType) -> TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify a property")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.property(code), queryError: queryError)
    }
    func elementsByCode(code: OSType) -> TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify elements")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.elements(code), queryError: queryError)
    }
    func propertyByFourCharCode(code: String) -> TETSpecifier {
        return self.propertyByCode(AEM4CC(code))
    }
    func elementsByFourCharCode(code: String) -> TETSpecifier {
        return self.elementsByCode(AEM4CC(code))
    }
    
    // Element(s) selectors
    // important: by-index selectors use Apple event-style 1-indexing, NOT Swift-style 0-indexing

    subscript(index: AnyObject!) -> TETSpecifier! { // by-index, by-name, by-test

        var baseQuery: AEMMultipleElementsSpecifier?, newQuery: AEMQuery?, queryError: NSError?
        switch (index) {
        case is String:
            (baseQuery, queryError) = self.aemElementsSpecifer("select element named \(index)")
            newQuery = baseQuery?.byName(index)
        case is AEMQueryProtocol:
            (baseQuery, queryError) = self.aemElementsSpecifer("select elements where \(index)")
            if let testClause = (index as! AEMQueryProtocol).aemQuery as? AEMTestClause {
                newQuery = baseQuery?.byTest(testClause)
            }
        default:
            (baseQuery, queryError) = self.aemElementsSpecifer("select element \(index)")
            newQuery = baseQuery?.byIndex(index)
        }
        return TETSpecifier(appData: aebAppData, aemQuery: newQuery, queryError: queryError)
    }
    func ID(uid: AnyObject) -> TETSpecifier { // by-id
        let (baseQuery, queryError) = self.aemElementsSpecifer("select element with id \(uid)")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.byID(uid), queryError: queryError)
    }
    subscript(from: AnyObject!, to: AnyObject!) -> TETSpecifier! { // by-range
        let (baseQuery, queryError) = self.aemElementsSpecifer("select elements \(from) thru \(to)")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.byRange(from, to: to), queryError: queryError)
    }

    func previous(class_: AEBSymbol) -> TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select previous element")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.previous(class_.aebCode), queryError: queryError)
    }
    func next(class_: AEBSymbol) -> TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select next element")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.next(class_.aebCode), queryError: queryError)
    }
    
    var first: TETSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select first element")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.first(), queryError: queryError)
    }
    var middle: TETSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select middle element")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.middle(), queryError: queryError)
    }
    var last: TETSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select last element")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.last(), queryError: queryError)
    }
    var any: TETSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select any element")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.any(), queryError: queryError)
    }

    var beginning: TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select beginning")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginning(), queryError: queryError)
    }
    var end: TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select end")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.end(), queryError: queryError)
    }
    var before: TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select before")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.before(), queryError: queryError)
    }
    var after: TETSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select after")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.after(), queryError: queryError)
    }

    // Test clause constructors, e.g. TET.its.name.beginsWith("foo")
    
    func beginsWith(input: AnyObject!) -> TETSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginsWith(input), queryError: queryError)
    }
    func endsWith(input: AnyObject!) -> TETSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.endsWith(input), queryError: queryError)
    }
    func contains(input: AnyObject!) -> TETSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.contains(input), queryError: queryError)
    }
    func isIn(input: AnyObject!) -> TETSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TETSpecifier(appData: aebAppData, aemQuery: baseQuery?.isIn(input), queryError: queryError)
    }
    
    // Properties
    
    var bounds: TETSpecifier {return self.propertyByCode(0x70626e64)}
    var class_: TETSpecifier {return self.propertyByCode(0x70636c73)}
    var closeable: TETSpecifier {return self.propertyByCode(0x68636c62)}
    var collating: TETSpecifier {return self.propertyByCode(0x6c77636c)}
    var color: TETSpecifier {return self.propertyByCode(0x636f6c72)}
    var copies: TETSpecifier {return self.propertyByCode(0x6c776370)}
    var document: TETSpecifier {return self.propertyByCode(0x646f6375)}
    var endingPage: TETSpecifier {return self.propertyByCode(0x6c776c70)}
    var errorHandling: TETSpecifier {return self.propertyByCode(0x6c776568)}
    var faxNumber: TETSpecifier {return self.propertyByCode(0x6661786e)}
    var fileName: TETSpecifier {return self.propertyByCode(0x6174666e)}
    var floating: TETSpecifier {return self.propertyByCode(0x6973666c)}
    var font: TETSpecifier {return self.propertyByCode(0x666f6e74)}
    var frontmost: TETSpecifier {return self.propertyByCode(0x70697366)}
    var id: TETSpecifier {return self.propertyByCode(0x49442020)}
    var index: TETSpecifier {return self.propertyByCode(0x70696478)}
    var miniaturizable: TETSpecifier {return self.propertyByCode(0x69736d6e)}
    var miniaturized: TETSpecifier {return self.propertyByCode(0x706d6e64)}
    var modal: TETSpecifier {return self.propertyByCode(0x706d6f64)}
    var modified: TETSpecifier {return self.propertyByCode(0x696d6f64)}
    var name: TETSpecifier {return self.propertyByCode(0x706e616d)}
    var pagesAcross: TETSpecifier {return self.propertyByCode(0x6c776c61)}
    var pagesDown: TETSpecifier {return self.propertyByCode(0x6c776c64)}
    var path: TETSpecifier {return self.propertyByCode(0x70707468)}
    var properties: TETSpecifier {return self.propertyByCode(0x70414c4c)}
    var requestedPrintTime: TETSpecifier {return self.propertyByCode(0x6c777174)}
    var resizable: TETSpecifier {return self.propertyByCode(0x7072737a)}
    var size: TETSpecifier {return self.propertyByCode(0x7074737a)}
    var startingPage: TETSpecifier {return self.propertyByCode(0x6c776670)}
    var targetPrinter: TETSpecifier {return self.propertyByCode(0x74727072)}
    var titled: TETSpecifier {return self.propertyByCode(0x70746974)}
    var version_: TETSpecifier {return self.propertyByCode(0x76657273)}
    var visible: TETSpecifier {return self.propertyByCode(0x70766973)}
    var zoomable: TETSpecifier {return self.propertyByCode(0x69737a6d)}
    var zoomed: TETSpecifier {return self.propertyByCode(0x707a756d)}
    
    // Elements
    
    var applications: TETSpecifier {return self.elementsByCode(0x63617070)}
    var attachment: TETSpecifier {return self.elementsByCode(0x61747473)}
    var attributeRuns: TETSpecifier {return self.elementsByCode(0x63617472)}
    var characters: TETSpecifier {return self.elementsByCode(0x63686120)}
    var colors: TETSpecifier {return self.elementsByCode(0x636f6c72)}
    var documents: TETSpecifier {return self.elementsByCode(0x646f6375)}
    var items: TETSpecifier {return self.elementsByCode(0x636f626a)}
    var paragraphs: TETSpecifier {return self.elementsByCode(0x63706172)}
    var printSettings: TETSpecifier {return self.elementsByCode(0x70736574)}
    var text: TETSpecifier {return self.elementsByCode(0x63747874)}
    var windows: TETSpecifier {return self.elementsByCode(0x6377696e)}
    var words: TETSpecifier {return self.elementsByCode(0x63776f72)}
    
    // Commands
    
    func activate(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x61637476, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func close(directParameter: AnyObject = kAEBNoParameter,
            savingIn: AnyObject = kAEBNoParameter,
            saving: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f73, parameters: [
                SwiftAEParameter(name: "savingIn", code: 0x6b66696c, value: savingIn),
                SwiftAEParameter(name: "saving", code: 0x7361766f, value: saving),
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
    func duplicate(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f6e, parameters: [
                SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
                SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
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
            withData: AnyObject = kAEBNoParameter,
            at: AnyObject = kAEBNoParameter,
            new: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6372656c, parameters: [
                SwiftAEParameter(name: "withData", code: 0x64617461, value: withData),
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
    func open(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f646f63, parameters: [
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
            printDialog: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x70646f63, parameters: [
                SwiftAEParameter(name: "printDialog", code: 0x70646c67, value: printDialog),
                SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func quit(directParameter: AnyObject = kAEBNoParameter,
            saving: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x71756974, parameters: [
                SwiftAEParameter(name: "saving", code: 0x7361766f, value: saving),
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
    func run(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f617070, parameters: [
                SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)],
            returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func save(directParameter: AnyObject = kAEBNoParameter,
            as_: AnyObject = kAEBNoParameter,
            in_: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x73617665, parameters: [
                SwiftAEParameter(name: "as_", code: 0x666c7470, value: as_),
                SwiftAEParameter(name: "in_", code: 0x6b66696c, value: in_),
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
}


class TextEdit: TETSpecifier {
    private init(targetType: AEBTargetType, targetData: AnyObject?) {
        let data = SwiftAEAppData(applicationClass: AEMApplication.self,
                                       symbolClass: TETSymbol.self,
                                    specifierClass: TETSpecifier.self,
                                        targetType: targetType,
                                        targetData: targetData)
        super.init(appData: data, aemQuery: AppleEventBridge.AEMQuery.app())
    }
    override convenience init() { // TO DO: delete/raise error if bundle id not given
        self.init(bundleIdentifier: "com.apple.TextEdit")
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
    class func currentApplication() -> TextEdit {
        return TextEdit(targetType: kAEBTargetCurrent, targetData: nil)
    }
    
    // Construct a TETSpecifier using a raw AEMQuery or other custom object
    // (e.g. if app's terminology is broken or when dealing with especially cranky old apps)
    
    func customRoot(object: AnyObject!) -> TETSpecifier {
        if object is TETSpecifier {
            return TETSpecifier(appData: aebAppData, aemQuery: (object as! TETSpecifier).aemQuery)
        } else if object is AppleEventBridge.AEMQuery {
            return TETSpecifier(appData: aebAppData, aemQuery: object as! AppleEventBridge.AEMQuery)
        } else if object == nil {
            return TETSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.app())
        } else {
            return TETSpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.customRoot(object))
        }
    }
}


// test clause constructors, e.g. TET.its.name != "foo"
// note: the == operator will return a TETSpecifier when used in elements[...] specifier; however, when
// binding its result to a variable, it must be explicitly typed as (e.g.) AnyObject or Swift will infer Bool

func == (left: TETSpecifier!, right: AnyObject!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.equals(right), queryError: queryError)
}
func != (left: TETSpecifier!, right: AnyObject!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.notEquals(right), queryError: queryError)
}
func < (left: TETSpecifier!, right: AnyObject!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessThan(right), queryError: queryError)
}
func > (left: TETSpecifier!, right: AnyObject!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterThan(right), queryError: queryError)
}
func <= (left: TETSpecifier!, right: AnyObject!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessOrEquals(right), queryError: queryError)
}
func >= (left: TETSpecifier!, right: AnyObject!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterOrEquals(right), queryError: queryError)
}
func && (left: TETSpecifier!, right: TETSpecifier!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.AND(right), queryError: queryError)
}
func || (left: TETSpecifier!, right: TETSpecifier!) -> TETSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return TETSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.OR(right), queryError: queryError)
}
prefix func ! (input: TETSpecifier!) -> TETSpecifier! {
    let (baseQuery, queryError) = input.aemTestClause("test")
    return TETSpecifier(appData: input.aebAppData, aemQuery: baseQuery?.NOT(), queryError: queryError)
}


/******************************************************************************/
// SYMBOLS


class TETSymbol: SwiftAESymbol {

    override var description: String {return "TET.\(self.aebName)"}

    // Generic specifier roots. These can be used to construct TETSpecifiers for use in other
    // TETSpecifiers and TETCommands, though only real specifiers constructed from a
    // TextEdit application instance can be used to send commands to the target application.

    // TO DO: where best to put these root vars?

    static let app = TETSpecifier(appData: nil, aemQuery: AEMQuery.app())
    static let con = TETSpecifier(appData: nil, aemQuery: AEMQuery.con())
    static let its = TETSpecifier(appData: nil, aemQuery: AEMQuery.its())

    override class func symbol(code: OSType) -> AEBSymbol {
        switch (code) {
        case 0x61707220: return self.April
        case 0x61756720: return self.August
        case 0x63737472: return self.CString
        case 0x64656320: return self.December
        case 0x45505320: return self.EPSPicture
        case 0x66656220: return self.February
        case 0x66726920: return self.Friday
        case 0x47494666: return self.GIFPicture
        case 0x4a504547: return self.JPEGPicture
        case 0x6a616e20: return self.January
        case 0x6a756c20: return self.July
        case 0x6a756e20: return self.June
        case 0x6d617220: return self.March
        case 0x6d617920: return self.May
        case 0x6d6f6e20: return self.Monday
        case 0x6e6f7620: return self.November
        case 0x6f637420: return self.October
        case 0x50494354: return self.PICTPicture
        case 0x70737472: return self.PascalString
        case 0x74723136: return self.RGB16Color
        case 0x74723936: return self.RGB96Color
        case 0x63524742: return self.RGBColor
        case 0x73617420: return self.Saturday
        case 0x73657020: return self.September
        case 0x73756e20: return self.Sunday
        case 0x54494646: return self.TIFFPicture
        case 0x74687520: return self.Thursday
        case 0x74756520: return self.Tuesday
        case 0x75743136: return self.UTF16Text
        case 0x75746638: return self.UTF8Text
        case 0x75747874: return self.UnicodeText
        case 0x77656420: return self.Wednesday
        case 0x616c6973: return self.alias
        case 0x2a2a2a2a: return self.anything
        case 0x63617070: return self.application
        case 0x62756e64: return self.applicationBundleID
        case 0x726d7465: return self.applicationResponses
        case 0x7369676e: return self.applicationSignature
        case 0x6170726c: return self.applicationURL
        case 0x61736b20: return self.ask
        case 0x61747473: return self.attachment
        case 0x63617472: return self.attributeRun
        case 0x62657374: return self.best
        case 0x626f6f6c: return self.boolean
        case 0x71647274: return self.boundingRectangle
        case 0x70626e64: return self.bounds
        case 0x63617365: return self.case_
        case 0x636d7472: return self.centimeters
        case 0x63686120: return self.character
        case 0x67636c69: return self.classInfo
        case 0x70636c73: return self.class_
        case 0x68636c62: return self.closeable
        case 0x6c77636c: return self.collating
        case 0x636f6c72: return self.color
        case 0x636c7274: return self.colorTable
        case 0x6c776370: return self.copies
        case 0x63636d74: return self.cubicCentimeters
        case 0x63666574: return self.cubicFeet
        case 0x6375696e: return self.cubicInches
        case 0x636d6574: return self.cubicMeters
        case 0x63797264: return self.cubicYards
        case 0x74646173: return self.dashStyle
        case 0x72646174: return self.data
        case 0x6c647420: return self.date
        case 0x6465636d: return self.decimalStruct
        case 0x64656763: return self.degreesCelsius
        case 0x64656766: return self.degreesFahrenheit
        case 0x6465676b: return self.degreesKelvin
        case 0x6c776474: return self.detailed
        case 0x64696163: return self.diacriticals
        case 0x646f6375: return self.document
        case 0x636f6d70: return self.doubleInteger
        case 0x656c696e: return self.elementInfo
        case 0x656e6373: return self.encodedString
        case 0x6c776c70: return self.endingPage
        case 0x656e756d: return self.enumerator
        case 0x6c776568: return self.errorHandling
        case 0x6576696e: return self.eventInfo
        case 0x65787061: return self.expansion
        case 0x65787465: return self.extendedFloat
        case 0x6661786e: return self.faxNumber
        case 0x66656574: return self.feet
        case 0x6174666e: return self.fileName
        case 0x66737266: return self.fileRef
        case 0x66737320: return self.fileSpecification
        case 0x6675726c: return self.fileURL
        case 0x66697864: return self.fixed
        case 0x66706e74: return self.fixedPoint
        case 0x66726374: return self.fixedRectangle
        case 0x646f7562: return self.float
        case 0x6c64626c: return self.float128bit
        case 0x6973666c: return self.floating
        case 0x666f6e74: return self.font
        case 0x70697366: return self.frontmost
        case 0x67616c6e: return self.gallons
        case 0x6772616d: return self.grams
        case 0x63677478: return self.graphicText
        case 0x68797068: return self.hyphens
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
        case 0x6c697374: return self.list
        case 0x6c697472: return self.liters
        case 0x696e736c: return self.locationReference
        case 0x6c667864: return self.longFixed
        case 0x6c667074: return self.longFixedPoint
        case 0x6c667263: return self.longFixedRectangle
        case 0x6c706e74: return self.longPoint
        case 0x6c726374: return self.longRectangle
        case 0x706f7274: return self.machPort
        case 0x6d616368: return self.machine
        case 0x6d4c6f63: return self.machineLocation
        case 0x6d657472: return self.meters
        case 0x6d696c65: return self.miles
        case 0x69736d6e: return self.miniaturizable
        case 0x706d6e64: return self.miniaturized
        case 0x6d736e67: return self.missingValue
        case 0x706d6f64: return self.modal
        case 0x696d6f64: return self.modified
        case 0x706e616d: return self.name
        case 0x6e6f2020: return self.no
        case 0x6e756c6c: return self.null
        case 0x6e756d65: return self.numericStrings
        case 0x6f7a7320: return self.ounces
        case 0x6c776c61: return self.pagesAcross
        case 0x6c776c64: return self.pagesDown
        case 0x63706172: return self.paragraph
        case 0x706d696e: return self.parameterInfo
        case 0x70707468: return self.path
        case 0x74706d6d: return self.pixelMapRecord
        case 0x51447074: return self.point
        case 0x6c627320: return self.pounds
        case 0x70736574: return self.printSettings
        case 0x70736e20: return self.processSerialNumber
        case 0x70414c4c: return self.properties
        case 0x70726f70: return self.property
        case 0x70696e66: return self.propertyInfo
        case 0x70756e63: return self.punctuation
        case 0x71727473: return self.quarts
        case 0x7265636f: return self.record
        case 0x6f626a20: return self.reference
        case 0x6c777174: return self.requestedPrintTime
        case 0x7072737a: return self.resizable
        case 0x74726f74: return self.rotation
        case 0x73637074: return self.script
        case 0x73696e67: return self.shortFloat
        case 0x73686f72: return self.shortInteger
        case 0x7074737a: return self.size
        case 0x73716674: return self.squareFeet
        case 0x73716b6d: return self.squareKilometers
        case 0x7371726d: return self.squareMeters
        case 0x73716d69: return self.squareMiles
        case 0x73717964: return self.squareYards
        case 0x6c777374: return self.standard
        case 0x6c776670: return self.startingPage
        case 0x54455854: return self.string
        case 0x7374796c: return self.styledClipboardText
        case 0x53545854: return self.styledText
        case 0x73757478: return self.styledUnicodeText
        case 0x7375696e: return self.suiteInfo
        case 0x74727072: return self.targetPrinter
        case 0x63747874: return self.text
        case 0x74737479: return self.textStyleInfo
        case 0x70746974: return self.titled
        case 0x74797065: return self.typeClass
        case 0x6d61676e: return self.unsignedInteger
        case 0x76657273: return self.version_
        case 0x70766973: return self.visible
        case 0x77686974: return self.whitespace
        case 0x6377696e: return self.window
        case 0x63776f72: return self.word
        case 0x70736374: return self.writingCode
        case 0x79617264: return self.yards
        case 0x79657320: return self.yes
        case 0x69737a6d: return self.zoomable
        case 0x707a756d: return self.zoomed
        default: return super.symbol(code)
        }
    }

    // Types/properties    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var April: TETSymbol {return TETSymbol(name: "April", type: 0x74797065, code: 0x61707220)}
    static var August: TETSymbol {return TETSymbol(name: "August", type: 0x74797065, code: 0x61756720)}
    static var CString: TETSymbol {return TETSymbol(name: "CString", type: 0x74797065, code: 0x63737472)}
    static var December: TETSymbol {return TETSymbol(name: "December", type: 0x74797065, code: 0x64656320)}
    static var EPSPicture: TETSymbol {return TETSymbol(name: "EPSPicture", type: 0x74797065, code: 0x45505320)}
    static var February: TETSymbol {return TETSymbol(name: "February", type: 0x74797065, code: 0x66656220)}
    static var Friday: TETSymbol {return TETSymbol(name: "Friday", type: 0x74797065, code: 0x66726920)}
    static var GIFPicture: TETSymbol {return TETSymbol(name: "GIFPicture", type: 0x74797065, code: 0x47494666)}
    static var JPEGPicture: TETSymbol {return TETSymbol(name: "JPEGPicture", type: 0x74797065, code: 0x4a504547)}
    static var January: TETSymbol {return TETSymbol(name: "January", type: 0x74797065, code: 0x6a616e20)}
    static var July: TETSymbol {return TETSymbol(name: "July", type: 0x74797065, code: 0x6a756c20)}
    static var June: TETSymbol {return TETSymbol(name: "June", type: 0x74797065, code: 0x6a756e20)}
    static var March: TETSymbol {return TETSymbol(name: "March", type: 0x74797065, code: 0x6d617220)}
    static var May: TETSymbol {return TETSymbol(name: "May", type: 0x74797065, code: 0x6d617920)}
    static var Monday: TETSymbol {return TETSymbol(name: "Monday", type: 0x74797065, code: 0x6d6f6e20)}
    static var November: TETSymbol {return TETSymbol(name: "November", type: 0x74797065, code: 0x6e6f7620)}
    static var October: TETSymbol {return TETSymbol(name: "October", type: 0x74797065, code: 0x6f637420)}
    static var PICTPicture: TETSymbol {return TETSymbol(name: "PICTPicture", type: 0x74797065, code: 0x50494354)}
    static var PascalString: TETSymbol {return TETSymbol(name: "PascalString", type: 0x74797065, code: 0x70737472)}
    static var RGB16Color: TETSymbol {return TETSymbol(name: "RGB16Color", type: 0x74797065, code: 0x74723136)}
    static var RGB96Color: TETSymbol {return TETSymbol(name: "RGB96Color", type: 0x74797065, code: 0x74723936)}
    static var RGBColor: TETSymbol {return TETSymbol(name: "RGBColor", type: 0x74797065, code: 0x63524742)}
    static var Saturday: TETSymbol {return TETSymbol(name: "Saturday", type: 0x74797065, code: 0x73617420)}
    static var September: TETSymbol {return TETSymbol(name: "September", type: 0x74797065, code: 0x73657020)}
    static var Sunday: TETSymbol {return TETSymbol(name: "Sunday", type: 0x74797065, code: 0x73756e20)}
    static var TIFFPicture: TETSymbol {return TETSymbol(name: "TIFFPicture", type: 0x74797065, code: 0x54494646)}
    static var Thursday: TETSymbol {return TETSymbol(name: "Thursday", type: 0x74797065, code: 0x74687520)}
    static var Tuesday: TETSymbol {return TETSymbol(name: "Tuesday", type: 0x74797065, code: 0x74756520)}
    static var UTF16Text: TETSymbol {return TETSymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
    static var UTF8Text: TETSymbol {return TETSymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
    static var UnicodeText: TETSymbol {return TETSymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
    static var Wednesday: TETSymbol {return TETSymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
    static var alias: TETSymbol {return TETSymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
    static var anything: TETSymbol {return TETSymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
    static var application: TETSymbol {return TETSymbol(name: "application", type: 0x74797065, code: 0x63617070)}
    static var applicationBundleID: TETSymbol {return TETSymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
    static var applicationSignature: TETSymbol {return TETSymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
    static var applicationURL: TETSymbol {return TETSymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
    static var attachment: TETSymbol {return TETSymbol(name: "attachment", type: 0x74797065, code: 0x61747473)}
    static var attributeRun: TETSymbol {return TETSymbol(name: "attributeRun", type: 0x74797065, code: 0x63617472)}
    static var best: TETSymbol {return TETSymbol(name: "best", type: 0x74797065, code: 0x62657374)}
    static var boolean: TETSymbol {return TETSymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
    static var boundingRectangle: TETSymbol {return TETSymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
    static var bounds: TETSymbol {return TETSymbol(name: "bounds", type: 0x74797065, code: 0x70626e64)}
    static var centimeters: TETSymbol {return TETSymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
    static var character: TETSymbol {return TETSymbol(name: "character", type: 0x74797065, code: 0x63686120)}
    static var classInfo: TETSymbol {return TETSymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
    static var class_: TETSymbol {return TETSymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
    static var closeable: TETSymbol {return TETSymbol(name: "closeable", type: 0x74797065, code: 0x68636c62)}
    static var collating: TETSymbol {return TETSymbol(name: "collating", type: 0x74797065, code: 0x6c77636c)}
    static var color: TETSymbol {return TETSymbol(name: "color", type: 0x74797065, code: 0x636f6c72)}
    static var colorTable: TETSymbol {return TETSymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
    static var copies: TETSymbol {return TETSymbol(name: "copies", type: 0x74797065, code: 0x6c776370)}
    static var cubicCentimeters: TETSymbol {return TETSymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
    static var cubicFeet: TETSymbol {return TETSymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
    static var cubicInches: TETSymbol {return TETSymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
    static var cubicMeters: TETSymbol {return TETSymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
    static var cubicYards: TETSymbol {return TETSymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
    static var dashStyle: TETSymbol {return TETSymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
    static var data: TETSymbol {return TETSymbol(name: "data", type: 0x74797065, code: 0x72646174)}
    static var date: TETSymbol {return TETSymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
    static var decimalStruct: TETSymbol {return TETSymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
    static var degreesCelsius: TETSymbol {return TETSymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
    static var degreesFahrenheit: TETSymbol {return TETSymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
    static var degreesKelvin: TETSymbol {return TETSymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
    static var document: TETSymbol {return TETSymbol(name: "document", type: 0x74797065, code: 0x646f6375)}
    static var doubleInteger: TETSymbol {return TETSymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
    static var elementInfo: TETSymbol {return TETSymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
    static var encodedString: TETSymbol {return TETSymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
    static var endingPage: TETSymbol {return TETSymbol(name: "endingPage", type: 0x74797065, code: 0x6c776c70)}
    static var enumerator: TETSymbol {return TETSymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
    static var errorHandling: TETSymbol {return TETSymbol(name: "errorHandling", type: 0x74797065, code: 0x6c776568)}
    static var eventInfo: TETSymbol {return TETSymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
    static var extendedFloat: TETSymbol {return TETSymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
    static var faxNumber: TETSymbol {return TETSymbol(name: "faxNumber", type: 0x74797065, code: 0x6661786e)}
    static var feet: TETSymbol {return TETSymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
    static var fileName: TETSymbol {return TETSymbol(name: "fileName", type: 0x74797065, code: 0x6174666e)}
    static var fileRef: TETSymbol {return TETSymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
    static var fileSpecification: TETSymbol {return TETSymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
    static var fileURL: TETSymbol {return TETSymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
    static var fixed: TETSymbol {return TETSymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
    static var fixedPoint: TETSymbol {return TETSymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
    static var fixedRectangle: TETSymbol {return TETSymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
    static var float: TETSymbol {return TETSymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
    static var float128bit: TETSymbol {return TETSymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
    static var floating: TETSymbol {return TETSymbol(name: "floating", type: 0x74797065, code: 0x6973666c)}
    static var font: TETSymbol {return TETSymbol(name: "font", type: 0x74797065, code: 0x666f6e74)}
    static var frontmost: TETSymbol {return TETSymbol(name: "frontmost", type: 0x74797065, code: 0x70697366)}
    static var gallons: TETSymbol {return TETSymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
    static var grams: TETSymbol {return TETSymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
    static var graphicText: TETSymbol {return TETSymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
    static var id: TETSymbol {return TETSymbol(name: "id", type: 0x74797065, code: 0x49442020)}
    static var inches: TETSymbol {return TETSymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
    static var index: TETSymbol {return TETSymbol(name: "index", type: 0x74797065, code: 0x70696478)}
    static var integer: TETSymbol {return TETSymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
    static var internationalText: TETSymbol {return TETSymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
    static var internationalWritingCode: TETSymbol {return TETSymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
    static var item: TETSymbol {return TETSymbol(name: "item", type: 0x74797065, code: 0x636f626a)}
    static var kernelProcessID: TETSymbol {return TETSymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
    static var kilograms: TETSymbol {return TETSymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
    static var kilometers: TETSymbol {return TETSymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
    static var list: TETSymbol {return TETSymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
    static var liters: TETSymbol {return TETSymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
    static var locationReference: TETSymbol {return TETSymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
    static var longFixed: TETSymbol {return TETSymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
    static var longFixedPoint: TETSymbol {return TETSymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
    static var longFixedRectangle: TETSymbol {return TETSymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
    static var longPoint: TETSymbol {return TETSymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
    static var longRectangle: TETSymbol {return TETSymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
    static var machPort: TETSymbol {return TETSymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
    static var machine: TETSymbol {return TETSymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
    static var machineLocation: TETSymbol {return TETSymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
    static var meters: TETSymbol {return TETSymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
    static var miles: TETSymbol {return TETSymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
    static var miniaturizable: TETSymbol {return TETSymbol(name: "miniaturizable", type: 0x74797065, code: 0x69736d6e)}
    static var miniaturized: TETSymbol {return TETSymbol(name: "miniaturized", type: 0x74797065, code: 0x706d6e64)}
    static var missingValue: TETSymbol {return TETSymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
    static var modal: TETSymbol {return TETSymbol(name: "modal", type: 0x74797065, code: 0x706d6f64)}
    static var modified: TETSymbol {return TETSymbol(name: "modified", type: 0x74797065, code: 0x696d6f64)}
    static var name: TETSymbol {return TETSymbol(name: "name", type: 0x74797065, code: 0x706e616d)}
    static var null: TETSymbol {return TETSymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
    static var ounces: TETSymbol {return TETSymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
    static var pagesAcross: TETSymbol {return TETSymbol(name: "pagesAcross", type: 0x74797065, code: 0x6c776c61)}
    static var pagesDown: TETSymbol {return TETSymbol(name: "pagesDown", type: 0x74797065, code: 0x6c776c64)}
    static var paragraph: TETSymbol {return TETSymbol(name: "paragraph", type: 0x74797065, code: 0x63706172)}
    static var parameterInfo: TETSymbol {return TETSymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
    static var path: TETSymbol {return TETSymbol(name: "path", type: 0x74797065, code: 0x70707468)}
    static var pixelMapRecord: TETSymbol {return TETSymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
    static var point: TETSymbol {return TETSymbol(name: "point", type: 0x74797065, code: 0x51447074)}
    static var pounds: TETSymbol {return TETSymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
    static var printSettings: TETSymbol {return TETSymbol(name: "printSettings", type: 0x74797065, code: 0x70736574)}
    static var processSerialNumber: TETSymbol {return TETSymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
    static var properties: TETSymbol {return TETSymbol(name: "properties", type: 0x74797065, code: 0x70414c4c)}
    static var property: TETSymbol {return TETSymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
    static var propertyInfo: TETSymbol {return TETSymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
    static var quarts: TETSymbol {return TETSymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
    static var record: TETSymbol {return TETSymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
    static var reference: TETSymbol {return TETSymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
    static var requestedPrintTime: TETSymbol {return TETSymbol(name: "requestedPrintTime", type: 0x74797065, code: 0x6c777174)}
    static var resizable: TETSymbol {return TETSymbol(name: "resizable", type: 0x74797065, code: 0x7072737a)}
    static var rotation: TETSymbol {return TETSymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
    static var script: TETSymbol {return TETSymbol(name: "script", type: 0x74797065, code: 0x73637074)}
    static var shortFloat: TETSymbol {return TETSymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
    static var shortInteger: TETSymbol {return TETSymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
    static var size: TETSymbol {return TETSymbol(name: "size", type: 0x74797065, code: 0x7074737a)}
    static var squareFeet: TETSymbol {return TETSymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
    static var squareKilometers: TETSymbol {return TETSymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
    static var squareMeters: TETSymbol {return TETSymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
    static var squareMiles: TETSymbol {return TETSymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
    static var squareYards: TETSymbol {return TETSymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
    static var startingPage: TETSymbol {return TETSymbol(name: "startingPage", type: 0x74797065, code: 0x6c776670)}
    static var string: TETSymbol {return TETSymbol(name: "string", type: 0x74797065, code: 0x54455854)}
    static var styledClipboardText: TETSymbol {return TETSymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
    static var styledText: TETSymbol {return TETSymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
    static var styledUnicodeText: TETSymbol {return TETSymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
    static var suiteInfo: TETSymbol {return TETSymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
    static var targetPrinter: TETSymbol {return TETSymbol(name: "targetPrinter", type: 0x74797065, code: 0x74727072)}
    static var text: TETSymbol {return TETSymbol(name: "text", type: 0x74797065, code: 0x63747874)}
    static var textStyleInfo: TETSymbol {return TETSymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
    static var titled: TETSymbol {return TETSymbol(name: "titled", type: 0x74797065, code: 0x70746974)}
    static var typeClass: TETSymbol {return TETSymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
    static var unsignedInteger: TETSymbol {return TETSymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
    static var version_: TETSymbol {return TETSymbol(name: "version_", type: 0x74797065, code: 0x76657273)}
    static var visible: TETSymbol {return TETSymbol(name: "visible", type: 0x74797065, code: 0x70766973)}
    static var window: TETSymbol {return TETSymbol(name: "window", type: 0x74797065, code: 0x6377696e)}
    static var word: TETSymbol {return TETSymbol(name: "word", type: 0x74797065, code: 0x63776f72)}
    static var writingCode: TETSymbol {return TETSymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
    static var yards: TETSymbol {return TETSymbol(name: "yards", type: 0x74797065, code: 0x79617264)}
    static var zoomable: TETSymbol {return TETSymbol(name: "zoomable", type: 0x74797065, code: 0x69737a6d)}
    static var zoomed: TETSymbol {return TETSymbol(name: "zoomed", type: 0x74797065, code: 0x707a756d)}

    // Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var applicationResponses: TETSymbol {return TETSymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
    static var ask: TETSymbol {return TETSymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
    static var case_: TETSymbol {return TETSymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
    static var detailed: TETSymbol {return TETSymbol(name: "detailed", type: 0x656e756d, code: 0x6c776474)}
    static var diacriticals: TETSymbol {return TETSymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
    static var expansion: TETSymbol {return TETSymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
    static var hyphens: TETSymbol {return TETSymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
    static var no: TETSymbol {return TETSymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
    static var numericStrings: TETSymbol {return TETSymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
    static var punctuation: TETSymbol {return TETSymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
    static var standard: TETSymbol {return TETSymbol(name: "standard", type: 0x656e756d, code: 0x6c777374)}
    static var whitespace: TETSymbol {return TETSymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
    static var yes: TETSymbol {return TETSymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


/******************************************************************************/
// TOP-LEVEL CONSTANTS

// Namespace for generic specifiers and symbols, e.g. TET.app.name, TET.unicodeText
let TET = TETSymbol.self


