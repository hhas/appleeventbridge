//
//  SwiftAEGlueSupport.swift
//

// TO DO: move into AppleEventBridge.framework

// TO DO: should XXApplication.currentApplication() be init(currentApplication:())? c.f. init(listDescriptor: ()) in NSAEDesc

// note: AEBAppData uses AEMCodecs to unpack basic AE types (text, list, etc) as NSObjects; TO DO: would it be better to unpack them as native Swift types (and would Swift objects cause any issues with other NSObject-based APIs such as AEMQuery)?

import Foundation
import AppKit
import AppleEventBridge


/******************************************************************************/
// AppData class
// each APPNAME application class creates its own XXAppData instance, which it then shares with all XXSpecifiers derived from it


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
    
    override func unpackCompDescriptor(desc: NSAppleEventDescriptor) throws -> AnyObject { // TO DO: throw error -1726 if invalid operand(s)
        let operatorCode = desc.descriptorForKeyword(AEM4CC("relo"))!.enumCodeValue // keyAECompOperator
        var op1 = try self.unpack(desc.descriptorForKeyword(AEM4CC("obj1"))) // keyAEObject1
        var op2 = try self.unpack(desc.descriptorForKeyword(AEM4CC("obj2"))) // keyAEObject2
        // note: unlike ObjC glues, SwiftAESpecifier isn't polymorphic with AEMQuery where test clause methods are concerned (preferring to use overloaded operators instead); one option would be to implement greaterThan, etc. on glue specifiers, allowing existing AEMCodecs.unpackCompDescriptor() to unpack them; for now though, let's just unwrap the underlying AEMQuerys and work on those (there's no real reason to unpack comparison and logic descriptors as SwiftAESpecifiers since they normally only occur inside other specifiers)
        if op1 is AEMQueryProtocol {
            op1 = op1.aemQuery
        }
        if op2 is AEMQueryProtocol {
            op2 = op2.aemQuery
        }
        // TO DO: it might be best if AEMCodecs split unpackCompDescriptor into separate unpack and apply methods
        switch operatorCode {
        case AEM4CC(">   "):
            // note: these will throw exception if first operand is not an objSpec; TO DO: if op1 is not an AEMQuery but op2 is, should operands and operator be reversed, e.g. op1.greaterThan(op2) -> op2.lessOrEquals(op1); the AEOM spec is no help, of course (one option would be to check how AS packs them)
            return (op1 as! AEMObjectSpecifier).greaterThan(op2)
        case AEM4CC(">=  "):
            return (op1 as! AEMObjectSpecifier).greaterOrEquals(op2)
        case AEM4CC("=   "):
            return (op1 as! AEMObjectSpecifier).equals(op2)
        case AEM4CC("<   "):
            return (op1 as! AEMObjectSpecifier).lessThan(op2)
        case AEM4CC("<=  "):
            return (op1 as! AEMObjectSpecifier).lessOrEquals(op2)
        case AEM4CC("bgwt"):
            return (op1 as! AEMObjectSpecifier).beginsWith(op2)
        case AEM4CC("ends"):
            return (op1 as! AEMObjectSpecifier).endsWith(op2)
        case AEM4CC("cont"):
            return try self.unpackContainsCompDescriptorWithOperand1(op1, operand2: op2)
        default:
            throw AEMErrorWithInfo(-1726, "Unknown comparison operator: \(desc)")
        }
    }

    override func unpackLogicalDescriptor(desc: NSAppleEventDescriptor) throws -> AnyObject { // TO DO: throw error -1726 if invalid operand(s)
        let operatorsDesc = desc.descriptorForKeyword(AEM4CC("term"))!.coerceToDescriptorType(AEM4CC("list"))! // keyAELogicalTerms, typeAEList
        let operatorCode = desc.descriptorForKeyword(AEM4CC("logc"))!.enumCodeValue // keyAELogicalOperator
        let op1 = try self.unpack(operatorsDesc.descriptorAtIndex(1)).aemQuery as! AEMTestClause
        switch operatorCode {
        case AEM4CC("AND "):
            operatorsDesc.removeDescriptorAtIndex(1)
            return op1.AND(try self.unpack(operatorsDesc))
        case AEM4CC("OR  "):
            operatorsDesc.removeDescriptorAtIndex(1)
            return op1.OR(try self.unpack(operatorsDesc))
        case AEM4CC("NOT "):
            return op1.NOT()
        default:
            throw AEMErrorWithInfo(-1726, "Unknown logical operator: \(desc)")
        }
    }
}

/******************************************************************************/
// Symbol base class

// base class for all standard and application-specific named symbols
// (note: while an enum would be idiomatic Swift, the need to map reliably between human-readable names and AE codes, and/or represent such mappings even when one or other is unavailable, may make this tricky or impractical; need to research further)

// TO DO: might be simpler for glues to subclass AEBSymbol, and define standard symbols as their own baseclass (Q. how best to generate that class? prob best done manually using glue generator, so that new types defined by Apple are permanently included in all subsequent framework releases)

class SwiftAESymbol: AEBSymbol {
    
