//
//  SwiftAEGlueSupport.swift
//

// TO DO: move into AppleEventBridge.framework

// TO DO: how best to support Apple event to Swift code translation? easiest might be to provide a universal translation function that takes an NSAppleEventDescriptor of any type, including typeAppleEvent, and unpacks and formats it appropriately (see JAB code for an existing AE-to-JavaScript implementation that could probably be generalized to accept any formatter class)

// note: AEBAppData uses AEMCodecs to unpack basic AE types (text, list, etc) as NSObjects; TO DO: would it be better to unpack them as native Swift types (and would Swift objects cause any issues with other NSObject-based APIs such as AEMQuery)?

import Foundation
import AppleEventBridge


/******************************************************************************/
// Formatter base class

// format numbers, strings, arrays, specifiers, etc. using literal Swift syntax
func SwiftAEFormatObject(object: AnyObject!) -> String {
    switch object {
    case let obj as [AnyObject]:
        var tmp = "["
        var useSep = false // TO DO: use map+join
        for item in obj {
            if useSep {
                tmp += ", "
            }
            tmp += SwiftAEFormatObject(item)
            useSep = true
        }
        return "[\(tmp)]"
    case let obj as NSDictionary: // TO DO: what about Swift dictionaries? (i.e. how to declare, as [protocol<Hashable>:AnyObject] doesn't work)
        var tmp = ""
        var useSep = false // TO DO: use map+join
        for (key, value) in obj {
            if (useSep) {
                tmp += ", "
            }
            tmp += "\(SwiftAEFormatObject(key)): \(SwiftAEFormatObject(value))"
            useSep = true
        }
        return "[\(tmp)]"
    case let obj as String:
        let tmp = NSMutableString(string: obj)
        tmp.replaceOccurrencesOfString("\\", withString: "\\\\", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, tmp.length))
        tmp.replaceOccurrencesOfString("\"", withString: "\\\"", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, tmp.length))
        tmp.replaceOccurrencesOfString("\r", withString: "\\r", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, tmp.length))
        tmp.replaceOccurrencesOfString("\n", withString: "\\n", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, tmp.length))
        tmp.replaceOccurrencesOfString("\t", withString: "\\t", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, tmp.length))
        return "\"\(tmp)\""
    case let obj as NSDate:
        return "NSDate(string: \(SwiftAEFormatObject(obj.description))"
    case let obj as NSURL:
        return "NSURL(string: \(SwiftAEFormatObject(obj.description))"
    default:
        return "\(object)" // note: specifiers, symbols, etc. automatically format themselves
    }
}


// used by AEBSpecifier.description to generate literal representation of itself
class SwiftAEFormatter: AEMQueryVisitor {
 
    var aebAppData: AEBAppData?
    var mutableResult: NSMutableString?
    
    // takes an AEMQuery plus AEBStaticAppData instance, and returns the query's literal ObjC representation
    class func formatObject(object: AnyObject!, appData: AEBAppData?) -> String {
        if object is AEMQuery { // instantiate a new formatter instance and pass it to AEMQuery's visitor method
            let renderer = self(appData: appData)
            object.resolveWithObject(renderer)
            if let result = renderer.mutableResult {
                return result.copy() as! String
            } else {
                return "\(renderer.app).specifierWithObject(\(object))"
            }
        } else {
            return SwiftAEFormatObject(object)
        }
    }

    // clients should avoid calling this constructor directly; use above formatObject(object:appData:) method instead
    required init(appData: AEBAppData?) {
        mutableResult = NSMutableString()
        aebAppData = appData;
    }
    
    func format(object: AnyObject) -> String {
        return object is AEMQuery ? self.dynamicType.formatObject(object, appData: aebAppData) : SwiftAEFormatObject(object)
    }
    
    // stubs; application-specific subclasses should override and extend to provide class name prefix and code->name translations,
    // returning nil if no translation found
    
    var prefix: String {return "AEB"}
    var appclassname: String {return "AEBApplication"}
    
    func propertyByCode(code: OSType) -> String? {
        return nil
    }
    func elementsByCode(code: OSType) -> String? {
        return nil
    }
    
