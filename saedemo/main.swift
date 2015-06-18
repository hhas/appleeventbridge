//
//  main.swift
//  saedemo
//

import Foundation

//import AppleEventBridge


// build an object specifier (note: formatter is unfinished so some types still appear ObjC style):
//
//     tell application "TextEdit"
//         name of document 1
//     end
//
//let objSpec = TextEdit.documents[1].name
//print(objSpec)
// TEApplication(name: @"/Applications/TextEdit.app").documents.at(1).name

//print(TEApp.documents[1].name)

do {
    print(try TextEdit.make(new_: kTE.document, withProperties: [kTE.text:"Hello World!"]))
    print(try TextEdit.documents.text.get())
} catch {
    print(error)
}

// build a symbol (i.e. an AEDesc of typeType or typeEnumerated):
//
//     tell application "TextEdit"
//         name
//     end
//let typeName = TESymbol.name
//print(typeName)
// TESymbol.name

//print(kTE.document)


/*
let te = AEMApplication(name: "TextEdit")
let evt = te.eventWithEventClass(AEM4CC("core"), eventID: AEM4CC("getd")) as! AEMEvent
let ref = AEMQuery.app().elements(AEM4CC("docu"))
print("\(ref)")
//let desc = try ref.packWithCodecs(te.defaultCodecs)
//print("\(desc)")
evt.setParameter(ref, forKeyword: AEM4CC("----"))
print("\(evt)")
do {
    let res = try evt.sendWithOptions(0x00000003 as AESendMode, timeout: -2)
    print("RESULT: \(res)")
} catch {
    print("ERROR: \(error)")
}
*/



/*
let tm = AEMApplication(name: "timeout.app")
let evt2 = tm.eventWithEventClass(AEM4CC("aevt"), eventID: AEM4CC("odoc")) as! AEMEvent
evt2.setParameter([], forKeyword: AEM4CC("----"))
do {
    let res = try evt2.sendWithOptions(0x00000003 as AESendMode, timeout: -1)
    print("RESULT: \(res)")
} catch {
    print("ERROR: \(error)")
}
*/
