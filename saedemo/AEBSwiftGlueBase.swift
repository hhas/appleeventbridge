//
//  SwiftAEGlueSupport.swift
//

// TO DO: move into AppleEventBridge.framework

import Foundation
import AppleEventBridge


class SwiftAEFormatter: AEBStaticFormatter { // TO DO: need to implement whole new formatter specifically for Swift syntax that subclasses AEBQueryVisitor; for now, string representation currently returned by formatter is a mix of Swift and ObjC syntax, which is sufficient for testing
 
    // property and elements specifiers; if no terminology found for given 'want' code, uses raw constructor syntax instead
    
    override func property(code: OSType) -> SwiftAEFormatter! {
        if let name = self.propertyByCode(code) ?? self.elementsByCode(code) {
            mutableResult.appendFormat(".%@", name)
        } else { // no code->name translation available
            mutableResult.appendFormat(".propertyWithFourCharCode(\"%@\")", AEMFormatOSType(code)) // TO DO: check this formats correctly for Swift
        }
        return self;
    }
    override func elements(code: OSType) -> SwiftAEFormatter! {
        if let name = self.elementsByCode(code) ?? self.propertyByCode(code) {
            mutableResult.appendFormat(".%@", name)
        } else { // no code->name translation available
            mutableResult.appendFormat(".elementsWithFourCharCode(\"%@\")", AEMFormatOSType(code)) // TO DO: check this formats correctly for Swift
        }
        return self;
    }
    
    // by-ordinal selectors
    
    override func first() -> SwiftAEFormatter! {
        self.mutableResult.appendString("first")
        return self
    }
    override func middle() -> SwiftAEFormatter! {
        self.mutableResult.appendString("middle")
        return self
    }
    override func last() -> SwiftAEFormatter! {
        self.mutableResult.appendString("last")
        return self
    }
    override func any() -> SwiftAEFormatter! {
        self.mutableResult.appendString("any")
        return self
    }
    
    // by-index, by-name, by-id, by-range, by-test selectors
    
    override func byIndex(index: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat("[%@]", self.format(index))
        return self
    }
    override func byName(name: AnyObject!) -> SwiftAEFormatter! { // TO DO
        self.mutableResult.appendFormat("[%@]", self.format(name))
        return self
    }
    override func byID(uid: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(".ID(%@)", self.format(uid))
        return self
    }
    override func byRange(fromObject: AnyObject!, to: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat("[%@, %@]", self.format(fromObject), self.format(to))
        return self;
    }
    override func byTest(testSpecifier: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat("[%@]", self.format(testSpecifier))
        return self;
    }
    
    // by-relative-position selectors
    
    override func previous(class_: OSType) -> SwiftAEFormatter! {
        let symbol = try! appData.unpack(NSAppleEventDescriptor(typeCode: class_))
        self.mutableResult.appendFormat(".previous(%@)", self.format(symbol))
        return self;
    }
    override func next(class_: OSType) -> SwiftAEFormatter! {
        let symbol = try! appData.unpack(NSAppleEventDescriptor(typeCode: class_))
        self.mutableResult.appendFormat(".next(%@)", self.format(symbol))
        return self;
    }
    
    // insertion location selectors
    
    override func beginning() -> SwiftAEFormatter! {
        self.mutableResult.appendString(".beginning")
        return self;
    }
    override func end() -> SwiftAEFormatter! {
        self.mutableResult.appendString(".end")
        return self;
    }
    override func before() -> SwiftAEFormatter! {
        self.mutableResult.appendString(".before")
        return self;
    }
    override func after() -> SwiftAEFormatter! {
        self.mutableResult.appendString(".after")
        return self;
    }

    // test clause renderers