    // the following methods are called as formatter walks AEMQuery's visitor API
    
    // property and elements specifiers; if no terminology found for given 'want' code, uses raw constructor syntax instead
    
    override func property(code: OSType) -> Self {
        if let name = self.propertyByCode(code) ?? self.elementsByCode(code) {
            mutableResult?.appendFormat(".%@", name)
        } else { // no code->name translation available
            mutableResult?.appendFormat(".propertyWithFourCharCode(\"%@\")", AEMFormatOSType(code)) // TO DO: check this formats correctly for Swift
        }
        return self;
    }
    override func elements(code: OSType) -> Self {
        if let name = self.elementsByCode(code) ?? self.propertyByCode(code) {
            mutableResult?.appendFormat(".%@", name)
        } else { // no code->name translation available
            mutableResult?.appendFormat(".elementsWithFourCharCode(\"%@\")", AEMFormatOSType(code)) // TO DO: check this formats correctly for Swift
        }
        return self;
    }
    
    // by-ordinal selectors
    
    override func first() -> Self {
        self.mutableResult?.appendString("first")
        return self
    }
    override func middle() -> Self {
        self.mutableResult?.appendString("middle")
        return self
    }
    override func last() -> Self {
        self.mutableResult?.appendString("last")
        return self
    }
    override func any() -> Self {
        self.mutableResult?.appendString("any")
        return self
    }
    
    // by-index, by-name, by-id, by-range, by-test selectors
    
    override func byIndex(index: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("[%@]", self.format(index))
        return self
    }
    override func byName(name: AnyObject!) -> Self { // TO DO
        self.mutableResult?.appendFormat("[%@]", self.format(name))
        return self
    }
    override func byID(uid: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(".ID(%@)", self.format(uid))
        return self
    }
    override func byRange(fromObject: AnyObject!, to: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("[%@, %@]", self.format(fromObject), self.format(to))
        return self;
    }
    override func byTest(testSpecifier: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("[%@]", self.format(testSpecifier))
        return self;
    }
    
    // by-relative-position selectors
    
    override func previous(class_: OSType) -> Self {
        
        let symbol = "TO DO" // TO DO: if aebAppData==nil, need to ask glue to convert OSType to XXSymbol; also needs fixed in ObjC glue (Q. is there any situation where aebAppData would be from a different glue? if not, simplest is just to use XXSymbol directly and not bother with pack/unpack)
        
 //       let symbol = try! aebAppData.unpack(NSAppleEventDescriptor(typeCode: class_))
        self.mutableResult?.appendFormat(".previous(%@)", self.format(symbol))
        return self;
    }
    override func next(class_: OSType) -> Self {
        
        let symbol = "TO DO" // DITTO

  //      let symbol = try! aebAppData.unpack(NSAppleEventDescriptor(typeCode: class_))
        self.mutableResult?.appendFormat(".next(%@)", self.format(symbol))
        return self;
    }
    
    // insertion location selectors
    
    override func beginning() -> Self {
        self.mutableResult?.appendString(".beginning")
        return self;
    }
    override func end() -> Self {
        self.mutableResult?.appendString(".end")
        return self;
    }
    override func before() -> Self {
        self.mutableResult?.appendString(".before")
        return self;
    }
    override func after() -> Self {
        self.mutableResult?.appendString(".after")
        return self;
    }

    // test clause renderers

