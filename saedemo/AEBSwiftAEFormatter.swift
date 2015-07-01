//
//  AEBSwiftAEFormatter.swift
//  AppleEventBridge
//

import Foundation
import AppKit
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
        for (from, to) in [("\\", "\\\\"), ("\"", "\\\""), ("\r", "\\r"), ("\n", "\\n"), ("\t", "\\t")] {
            tmp.replaceOccurrencesOfString(from, withString: to,
                options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, tmp.length))
        }
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
    class func formatObject(object: AnyObject!, appData: AEBAppData?) -> String { // TO DO: move this into SwiftAEFormatObject function above, with optional appData arg?
        if object is AEMQuery { // instantiate a new formatter instance and pass it to AEMQuery's visitor method
            let renderer = self.init(appData: appData)
            object.resolveWithObject(renderer)
            if let result = renderer.mutableResult {
                return result.copy() as! String
            } else {
                return "\(renderer.app).specifierWithObject(\(object))"
            }
        } else {
            return object == nil ? "<MALFORMED SPECIFIER>" : SwiftAEFormatObject(object) // TO DO: what we really want here is the AEBSpecifier, as that should contain error info
        }
    }
    
    // clients should avoid calling this constructor directly; use above formatObject(object:appData:) method instead
    required init(appData: AEBAppData?) {
        mutableResult = NSMutableString()
        aebAppData = appData;
    }
    
    func format(object: AnyObject) -> String {
        return object is AEMQuery ? self.dynamicType.formatObject(object, appData: aebAppData) : SwiftAEFormatObject(object) // see above
    }
    
    // stubs; application-specific subclasses should override and extend to provide class name prefix and code->name translations,
    // returning nil if no translation found
    
    var prefix: String {return "AEB"}
    var appClassName: String {return "AEBApplication"}
    
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
    override func byRange(from: AnyObject!, to: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("[%@, %@]", self.format(from), self.format(to))
        return self;
    }
    override func byTest(clause: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("[%@]", self.format(clause))
        return self;
    }
    
    // by-relative-position selectors
    
    override func previous(class_: OSType) -> Self {
        
        let symbol = "TO DO" // TO DO: if aebAppData==nil, need to ask glue to convert OSType to XXSymbol; also needs fixed in ObjC glue (Q. is there any situation where aebAppData would be from a different glue? if not, simplest is just to use XXSymbol directly and not bother with pack/unpack; i.e. glue subclasses should override this method so that they can refer directly to their XXSymbol class, or else should have a symbolForCode method that instantiates the XXSymbol class; also what about raw AEMTypes and/or AEMQuerys? will they convert to XXSymbols automatically, or is that something else that should be done in SwiftAEFormatObject function above?)
        
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
    
    // specifier roots
    
    override func app() -> Self {
        if aebAppData == nil { // generic specifier
            self.mutableResult?.appendFormat("%@app", self.prefix)
        } else { // concrete specifier
            self.mutableResult?.appendString(self.appClassName)
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
        self.mutableResult?.appendFormat("%@con", self.prefix)
        return self
    }
    override func its() -> Self {
        self.mutableResult?.appendFormat("%@its", self.prefix)
        return self
    }
    override func customRoot(rootObject: AnyObject!) -> Self {
        self.mutableResult?.appendFormat("%@.customRoot(%@)", self.appClassName, self.format(rootObject))
        return self
    }
}
