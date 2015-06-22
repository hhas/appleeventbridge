# Examples

// TO DO: include corresponding aebglue commands as comments

## Application objects
    
    // application id "com.apple.Finder"
    
    let finder = Finder() // (use the glue's default bundle ID)

    let finder = Finder(bundleIdentifier: "com.apple.finder")

    // application "Adobe InDesign CS6"

    let indesign = AdobeInDesign(name: "Adobe InDesign CS6")

    // application "Macintosh HD:Applications:TextEdit.app:"

    let textedit = TextEdit(name: "/Applications/TextEdit.app")

    // application "iTunes" of machine "eppc://jsmith@media-mac.local"

    let itunes = iTunes(url: NSURL(string: "eppc://jsmith@media-mac.local/iTunes"))


## Property references

    // a reference to startup disk of application "Finder"
    finder.startupDisk

    // a reference to name of folder 1 of home of application "Finder"
    finder.home.folders[1].name

    // a reference to name of every item of home of application "Finder"
    finder.home.items.name

    // a reference to text of every document of application "TextEdit"
    textedit.documents.text

    // a reference to color of character 1 of every paragraph of text ¬
    //     of document 1 of application "TextEdit"
    textedit.documents[1].text.paragraphs.characters[1].color


## All elements references

    // a reference to disks of application "Finder"
    finder.disks

    // a reference to every word of every paragraph ¬
    //     of text of every document of application "TextEdit"
    textedit.documents.text.paragraphs.words


## Single element references

    // a reference to disk 1 of application "Finder"
    finder.disks[1]

    // a reference to file "ReadMe.txt" of folder "Documents" of home of application "Finder"
    finder.home.folders["Documents"].files["ReadMe.txt"]

    // a reference to paragraph -1 of text of document 1 of application "TextEdit"
    textedit.documents[1].text.paragraphs[-1]

    // a reference to middle paragraph of text of last document of application "TextEdit"
    textedit.documents.last.text.paragraphs.middle

    // a reference to any file of home of application "Finder"
    finder.home.files.any


## Relative references

    // a reference to paragraph before paragraph 6 of text of document 1 of application "TextEdit"
    textedit.documents[1].text.paragraphs[6].previous(TET.paragraph)

    // a reference to paragraph after character 30 of document 1 of application "Tex-Edit Plus"
    texEditPlus.documents[1].characters[30].next(TEP.paragraph)


## Element range references

    // a reference to words 1 thru 4 of text of document 1 of application "TextEdit"
    textedit.documents[1].text.words[1, 4]

    // a reference to paragraphs 2 thru -1 of text of document 1 of application "TextEdit"
    textedit.documents[1].text.paragraphs[2, -1]

    // a reference to folders "Documents" thru "Music" of home of application "Finder"
    finder.home.folders["Documents", "Music"]

    // a reference to text (word 3) thru (paragraph 7) of document 1 of application "Tex-Edit Plus"
    texEditPlus.documents[1].text[TEP.con.words[3], TEP.con.paragraphs[7]]


## Test references

    // a reference to every document of application "TextEdit" whose text is "\n"
    textedit.documents[TET.its.text == "\n"]

    // a reference to every paragraph of document 1 of application "Tex-Edit Plus" ¬
    //      whose first character is last character
    texEditPlus.documents[1].paragraphs[TEP.its.characters.first == TEP.its.characters.last]

    // a reference to every file of folder "Documents" of home of application "Finder" ¬
    //      whose name extension is "txt" and size < 10240
    finder.home.folders["Documents"].files[FIN.its.nameExtension == "txt" && FIN.its.size < 10240]


## Insertion location references

    // a reference to end of documents of application "TextEdit"
    textedit.documents.end

    // a reference to before paragraph 1 of text of document 1 of application "TextEdit"
    textedit.documents[1].text.paragraphs[1].before


## `get` command

Get the name of every folder in the user's home folder:

    // tell application "Finder" to get name of every folder of home
    finder.get(FIN.app.home.folders.name)

Note that if the direct parameter is omitted from the argument list, the reference that the command is invoked on is used instead. For example, the above example would normally be written as:

    finder.home.folders.name.get()


## `set` command

Set the content of a TextEdit document:

    // tell application "TextEdit" to set text of document 1 to "Hello World"
    textedit.documents[1].text.set(to: "Hello World")


## `count` command

Count the words in a TextEdit document:

    // tell application "TextEdit" to count words of document 1
    textedit.documents[1].words.count()

Count the items in the current user's home folder:

    // tell application "Finder" to count items of home
    finder.home.count(each: FIN.item)

(Note that Finder and many other Carbon applications require the `count` command's `each` parameter to be given.)


## `make` command

Create a new TextEdit document:

    // tell application "TextEdit" to make new document ¬
    //     with properties {text:"Hello World\n"}
    textedit.make(new: TET.document, withProperties: [TET.text: "Hello World\n"])

Append text to a TextEdit document:

    // tell application "TextEdit" to make new paragraph ¬
    //     at end of text of document 1 ¬
    //     with properties {text:"Yesterday\nToday\nTomorrow\n"}
    textedit.make(new: TET.paragraph, 
                   at: TET.app.documents[1].text.end,
             withData: "Yesterday\nToday\nTomorrow\n")


## `duplicate` command

Duplicate a folder to a disk, replacing an existing item if one exists:

    // tell application "Finder"
    //     duplicate folder "Projects" of home to disk "Work" with replacing
    // end tell
    finder.home.folders["Projects"].duplicate(to: FIN.app.disks["Backup"],replacing: true)


## `add` command

Add every person with a known birthday to a group named "Birthdays": 

    // tell application "Contacts"
    //     add every person whose birth date is not missing value to group "Birthdays"
    // end tell
    contacts.people[CTS.its.birthDate != CTS.missingValue].add(to: CTS.app.groups["Birthdays"])