    override func greaterThan(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(" > %@", self.format(object))
        return self;
    }
    override func greaterOrEquals(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(" >= %@", self.format(object))
        return self;
    }
    override func equals(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(" == %@", self.format(object))
        return self;
    }
    override func notEquals(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(" != %@", self.format(object))
        return self;
    }
    override func lessThan(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(" < %@", self.format(object))
        return self;
    }
    override func lessOrEquals(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(" <= %@", self.format(object))
        return self;
    }
    override func beginsWith(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(".beginsWith(%@)", self.format(object))
        return self;
    }
    override func endsWith(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(".endsWith(%@)", self.format(object))
        return self;
    }
    override func contains(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(".contains(%@)", self.format(object))
        return self;
    }
    override func isIn(object: AnyObject!) -> Self {
        self.mutableResult?.appendFormat(".isIn(%@)", self.format(object))
        return self;
    }
   override func AND(remainingOperands: AnyObject!) -> Self {
        self.mutableResult?.insertString("(", atIndex: 0)
        if remainingOperands is [AnyObject] {
            for operand in remainingOperands as! [AnyObject] {
                self.mutableResult?.appendFormat(" && %@", self.format(operand))
            }
        } else {
            self.mutableResult?.appendFormat(" && %@", self.format(remainingOperands))
        }
        self.mutableResult?.appendString(")")
        return self;
    }
    override func OR(remainingOperands: AnyObject!) -> Self {
        self.mutableResult?.insertString("(", atIndex: 0)
        if remainingOperands is [AnyObject] {
            for operand in remainingOperands as! [AnyObject] {
                self.mutableResult?.appendFormat(" || %@", self.format(operand))
            }
        } else {
            self.mutableResult?.appendFormat(" || %@", self.format(remainingOperands))
        }
        self.mutableResult?.appendString(")")
        return self;
    }
    override func NOT() -> Self {
        self.mutableResult?.insertString("!(", atIndex: 0)
        self.mutableResult?.appendString(")")
        return self;
    }

    
    
    override func app() -> Self {
        if aebAppData == nil { // generic specifier
            self.mutableResult?.appendFormat("%@.app", self.prefix)
        } else { // concrete specifier
            self.mutableResult?.appendString(self.appclassname)
            do {
                let target = try aebAppData!.targetWithError()
                let targetData = target.targetData()
                let targetType = target.targetType()
                if targetType == kAEMTargetCurrent {
                    self.mutableResult?.appendString(".currentApplication()")
                } else if targetType == kAEMTargetFileURL {
                    self.mutableResult?.appendFormat("(name:%@)", self.format((targetData as! NSURL).path!)) // TO DO: check this
                } else if targetType == kAEMTargetEppcURL {
                    self.mutableResult?.appendFormat("(url:%@)", self.format(targetData))
                } else if targetType == kAEMTargetProcessID {
                    self.mutableResult?.appendFormat("(processIdentifier:%@)", self.format(targetData))
                } else { // if targetType == kAEMTargetDescriptor {
                    self.mutableResult?.appendFormat("(descriptor:%@)", self.format(targetData))
                }
            } catch {
                self.mutableResult?.appendString("(<invalid target (error=\(error))>)")
            }
        }
        return self;
    }
    override func con() -> Self {
        self.mutableResult?.appendFormat("%@.con", self.prefix)
        return self
    }
    override func its() -> Self {
        self.mutableResult?.appendFormat("%@.its", self.prefix)
        return self
    }
    override func customRoot(rootObject: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("%@Application.customRoot(%@)", self.prefix, self.format(rootObject))
        return self
    }
    
    // Swift types
}


/******************************************************************************/
// AppData class


class SwiftAEAppData: AEBStaticAppData {
    
    
    override func pack(anObject: AnyObject!) throws -> NSAppleEventDescriptor {
        if anObject is Bool {
            return NSAppleEventDescriptor(boolean: (anObject as! Bool ? 1 : 0))
        }
        return try super.pack(anObject)
    }
    
    
    override func unpack(desc: NSAppleEventDescriptor!) throws -> AnyObject {
        switch desc.descriptorType {
        case 0x74727565: return true // TO DO: unpacking arrays turns Swift true/false to NSCFBooleans
        case 0x66616c73: return false
        case 0x626f6f6c: return desc.booleanValue != 0
        default: return try super.unpack(desc)
        }
    }
}


/******************************************************************************/
// Symbol base class

// base class for all standard and application-specific named symbols
// (note: while an enum would be idiomatic Swift, the need to map reliably between human-readable names and AE codes, and/or represent such mappings even when one or other is unavailable, may make this tricky or impractical; need to research further)

