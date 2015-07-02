//
//  AEBSwiftAETranslate.swift
//  AppleEventBridge
//
//  Format an AppleEvent descriptor as Swift source code. Enables user tools
//  to translate application commands from AppleScript to Swift syntax simply
//  by installing a custom SendProc into an AS component instance to intercept
//  outgoing AEs, pass them to SwiftAETranslateAppleEvent(), and print the result.
//

import Foundation
import AppKit
import AppleEventBridge


/******************************************************************************/
// SwiftAETranslateAppleEvent

// constants used in AEBDynamicAppData initializers
let kAEBUseAETETerminology    = AEMType(code: AEM4CC("AETE"))
let kAEBUseSDEFTerminology    = AEMType(code: AEM4CC("SDEF"))
let kAEBNoTerminology         = AEMType(code: AEM4CC("NoTe"))
let kAEBUseDefaultTerminology = AEMType(code: AEM4CC("DeTe"))



// generate default AppClassName, Prefix strings from application's CFBundleName
private func glueInfoForLocalProcess(pid: pid_t) -> (String, String) {
    if let url = AEMApplication.fileURLForApplicationWithProcessID(pid) {
        if let bundleInfo = NSBundle(URL: url)?.infoDictionary {
            let name = (bundleInfo["CFBundleName"] as? String) ?? url.lastPathComponent // TO DO: need to strip .app suffix
            let converter = AEBSwiftKeywordConverter.sharedKeywordConverter()
            return (converter.identifierForAppName(name), converter.prefixForAppName(name))
        }
    }
    return ("XXXApplication", "XXX")
}


private func appDataForProcess(var addressDesc: NSAppleEventDescriptor!, useSDEF: Bool) throws -> SwiftAETranslationAppData {
    if addressDesc.descriptorType == AEM4CC("psn ") { // typeProcessSerialNumber // AppleScript is old school
        addressDesc = addressDesc.coerceToDescriptorType(AEM4CC("kpid"))! // typeKernelProcessID
    }
    var targetType = kAEBTargetURL
    var targetData: AnyObject
    var appClassName: String = "XXXApplication"
    var prefix: String = "XXX"
    if addressDesc.descriptorType == AEM4CC("kpid") { // typeKernelProcessID // local processes are generally targeted by PID
        var pid: pid_t = 0
        addressDesc.data.getBytes(&pid, length: sizeof(pid_t))
        targetData = NSRunningApplication(processIdentifier: pid)!.bundleURL!
        (appClassName, prefix) = glueInfoForLocalProcess(pid)
    } else {
        targetType = kAEBTargetDescriptor
        targetData = addressDesc
    }
    // get terms for use in custom formatter
    let dynamicAppData = AEBDynamicAppData(applicationClass: AEMApplication.self, targetType: targetType, targetData: targetData,
        relaunchMode: kAEBRelaunchAlways,
        launchOptions: NSWorkspaceLaunchOptions.WithoutActivation,
        targetTerms: (useSDEF ? kAEBUseSDEFTerminology : kAEBUseAETETerminology),
        defaultTerms: kAEBUseDefaultTerminology,
        keywordConverter: AEBSwiftKeywordConverter.sharedKeywordConverter())
    let appTerms = try dynamicAppData.terminologyWithError()
    return SwiftAETranslationAppData(applicationClass: SwiftAETranslationSpecifier.self, symbolClass: SwiftAETranslationSymbol.self,
        specifierClass: SwiftAETranslationSpecifier.self, targetType: targetType, targetData: targetData,
        terms: appTerms, appClassName: appClassName, prefix: prefix) // note: symbolClass arg is ignored as it's hardcoded into unpack
}
//

// note: if sending events to self, processes _must_ useSDEF=true or call this function on a background thread, otherwise SwiftAETranslateAppleEvent will deadlock the main loop when it tries to fetch host app's AETE via ascr/gdte event