    var aebPrefix: String {return "AEB"}
    
    override var description: String {
        if (self.aebName != nil) {
            return "\(self.aebPrefix).\(self.aebName)"
        } else {
            return "\(self.aebPrefix).symbolWithFourCharCode(\"\(AEMFormatOSType(self.aebCode))\")"
        }
    }
    
    // TO DO: construction is kinda messy
        class func symbolWithFourCharCode(code: String!) -> AEBSymbol { // convenience constructor; TO DO: how best to implement this? as convenience init? e.g. would it be better on glue, where exact type can be given?
        return self.aebSymbolForCode(AEM4CC(code))
    }
    
    /* begin generated section */
    
    override class func aebSymbolForCode(code_: OSType) -> AEBSymbol { // used by codecs to unpack AEDescs of typeType/typeEnumerated as named symbols (note: if a four-char code doesn't have a corresponding name, an AEBSymbol instance containing the raw code only is returned)
        switch code_ {
        //case AEM4CC("pnam"): return self.name
        // ... TO DO: standard codes
        default: return super.aebSymbolForCode(code_)
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
// misc constants used in SwiftAESpecifier

struct SwiftAEParameter {
    var name: String? // TO DO: name is never used; probably simplest to replace this struct with simple (code:OSType,value:AnyObject) tuple
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
typealias AEBConsiderIgnoreType = [AEBSymbol]


// TO DO: not certain if using arrays of AEBSymbols to specify considers/ignores values is best choice; would a Swift enum be better?
// generally, mimicking AppleScript is the best approach; however, the kAE/kAS...Considers/IgnoresMask constants are hardcoded in ASRegistry.h, which are in turn copied in AEBDefaultTerms.m as part of AEB's 'default' terminology (itself modeled after AppleScript's own built-in terminology resource, and with much the same definitions), so it's not as if the user can supply non-standard symbols as command's considering/ignoring attributes, because those symbols need to be mapped to UInt32 bitmasks before they can be packed into an event (TBH, the fault is really with ASRegistry.h for adding a second, inflexible mechanism for specifying considering/ignoring flags, when there was already a simple, robust mechanism that took a single AEList of typeEnum descriptors)
let AEBConsidersAndIgnoresMasks: [OSType: (consider: UInt32, ignore: UInt32)] = [ // (AEBSymbol.code, ConsiderMask, IgnoreMask)
    AEM4CC("case"): (0x00000001, 0x00010000), // note: AEB.case, AEB.diacriticals, etc. symbols are defined in AEBDefaultTerms
    AEM4CC("diac"): (0x00000002, 0x00020000),
    AEM4CC("whit"): (0x00000004, 0x00040000),
    AEM4CC("hyph"): (0x00000008, 0x00080000),
    AEM4CC("expa"): (0x00000010, 0x00100000),
    AEM4CC("punc"): (0x00000020, 0x00200000),
    AEM4CC("nume"): (0x00000080, 0x00800000),
]

let kAEBDefaultConsidersIgnoresMask: UInt32 = 0x00010000 // AppleScript ignores case by default


/******************************************************************************/
// Specifier base class

class SwiftAESpecifier: AEBSpecifier {
    
    var aemQueryError: NSError? = nil
    
    // TO DO: make this `required`
    convenience init(appData appData_: AEBAppData!, aemQuery aemQuery_: AEMQuery?, queryError queryError_: NSError?) {
        self.init(appData: appData_, aemQuery: aemQuery_)
        aemQueryError = queryError_
    }
    
    // TO DO: a better approach would be to pass a closure, e.g. {$0?[index]} which can be used to generate either new query or (using formatter) representation of malformed query
    
    // TO DO: sort out error messages; also make sure errors can't recurse, e.g. when displayed or packed into an AE (since `self` is the cause of the problem and cannot pack or display correctly); push error message creation into shared method
    
    // another issue is how to generate representation of malformed specifier for use in description? may be easiest if error description continues to construct representation, and if aemQuery==nil then description/formatter should just return that instead of building new one

    func aemObjectSpecifer(what: String) -> (AEMObjectSpecifier?, NSError?) {
        if aemQuery is AEMObjectSpecifier {
            return ((self.aemQuery as! AEMObjectSpecifier), nil)
        } else if aemQueryError == nil { // invalid specifier, e.g. app.documents[1].first
            return (nil, NSError(domain: kAEMErrorDomain, code: -1728, userInfo: [
                    NSLocalizedDescriptionKey: "Can't \(what) of the following specifier (not an object specifier): \(self)",
                    kAEMErrorOffendingObjectKey: self]))
        } else {
            return (nil, aemQueryError)
        }
    }
    func aemElementsSpecifer(what: String) -> (AEMMultipleElementsSpecifier?, NSError?) {
        if aemQuery is AEMMultipleElementsSpecifier {
            return ((self.aemQuery as! AEMMultipleElementsSpecifier), nil)
        } else if aemQueryError == nil { // invalid specifier, e.g. app.documents[1].first
            return (nil, NSError(domain: kAEMErrorDomain, code: -1728, userInfo: [
                    NSLocalizedDescriptionKey: "Can't \(what) of the following specifier (not a multiple elements specifier): \(self)",
                    kAEMErrorOffendingObjectKey: self]))
        } else {
            return (nil, aemQueryError)
        }
    }
    func aemTestClause(what: String) -> (AEMTestClause?, NSError?) {
        if aemQuery is AEMTestClause {
            return ((self.aemQuery as! AEMTestClause), nil)
        } else if aemQueryError == nil { // invalid specifier, e.g. app.documents[1].first
            return (nil, NSError(domain: kAEMErrorDomain, code: -1728, userInfo: [
                    NSLocalizedDescriptionKey: "Can't \(what) of the following specifier (not an object specifier): \(self)",
                    kAEMErrorOffendingObjectKey: self]))
        } else {
            return (nil, aemQueryError)
        }
    }
    
    override func packWithCodecs(codecs: AEMCodecsProtocol) throws -> NSAppleEventDescriptor {
        if (self.aemQuery != nil) {
            return try aemQuery.packWithCodecs(codecs)
        } else {
            throw aemQueryError ?? NSError(domain: kAEMErrorDomain, code: -1728, userInfo: [
                    NSLocalizedDescriptionKey: "Can't pack the following (not a valid specifier): \(self)",
                    kAEMErrorOffendingObjectKey: self])
        }
    }
    
    // TO DO: support optional completionHandler closure for async sends? (not sure how best to implement this; might be simpler to take optional `queueReply:true` arg that calls command.queueReply() to set AESendMode's kAEQueueReply flag and, on successful dispatch of the event, immediately return the event's returnID as result, leaving user to collect reply event themselves)
    
    // note: clients may call the following method directly as workaround if app's terminology is missing or incorrect
    
    // TO DO: add convenience raw send method that takes four-char code strings (c.f. elementsByFourCharCode)
    // sendAppleEvent(eventCode: AEBEightCharCode, parameters: [AEBFourCharCode:AnyObject], ....)
    
    func sendAppleEvent(eventClass: OSType, eventID: OSType, parameters: Array<SwiftAEParameter>,
            returnType: AEBReturnType?, waitReply: Bool?, withTimeout: NSTimeInterval?,
            considering: AEBConsiderIgnoreType?, ignoring: AEBConsiderIgnoreType?) throws -> AnyObject! {
        if aebAppData == nil { // only concrete specifiers (i.e. created from an application object, not generic roots) can send events
            throw AEMErrorWithInfo(-1701, "Generic specifiers can't send commands: \(self)")
        }
        if aemQuery == nil { // malformed specifier, e.g. TextEdit().documents[1][1], so throw deferred error describing problem
            if aemQueryError == nil { // catch-all in case error hasn't been set for some reason
                throw NSError(domain: kAEMErrorDomain, code: -1728, userInfo: [
                    NSLocalizedDescriptionKey:"Can't call command on the following (not a valid specifier): \(self)",
                    kAEMErrorOffendingObjectKey: self])
            }
            throw aemQueryError!
        }
        // create Apple event and pack its parameters
        let command = AEBCommand(appData: aebAppData, eventClass: eventClass, eventID: eventID, parentQuery: aemQuery)
        for param in parameters {
            if !(param.value is AEBNoParameter) {
                command.setParameter(param.value, forKeyword: param.code)
            }
        }
        // pack event attributes
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
        // (note: most apps completely ignore enumConsidsAndIgnores attribute, and always ignore case and consider everything else)
        if considering != nil || ignoring != nil {
            var considersAndIgnores: UInt32 = 0
            if let considerOptions = considering {
                for symbol in considerOptions {
                    if let mask = AEBConsidersAndIgnoresMasks[symbol.aebCode] {
                        considersAndIgnores |= mask.consider
                    }
                }
            }
            if let ignoreOptions = ignoring {
                for symbol in ignoreOptions {
                    if let mask = AEBConsidersAndIgnoresMasks[symbol.aebCode] {
                        considersAndIgnores |= mask.ignore
                    }
                }
            }
            command.considering(considersAndIgnores)
        }
        // send the event
        //defer { print("SENT: \(try! SwiftAETranslateAppleEvent(command.aemEvent.descriptor, useSDEF: true))") } // TEST; TO DO: delete
        return try command.sendWithError() // TO DO: trap and rethrow with better error message, c.f. py-appscript; Q. implement SwiftAEError as enum (at least for common standard error codes)? e.g. SwiftAEError.UnsupportedCoercion, .MissingParameter, .SpecifierNotFound, .ProcessNotFound, .ProcessTerminated, etc. prob. easiest for writing do...catch...catch...catch blocks, though not so good when dealing with app-specific error codes and codes that aren't explicitly bridged (all of which would need to be .Other); TBH, it'd be best if users could just pattern match on the error number itself (e.g. as in Haskell); defining an AEBError class with custom ~= operator override may allow this (would need to experiment, e.g. whether to match error no. directly, or a tuple with code:domain:errorInfo: fields); bear in mind that expression-based matching is only available in switch statements (need to check catch clauses' capabilities)
    }
    
}


