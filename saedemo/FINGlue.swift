//
// FINGlue.swift
// Finder.app 10.11
// AppleEventBridge.framework 0.7.0
//

import Foundation
import AppleEventBridge

// TO DO: decide if generic specifier roots should appear as app/con/its static vars on XXSymbol class, or as XXApp/XXCon/XXIts vars on module


class FINFormatter: SwiftAEFormatter { // used internally to generate description strings

    override var prefix: String {return "FIN"}
    override var appclassname: String {return "Finder"}
    
    override func propertyByCode(code: OSType) -> String? {
        switch code {
        case 0x70636c73: return "class_"
        case 0x6c77636c: return "collating"
        case 0x6c776370: return "copies"
        case 0x6c776c70: return "endingPage"
        case 0x6c776568: return "errorHandling"
        case 0x6661786e: return "faxNumber"
        case 0x49442020: return "id"
        case 0x6c776c61: return "pagesAcross"
        case 0x6c776c64: return "pagesDown"
        case 0x6c777174: return "requestedPrintTime"
        case 0x6c776670: return "startingPage"
        case 0x74727072: return "targetPrinter"
        default: return super.propertyByCode(code)
        }
    }
    override func elementsByCode(code: OSType) -> String? {
        switch (code) {
        case 0x70736574: return "printSettings"
        default: return super.elementsByCode(code)
        }
    }
}


class FINSpecifier: SwiftAESpecifier {
        