func SwiftAETranslateAppleEvent(event: NSAppleEventDescriptor!, useSDEF: Bool = false) throws -> String { // TO DO: on failure, return string or error message?
    if event.descriptorType as UInt32 != AEM4CC("aevt") { // typeAppleEvent // TO DO: Swift auto-converts OSType to Int, making AE consts useless
        return "<NOT A VALID APPLE EVENT>" // TO DO: how to handle? throw error?
    }
    // get target process's terminology
    let addressDesc = event.attributeDescriptorForKeyword(AEM4CC("addr"))! // keyAddressAttr
    let appData = try appDataForProcess(addressDesc, useSDEF: useSDEF)
    // unpack event attributes
    let eventClass: UInt32 = event.attributeDescriptorForKeyword(0x6576636C)!.typeCodeValue // keyEventClassAttr
    let eventID: UInt32 = event.attributeDescriptorForKeyword(0x65766964)!.typeCodeValue // keyEventIDAttr
    let subjectDesc = event.attributeDescriptorForKeyword(0x7375626A) // keySubjectAttr
    // get the application terminology for this event
    let commandInfo = appData.commandsByCodeTable[NSNumber(unsignedLongLong: (UInt64(eventClass) << 32 | UInt64(eventID)))]
    if commandInfo == nil {
        throw  AEMErrorWithInfo(-1728, "no terminology for this command")
    }
    // unpack and format subject attribute and/or direct parameter, if given
    var subjectString: String? = nil
    var directParamString: String? = nil
    if subjectDesc != nil && subjectDesc!.descriptorType != 0x6E756C6C { // typeNull = root application object
        subjectString = SwiftAETranslationFormatter.formatObject(try appData.unpack(subjectDesc), appData: appData)
    }
    if let directParam = event.paramDescriptorForKeyword(AEM4CC("----")) {
        directParamString = SwiftAETranslationFormatter.formatObject(try appData.unpack(directParam), appData: appData)
    }
    var baseString = "\(appData.appClassName)()"
    var argStrings = [String]()
    if subjectString != nil && directParamString != nil {
        baseString = subjectString!
        argStrings.append(directParamString!)
 //   } else if eventClass == AEM4CC("core") && eventID == AEM4CC("crel") { // TO DO: format make command as special case (for convenience, AEBCommand allows user to call `make` directly on a specifier, in which case the specifier is used as its `at` parameter if not already given)
    } else if subjectString == nil && directParamString != nil {
        baseString = directParamString!
    } else if subjectString != nil && directParamString == nil {
        baseString = subjectString!
    }
    for paramInfo in commandInfo!.parameters as! [AEBDynamicKeywordTerm] {
        if let param = event.paramDescriptorForKeyword(paramInfo.code) {
            let value = SwiftAETranslationFormatter.formatObject(try appData.unpack(param), appData: appData)
            argStrings.append("\(paramInfo.name): \(value)")
        }
        
    }
    // add command's attributes in order of appearance
    if let replyType = event.attributeDescriptorForKeyword(0x72747970) { // keyAERequestedType
        let value = SwiftAETranslationFormatter.formatObject(try appData.unpack(replyType), appData: appData)
        argStrings.append("returnType: \(value)")
    }
    if let wantsReply = event.attributeDescriptorForKeyword(0x72657071) { // keyReplyRequestedAttr]
        // keyReplyRequestedAttr appears to be boolean value encoded as Int32 (1=wait or queue reply; 0=no reply)
        if wantsReply.int32Value == 0 {
            argStrings.append("waitReply: false")
        }
    }
    if let timeout = event.attributeDescriptorForKeyword(0x74696D6F) { // keyTimeoutAttr
        let timeoutInTicks = timeout.int32Value
        if timeoutInTicks == -2 { // AEBNoTimeout
            argStrings.append("withTimeout: AEBNoTimeout")
        } else if timeoutInTicks != -1 { // AEBDefaultTimeout
            let timeoutInSeconds = NSString(format: "%.2f", Double(timeoutInTicks) / 60.0)
            argStrings.append("withTimeout: \(timeoutInSeconds)")
        }
    }
    if let considsIgnoresDesc = event.attributeDescriptorForKeyword(0x63736967) { // enumConsidsAndIgnores
        var considsIgnores: UInt32 = 0
        considsIgnoresDesc.data.getBytes(&considsIgnores, length: sizeof(UInt32))
        // TO DO: finish; if not default value, use byte masks to determine specified options and format as array of constants
    }
    let argsString = ", ".join(argStrings)
    return "\(baseString).\(commandInfo!.name)(\(argsString))"
}


/******************************************************************************/
// dynamic formatter; used to generate Swift code representation of an AppleEvent

// init(applicationClass:targetType:targetData:relaunchMode:launchOptions:)
// init!(applicationClass appClass: AnyClass!, targetType type: AEBTargetType, targetData data: AnyObject!, relaunchMode mode: AEBRelaunchMode, launchOptions options: NSWorkspaceLaunchOptions)


class SwiftAETranslationAppData: SwiftAEAppData { // extends static app data (which provides pack/unpack) to include terms
    
