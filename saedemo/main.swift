//
//  main.swift
//  saedemo
//


import Foundation
import AppleEventBridge


// create application objects
let textedit = TextEdit()
let itunes = ITunes()


//print(try Finder().items[NSURL(fileURLWithPath:"/Users/has/Desktop")].files.get() as! [FINSpecifier])


let t = true; let f = false


do {
    try TextEdit().documents[100].get()
} catch {
    print(error)
}


// note that TextEdit pays no attention to considering/ignoring flags in events, so always ignores case and considers everything else
//print(try textedit.documents[1].words[TEDIts == "foo"].get())
//print(try textedit.documents[1].words[TEDIts == "foo"].get(considering: [TED.case_, TED.diacriticals], ignoring: [TED.expansion]))


if f {
    do {
        print(try textedit.get(TEDApp.documents[1][1].text)) // check invalid specifiers are reported as errors upon use
    //    print(try textedit.documents[1][1].text.get())
    } catch {
    print(error)
    }
    do { print(try TEDApp.documents[1].next(TED.document).get()) } catch { print(error) } // calling a command on a generic specifier throws error as only concrete specifiers (i.e. those created from an Application object) contain application's address info
}


// print((try itunes.playerState.get())) // e.g. -> ITU.stopped

//print((try itunes.playlists["Top 25 Most Played"].tracks.name.get()) as! [String])

//print((try itunes.playlists["Top 25 Most Played"].tracks.name.get(waitReply: false)))

// test formatting support for relative specifiers
//print(TEDApp.documents[1].next(TED.document)) // -> "TEDApp.documents[1].next(TED.document)"
//print(TextEdit().documents[1].next(TED.document)) // -> "TextEdit(name:\"...TextEdit.app\").documents[1].next(TED.document)"
//try TextEdit().documents[1].next(TED.document).get() // AE translation: "TextEdit().documents[1].next(TED.document).get()"


//try itunes.playpause()

//print(try textedit.documents.count())
//print(try textedit.count(each: TED.document))


if t {

    // build an object specifier (note: formatter is unfinished so some types still appear ObjC style):
    //
    //     tell application "TextEdit"
    //         a reference to name of document 1
    //     end
    //
    let objSpec = textedit.documents[1].name
    print(objSpec) // TextEdit(name: @"/Applications/TextEdit.app").documents[1].name

    print(TEDApp.documents[1].name) // 'generic' refs can be used as parameters to commands

    do {
        // tell application "TextEdit" to make new document with properties {text:"Hello World!"}
        print(try textedit.make(new: TED.document, withProperties: [TED.text:"Hello World!"]))
        
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
    let q = itunes.tracks[ITUIts.artist == "Sigur Ros" && (ITUIts.name.beginsWith("G") || ITUIts.rating >= 60)]
    print(Array(zip(try q.name.get() as! [String], try q.rating.get() as! [Int])))
    // [("Gobbledigook", 80), ("Góðan Daginn", 40), ("Við Spilum Endalaust", 60), ...]

    //itunes.make(new: ITU.playlist, withProperties: [ITU.name:"TEST PLAYLIST"])



    print(itunes.tracks[ITUIts.artist == "Sigur Ros" && (ITUIts.name.beginsWith("G") || ITUIts.rating >= 60)].rating)
    //ITUApplication(name: @"/Applications/iTunes.app").tracks[(ITUIts.artist == @"Sigur Ros" && (ITUIts.name.beginsWith(@"G") || ITUIts.rating >= @60))].rating


}


/*
let t: AnyObject = TEDIts.documents.name == "test.rtf" // caution: using == outside of [...] can produce bool result...
print("EQ: \(t)") // 0  // !!!
let t1: TEDSpecifier = TEDIts.documents.name == "test.rtf" // ...unless result is explicitly typed ensure is correct type
print("EQ: \(t1)") // [TEDIts.documents.name equals: @"test.rtf"]

print(textedit.documents[TEDIts.name == "test.rtf"]) // this appears to produce correct result, but can it always be guaranteed to do so?


let t2: AnyObject = TEDIts.documents.name != "test.rtf"
print("EQ: \(t2)")
let t3: TEDSpecifier = TEDIts.documents.name != "test.rtf"
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
