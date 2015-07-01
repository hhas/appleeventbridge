//
//  main.swift
//  saedemo
//


import Foundation
import AppleEventBridge


let textedit = TextEdit()
let itunes = ITunes()


let t = true; let f = false


if f {
    do {
        print(try textedit.get(TETapp.documents[1][1].text)) // check invalid specifiers are reported as errors upon use
    //    print(try textedit.documents[1][1].text.get())
    } catch {
    print(error)
    }
}


print((try itunes.playerState.get()))

//print("")
//print((try itunes.playlists["Top 25 Most Played"].tracks.name.get()) as! [String])
//print("")
//print((try itunes.playlists["Top 25 Most Played"].tracks.name.get(waitReply: false)))


if t {

    // build an object specifier (note: formatter is unfinished so some types still appear ObjC style):
    //
    //     tell application "TextEdit"
    //         a reference to name of document 1
    //     end
    //
    let objSpec = textedit.documents[1].name
    print(objSpec) // TextEdit(name: @"/Applications/TextEdit.app").documents[1].name

    print(TETapp.documents[1].name) // 'generic' refs can be used as parameters to commands

    do {
        // tell application "TextEdit" to make new document with properties {text:"Hello World!"}
        print(try textedit.make(new: TET.document, withProperties: [TET.text:"Hello World!"]))
        
        // tell application "TextEdit" to get text of every document
        print(try textedit.documents.text.get())
        // note: AEB unpacks AEDescs as NSObjects rather than Swift objects, so the returned NSArray will print as ObjC notation unless explicitly cast to Array<> first
        
        // tell application "AppleScript" to set q to a reference to name of document 1
        let q = textedit.documents[1].name
        print(q) // q
        print(try q.get()) // get contents of q
    } catch {
        print(error)
    }
}

if t {

    // tell application "iTunes" to get name of every track of playlist "Top 25 Most Played"
    print((try itunes.playlists["Top 25 Most Played"].tracks.name.get()) as! [String])


    // tell application "iTunes" to get {name, rating} of (every track whose artist = "Sigur Ros" and (name begins with "G" or rating ≥ 60))
    let q = itunes.tracks[ITUits.artist == "Sigur Ros" && (ITUits.name.beginsWith("G") || ITUits.rating >= 60)]
    print(Array(zip(try q.name.get() as! [String], try q.rating.get() as! [Int])))
    // [("Gobbledigook", 80), ("Góðan Daginn", 40), ("Við Spilum Endalaust", 60), ...]

    //itunes.make(new: ITU.playlist, withProperties: [ITU.name:"TEST PLAYLIST"])



    print(itunes.tracks[ITUits.artist == "Sigur Ros" && (ITUits.name.beginsWith("G") || ITUits.rating >= 60)].rating)
    //ITUApplication(name: @"/Applications/iTunes.app").tracks[(ITUits.artist == @"Sigur Ros" && (ITUits.name.beginsWith(@"G") || ITUits.rating >= @60))].rating


}


/*
let t: AnyObject = TETIts.documents.name == "test.rtf" // caution: using == outside of [...] can produce bool result...
print("EQ: \(t)") // 0  // !!!
let t1: TETSpecifier = TETIts.documents.name == "test.rtf" // ...unless result is explicitly typed ensure is correct type
print("EQ: \(t1)") // [TETIts.documents.name equals: @"test.rtf"]

print(textedit.documents[TETIts.name == "test.rtf"]) // this appears to produce correct result, but can it always be guaranteed to do so?


let t2: AnyObject = TETIts.documents.name != "test.rtf"
print("EQ: \(t2)")
let t3: TETSpecifier = TETIts.documents.name != "test.rtf"
print("EQ: \(t3)")
*/



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