    override var description: String { return FINFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Raw property and element specifiers, e.g. TextEdit.elementsByFourCharCode("docu") => TextEdit.documents
    
    func propertyByCode(code: OSType) -> FINSpecifier {
        return FINSpecifier(appData: aebAppData, aemQuery: (aemQuery as! AEMObjectSpecifier).property(code))
    }
    func elementsByCode(code: OSType) -> FINSpecifier {
        return FINSpecifier(appData: aebAppData, aemQuery: (aemQuery as! AEMObjectSpecifier).elements(code))
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
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        switch (index) {
        case is String:
            return FINSpecifier(appData: aebAppData, aemQuery:  baseQuery.byName(index))
        case is FINSpecifier:
            let testClause = (index is AEBSpecifier ? (index as! AEBSpecifier).aemQuery : aemQuery) as! AEMTestClause
            return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.byTest(testClause))
        default:
            return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.byIndex(index))
        }
    }
    func ID(uid: AnyObject) -> FINSpecifier { // by-id
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.byID(uid))
    }
    subscript(from: AnyObject!, to: AnyObject!) -> FINSpecifier! { // by-range
        let newQuery = (self.aemQuery as! AEMMultipleElementsSpecifier).byRange(from, to: to)
        return FINSpecifier(appData: aebAppData, aemQuery: newQuery)
    }
    
    func previous(class_: AEBSymbol) -> FINSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.previous(class_.aebCode))
    }
    func next(class_: AEBSymbol) -> FINSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.next(class_.aebCode))
    }
    
    var first:  FINSpecifier {return FINSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).first())}
    var middle: FINSpecifier {return FINSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).middle())}
    var last:   FINSpecifier {return FINSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).last())}
    var any:    FINSpecifier {return FINSpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).any())}
    
    func beginning() -> FINSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.beginning())
    }
    func end() -> FINSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.end())
    }
    func before() -> FINSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.before())
    }
    func after() -> FINSpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.after())
    }

    // Test clause constructors, e.g. FIN.its.name.beginsWith("foo")
    
    func beginsWith(input: AnyObject!) -> FINSpecifier! {
        let baseQuery = self.aemQuery as! AEMObjectSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.beginsWith(input))
    }
    func endsWith(input: AnyObject!) -> FINSpecifier! {
        let baseQuery = self.aemQuery as! AEMObjectSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.endsWith(input))
    }
    func contains(input: AnyObject!) -> FINSpecifier! {
        let baseQuery = self.aemQuery as! AEMObjectSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.contains(input))
    }
    func isIn(input: AnyObject!) -> FINSpecifier! {
        let baseQuery = self.aemQuery as! AEMObjectSpecifier
        return FINSpecifier(appData: aebAppData, aemQuery: baseQuery.isIn(input))
    }
    
    // Properties
    
    var class_: FINSpecifier {return self.propertyByCode(0x70636c73)}
    var collating: FINSpecifier {return self.propertyByCode(0x6c77636c)}
    var copies: FINSpecifier {return self.propertyByCode(0x6c776370)}
    var endingPage: FINSpecifier {return self.propertyByCode(0x6c776c70)}
    var errorHandling: FINSpecifier {return self.propertyByCode(0x6c776568)}
    var faxNumber: FINSpecifier {return self.propertyByCode(0x6661786e)}
    var id: FINSpecifier {return self.propertyByCode(0x49442020)}
    var pagesAcross: FINSpecifier {return self.propertyByCode(0x6c776c61)}
    var pagesDown: FINSpecifier {return self.propertyByCode(0x6c776c64)}
    var requestedPrintTime: FINSpecifier {return self.propertyByCode(0x6c777174)}
    var startingPage: FINSpecifier {return self.propertyByCode(0x6c776670)}
    var targetPrinter: FINSpecifier {return self.propertyByCode(0x74727072)}
    
    // Elements
    
    var printSettings: FINSpecifier {return self.elementsByCode(0x70736574)}
    
    // Commands
    
    func activate(directParameter: AnyObject = kAEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x61637476, parameters: [
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
            returnType: AEBReturnType? = nil, waitReply: Bool? = true, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent(0x61657674, eventID: 0x70646f63, parameters: [
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
        return self.init(targetType: kAEBTargetCurrent, targetData: nil)
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
    let baseQuery = left.aemQuery as! AEMObjectSpecifier
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.equals(right))
}
func != (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMObjectSpecifier
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.notEquals(right))
}
func < (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMObjectSpecifier
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.lessThan(right))
}
func > (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMObjectSpecifier
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.greaterThan(right))
}
func <= (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMObjectSpecifier
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.lessOrEquals(right))
}
func >= (left: FINSpecifier!, right: AnyObject!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMObjectSpecifier
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.greaterOrEquals(right))
}
func && (left: FINSpecifier!, right: FINSpecifier!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMTestClause
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.AND(right))
}
func || (left: FINSpecifier!, right: FINSpecifier!) -> FINSpecifier! {
    let baseQuery = left.aemQuery as! AEMTestClause
    return FINSpecifier(appData: left.aebAppData, aemQuery: baseQuery.OR(right))
}
prefix func ! (input: FINSpecifier!) -> FINSpecifier! {
    let baseQuery = input.aemQuery as! AEMTestClause
    return FINSpecifier(appData: input.aebAppData, aemQuery: baseQuery.NOT())
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
        case 0x62756e64: return self.applicationBundleID
        case 0x726d7465: return self.applicationResponses
        case 0x7369676e: return self.applicationSignature
        case 0x6170726c: return self.applicationURL
        case 0x61736b20: return self.ask
        case 0x62657374: return self.best
        case 0x626f6f6c: return self.boolean
        case 0x71647274: return self.boundingRectangle
        case 0x63617365: return self.case_
        case 0x636d7472: return self.centimeters
        case 0x67636c69: return self.classInfo
        case 0x70636c73: return self.class_
        case 0x6c77636c: return self.collating
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
        case 0x66737266: return self.fileRef
        case 0x66737320: return self.fileSpecification
        case 0x6675726c: return self.fileURL
        case 0x66697864: return self.fixed
        case 0x66706e74: return self.fixedPoint
        case 0x66726374: return self.fixedRectangle
        case 0x646f7562: return self.float
        case 0x6c64626c: return self.float128bit
        case 0x67616c6e: return self.gallons
        case 0x6772616d: return self.grams
        case 0x63677478: return self.graphicText
        case 0x68797068: return self.hyphens
        case 0x49442020: return self.id
        case 0x696e6368: return self.inches
        case 0x6c6f6e67: return self.integer
        case 0x69747874: return self.internationalText
        case 0x696e746c: return self.internationalWritingCode
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
        case 0x6d736e67: return self.missingValue
        case 0x6e6f2020: return self.no
        case 0x6e756c6c: return self.null
        case 0x6e756d65: return self.numericStrings
        case 0x6f7a7320: return self.ounces
        case 0x6c776c61: return self.pagesAcross
        case 0x6c776c64: return self.pagesDown
        case 0x706d696e: return self.parameterInfo
        case 0x74706d6d: return self.pixelMapRecord
        case 0x51447074: return self.point
        case 0x6c627320: return self.pounds
        case 0x70736574: return self.printSettings
        case 0x70736e20: return self.processSerialNumber
        case 0x70726f70: return self.property
        case 0x70696e66: return self.propertyInfo
        case 0x70756e63: return self.punctuation
        case 0x71727473: return self.quarts
        case 0x7265636f: return self.record
        case 0x6f626a20: return self.reference
        case 0x6c777174: return self.requestedPrintTime
        case 0x74726f74: return self.rotation
        case 0x73637074: return self.script
        case 0x73696e67: return self.shortFloat
        case 0x73686f72: return self.shortInteger
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
        case 0x74737479: return self.textStyleInfo
        case 0x74797065: return self.typeClass
        case 0x6d61676e: return self.unsignedInteger
        case 0x76657273: return self.version_
        case 0x77686974: return self.whitespace
        case 0x70736374: return self.writingCode
        case 0x79617264: return self.yards
        case 0x79657320: return self.yes
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
    static var UTF16Text: FINSymbol {return FINSymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
    static var UTF8Text: FINSymbol {return FINSymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
    static var UnicodeText: FINSymbol {return FINSymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
    static var Wednesday: FINSymbol {return FINSymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
    static var alias: FINSymbol {return FINSymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
    static var anything: FINSymbol {return FINSymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
    static var applicationBundleID: FINSymbol {return FINSymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
    static var applicationSignature: FINSymbol {return FINSymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
    static var applicationURL: FINSymbol {return FINSymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
    static var best: FINSymbol {return FINSymbol(name: "best", type: 0x74797065, code: 0x62657374)}
    static var boolean: FINSymbol {return FINSymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
    static var boundingRectangle: FINSymbol {return FINSymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
    static var centimeters: FINSymbol {return FINSymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
    static var classInfo: FINSymbol {return FINSymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
    static var class_: FINSymbol {return FINSymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
    static var collating: FINSymbol {return FINSymbol(name: "collating", type: 0x74797065, code: 0x6c77636c)}
    static var colorTable: FINSymbol {return FINSymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
    static var copies: FINSymbol {return FINSymbol(name: "copies", type: 0x74797065, code: 0x6c776370)}
    static var cubicCentimeters: FINSymbol {return FINSymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
    static var cubicFeet: FINSymbol {return FINSymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
    static var cubicInches: FINSymbol {return FINSymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
    static var cubicMeters: FINSymbol {return FINSymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
    static var cubicYards: FINSymbol {return FINSymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
    static var dashStyle: FINSymbol {return FINSymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
    static var data: FINSymbol {return FINSymbol(name: "data", type: 0x74797065, code: 0x72646174)}
    static var date: FINSymbol {return FINSymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
    static var decimalStruct: FINSymbol {return FINSymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
    static var degreesCelsius: FINSymbol {return FINSymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
    static var degreesFahrenheit: FINSymbol {return FINSymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
    static var degreesKelvin: FINSymbol {return FINSymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
    static var doubleInteger: FINSymbol {return FINSymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
    static var elementInfo: FINSymbol {return FINSymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
    static var encodedString: FINSymbol {return FINSymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
    static var endingPage: FINSymbol {return FINSymbol(name: "endingPage", type: 0x74797065, code: 0x6c776c70)}
    static var enumerator: FINSymbol {return FINSymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
    static var errorHandling: FINSymbol {return FINSymbol(name: "errorHandling", type: 0x74797065, code: 0x6c776568)}
    static var eventInfo: FINSymbol {return FINSymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
    static var extendedFloat: FINSymbol {return FINSymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
    static var faxNumber: FINSymbol {return FINSymbol(name: "faxNumber", type: 0x74797065, code: 0x6661786e)}
    static var feet: FINSymbol {return FINSymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
    static var fileRef: FINSymbol {return FINSymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
    static var fileSpecification: FINSymbol {return FINSymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
    static var fileURL: FINSymbol {return FINSymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
    static var fixed: FINSymbol {return FINSymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
    static var fixedPoint: FINSymbol {return FINSymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
    static var fixedRectangle: FINSymbol {return FINSymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
    static var float: FINSymbol {return FINSymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
    static var float128bit: FINSymbol {return FINSymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
    static var gallons: FINSymbol {return FINSymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
    static var grams: FINSymbol {return FINSymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
    static var graphicText: FINSymbol {return FINSymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
    static var id: FINSymbol {return FINSymbol(name: "id", type: 0x74797065, code: 0x49442020)}
    static var inches: FINSymbol {return FINSymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
    static var integer: FINSymbol {return FINSymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
    static var internationalText: FINSymbol {return FINSymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
    static var internationalWritingCode: FINSymbol {return FINSymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
    static var kernelProcessID: FINSymbol {return FINSymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
    static var kilograms: FINSymbol {return FINSymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
    static var kilometers: FINSymbol {return FINSymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
    static var list: FINSymbol {return FINSymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
    static var liters: FINSymbol {return FINSymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
    static var locationReference: FINSymbol {return FINSymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
    static var longFixed: FINSymbol {return FINSymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
    static var longFixedPoint: FINSymbol {return FINSymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
    static var longFixedRectangle: FINSymbol {return FINSymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
    static var longPoint: FINSymbol {return FINSymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
    static var longRectangle: FINSymbol {return FINSymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
    static var machPort: FINSymbol {return FINSymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
    static var machine: FINSymbol {return FINSymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
    static var machineLocation: FINSymbol {return FINSymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
    static var meters: FINSymbol {return FINSymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
    static var miles: FINSymbol {return FINSymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
    static var missingValue: FINSymbol {return FINSymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
    static var null: FINSymbol {return FINSymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
    static var ounces: FINSymbol {return FINSymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
    static var pagesAcross: FINSymbol {return FINSymbol(name: "pagesAcross", type: 0x74797065, code: 0x6c776c61)}
    static var pagesDown: FINSymbol {return FINSymbol(name: "pagesDown", type: 0x74797065, code: 0x6c776c64)}
    static var parameterInfo: FINSymbol {return FINSymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
    static var pixelMapRecord: FINSymbol {return FINSymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
    static var point: FINSymbol {return FINSymbol(name: "point", type: 0x74797065, code: 0x51447074)}
    static var pounds: FINSymbol {return FINSymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
    static var printSettings: FINSymbol {return FINSymbol(name: "printSettings", type: 0x74797065, code: 0x70736574)}
    static var processSerialNumber: FINSymbol {return FINSymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
    static var property: FINSymbol {return FINSymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
    static var propertyInfo: FINSymbol {return FINSymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
    static var quarts: FINSymbol {return FINSymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
    static var record: FINSymbol {return FINSymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
    static var reference: FINSymbol {return FINSymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
    static var requestedPrintTime: FINSymbol {return FINSymbol(name: "requestedPrintTime", type: 0x74797065, code: 0x6c777174)}
    static var rotation: FINSymbol {return FINSymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
    static var script: FINSymbol {return FINSymbol(name: "script", type: 0x74797065, code: 0x73637074)}
    static var shortFloat: FINSymbol {return FINSymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
    static var shortInteger: FINSymbol {return FINSymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
    static var squareFeet: FINSymbol {return FINSymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
    static var squareKilometers: FINSymbol {return FINSymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
    static var squareMeters: FINSymbol {return FINSymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
    static var squareMiles: FINSymbol {return FINSymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
    static var squareYards: FINSymbol {return FINSymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
    static var startingPage: FINSymbol {return FINSymbol(name: "startingPage", type: 0x74797065, code: 0x6c776670)}
    static var string: FINSymbol {return FINSymbol(name: "string", type: 0x74797065, code: 0x54455854)}
    static var styledClipboardText: FINSymbol {return FINSymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
    static var styledText: FINSymbol {return FINSymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
    static var styledUnicodeText: FINSymbol {return FINSymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
    static var suiteInfo: FINSymbol {return FINSymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
    static var targetPrinter: FINSymbol {return FINSymbol(name: "targetPrinter", type: 0x74797065, code: 0x74727072)}
    static var textStyleInfo: FINSymbol {return FINSymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
    static var typeClass: FINSymbol {return FINSymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
    static var unsignedInteger: FINSymbol {return FINSymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
    static var version_: FINSymbol {return FINSymbol(name: "version_", type: 0x74797065, code: 0x76657273)}
    static var writingCode: FINSymbol {return FINSymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
    static var yards: FINSymbol {return FINSymbol(name: "yards", type: 0x74797065, code: 0x79617264)}

    // Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var applicationResponses: FINSymbol {return FINSymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
    static var ask: FINSymbol {return FINSymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
    static var case_: FINSymbol {return FINSymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
    static var detailed: FINSymbol {return FINSymbol(name: "detailed", type: 0x656e756d, code: 0x6c776474)}
    static var diacriticals: FINSymbol {return FINSymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
    static var expansion: FINSymbol {return FINSymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
    static var hyphens: FINSymbol {return FINSymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
    static var no: FINSymbol {return FINSymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
    static var numericStrings: FINSymbol {return FINSymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
    static var punctuation: FINSymbol {return FINSymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
    static var standard: FINSymbol {return FINSymbol(name: "standard", type: 0x656e756d, code: 0x6c777374)}
    static var whitespace: FINSymbol {return FINSymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
    static var yes: FINSymbol {return FINSymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


/******************************************************************************/
// TOP-LEVEL CONSTANTS

// Namespace for generic specifiers and symbols, e.g. FIN.app.name, FIN.unicodeText
let FIN = FINSymbol.self