    override func greaterThan(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(" > %@", self.format(object))
        return self;
    }
    override func greaterOrEquals(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(" >= %@", self.format(object))
        return self;
    }
    override func equals(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(" == %@", self.format(object))
        return self;
    }
    override func notEquals(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(" != %@", self.format(object))
        return self;
    }
    override func lessThan(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(" < %@", self.format(object))
        return self;
    }
    override func lessOrEquals(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(" <= %@", self.format(object))
        return self;
    }
    override func beginsWith(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(".beginsWith(%@)", self.format(object))
        return self;
    }
    override func endsWith(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(".endsWith(%@)", self.format(object))
        return self;
    }
    override func contains(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(".contains(%@)", self.format(object))
        return self;
    }
    override func isIn(object: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat(".isIn(%@)", self.format(object))
        return self;
    }
   override func AND(remainingOperands: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.insertString("(", atIndex: 0)
        if remainingOperands is [AnyObject] {
            for operand in remainingOperands as! [AnyObject] {
                self.mutableResult.appendFormat(" && %@", self.format(operand))
            }
        } else {
            self.mutableResult.appendFormat(" && %@", self.format(remainingOperands))
        }
        self.mutableResult.appendString(")")
        return self;
    }
    override func OR(remainingOperands: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.insertString("(", atIndex: 0)
        if remainingOperands is [AnyObject] {
            for operand in remainingOperands as! [AnyObject] {
                self.mutableResult.appendFormat(" || %@", self.format(operand))
            }
        } else {
            self.mutableResult.appendFormat(" || %@", self.format(remainingOperands))
        }
        self.mutableResult.appendString(")")
        return self;
    }
    override func NOT() -> SwiftAEFormatter! {
        self.mutableResult.insertString("!(", atIndex: 0)
        self.mutableResult.appendString(")")
        return self;
    }

    
    
    override func app() -> SwiftAEFormatter! { // TO DO: can these return types be replaced with a protocol that returns Self? or must they always be declared explicitly in method definitions?
        if appData == nil { // generic specifier
            self.mutableResult.appendFormat("%@.app", self.prefix)
        } else { // concrete specifier
            self.mutableResult.appendFormat("%@Application", self.prefix)
            do {
                let target = try appData.targetWithError()
                let targetData = target.targetData()
                let targetType = target.targetType()
                if targetType == kAEMTargetCurrent {
                    self.mutableResult.appendString(".currentApplication()")
                } else if targetType == kAEMTargetFileURL {
                    self.mutableResult.appendFormat("(name: %@)", self.format(targetData.path))
                } else if targetType == kAEMTargetEppcURL {
                    self.mutableResult.appendFormat("(url: %@)", self.format(targetData))
                } else if targetType == kAEMTargetProcessID {
                    self.mutableResult.appendFormat("(processIdentifier: %@)", self.format(targetData))
                } else { // if targetType == kAEMTargetDescriptor {
                    self.mutableResult.appendFormat("(descriptor: %@)", self.format(targetData))
                }
            } catch {
                self.mutableResult.appendString("(<invalid target (error=\(error))>)")
            }
        }
        return self;
    }
    override func con() -> SwiftAEFormatter! {
        self.mutableResult.appendFormat("%@.con", self.prefix)
        return self
    }
    override func its() -> SwiftAEFormatter! {
        self.mutableResult.appendFormat("%@.its", self.prefix)
        return self
    }
    override func customRoot(rootObject: AnyObject!) -> SwiftAEFormatter! {
        self.mutableResult.appendFormat("%@Application.customRoot(%@)", self.prefix, self.format(rootObject))
        return self
    }
}



// base class for all standard and application-specific named symbols
// (note: while an enum would be idiomatic Swift, the need to map reliably between human-readable names and AE codes, and/or represent such mappings even when one or other is unavailable, may make this tricky or impractical; need to research further)

// TO DO: might be simpler for glues to subclass AEBSymbol, and define standard symbols as their own baseclass (Q. how best to generate that class? prob best done manually using glue generator, so that new types defined by Apple are permanently included in all subsequent framework releases)

class SwiftAESymbol: AEBSymbol {
    
    override var description: String {return "AEB.\(self.aebName)"}
    
    /* begin generated section */
    
    class func symbol(code: OSType) -> AEBSymbol { // used by codecs to unpack AEDescs of typeType/typeEnumerated as named symbols (note: if a four-char code doesn't have a corresponding name, an AEBSymbol instance containing the raw code only is returned)
        switch (code) {
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
let kAEBNoParameter = AEBNoParameter() // TO DO: what's easiest way to create unique symbol?



class SwiftAESpecifier: AEBSpecifier {
    
    // note: clients may call the following method directly as workaround if app's terminology is missing or incorrect
    // TO DO: add convenience send method that takes varargs and four-char code strings, c.f. elementsByFourCharCode?
    
    func sendAppleEvent(eventClass: OSType, eventID: OSType, parameters: Array<SwiftAEParameter>) throws -> AnyObject! {
        let command = AEBCommand(appData: aebAppData, eventClass: eventClass, eventID: eventID, parentQuery: aemQuery)
        for param in parameters {
            if !(param.value is AEBNoParameter) {
                command.setParameter(param.value, forKeyword: param.code)
            }
        }
        // TO DO: attributes
        return try command.sendWithError() // TO DO: trap and rethrow with better error message
    }
    
}