    var typesByCodeTable: [NSNumber:String]
    var propertiesByCodeTable: [NSNumber:String]
    var elementsByCodeTable: [NSNumber:String]
    var commandsByCodeTable: [NSNumber:AEBDynamicCommandTerm]
    var appClassName: String
    var prefix: String
    
    required init(applicationClass appClass: AnyClass!, symbolClass symbolClass_: AnyClass!,
        specifierClass specifierClass_: AnyClass!, targetType type: AEBTargetType,
        targetData data: AnyObject!, terms: AEBDynamicTerminology,
        appClassName appClassName_: String, prefix prefix_: String) {
            typesByCodeTable = terms.typesByCode.copy() as! [NSNumber:String]
            propertiesByCodeTable = terms.propertiesByCode.copy() as! [NSNumber:String]
            elementsByCodeTable = terms.elementsByCode.copy() as! [NSNumber:String]
            commandsByCodeTable = terms.commandsByCode.copy() as! [NSNumber:AEBDynamicCommandTerm]
            appClassName = appClassName_
            prefix = prefix_
            super.init(applicationClass: appClass, symbolClass: symbolClass_, specifierClass: specifierClass_,
                targetType: type, targetData: data)
    }
        
    private func unpackAEBSymbol(desc: NSAppleEventDescriptor!) -> AnyObject {
        let name = (self.typesByCodeTable[NSNumber(unsignedInt: desc.typeCodeValue)])
        return SwiftAETranslationSymbol(prefix: self.prefix, name: name, descriptor: desc)
    }
    override func unpackType(desc: NSAppleEventDescriptor!) throws -> AnyObject {
        return self.unpackAEBSymbol(desc)
    }
    override func unpackEnum(desc: NSAppleEventDescriptor!) throws -> AnyObject {
        return self.unpackAEBSymbol(desc)
    }
    override func unpackProperty(desc: NSAppleEventDescriptor!) throws -> AnyObject {
        return self.unpackAEBSymbol(desc)
    }
    override func unpackKeyword(desc: NSAppleEventDescriptor!) throws -> AnyObject {
        return self.unpackAEBSymbol(desc)
    }
    override func unpackAERecordKey(key: AEKeyword) throws -> AnyObject {
        return self.unpackAEBSymbol(NSAppleEventDescriptor(typeCode: key))
    }

}


//


class SwiftAETranslationFormatter: SwiftAEFormatter {
    
    override var prefix: String {return (aebAppData as! SwiftAETranslationAppData).prefix}
    override var appClassName: String {return (aebAppData as! SwiftAETranslationAppData).appClassName}
    
    override func propertyByCode(code: OSType) -> String? {
        if let result = (aebAppData as! SwiftAETranslationAppData).propertiesByCodeTable[NSNumber(unsignedInt: code)] {
            return result
        } else {
            return super.propertyByCode(code)
        }
    }
    override func elementsByCode(code: OSType) -> String? {
        if let result = (aebAppData as! SwiftAETranslationAppData).elementsByCodeTable[NSNumber(unsignedInt: code)] {
            return result
        } else {
            return super.elementsByCode(code)
        }
    }
    
    private func relative(name: String, code: OSType) {
        let symbol = (aebAppData as! SwiftAETranslationAppData).unpackAEBSymbol(NSAppleEventDescriptor(typeCode: code)) as! AEBSymbol
        self.mutableResult?.appendFormat(".%@(%@)", name, self.format(symbol))
    }
    
    override func previous(class_: OSType) -> Self {
        self.relative("previous", code: class_)
        return self;
    }
    override func next(class_: OSType) -> Self {
        self.relative("next", code: class_)
        return self;
    }

    override func app() -> SwiftAETranslationFormatter {
        if aebAppData == nil { // generic specifier
            self.mutableResult?.appendFormat("%@.app", self.prefix)
        } else { // concrete specifier
            self.mutableResult?.appendFormat("%@()", self.appClassName)
        }
        return self;
    }
}


class SwiftAETranslationSpecifier: SwiftAESpecifier {
    override var description: String { return SwiftAETranslationFormatter.formatObject(aemQuery, appData: aebAppData) }
}


class SwiftAETranslationSymbol: SwiftAESymbol {
    
    var prefix: String
    override var aebPrefix: String {return self.prefix}
    
    init(prefix: String, name: String?, descriptor: NSAppleEventDescriptor?) {
        self.prefix = prefix
        super.init(name: name, descriptor: descriptor)
    }

}