// TO DO: might be simpler for glues to subclass AEBSymbol, and define standard symbols as their own baseclass (Q. how best to generate that class? prob best done manually using glue generator, so that new types defined by Apple are permanently included in all subsequent framework releases)

class SwiftAESymbol: AEBSymbol {
    
    override var description: String {return "AEB.\(self.aebName)"}
    
    /* begin generated section */
    
    class func symbol(code: OSType) -> AEBSymbol { // used by codecs to unpack AEDescs of typeType/typeEnumerated as named symbols (note: if a four-char code doesn't have a corresponding name, an AEBSymbol instance containing the raw code only is returned)
        switch code {
        //case AEM4CC("pnam"): return self.name
        // ... TO DO: standard codes
        default: return AEBSymbol(code: code)
        }
    }
    
    /* Types and properties */
    //static let name: AEBSymbol = AEBSymbol(name: "color", type: AEM4CC("type"), code: AEM4CC("colr"))
    //class var name: SwiftAESymbol {return SwiftAESymbol(name: "color", type: AEM4CC("type"), code: AEM4CC("colr"))}
    // ...
    /* Enumerators */
    // ...
}


// shortcut for constructing standard symbols, e.g. AEB.unicodeText, AEB.list // currently unused
// let AEB = SwiftAESymbol.self



/******************************************************************************/
// Specifier base class

struct SwiftAEParameter {
    var name: String?
    var code: OSType
    var value: AnyObject!
}


class AEBNoParameter {}
let kAEBNoParameter = AEBNoParameter() // TO DO: what's easiest way to create unique symbol? (i.e. don't want to use nil to indicate omission of directParameter in commands, as that can't be distinguished from nil values returned by Cocoa APIs [e.g.] to signal a runtime error)

// command attributes

// timeout constants
let AEBNoTimeout: NSTimeInterval = -2
let AEBDefaultTimeout: NSTimeInterval = -1

typealias AEBReturnType = AnyObject // TO DO: more specific returnType
typealias AEBConsiderIgnoreType = Set<AEBSymbol>


class SwiftAESpecifier: AEBSpecifier {
    
    // TO DO: support optional completionHandler closure for async sends? (not sure how best to implement this; might be simpler to take kAEQueueReply flag and immediately return  sent event's returnID as result, leaving user to collect reply event themselves)
    
    // note: clients may call the following method directly as workaround if app's terminology is missing or incorrect
    // TO DO: add convenience raw send method that takes four-char code strings (c.f. elementsByFourCharCode)
    
    func sendAppleEvent(eventClass: OSType, eventID: OSType, parameters: Array<SwiftAEParameter>,
            returnType: AEBReturnType?, waitReply: Bool?, withTimeout: NSTimeInterval?,
            considering: AEBConsiderIgnoreType?, ignoring: AEBConsiderIgnoreType?) throws -> AnyObject! {
        let command = AEBCommand(appData: aebAppData, eventClass: eventClass, eventID: eventID, parentQuery: aemQuery)
        for param in parameters {
            if !(param.value is AEBNoParameter) {
                command.setParameter(param.value, forKeyword: param.code)
            }
        }
        // TO DO: attributes

        if let type = returnType {
            if type is [AEBSymbol] {
                command.returnListOfType(type.code())
            } else if type is AEBSymbol {
                command.returnType(type.code())
            } else {
                print("TO DO: map common Swift types to corresponding AE types, and apply those as coercions while unpacking (note: this will require enhancements to AEBCommand)")
            }
        }
        if let reply = waitReply {
            if reply {
                command.waitForReply()
            } else {
                command.ignoreReply()
            }
        }
        if let timeout = withTimeout {
            if timeout == AEBDefaultTimeout {
                command.defaultTimeout()
            } else if timeout == AEBNoTimeout {
                command.noTimeout()
            } else {
                command.timeout(timeout as NSTimeInterval)
            }
        }
        if let consider = considering {
            print("TO DO: considering: \(consider)")
        }
        if let ignore = ignoring {
            print("TO DO: ignoring: \(ignore)")
        }
        return try command.sendWithError() // TO DO: trap and rethrow with better error message
    }
    
}



