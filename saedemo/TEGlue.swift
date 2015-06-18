//
// TEGlue.swift
// TextEdit 1.11
// AppleEventBridge.framework 0.7.0
//

import Foundation
import AppleEventBridge


class TEFormatter: SwiftAEFormatter { // used internally to generate description strings
    
    override var prefix: String {return "TE"}
    
    override func propertyByCode(code: OSType) -> String? {
        switch (code) {
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
        default: return super.propertyByCode(code) // TO DO: not sure about this; check if formatter throws across to other if not found
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
        default: return super.elementsByCode(code) // ditto
        }
    }
}


class TESymbol: SwiftAESymbol {
    
    override var description: String {return "kTE.\(self.aebName)"}
    
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
    static var April: TESymbol {return TESymbol(name: "April", type: 0x74797065, code: 0x61707220)}
    static var August: TESymbol {return TESymbol(name: "August", type: 0x74797065, code: 0x61756720)}
    static var CString: TESymbol {return TESymbol(name: "CString", type: 0x74797065, code: 0x63737472)}
    static var December: TESymbol {return TESymbol(name: "December", type: 0x74797065, code: 0x64656320)}
    static var EPSPicture: TESymbol {return TESymbol(name: "EPSPicture", type: 0x74797065, code: 0x45505320)}
    static var February: TESymbol {return TESymbol(name: "February", type: 0x74797065, code: 0x66656220)}
    static var Friday: TESymbol {return TESymbol(name: "Friday", type: 0x74797065, code: 0x66726920)}
    static var GIFPicture: TESymbol {return TESymbol(name: "GIFPicture", type: 0x74797065, code: 0x47494666)}
    static var JPEGPicture: TESymbol {return TESymbol(name: "JPEGPicture", type: 0x74797065, code: 0x4a504547)}
    static var January: TESymbol {return TESymbol(name: "January", type: 0x74797065, code: 0x6a616e20)}
    static var July: TESymbol {return TESymbol(name: "July", type: 0x74797065, code: 0x6a756c20)}
    static var June: TESymbol {return TESymbol(name: "June", type: 0x74797065, code: 0x6a756e20)}
    static var March: TESymbol {return TESymbol(name: "March", type: 0x74797065, code: 0x6d617220)}
    static var May: TESymbol {return TESymbol(name: "May", type: 0x74797065, code: 0x6d617920)}
    static var Monday: TESymbol {return TESymbol(name: "Monday", type: 0x74797065, code: 0x6d6f6e20)}
    static var November: TESymbol {return TESymbol(name: "November", type: 0x74797065, code: 0x6e6f7620)}
    static var October: TESymbol {return TESymbol(name: "October", type: 0x74797065, code: 0x6f637420)}
    static var PICTPicture: TESymbol {return TESymbol(name: "PICTPicture", type: 0x74797065, code: 0x50494354)}
    static var PascalString: TESymbol {return TESymbol(name: "PascalString", type: 0x74797065, code: 0x70737472)}
    static var RGB16Color: TESymbol {return TESymbol(name: "RGB16Color", type: 0x74797065, code: 0x74723136)}
    static var RGB96Color: TESymbol {return TESymbol(name: "RGB96Color", type: 0x74797065, code: 0x74723936)}
    static var RGBColor: TESymbol {return TESymbol(name: "RGBColor", type: 0x74797065, code: 0x63524742)}
    static var Saturday: TESymbol {return TESymbol(name: "Saturday", type: 0x74797065, code: 0x73617420)}
    static var September: TESymbol {return TESymbol(name: "September", type: 0x74797065, code: 0x73657020)}
    static var Sunday: TESymbol {return TESymbol(name: "Sunday", type: 0x74797065, code: 0x73756e20)}
    static var TIFFPicture: TESymbol {return TESymbol(name: "TIFFPicture", type: 0x74797065, code: 0x54494646)}
    static var Thursday: TESymbol {return TESymbol(name: "Thursday", type: 0x74797065, code: 0x74687520)}
    static var Tuesday: TESymbol {return TESymbol(name: "Tuesday", type: 0x74797065, code: 0x74756520)}
    static var UTF16Text: TESymbol {return TESymbol(name: "UTF16Text", type: 0x74797065, code: 0x75743136)}
    static var UTF8Text: TESymbol {return TESymbol(name: "UTF8Text", type: 0x74797065, code: 0x75746638)}
    static var UnicodeText: TESymbol {return TESymbol(name: "UnicodeText", type: 0x74797065, code: 0x75747874)}
    static var Wednesday: TESymbol {return TESymbol(name: "Wednesday", type: 0x74797065, code: 0x77656420)}
    static var alias: TESymbol {return TESymbol(name: "alias", type: 0x74797065, code: 0x616c6973)}
    static var anything: TESymbol {return TESymbol(name: "anything", type: 0x74797065, code: 0x2a2a2a2a)}
    static var application: TESymbol {return TESymbol(name: "application", type: 0x74797065, code: 0x63617070)}
    static var applicationBundleID: TESymbol {return TESymbol(name: "applicationBundleID", type: 0x74797065, code: 0x62756e64)}
    static var applicationSignature: TESymbol {return TESymbol(name: "applicationSignature", type: 0x74797065, code: 0x7369676e)}
    static var applicationURL: TESymbol {return TESymbol(name: "applicationURL", type: 0x74797065, code: 0x6170726c)}
    static var attachment: TESymbol {return TESymbol(name: "attachment", type: 0x74797065, code: 0x61747473)}
    static var attributeRun: TESymbol {return TESymbol(name: "attributeRun", type: 0x74797065, code: 0x63617472)}
    static var best: TESymbol {return TESymbol(name: "best", type: 0x74797065, code: 0x62657374)}
    static var boolean: TESymbol {return TESymbol(name: "boolean", type: 0x74797065, code: 0x626f6f6c)}
    static var boundingRectangle: TESymbol {return TESymbol(name: "boundingRectangle", type: 0x74797065, code: 0x71647274)}
    static var bounds: TESymbol {return TESymbol(name: "bounds", type: 0x74797065, code: 0x70626e64)}
    static var centimeters: TESymbol {return TESymbol(name: "centimeters", type: 0x74797065, code: 0x636d7472)}
    static var character: TESymbol {return TESymbol(name: "character", type: 0x74797065, code: 0x63686120)}
    static var classInfo: TESymbol {return TESymbol(name: "classInfo", type: 0x74797065, code: 0x67636c69)}
    static var class_: TESymbol {return TESymbol(name: "class_", type: 0x74797065, code: 0x70636c73)}
    static var closeable: TESymbol {return TESymbol(name: "closeable", type: 0x74797065, code: 0x68636c62)}
    static var collating: TESymbol {return TESymbol(name: "collating", type: 0x74797065, code: 0x6c77636c)}
    static var color: TESymbol {return TESymbol(name: "color", type: 0x74797065, code: 0x636f6c72)}
    static var colorTable: TESymbol {return TESymbol(name: "colorTable", type: 0x74797065, code: 0x636c7274)}
    static var copies: TESymbol {return TESymbol(name: "copies", type: 0x74797065, code: 0x6c776370)}
    static var cubicCentimeters: TESymbol {return TESymbol(name: "cubicCentimeters", type: 0x74797065, code: 0x63636d74)}
    static var cubicFeet: TESymbol {return TESymbol(name: "cubicFeet", type: 0x74797065, code: 0x63666574)}
    static var cubicInches: TESymbol {return TESymbol(name: "cubicInches", type: 0x74797065, code: 0x6375696e)}
    static var cubicMeters: TESymbol {return TESymbol(name: "cubicMeters", type: 0x74797065, code: 0x636d6574)}
    static var cubicYards: TESymbol {return TESymbol(name: "cubicYards", type: 0x74797065, code: 0x63797264)}
    static var dashStyle: TESymbol {return TESymbol(name: "dashStyle", type: 0x74797065, code: 0x74646173)}
    static var data: TESymbol {return TESymbol(name: "data", type: 0x74797065, code: 0x72646174)}
    static var date: TESymbol {return TESymbol(name: "date", type: 0x74797065, code: 0x6c647420)}
    static var decimalStruct: TESymbol {return TESymbol(name: "decimalStruct", type: 0x74797065, code: 0x6465636d)}
    static var degreesCelsius: TESymbol {return TESymbol(name: "degreesCelsius", type: 0x74797065, code: 0x64656763)}
    static var degreesFahrenheit: TESymbol {return TESymbol(name: "degreesFahrenheit", type: 0x74797065, code: 0x64656766)}
    static var degreesKelvin: TESymbol {return TESymbol(name: "degreesKelvin", type: 0x74797065, code: 0x6465676b)}
    static var document: TESymbol {return TESymbol(name: "document", type: 0x74797065, code: 0x646f6375)}
    static var doubleInteger: TESymbol {return TESymbol(name: "doubleInteger", type: 0x74797065, code: 0x636f6d70)}
    static var elementInfo: TESymbol {return TESymbol(name: "elementInfo", type: 0x74797065, code: 0x656c696e)}
    static var encodedString: TESymbol {return TESymbol(name: "encodedString", type: 0x74797065, code: 0x656e6373)}
    static var endingPage: TESymbol {return TESymbol(name: "endingPage", type: 0x74797065, code: 0x6c776c70)}
    static var enumerator: TESymbol {return TESymbol(name: "enumerator", type: 0x74797065, code: 0x656e756d)}
    static var errorHandling: TESymbol {return TESymbol(name: "errorHandling", type: 0x74797065, code: 0x6c776568)}
    static var eventInfo: TESymbol {return TESymbol(name: "eventInfo", type: 0x74797065, code: 0x6576696e)}
    static var extendedFloat: TESymbol {return TESymbol(name: "extendedFloat", type: 0x74797065, code: 0x65787465)}
    static var faxNumber: TESymbol {return TESymbol(name: "faxNumber", type: 0x74797065, code: 0x6661786e)}
    static var feet: TESymbol {return TESymbol(name: "feet", type: 0x74797065, code: 0x66656574)}
    static var fileName: TESymbol {return TESymbol(name: "fileName", type: 0x74797065, code: 0x6174666e)}
    static var fileRef: TESymbol {return TESymbol(name: "fileRef", type: 0x74797065, code: 0x66737266)}
    static var fileSpecification: TESymbol {return TESymbol(name: "fileSpecification", type: 0x74797065, code: 0x66737320)}
    static var fileURL: TESymbol {return TESymbol(name: "fileURL", type: 0x74797065, code: 0x6675726c)}
    static var fixed: TESymbol {return TESymbol(name: "fixed", type: 0x74797065, code: 0x66697864)}
    static var fixedPoint: TESymbol {return TESymbol(name: "fixedPoint", type: 0x74797065, code: 0x66706e74)}
    static var fixedRectangle: TESymbol {return TESymbol(name: "fixedRectangle", type: 0x74797065, code: 0x66726374)}
    static var float: TESymbol {return TESymbol(name: "float", type: 0x74797065, code: 0x646f7562)}
    static var float128bit: TESymbol {return TESymbol(name: "float128bit", type: 0x74797065, code: 0x6c64626c)}
    static var floating: TESymbol {return TESymbol(name: "floating", type: 0x74797065, code: 0x6973666c)}
    static var font: TESymbol {return TESymbol(name: "font", type: 0x74797065, code: 0x666f6e74)}
    static var frontmost: TESymbol {return TESymbol(name: "frontmost", type: 0x74797065, code: 0x70697366)}
    static var gallons: TESymbol {return TESymbol(name: "gallons", type: 0x74797065, code: 0x67616c6e)}
    static var grams: TESymbol {return TESymbol(name: "grams", type: 0x74797065, code: 0x6772616d)}
    static var graphicText: TESymbol {return TESymbol(name: "graphicText", type: 0x74797065, code: 0x63677478)}
    static var id: TESymbol {return TESymbol(name: "id", type: 0x74797065, code: 0x49442020)}
    static var inches: TESymbol {return TESymbol(name: "inches", type: 0x74797065, code: 0x696e6368)}
    static var index: TESymbol {return TESymbol(name: "index", type: 0x74797065, code: 0x70696478)}
    static var integer: TESymbol {return TESymbol(name: "integer", type: 0x74797065, code: 0x6c6f6e67)}
    static var internationalText: TESymbol {return TESymbol(name: "internationalText", type: 0x74797065, code: 0x69747874)}
    static var internationalWritingCode: TESymbol {return TESymbol(name: "internationalWritingCode", type: 0x74797065, code: 0x696e746c)}
    static var item: TESymbol {return TESymbol(name: "item", type: 0x74797065, code: 0x636f626a)}
    static var kernelProcessID: TESymbol {return TESymbol(name: "kernelProcessID", type: 0x74797065, code: 0x6b706964)}
    static var kilograms: TESymbol {return TESymbol(name: "kilograms", type: 0x74797065, code: 0x6b67726d)}
    static var kilometers: TESymbol {return TESymbol(name: "kilometers", type: 0x74797065, code: 0x6b6d7472)}
    static var list: TESymbol {return TESymbol(name: "list", type: 0x74797065, code: 0x6c697374)}
    static var liters: TESymbol {return TESymbol(name: "liters", type: 0x74797065, code: 0x6c697472)}
    static var locationReference: TESymbol {return TESymbol(name: "locationReference", type: 0x74797065, code: 0x696e736c)}
    static var longFixed: TESymbol {return TESymbol(name: "longFixed", type: 0x74797065, code: 0x6c667864)}
    static var longFixedPoint: TESymbol {return TESymbol(name: "longFixedPoint", type: 0x74797065, code: 0x6c667074)}
    static var longFixedRectangle: TESymbol {return TESymbol(name: "longFixedRectangle", type: 0x74797065, code: 0x6c667263)}
    static var longPoint: TESymbol {return TESymbol(name: "longPoint", type: 0x74797065, code: 0x6c706e74)}
    static var longRectangle: TESymbol {return TESymbol(name: "longRectangle", type: 0x74797065, code: 0x6c726374)}
    static var machPort: TESymbol {return TESymbol(name: "machPort", type: 0x74797065, code: 0x706f7274)}
    static var machine: TESymbol {return TESymbol(name: "machine", type: 0x74797065, code: 0x6d616368)}
    static var machineLocation: TESymbol {return TESymbol(name: "machineLocation", type: 0x74797065, code: 0x6d4c6f63)}
    static var meters: TESymbol {return TESymbol(name: "meters", type: 0x74797065, code: 0x6d657472)}
    static var miles: TESymbol {return TESymbol(name: "miles", type: 0x74797065, code: 0x6d696c65)}
    static var miniaturizable: TESymbol {return TESymbol(name: "miniaturizable", type: 0x74797065, code: 0x69736d6e)}
    static var miniaturized: TESymbol {return TESymbol(name: "miniaturized", type: 0x74797065, code: 0x706d6e64)}
    static var missingValue: TESymbol {return TESymbol(name: "missingValue", type: 0x74797065, code: 0x6d736e67)}
    static var modal: TESymbol {return TESymbol(name: "modal", type: 0x74797065, code: 0x706d6f64)}
    static var modified: TESymbol {return TESymbol(name: "modified", type: 0x74797065, code: 0x696d6f64)}
    static var name: TESymbol {return TESymbol(name: "name", type: 0x74797065, code: 0x706e616d)}
    static var null: TESymbol {return TESymbol(name: "null", type: 0x74797065, code: 0x6e756c6c)}
    static var ounces: TESymbol {return TESymbol(name: "ounces", type: 0x74797065, code: 0x6f7a7320)}
    static var pagesAcross: TESymbol {return TESymbol(name: "pagesAcross", type: 0x74797065, code: 0x6c776c61)}
    static var pagesDown: TESymbol {return TESymbol(name: "pagesDown", type: 0x74797065, code: 0x6c776c64)}
    static var paragraph: TESymbol {return TESymbol(name: "paragraph", type: 0x74797065, code: 0x63706172)}
    static var parameterInfo: TESymbol {return TESymbol(name: "parameterInfo", type: 0x74797065, code: 0x706d696e)}
    static var path: TESymbol {return TESymbol(name: "path", type: 0x74797065, code: 0x70707468)}
    static var pixelMapRecord: TESymbol {return TESymbol(name: "pixelMapRecord", type: 0x74797065, code: 0x74706d6d)}
    static var point: TESymbol {return TESymbol(name: "point", type: 0x74797065, code: 0x51447074)}
    static var pounds: TESymbol {return TESymbol(name: "pounds", type: 0x74797065, code: 0x6c627320)}
    static var printSettings: TESymbol {return TESymbol(name: "printSettings", type: 0x74797065, code: 0x70736574)}
    static var processSerialNumber: TESymbol {return TESymbol(name: "processSerialNumber", type: 0x74797065, code: 0x70736e20)}
    static var properties: TESymbol {return TESymbol(name: "properties", type: 0x74797065, code: 0x70414c4c)}
    static var property: TESymbol {return TESymbol(name: "property", type: 0x74797065, code: 0x70726f70)}
    static var propertyInfo: TESymbol {return TESymbol(name: "propertyInfo", type: 0x74797065, code: 0x70696e66)}
    static var quarts: TESymbol {return TESymbol(name: "quarts", type: 0x74797065, code: 0x71727473)}
    static var record: TESymbol {return TESymbol(name: "record", type: 0x74797065, code: 0x7265636f)}
    static var reference: TESymbol {return TESymbol(name: "reference", type: 0x74797065, code: 0x6f626a20)}
    static var requestedPrintTime: TESymbol {return TESymbol(name: "requestedPrintTime", type: 0x74797065, code: 0x6c777174)}
    static var resizable: TESymbol {return TESymbol(name: "resizable", type: 0x74797065, code: 0x7072737a)}
    static var rotation: TESymbol {return TESymbol(name: "rotation", type: 0x74797065, code: 0x74726f74)}
    static var script: TESymbol {return TESymbol(name: "script", type: 0x74797065, code: 0x73637074)}
    static var shortFloat: TESymbol {return TESymbol(name: "shortFloat", type: 0x74797065, code: 0x73696e67)}
    static var shortInteger: TESymbol {return TESymbol(name: "shortInteger", type: 0x74797065, code: 0x73686f72)}
    static var size: TESymbol {return TESymbol(name: "size", type: 0x74797065, code: 0x7074737a)}
    static var squareFeet: TESymbol {return TESymbol(name: "squareFeet", type: 0x74797065, code: 0x73716674)}
    static var squareKilometers: TESymbol {return TESymbol(name: "squareKilometers", type: 0x74797065, code: 0x73716b6d)}
    static var squareMeters: TESymbol {return TESymbol(name: "squareMeters", type: 0x74797065, code: 0x7371726d)}
    static var squareMiles: TESymbol {return TESymbol(name: "squareMiles", type: 0x74797065, code: 0x73716d69)}
    static var squareYards: TESymbol {return TESymbol(name: "squareYards", type: 0x74797065, code: 0x73717964)}
    static var startingPage: TESymbol {return TESymbol(name: "startingPage", type: 0x74797065, code: 0x6c776670)}
    static var string: TESymbol {return TESymbol(name: "string", type: 0x74797065, code: 0x54455854)}
    static var styledClipboardText: TESymbol {return TESymbol(name: "styledClipboardText", type: 0x74797065, code: 0x7374796c)}
    static var styledText: TESymbol {return TESymbol(name: "styledText", type: 0x74797065, code: 0x53545854)}
    static var styledUnicodeText: TESymbol {return TESymbol(name: "styledUnicodeText", type: 0x74797065, code: 0x73757478)}
    static var suiteInfo: TESymbol {return TESymbol(name: "suiteInfo", type: 0x74797065, code: 0x7375696e)}
    static var targetPrinter: TESymbol {return TESymbol(name: "targetPrinter", type: 0x74797065, code: 0x74727072)}
    static var text: TESymbol {return TESymbol(name: "text", type: 0x74797065, code: 0x63747874)}
    static var textStyleInfo: TESymbol {return TESymbol(name: "textStyleInfo", type: 0x74797065, code: 0x74737479)}
    static var titled: TESymbol {return TESymbol(name: "titled", type: 0x74797065, code: 0x70746974)}
    static var typeClass: TESymbol {return TESymbol(name: "typeClass", type: 0x74797065, code: 0x74797065)}
    static var unsignedInteger: TESymbol {return TESymbol(name: "unsignedInteger", type: 0x74797065, code: 0x6d61676e)}
    static var version_: TESymbol {return TESymbol(name: "version_", type: 0x74797065, code: 0x76657273)}
    static var visible: TESymbol {return TESymbol(name: "visible", type: 0x74797065, code: 0x70766973)}
    static var window: TESymbol {return TESymbol(name: "window", type: 0x74797065, code: 0x6377696e)}
    static var word: TESymbol {return TESymbol(name: "word", type: 0x74797065, code: 0x63776f72)}
    static var writingCode: TESymbol {return TESymbol(name: "writingCode", type: 0x74797065, code: 0x70736374)}
    static var yards: TESymbol {return TESymbol(name: "yards", type: 0x74797065, code: 0x79617264)}
    static var zoomable: TESymbol {return TESymbol(name: "zoomable", type: 0x74797065, code: 0x69737a6d)}
    static var zoomed: TESymbol {return TESymbol(name: "zoomed", type: 0x74797065, code: 0x707a756d)}
    
