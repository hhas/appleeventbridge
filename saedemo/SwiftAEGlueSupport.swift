//
//  SwiftAEGlueSupport.swift
//

// TO DO: native boolean packing/unpacking

import Foundation
import AppleEventBridge

// TO DO: currently built-in terms aren't predefined here, but are included in glue each time; not sure if this is best approach (though is prob. simplest)

// TO DO: best to stick with classname prefixes, as they'll make it easier to troubleshoot (since, unlike dynamic bridges, the glue and the target process are independent of each other so it is possible to use glue A with app B and vice-versa)

// TO DO: if user constructs a malformed SwiftAESpecifier - e.g. te.documents[1][2] - it should still be usable in commands (i.e. swift specifier constructors should never return nil or throw errors themselves); the only difference is that it'll contain an AEMQueryError instead of an AEMQuery, and the command will throw that along with any other errors that occur during packing (e.g. if user passes an unsupported type as a command param or a specifier selector)

// TO DO: how does Swift<->ObjC bridge true/false?

// TO DO: use objc-style class name prefixes or rely on Swift namespacing to disambiguate?
// TO DO: use hex codes, with human-readable FCC as comment? or use generated raw code enums from rawcodes file?
// TO DO: move SwiftAEGlueSupport to framework and import here
// TO DO: glue generator should use ints
// TO DO: how best to support event attributes? how best to specify how reply descs should be unpacked? (TO DO: is it possible/practical to specify return type as a Swift type, e.g. Array<String>, and introspect that to determine what coercions to apply when unpacking descs?)



class SwiftAEFormatter: AEBStaticFormatter { // TO DO: need to implement whole new formatter specifically for Swift syntax that subclasses AEBQueryVisitor; for now, string representation currently returned by formatter is a mix of Swift and ObjC syntax, which is sufficient for testing
    
    // if no terminology found for given 'want' code, use 'raw AE code' constructor syntax instead
    override func property(code: OSType) -> Self {
        let name = self.propertyByCode(code) ?? self.elementsByCode(code)
        if (name != nil) {
            mutableResult.appendFormat(".%@", name!)
        } else { // no code->name translation available
            mutableResult.appendFormat(".propertyWithFourCharCode(\"%@\")", AEMFormatOSType(code)) // TO DO: check this formats correctly for Swift
        }
        return self;
    }
    override func elements(code: OSType) -> Self {
        let name = self.elementsByCode(code) ?? self.propertyByCode(code)
        if (name != nil) {
            mutableResult.appendFormat(".%@", name!)
        } else { // no code->name translation available
            mutableResult.appendFormat(".elementsWithFourCharCode(\"%@\")", AEMFormatOSType(code)) // TO DO: check this formats correctly for Swift
        }
        return self;
    }
    
    // by-index, by-name, by-id selectors
    override func byIndex(index: AnyObject!) -> SwiftAEFormatter {
        self.mutableResult.appendFormat("[%@]", self.format(index))
        return self
    }
    override func byName(name: AnyObject!) -> SwiftAEFormatter {
        self.mutableResult.appendFormat("[%@]", self.format(name))
        return self
    }
    override func byID(uid: AnyObject!) -> SwiftAEFormatter {
        self.mutableResult.appendFormat(".ID(%@)", self.format(uid))
        return self
    }
    
    // TO DO: finish
    
    override func app() -> SwiftAEFormatter { // TO DO: can these return types be replaced with a protocol that returns Self? or must they always be declared explicitly in method definitions?
        if appData == nil { // generic specifier
            self.mutableResult.appendFormat("%@App", self.prefix)
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
    
    override func con() -> SwiftAEFormatter {
        self.mutableResult.appendFormat("%@Con", self.prefix)
        return self
    }
    
    override func its() -> SwiftAEFormatter {
        self.mutableResult.appendFormat("%@Its", self.prefix)
        return self
    }
    
    override func customRoot(rootObject: AnyObject) -> SwiftAEFormatter {
        self.mutableResult.appendFormat("%@Application.customRoot(%@)", self.prefix, self.format(rootObject))
        return self
    }
}



// base class for all standard and application-specific named symbols
// (note: while an enum would be idiomatic Swift, the need to map reliably between human-readable names and AE codes, and/or represent such mappings even when one or other is unavailable, may make this tricky or impractical; need to research further)


class SwiftAESymbol: AEBSymbol {
    
    override var description: String {return "kAEB.\(self.aebName)"}
    
    /* begin generated section */
    
    class func symbol(code: OSType) -> AEBSymbol { // used by codecs to unpack AEDescs of typeType/typeEnumerated as named symbols (note: if a four-char code doesn't have a corresponding name, an AEBSymbol instance containing the raw code only is returned)
        switch (code) {
        //case AEM4CC("pnam"): return self.name
        // ... TO DO: standard codes
        default: return AEBSymbol(code: code)
        }
    }
    
    /* Enumerators */
    
    // ...
    
    /* Types and properties */
   // static let name: AEBSymbol = AEBSymbol(name: "color", type: AEM4CC("type"), code: AEM4CC("colr"))
    
    //class var name: SwiftAESymbol {return SwiftAESymbol(name: "color", type: AEM4CC("type"), code: AEM4CC("colr"))}
    
    // ...
}


// shortcut for constructing standard symbols, e.g. kAEB.unicodeText, kAEB.list
let kAEB = SwiftAESymbol.self



// TO DO: check if operator overloading is practical for constructing test clauses; logic clauses might want to use their own AEBSpecifier subclass

struct SwiftAEParameter {
    var name: String?
    var code: OSType
    var value: AnyObject!
}

class AEBNoParameter {}
let kAEBNoParameter = AEBNoParameter() // TO DO: what's easiest way to create unique symbol?



class SwiftAESpecifier: AEBSpecifier {
    
    // note: clients may call the following method directly as workaround if app's terminology is missing or incorrect
    func sendAppleEvent(eventClass: OSType, eventID: OSType, parameters: Array<SwiftAEParameter>) throws -> AnyObject {
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



