//
// TEDGlue.swift
// TextEdit.app 1.10
// AppleEventBridge.framework 0.7.0
// aebglue -r TextEdit
//

import Foundation
import AppleEventBridge


/******************************************************************************/
// TEDFormatter is used by TEDSpecifier to generate description strings


class TEDFormatter: SwiftAEFormatter {

    override var prefix: String {return "TED"}
    override var appClassName: String {return "TextEdit"}
    override var symbolClass: AEBSymbol.Type {return TEDSymbol.self}

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


/******************************************************************************/
// TEDSymbol instances represent built-in and app-defined type, enum, and property names


class TEDSymbol: SwiftAESymbol {

override var aebPrefix: String {return "TED"}

override class func aebSymbolForCode(code_: OSType) -> AEBSymbol {
switch (code_) {
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
default: return super.aebSymbolForCode(code_)
}
}

// Types/properties    // TO DO: add 'override' if var is already defined in AEBSymbol
static var April: TEDSymbol {return TEDSymbol(name: "April", type: 0x74797065, code: 0x61707220)}
static var August: TEDSymbol {return TEDSymbol(name: "August", type: 0x74797065, code: 0x61756720)}
static var CString: TEDSymbol {return TEDSymbol(name: "CString", type: 0x74797065, code: 0x63737472)}
static var December: TEDSymbol {return TEDSymbol(name: "December", type: 0x74797065, code: 0x64656320)}
static var EPSPicture: TEDSymbol {return TEDSymbol(name: "EPSPicture", type: 0x74797065, code: 0x45505320)}
static var February: TEDSymbol {return TEDSymbol(name: "February", type: 0x74797065, code: 0x66656220)}
static var Friday: TEDSymbol {return TEDSymbol(name: "Friday", type: 0x74797065, code: 0x66726920)}
static var GIFPicture: TEDSymbol {return TEDSymbol(name: "GIFPicture", type: 0x74797065, code: 0x47494666)}
static var JPEGPicture: TEDSymbol {return TEDSymbol(name: "JPEGPicture", type: 0x74797065, code: 0x4a504547)}
static var January: TEDSymbol {return TEDSymbol(name: "January", type: 0x74797065, code: 0x6a616e20)}
static var July: TEDSymbol {return TEDSymbol(name: "July", type: 0x74797065, code: 0x6a756c20)}
static var June: TEDSymbol {return TEDSymbol(name: "June", type: 0x74797065, code: 0x6a756e20)}
static var March: TEDSymbol {return TEDSymbol(name: "March", type: 0x74797065, code: 0x6d617220)}
static var May: TEDSymbol {return TEDSymbol(name: "May", type: 0x74797065, code: 0x6d617920)}
static var Monday: TEDSymbol {return TEDSymbol(name: "Monday", type: 0x74797065, code: 0x6d6f6e20)}
static var November: TEDSymbol {return TEDSymbol(name: "November", type: 0x74797065, code: 0x6e6f7620)}
static var October: TEDSymbol {return TEDSymbol(name: "October", type: 0x74797065, code: 0x6f637420)}
static var PICTPicture: TEDSymbol {return TEDSymbol(name: "PICTPicture", type: 0x74797065, code: 0x50494354)}
static var PascalString: TEDSymbol {return TEDSymbol(name: "PascalString", type: 0x74797065, code: 0x70737472)}
static var RGB16Color: TEDSymbol {return TEDSymbol(name: "RGB16Color", type: 0x74797065, code: 0x74723136)}
static var RGB96Color: TEDSymbol {return TEDSymbol(name: "RGB96Color", type: 0x74797065, code: 0x74723936)}
static var RGBColor: TEDSymbol {return TEDSymbol(name: "RGBColor", type: 0x74797065, code: 0x63524742)}
static var Saturday: TEDSymbol {return TEDSymbol(name: "Saturday", type: 0x74797065, code: 0x73617420)}
static var September: TEDSymbol {return TEDSymbol(name: "September", type: 0x74797065, code: 0x73657020)}
static var Sunday: TEDSymbol {return TEDSymbol(name: "Sunday", type: 0x74797065, code: 0x73756e20)}
static var TIFFPicture: TEDSymbol {return TEDSymbol(name: "TIFFPicture", type: 0x74797065, code: 0x54494646)}
static var Thursday: TEDSymbol {return TEDSymbol(name: "Thursday", type: 0x74797065, code: 0x74687520)}
static var Tuesday: TEDSymbol {return TEDSymbol(name: "Tuesday", type: 0x74797065, code: 0x74756520)}
static var UTF16Text: TEDSymbol {return TEDSymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
static var UTF8Text: TEDSymbol {return TEDSymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
static var UnicodeText: TEDSymbol {return TEDSymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
static var Wednesday: TEDSymbol {return TEDSymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
static var alias: TEDSymbol {return TEDSymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
static var anything: TEDSymbol {return TEDSymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
static var application: TEDSymbol {return TEDSymbol(name: "application", type: 0x74797065, code: 0x63617070)}
static var applicationBundleID: TEDSymbol {return TEDSymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
static var applicationSignature: TEDSymbol {return TEDSymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
static var applicationURL: TEDSymbol {return TEDSymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
static var attachment: TEDSymbol {return TEDSymbol(name: "attachment", type: 0x74797065, code: 0x61747473)}
static var attributeRun: TEDSymbol {return TEDSymbol(name: "attributeRun", type: 0x74797065, code: 0x63617472)}
static var best: TEDSymbol {return TEDSymbol(name: "best", type: 0x74797065, code: 0x62657374)}
static var boolean: TEDSymbol {return TEDSymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
static var boundingRectangle: TEDSymbol {return TEDSymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
static var bounds: TEDSymbol {return TEDSymbol(name: "bounds", type: 0x74797065, code: 0x70626e64)}
static var centimeters: TEDSymbol {return TEDSymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
static var character: TEDSymbol {return TEDSymbol(name: "character", type: 0x74797065, code: 0x63686120)}
static var classInfo: TEDSymbol {return TEDSymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
static var class_: TEDSymbol {return TEDSymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
static var closeable: TEDSymbol {return TEDSymbol(name: "closeable", type: 0x74797065, code: 0x68636c62)}
static var collating: TEDSymbol {return TEDSymbol(name: "collating", type: 0x74797065, code: 0x6c77636c)}
static var color: TEDSymbol {return TEDSymbol(name: "color", type: 0x74797065, code: 0x636f6c72)}
static var colorTable: TEDSymbol {return TEDSymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
static var copies: TEDSymbol {return TEDSymbol(name: "copies", type: 0x74797065, code: 0x6c776370)}
static var cubicCentimeters: TEDSymbol {return TEDSymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
static var cubicFeet: TEDSymbol {return TEDSymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
static var cubicInches: TEDSymbol {return TEDSymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
static var cubicMeters: TEDSymbol {return TEDSymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
static var cubicYards: TEDSymbol {return TEDSymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
static var dashStyle: TEDSymbol {return TEDSymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
static var data: TEDSymbol {return TEDSymbol(name: "data", type: 0x74797065, code: 0x72646174)}
static var date: TEDSymbol {return TEDSymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
static var decimalStruct: TEDSymbol {return TEDSymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
static var degreesCelsius: TEDSymbol {return TEDSymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
static var degreesFahrenheit: TEDSymbol {return TEDSymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
static var degreesKelvin: TEDSymbol {return TEDSymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
static var document: TEDSymbol {return TEDSymbol(name: "document", type: 0x74797065, code: 0x646f6375)}
static var doubleInteger: TEDSymbol {return TEDSymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
static var elementInfo: TEDSymbol {return TEDSymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
static var encodedString: TEDSymbol {return TEDSymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
static var endingPage: TEDSymbol {return TEDSymbol(name: "endingPage", type: 0x74797065, code: 0x6c776c70)}
static var enumerator: TEDSymbol {return TEDSymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
static var errorHandling: TEDSymbol {return TEDSymbol(name: "errorHandling", type: 0x74797065, code: 0x6c776568)}
static var eventInfo: TEDSymbol {return TEDSymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
static var extendedFloat: TEDSymbol {return TEDSymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
static var faxNumber: TEDSymbol {return TEDSymbol(name: "faxNumber", type: 0x74797065, code: 0x6661786e)}
static var feet: TEDSymbol {return TEDSymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
static var fileName: TEDSymbol {return TEDSymbol(name: "fileName", type: 0x74797065, code: 0x6174666e)}
static var fileRef: TEDSymbol {return TEDSymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
static var fileSpecification: TEDSymbol {return TEDSymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
static var fileURL: TEDSymbol {return TEDSymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
static var fixed: TEDSymbol {return TEDSymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
static var fixedPoint: TEDSymbol {return TEDSymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
static var fixedRectangle: TEDSymbol {return TEDSymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
static var float: TEDSymbol {return TEDSymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
static var float128bit: TEDSymbol {return TEDSymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
static var floating: TEDSymbol {return TEDSymbol(name: "floating", type: 0x74797065, code: 0x6973666c)}
static var font: TEDSymbol {return TEDSymbol(name: "font", type: 0x74797065, code: 0x666f6e74)}
static var frontmost: TEDSymbol {return TEDSymbol(name: "frontmost", type: 0x74797065, code: 0x70697366)}
static var gallons: TEDSymbol {return TEDSymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
static var grams: TEDSymbol {return TEDSymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
static var graphicText: TEDSymbol {return TEDSymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
static var id: TEDSymbol {return TEDSymbol(name: "id", type: 0x74797065, code: 0x49442020)}
static var inches: TEDSymbol {return TEDSymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
static var index: TEDSymbol {return TEDSymbol(name: "index", type: 0x74797065, code: 0x70696478)}
static var integer: TEDSymbol {return TEDSymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
static var internationalText: TEDSymbol {return TEDSymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
static var internationalWritingCode: TEDSymbol {return TEDSymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
static var item: TEDSymbol {return TEDSymbol(name: "item", type: 0x74797065, code: 0x636f626a)}
static var kernelProcessID: TEDSymbol {return TEDSymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
static var kilograms: TEDSymbol {return TEDSymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
static var kilometers: TEDSymbol {return TEDSymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
static var list: TEDSymbol {return TEDSymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
static var liters: TEDSymbol {return TEDSymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
static var locationReference: TEDSymbol {return TEDSymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
static var longFixed: TEDSymbol {return TEDSymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
static var longFixedPoint: TEDSymbol {return TEDSymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
static var longFixedRectangle: TEDSymbol {return TEDSymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
static var longPoint: TEDSymbol {return TEDSymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
static var longRectangle: TEDSymbol {return TEDSymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
static var machPort: TEDSymbol {return TEDSymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
static var machine: TEDSymbol {return TEDSymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
static var machineLocation: TEDSymbol {return TEDSymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
static var meters: TEDSymbol {return TEDSymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
static var miles: TEDSymbol {return TEDSymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
static var miniaturizable: TEDSymbol {return TEDSymbol(name: "miniaturizable", type: 0x74797065, code: 0x69736d6e)}
static var miniaturized: TEDSymbol {return TEDSymbol(name: "miniaturized", type: 0x74797065, code: 0x706d6e64)}
static var missingValue: TEDSymbol {return TEDSymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
static var modal: TEDSymbol {return TEDSymbol(name: "modal", type: 0x74797065, code: 0x706d6f64)}
static var modified: TEDSymbol {return TEDSymbol(name: "modified", type: 0x74797065, code: 0x696d6f64)}
static var name: TEDSymbol {return TEDSymbol(name: "name", type: 0x74797065, code: 0x706e616d)}
static var null: TEDSymbol {return TEDSymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
static var ounces: TEDSymbol {return TEDSymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
static var pagesAcross: TEDSymbol {return TEDSymbol(name: "pagesAcross", type: 0x74797065, code: 0x6c776c61)}
static var pagesDown: TEDSymbol {return TEDSymbol(name: "pagesDown", type: 0x74797065, code: 0x6c776c64)}
static var paragraph: TEDSymbol {return TEDSymbol(name: "paragraph", type: 0x74797065, code: 0x63706172)}
static var parameterInfo: TEDSymbol {return TEDSymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
static var path: TEDSymbol {return TEDSymbol(name: "path", type: 0x74797065, code: 0x70707468)}
static var pixelMapRecord: TEDSymbol {return TEDSymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
static var point: TEDSymbol {return TEDSymbol(name: "point", type: 0x74797065, code: 0x51447074)}
static var pounds: TEDSymbol {return TEDSymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
static var printSettings: TEDSymbol {return TEDSymbol(name: "printSettings", type: 0x74797065, code: 0x70736574)}
static var processSerialNumber: TEDSymbol {return TEDSymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
static var properties: TEDSymbol {return TEDSymbol(name: "properties", type: 0x74797065, code: 0x70414c4c)}
static var property: TEDSymbol {return TEDSymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
static var propertyInfo: TEDSymbol {return TEDSymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
static var quarts: TEDSymbol {return TEDSymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
static var record: TEDSymbol {return TEDSymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
static var reference: TEDSymbol {return TEDSymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
static var requestedPrintTime: TEDSymbol {return TEDSymbol(name: "requestedPrintTime", type: 0x74797065, code: 0x6c777174)}
static var resizable: TEDSymbol {return TEDSymbol(name: "resizable", type: 0x74797065, code: 0x7072737a)}
static var rotation: TEDSymbol {return TEDSymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
static var script: TEDSymbol {return TEDSymbol(name: "script", type: 0x74797065, code: 0x73637074)}
static var shortFloat: TEDSymbol {return TEDSymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
static var shortInteger: TEDSymbol {return TEDSymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
static var size: TEDSymbol {return TEDSymbol(name: "size", type: 0x74797065, code: 0x7074737a)}
static var squareFeet: TEDSymbol {return TEDSymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
static var squareKilometers: TEDSymbol {return TEDSymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
static var squareMeters: TEDSymbol {return TEDSymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
static var squareMiles: TEDSymbol {return TEDSymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
static var squareYards: TEDSymbol {return TEDSymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
static var startingPage: TEDSymbol {return TEDSymbol(name: "startingPage", type: 0x74797065, code: 0x6c776670)}
static var string: TEDSymbol {return TEDSymbol(name: "string", type: 0x74797065, code: 0x54455854)}
static var styledClipboardText: TEDSymbol {return TEDSymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
static var styledText: TEDSymbol {return TEDSymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
static var styledUnicodeText: TEDSymbol {return TEDSymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
static var suiteInfo: TEDSymbol {return TEDSymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
static var targetPrinter: TEDSymbol {return TEDSymbol(name: "targetPrinter", type: 0x74797065, code: 0x74727072)}
static var text: TEDSymbol {return TEDSymbol(name: "text", type: 0x74797065, code: 0x63747874)}
static var textStyleInfo: TEDSymbol {return TEDSymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
static var titled: TEDSymbol {return TEDSymbol(name: "titled", type: 0x74797065, code: 0x70746974)}
static var typeClass: TEDSymbol {return TEDSymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
static var unsignedInteger: TEDSymbol {return TEDSymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
static var version_: TEDSymbol {return TEDSymbol(name: "version_", type: 0x74797065, code: 0x76657273)}
static var visible: TEDSymbol {return TEDSymbol(name: "visible", type: 0x74797065, code: 0x70766973)}
static var window: TEDSymbol {return TEDSymbol(name: "window", type: 0x74797065, code: 0x6377696e)}
static var word: TEDSymbol {return TEDSymbol(name: "word", type: 0x74797065, code: 0x63776f72)}
static var writingCode: TEDSymbol {return TEDSymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
static var yards: TEDSymbol {return TEDSymbol(name: "yards", type: 0x74797065, code: 0x79617264)}
static var zoomable: TEDSymbol {return TEDSymbol(name: "zoomable", type: 0x74797065, code: 0x69737a6d)}
static var zoomed: TEDSymbol {return TEDSymbol(name: "zoomed", type: 0x74797065, code: 0x707a756d)}

// Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
static var applicationResponses: TEDSymbol {return TEDSymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
static var ask: TEDSymbol {return TEDSymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
static var case_: TEDSymbol {return TEDSymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
static var detailed: TEDSymbol {return TEDSymbol(name: "detailed", type: 0x656e756d, code: 0x6c776474)}
static var diacriticals: TEDSymbol {return TEDSymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
static var expansion: TEDSymbol {return TEDSymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
static var hyphens: TEDSymbol {return TEDSymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
static var no: TEDSymbol {return TEDSymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
static var numericStrings: TEDSymbol {return TEDSymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
static var punctuation: TEDSymbol {return TEDSymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
static var standard: TEDSymbol {return TEDSymbol(name: "standard", type: 0x656e756d, code: 0x6c777374)}
static var whitespace: TEDSymbol {return TEDSymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
static var yes: TEDSymbol {return TEDSymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


/******************************************************************************/
// TEDSpecifier instances represent Apple event queries (aka 'specifiers'/'references')


class TEDSpecifier: SwiftAESpecifier {
        
    override var description: String { return TEDFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Raw property and element specifiers, e.g. TextEdit.elementsByFourCharCode("docu") => TextEdit.documents
    
    func propertyByCode(code: OSType) -> TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify a property")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.property(code), queryError: queryError)
    }
    func elementsByCode(code: OSType) -> TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("specify elements")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.elements(code), queryError: queryError)
    }
    func propertyByFourCharCode(code: String) -> TEDSpecifier {
        return self.propertyByCode(AEM4CC(code))
    }
    func elementsByFourCharCode(code: String) -> TEDSpecifier {
        return self.elementsByCode(AEM4CC(code))
    }
    
    // Element(s) selectors
    // important: by-index selectors use Apple event-style 1-indexing, NOT Swift-style 0-indexing

    subscript(index: AnyObject!) -> TEDSpecifier! { // by-index, by-name, by-test

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
        return TEDSpecifier(appData: aebAppData, aemQuery: newQuery, queryError: queryError)
    }
    func ID(uid: AnyObject) -> TEDSpecifier { // by-id
        let (baseQuery, queryError) = self.aemElementsSpecifer("select element with id \(uid)")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.byID(uid), queryError: queryError)
    }
    subscript(from: AnyObject!, to: AnyObject!) -> TEDSpecifier! { // by-range
        let (baseQuery, queryError) = self.aemElementsSpecifer("select elements \(from) thru \(to)")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.byRange(from, to: to), queryError: queryError)
    }

    func previous(class_: AEBSymbol) -> TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select previous element")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.previous(class_.aebCode), queryError: queryError)
    }
    func next(class_: AEBSymbol) -> TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select next element")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.next(class_.aebCode), queryError: queryError)
    }
    
    var first: TEDSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select first element")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.first(), queryError: queryError)
    }
    var middle: TEDSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select middle element")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.middle(), queryError: queryError)
    }
    var last: TEDSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select last element")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.last(), queryError: queryError)
    }
    var any: TEDSpecifier {
        let (baseQuery, queryError) = self.aemElementsSpecifer("select any element")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.any(), queryError: queryError)
    }

    var beginning: TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select beginning")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginning(), queryError: queryError)
    }
    var end: TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select end")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.end(), queryError: queryError)
    }
    var before: TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select before")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.before(), queryError: queryError)
    }
    var after: TEDSpecifier {
        let (baseQuery, queryError) = self.aemObjectSpecifer("select after")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.after(), queryError: queryError)
    }

    // Test clause constructors, e.g. TEDits.name.beginsWith("foo")
    
    func beginsWith(input: AnyObject!) -> TEDSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.beginsWith(input), queryError: queryError)
    }
    func endsWith(input: AnyObject!) -> TEDSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.endsWith(input), queryError: queryError)
    }
    func contains(input: AnyObject!) -> TEDSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.contains(input), queryError: queryError)
    }
    func isIn(input: AnyObject!) -> TEDSpecifier! {
        let (baseQuery, queryError) = self.aemObjectSpecifer("test")
        return TEDSpecifier(appData: aebAppData, aemQuery: baseQuery?.isIn(input), queryError: queryError)
    }
    
    // Properties
    
    var bounds: TEDSpecifier {return self.propertyByCode(0x70626e64)}
    var class_: TEDSpecifier {return self.propertyByCode(0x70636c73)}
    var closeable: TEDSpecifier {return self.propertyByCode(0x68636c62)}
    var collating: TEDSpecifier {return self.propertyByCode(0x6c77636c)}
    var color: TEDSpecifier {return self.propertyByCode(0x636f6c72)}
    var copies: TEDSpecifier {return self.propertyByCode(0x6c776370)}
    var document: TEDSpecifier {return self.propertyByCode(0x646f6375)}
    var endingPage: TEDSpecifier {return self.propertyByCode(0x6c776c70)}
    var errorHandling: TEDSpecifier {return self.propertyByCode(0x6c776568)}
    var faxNumber: TEDSpecifier {return self.propertyByCode(0x6661786e)}
    var fileName: TEDSpecifier {return self.propertyByCode(0x6174666e)}
    var floating: TEDSpecifier {return self.propertyByCode(0x6973666c)}
    var font: TEDSpecifier {return self.propertyByCode(0x666f6e74)}
    var frontmost: TEDSpecifier {return self.propertyByCode(0x70697366)}
    var id: TEDSpecifier {return self.propertyByCode(0x49442020)}
    var index: TEDSpecifier {return self.propertyByCode(0x70696478)}
    var miniaturizable: TEDSpecifier {return self.propertyByCode(0x69736d6e)}
    var miniaturized: TEDSpecifier {return self.propertyByCode(0x706d6e64)}
    var modal: TEDSpecifier {return self.propertyByCode(0x706d6f64)}
    var modified: TEDSpecifier {return self.propertyByCode(0x696d6f64)}
    var name: TEDSpecifier {return self.propertyByCode(0x706e616d)}
    var pagesAcross: TEDSpecifier {return self.propertyByCode(0x6c776c61)}
    var pagesDown: TEDSpecifier {return self.propertyByCode(0x6c776c64)}
    var path: TEDSpecifier {return self.propertyByCode(0x70707468)}
    var properties: TEDSpecifier {return self.propertyByCode(0x70414c4c)}
    var requestedPrintTime: TEDSpecifier {return self.propertyByCode(0x6c777174)}
    var resizable: TEDSpecifier {return self.propertyByCode(0x7072737a)}
    var size: TEDSpecifier {return self.propertyByCode(0x7074737a)}
    var startingPage: TEDSpecifier {return self.propertyByCode(0x6c776670)}
    var targetPrinter: TEDSpecifier {return self.propertyByCode(0x74727072)}
    var titled: TEDSpecifier {return self.propertyByCode(0x70746974)}
    var version_: TEDSpecifier {return self.propertyByCode(0x76657273)}
    var visible: TEDSpecifier {return self.propertyByCode(0x70766973)}
    var zoomable: TEDSpecifier {return self.propertyByCode(0x69737a6d)}
    var zoomed: TEDSpecifier {return self.propertyByCode(0x707a756d)}
    
    // Elements
    
    var applications: TEDSpecifier {return self.elementsByCode(0x63617070)}
    var attachment: TEDSpecifier {return self.elementsByCode(0x61747473)}
    var attributeRuns: TEDSpecifier {return self.elementsByCode(0x63617472)}
    var characters: TEDSpecifier {return self.elementsByCode(0x63686120)}
    var colors: TEDSpecifier {return self.elementsByCode(0x636f6c72)}
    var documents: TEDSpecifier {return self.elementsByCode(0x646f6375)}
    var items: TEDSpecifier {return self.elementsByCode(0x636f626a)}
    var paragraphs: TEDSpecifier {return self.elementsByCode(0x63706172)}
    var printSettings: TEDSpecifier {return self.elementsByCode(0x70736574)}
    var text: TEDSpecifier {return self.elementsByCode(0x63747874)}
    var windows: TEDSpecifier {return self.elementsByCode(0x6377696e)}
    var words: TEDSpecifier {return self.elementsByCode(0x63776f72)}
    
    // Commands
    
    func activate(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("activate", eventClass: 0x6d697363, eventID: 0x61637476, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func close(directParameter: AnyObject = AEBNoParameter,
            savingIn: AnyObject = AEBNoParameter,
            saving: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("close", eventClass: 0x636f7265, eventID: 0x636c6f73, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("savingIn", 0x6b66696c, savingIn),
                ("saving", 0x7361766f, saving),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func count(directParameter: AnyObject = AEBNoParameter,
            each: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("count", eventClass: 0x636f7265, eventID: 0x636e7465, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("each", 0x6b6f636c, each),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func delete(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("delete", eventClass: 0x636f7265, eventID: 0x64656c6f, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func duplicate(directParameter: AnyObject = AEBNoParameter,
            to: AnyObject = AEBNoParameter,
            withProperties: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("duplicate", eventClass: 0x636f7265, eventID: 0x636c6f6e, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("to", 0x696e7368, to),
                ("withProperties", 0x70726474, withProperties),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func exists(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("exists", eventClass: 0x636f7265, eventID: 0x646f6578, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func get(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("get", eventClass: 0x636f7265, eventID: 0x67657464, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func launch(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("launch", eventClass: 0x61736372, eventID: 0x6e6f6f70, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func make(directParameter: AnyObject = AEBNoParameter,
            withData: AnyObject = AEBNoParameter,
            at: AnyObject = AEBNoParameter,
            new: AnyObject = AEBNoParameter,
            withProperties: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("make", eventClass: 0x636f7265, eventID: 0x6372656c, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("withData", 0x64617461, withData),
                ("at", 0x696e7368, at),
                ("new", 0x6b6f636c, new),
                ("withProperties", 0x70726474, withProperties),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func move(directParameter: AnyObject = AEBNoParameter,
            to: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("move", eventClass: 0x636f7265, eventID: 0x6d6f7665, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("to", 0x696e7368, to),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func open(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("open", eventClass: 0x61657674, eventID: 0x6f646f63, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func openLocation(directParameter: AnyObject = AEBNoParameter,
            window: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("window", 0x57494e44, window),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func print(directParameter: AnyObject = AEBNoParameter,
            printDialog: AnyObject = AEBNoParameter,
            withProperties: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("print", eventClass: 0x61657674, eventID: 0x70646f63, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("printDialog", 0x70646c67, printDialog),
                ("withProperties", 0x70726474, withProperties),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func quit(directParameter: AnyObject = AEBNoParameter,
            saving: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("quit", eventClass: 0x61657674, eventID: 0x71756974, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("saving", 0x7361766f, saving),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func reopen(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("reopen", eventClass: 0x61657674, eventID: 0x72617070, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func run(directParameter: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("run", eventClass: 0x61657674, eventID: 0x6f617070, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func save(directParameter: AnyObject = AEBNoParameter,
            as_: AnyObject = AEBNoParameter,
            in_: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("save", eventClass: 0x636f7265, eventID: 0x73617665, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("as_", 0x666c7470, as_),
                ("in_", 0x6b66696c, in_),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
    func set(directParameter: AnyObject = AEBNoParameter,
            to: AnyObject = AEBNoParameter,
            returnType: AEBReturnType? = nil, waitReply: Bool? = nil, withTimeout: NSTimeInterval? = nil,
            considering: AEBConsiderIgnoreType? = nil, ignoring: AEBConsiderIgnoreType? = nil) throws -> AnyObject! {
        return try self.sendAppleEvent("set", eventClass: 0x636f7265, eventID: 0x73657464, parameters: [
                (nil, 0x2d2d2d2d, directParameter),
                ("to", 0x64617461, to),
            ], returnType: returnType, waitReply: waitReply, withTimeout: withTimeout, considering: considering, ignoring: ignoring)
    }
}


/******************************************************************************/
// TextEdit instances identify the target process(es) to which Apple events will be sent


class TextEdit: TEDSpecifier {
    private init(targetType: AEBTargetType, targetData: AnyObject?, launchOptions: NSWorkspaceLaunchOptions, relaunchMode: AEBRelaunchMode) {
        let data = SwiftAEAppData(targetType: targetType,
                                  targetData: targetData,
                               launchOptions: launchOptions,
                                relaunchMode: relaunchMode,
                              specifierClass: TEDSpecifier.self,
                                 symbolClass: TEDSymbol.self)
        super.init(appData: data, aemQuery: AEMQuery.app(), queryError: nil)
    }
    convenience init(launchOptions: NSWorkspaceLaunchOptions = .WithoutActivation, relaunchMode: AEBRelaunchMode = .Limited) { // TO DO: delete this initializer/or have it raise an error if BUNDLE_ID is unknown
        self.init(bundleIdentifier: "com.apple.TextEdit", launchOptions: launchOptions, relaunchMode: relaunchMode)
    }
    convenience init(name: NSString, launchOptions: NSWorkspaceLaunchOptions = .WithoutActivation, relaunchMode: AEBRelaunchMode = .Limited) {
        self.init(targetType: .Name, targetData: name, launchOptions: launchOptions, relaunchMode: relaunchMode)
    }
    convenience init(url: NSURL, launchOptions: NSWorkspaceLaunchOptions = .WithoutActivation, relaunchMode: AEBRelaunchMode = .Limited) {
        self.init(targetType: .URL, targetData: url, launchOptions: launchOptions, relaunchMode: relaunchMode)
    }
    convenience init(bundleIdentifier: NSString, launchOptions: NSWorkspaceLaunchOptions = .WithoutActivation, relaunchMode: AEBRelaunchMode = .Limited) {
        self.init(targetType: .BundleID, targetData: bundleIdentifier, launchOptions: launchOptions, relaunchMode: relaunchMode)
    }
    convenience init(processIdentifier: Int, launchOptions: NSWorkspaceLaunchOptions = .WithoutActivation, relaunchMode: AEBRelaunchMode = .Limited) {
        self.init(targetType: .ProcessID, targetData: processIdentifier, launchOptions: launchOptions, relaunchMode: relaunchMode)
    }
    convenience init(descriptor: NSAppleEventDescriptor, launchOptions: NSWorkspaceLaunchOptions = .WithoutActivation, relaunchMode: AEBRelaunchMode = .Limited) {
        self.init(targetType: .Descriptor, targetData: descriptor, launchOptions: launchOptions, relaunchMode: relaunchMode)
    }
    static let currentApplication = TextEdit(targetType: .Current, targetData: nil, launchOptions: .WithoutActivation, relaunchMode: .Limited)

    // Construct a TEDSpecifier using a raw AEMQuery or other custom object
    // (e.g. if app's terminology is broken or when dealing with especially cranky old apps)
    
    func customRoot(object: AnyObject!) -> TEDSpecifier {
        if object is TEDSpecifier {
            return TEDSpecifier(appData: aebAppData, aemQuery: (object as! TEDSpecifier).aemQuery, queryError: nil)
        } else if object is AEMQuery {
            return TEDSpecifier(appData: aebAppData, aemQuery: (object as! AEMQuery), queryError: nil)
        } else if object == nil {
            return TEDSpecifier(appData: aebAppData, aemQuery: AEMQuery.app(), queryError: nil)
        } else {
            return TEDSpecifier(appData: aebAppData, aemQuery: AEMQuery.customRoot(object), queryError: nil)
        }
    }
}


// test clause constructors, e.g. TEDits.name != "foo"
// note: the == operator will return a TEDSpecifier when used in elements[...] specifier; however, when
// binding its result to a variable, it must be explicitly typed as (e.g.) AnyObject or Swift will infer Bool

func == (left: TEDSpecifier!, right: AnyObject!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.equals(right), queryError: queryError)
}
func != (left: TEDSpecifier!, right: AnyObject!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.notEquals(right), queryError: queryError)
}
func < (left: TEDSpecifier!, right: AnyObject!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessThan(right), queryError: queryError)
}
func > (left: TEDSpecifier!, right: AnyObject!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterThan(right), queryError: queryError)
}
func <= (left: TEDSpecifier!, right: AnyObject!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.lessOrEquals(right), queryError: queryError)
}
func >= (left: TEDSpecifier!, right: AnyObject!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemObjectSpecifer("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.greaterOrEquals(right), queryError: queryError)
}
func && (left: TEDSpecifier!, right: TEDSpecifier!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.AND(right), queryError: queryError)
}
func || (left: TEDSpecifier!, right: TEDSpecifier!) -> TEDSpecifier! {
    let (baseQuery, queryError) = left.aemTestClause("test")
    return TEDSpecifier(appData: left.aebAppData, aemQuery: baseQuery?.OR(right), queryError: queryError)
}
prefix func ! (input: TEDSpecifier!) -> TEDSpecifier! {
    let (baseQuery, queryError) = input.aemTestClause("test")
    return TEDSpecifier(appData: input.aebAppData, aemQuery: baseQuery?.NOT(), queryError: queryError)
}


/******************************************************************************/
// TOP-LEVEL CONSTANTS

// Namespace for built-in and application-defined symbols, e.g. TED.documentFile, TED.unicodeText
let TED = TEDSymbol.self


// Generic specifier roots. These can be used to construct TEDSpecifiers for use in other
// TEDSpecifiers and TEDCommands, though only real specifiers constructed from a
// TextEdit application instance can be used to send commands to the target application.
let TEDApp = TEDSpecifier(appData: nil, aemQuery: AEMQuery.app(), queryError: nil)
let TEDCon = TEDSpecifier(appData: nil, aemQuery: AEMQuery.con(), queryError: nil)
let TEDIts = TEDSpecifier(appData: nil, aemQuery: AEMQuery.its(), queryError: nil)