    // Enumerators    // TO DO: add 'override' if var is already defined in AEBSymbol
    static var applicationResponses: TESymbol {return TESymbol(name: "applicationResponses", type: 0x656e756d, code: 0x726d7465)}
    static var ask: TESymbol {return TESymbol(name: "ask", type: 0x656e756d, code: 0x61736b20)}
    static var case_: TESymbol {return TESymbol(name: "case_", type: 0x656e756d, code: 0x63617365)}
    static var detailed: TESymbol {return TESymbol(name: "detailed", type: 0x656e756d, code: 0x6c776474)}
    static var diacriticals: TESymbol {return TESymbol(name: "diacriticals", type: 0x656e756d, code: 0x64696163)}
    static var expansion: TESymbol {return TESymbol(name: "expansion", type: 0x656e756d, code: 0x65787061)}
    static var hyphens: TESymbol {return TESymbol(name: "hyphens", type: 0x656e756d, code: 0x68797068)}
    static var no: TESymbol {return TESymbol(name: "no", type: 0x656e756d, code: 0x6e6f2020)}
    static var numericStrings: TESymbol {return TESymbol(name: "numericStrings", type: 0x656e756d, code: 0x6e756d65)}
    static var punctuation: TESymbol {return TESymbol(name: "punctuation", type: 0x656e756d, code: 0x70756e63)}
    static var standard: TESymbol {return TESymbol(name: "standard", type: 0x656e756d, code: 0x6c777374)}
    static var whitespace: TESymbol {return TESymbol(name: "whitespace", type: 0x656e756d, code: 0x77686974)}
    static var yes: TESymbol {return TESymbol(name: "yes", type: 0x656e756d, code: 0x79657320)}
}


class TESpecifier: SwiftAESpecifier {
        
    override var description: String { return TEFormatter.formatObject(aemQuery, appData: aebAppData) }
    
    // Element(s) selectors
    // important: by-index selectors use Apple event-style 1-indexing, NOT Swift-style 0-indexing
    
    // by-index, by-name, by-range, by-test
    
    subscript(index: AnyObject!) -> TESpecifier! {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        switch (index) {
        case is String:
            return TESpecifier(appData: aebAppData, aemQuery:  baseQuery.byName(index))
        case is TESpecifier:
            let testClause = (index is AEBSpecifier ? (index as! AEBSpecifier).aemQuery : aemQuery) as! AEMTestClause
            return TESpecifier(appData: aebAppData, aemQuery: baseQuery.byTest(testClause))
        default:
            return TESpecifier(appData: aebAppData, aemQuery: baseQuery.byIndex(index))
        }
    }
    
    subscript(from: AnyObject!, to: AnyObject!) -> TESpecifier! {
        let newQuery = (self.aemQuery as! AEMMultipleElementsSpecifier).byRange(from, to: to)
        return TESpecifier(appData: aebAppData, aemQuery: newQuery)
    }
    
    // by-id
    
    func ID(uid: AnyObject) -> TESpecifier {
        let baseQuery = self.aemQuery as! AEMMultipleElementsSpecifier
        return TESpecifier(appData: aebAppData, aemQuery: baseQuery.byID(uid))
    }
    
    // ordinal
    
    var first:  TESpecifier {return TESpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).first())}
    var middle: TESpecifier {return TESpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).middle())}
    var last:   TESpecifier {return TESpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).last())}
    var any:    TESpecifier {return TESpecifier(appData: aebAppData, aemQuery: (self.aemQuery as! AEMMultipleElementsSpecifier).any())}
    
    // TO DO: implement other selectors: before, after, beginning, end, previous(symbol), next(symbol)
    
    // Property and element specifiers
    
    func propertyByCode(code: OSType) -> TESpecifier {
        return TESpecifier(appData: aebAppData, aemQuery: (aemQuery as! AEMObjectSpecifier).property(code))
    }
    func elementsByCode(code: OSType) -> TESpecifier {
        return TESpecifier(appData: aebAppData, aemQuery: (aemQuery as! AEMObjectSpecifier).elements(code))
    }
    func propertyByFourCharCode(code: String) -> TESpecifier {
        return self.propertyByCode(AEM4CC(code))
    }
    func elementsByFourCharCode(code: String) -> TESpecifier {
        return self.elementsByCode(AEM4CC(code))
    }
    
    // Properties
    
    var bounds: TESpecifier {return self.propertyByCode(0x70626e64)}
    var class_: TESpecifier {return self.propertyByCode(0x70636c73)}
    var closeable: TESpecifier {return self.propertyByCode(0x68636c62)}
    var collating: TESpecifier {return self.propertyByCode(0x6c77636c)}
    var color: TESpecifier {return self.propertyByCode(0x636f6c72)}
    var copies: TESpecifier {return self.propertyByCode(0x6c776370)}
    var document: TESpecifier {return self.propertyByCode(0x646f6375)}
    var endingPage: TESpecifier {return self.propertyByCode(0x6c776c70)}
    var errorHandling: TESpecifier {return self.propertyByCode(0x6c776568)}
    var faxNumber: TESpecifier {return self.propertyByCode(0x6661786e)}
    var fileName: TESpecifier {return self.propertyByCode(0x6174666e)}
    var floating: TESpecifier {return self.propertyByCode(0x6973666c)}
    var font: TESpecifier {return self.propertyByCode(0x666f6e74)}
    var frontmost: TESpecifier {return self.propertyByCode(0x70697366)}
    var id: TESpecifier {return self.propertyByCode(0x49442020)}
    var index: TESpecifier {return self.propertyByCode(0x70696478)}
    var miniaturizable: TESpecifier {return self.propertyByCode(0x69736d6e)}
    var miniaturized: TESpecifier {return self.propertyByCode(0x706d6e64)}
    var modal: TESpecifier {return self.propertyByCode(0x706d6f64)}
    var modified: TESpecifier {return self.propertyByCode(0x696d6f64)}
    var name: TESpecifier {return self.propertyByCode(0x706e616d)}
    var pagesAcross: TESpecifier {return self.propertyByCode(0x6c776c61)}
    var pagesDown: TESpecifier {return self.propertyByCode(0x6c776c64)}
    var path: TESpecifier {return self.propertyByCode(0x70707468)}
    var properties: TESpecifier {return self.propertyByCode(0x70414c4c)}
    var requestedPrintTime: TESpecifier {return self.propertyByCode(0x6c777174)}
    var resizable: TESpecifier {return self.propertyByCode(0x7072737a)}
    var size: TESpecifier {return self.propertyByCode(0x7074737a)}
    var startingPage: TESpecifier {return self.propertyByCode(0x6c776670)}
    var targetPrinter: TESpecifier {return self.propertyByCode(0x74727072)}
    var titled: TESpecifier {return self.propertyByCode(0x70746974)}
    var version_: TESpecifier {return self.propertyByCode(0x76657273)}
    var visible: TESpecifier {return self.propertyByCode(0x70766973)}
    var zoomable: TESpecifier {return self.propertyByCode(0x69737a6d)}
    var zoomed: TESpecifier {return self.propertyByCode(0x707a756d)}
    
    // Elements
    
    var applications: TESpecifier {return self.elementsByCode(0x63617070)}
    var attachment: TESpecifier {return self.elementsByCode(0x61747473)}
    var attributeRuns: TESpecifier {return self.elementsByCode(0x63617472)}
    var characters: TESpecifier {return self.elementsByCode(0x63686120)}
    var colors: TESpecifier {return self.elementsByCode(0x636f6c72)}
    var documents: TESpecifier {return self.elementsByCode(0x646f6375)}
    var items: TESpecifier {return self.elementsByCode(0x636f626a)}
    var paragraphs: TESpecifier {return self.elementsByCode(0x63706172)}
    var printSettings: TESpecifier {return self.elementsByCode(0x70736574)}
    var text: TESpecifier {return self.elementsByCode(0x63747874)}
    var windows: TESpecifier {return self.elementsByCode(0x6377696e)}
    var words: TESpecifier {return self.elementsByCode(0x63776f72)}
    
    // Commands
    
    func activate(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x6d697363, eventID: 0x61637476, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func close(directParameter: AnyObject = kAEBNoParameter,
            savingIn: AnyObject = kAEBNoParameter,
            saving: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f73, parameters: [
            SwiftAEParameter(name: "savingIn", code: 0x6b66696c, value: savingIn),
            SwiftAEParameter(name: "saving", code: 0x7361766f, value: saving),
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
    func duplicate(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x636c6f6e, parameters: [
            SwiftAEParameter(name: "to", code: 0x696e7368, value: to),
            SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func exists(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x646f6578, parameters: [
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
            withData: AnyObject = kAEBNoParameter,
            at: AnyObject = kAEBNoParameter,
            new_: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x6372656c, parameters: [
            SwiftAEParameter(name: "withData", code: 0x64617461, value: withData),
            SwiftAEParameter(name: "at", code: 0x696e7368, value: at),
            SwiftAEParameter(name: "new_", code: 0x6b6f636c, value: new_),
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
    func open(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f646f63, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func openLocation(directParameter: AnyObject = kAEBNoParameter,
            window: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x4755524c, eventID: 0x4755524c, parameters: [
            SwiftAEParameter(name: "window", code: 0x57494e44, value: window),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func print(directParameter: AnyObject = kAEBNoParameter,
            printDialog: AnyObject = kAEBNoParameter,
            withProperties: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x70646f63, parameters: [
            SwiftAEParameter(name: "printDialog", code: 0x70646c67, value: printDialog),
            SwiftAEParameter(name: "withProperties", code: 0x70726474, value: withProperties),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func quit(directParameter: AnyObject = kAEBNoParameter,
            saving: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x71756974, parameters: [
            SwiftAEParameter(name: "saving", code: 0x7361766f, value: saving),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func reopen(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x72617070, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func run(directParameter: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x61657674, eventID: 0x6f617070, parameters: [
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func save(directParameter: AnyObject = kAEBNoParameter,
            as_: AnyObject = kAEBNoParameter,
            in_: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x73617665, parameters: [
            SwiftAEParameter(name: "as_", code: 0x666c7470, value: as_),
            SwiftAEParameter(name: "in_", code: 0x6b66696c, value: in_),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
    func set(directParameter: AnyObject = kAEBNoParameter,
            to: AnyObject = kAEBNoParameter,
            eventAttributes: AnyObject? = nil) throws -> AnyObject {
        return try self.sendAppleEvent(0x636f7265, eventID: 0x73657464, parameters: [
            SwiftAEParameter(name: "to", code: 0x64617461, value: to),
            SwiftAEParameter(name: nil, code: 0x2d2d2d2d, value: directParameter)])
    }
}


class TEApplication: TESpecifier {
    private init(targetType: AEBTargetType, targetData: AnyObject?) {
        let data = AppleEventBridge.AEBStaticAppData(applicationClass: AEMApplication.self,
                                                          symbolClass: TESymbol.self,
                                                       specifierClass: TESpecifier.self,
                                                           targetType: targetType,
                                                           targetData: targetData)
        super.init(appData: data, aemQuery: AppleEventBridge.AEMQuery.app())
    }
    override convenience init() {
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
    class func currentApplication() -> TEApplication {
        return self.init(targetType: kAEBTargetCurrent, targetData: nil)
    }
    
    // Construct a TESpecifier using a raw AEMQuery or other custom object
    // (e.g. if app's terminology is broken or when dealing with especially cranky old apps)
    
    func customRoot(object: AnyObject!) -> TESpecifier {
        if object is TESpecifier {
            return TESpecifier(appData: aebAppData, aemQuery: (object as! TESpecifier).aemQuery)
        } else if object is AppleEventBridge.AEMQuery {
            return TESpecifier(appData: aebAppData, aemQuery: object as! AppleEventBridge.AEMQuery)
        } else if object == nil {
            return TESpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.app())
        } else {
            return TESpecifier(appData: aebAppData, aemQuery: AppleEventBridge.AEMQuery.customRoot(object))
        }
    }
}


// Generic specifier roots. These can be used to construct TESpecifiers for use in other TESpecifiers and TECommands,
// though only real specifiers constructed from a TEApplication can be used to send commands to the target application.

let TEApp = TESpecifier(appData: nil, aemQuery: AEMQuery.app())
let TECon = TESpecifier(appData: nil, aemQuery: AEMQuery.con())
let TEIts = TESpecifier(appData: nil, aemQuery: AEMQuery.its())

// Symbol namespace

let kTE = TESymbol.self

// Convenience constructor for application objects.

var TextEdit: TEApplication {return TEApplication()}

