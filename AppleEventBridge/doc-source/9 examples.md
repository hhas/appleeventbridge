# Examples

## Application objects

    // application "Finder"
    #import "FNGlue.h"
    FNApplication *finder = [FNApplication applicationWithName: @"Finder.app"];


    // application "Macintosh HD:Applications:TextEdit.app:"
    #import "TEGlue.h"
    TEApplication *textedit = [[TEApplication applicationWithPath: @"/Applications/TextEdit.app"];


## Property references

    // a reference to startup disk of application "Finder"
    finder.startupDisk

    // a reference to name of folder 1 of home of application "Finder"
    [finder.home.folders at: 1].name

    // a reference to name of every item of home of application "Finder"
    finder.home.items.name

    // a reference to text of every document of application "TextEdit"
    textedit.documents.text

    // a reference to color of character 1 of every paragraph of text ¬
    //     of document 1 of application "TextEdit"
    [[textedit.documents at: 1].text.paragraphs.characters at: 1].color


## All elements references

    // a reference to disks of application "Finder"
    finder.disks

    // a reference to every word of every paragraph ¬
    //     of text of every document of application "TextEdit"
    textedit.documents.text.paragraphs.words


## Single element references

    // a reference to disk 1 of application "Finder"
    [finder.disks at: 1]

    // a reference to file "ReadMe.txt" of folder "Documents" of home of application "Finder"
    [[finder home.folders byName: @"Documents"].files byName: @"ReadMe.txt"]

    // a reference to paragraph -1 of text of document 1 of application "TextEdit"
    [[textedit.documents at: 1].text.paragraphs at: -1]

    // a reference to middle paragraph of text of last document of application "TextEdit"
    textedit.documents.last.text.paragraphs.middle

    // a reference to any file of home of application "Finder"
    finder.home.files.any


## Relative references

    // a reference to paragraph before paragraph 6 of text of document 1 of application "TextEdit"
    [[[textedit.documents at: 1].text.paragraphs at: 6] previous: TESymbol.paragraph]

    // a reference to paragraph after character 30 of document 1 of application "Tex-Edit Plus"
    [[[texEditPlus.documents at: 1].characters at: 30] next: TESymbol.paragraph]


## Element range references

    // a reference to words 1 thru 4 of text of document 1 of application "TextEdit"
    [[textedit.documents at: 1].text.words at: 1 to: 4]

    // a reference to paragraphs 2 thru -1 of text of document 1 of application "TextEdit"
    [[textedit.documents] at: 1].text.paragraphs at: 2 to: -1]

    // a reference to folders "Documents" thru "Music" of home of application "Finder"
    [finder.home.folders byRange: @"Documents" to: @"Music"]

    // a reference to text (word 3) thru (paragraph 7) of document 1 of application "Tex-Edit Plus"
    [[tePlus.documents at: 1].text byRange: [TEPCon.words at: 3]
                                        to: [TEPCon.paragraphs at: 7]]


## Test references

    // a reference to every document of application "TextEdit" whose text is "\n"
    [textedit.documents byTest: [TEIts.text equals: @"\n"]]

    // a reference to every paragraph of document 1 of application "Tex-Edit Plus" ¬
    //      whose first character is last character
    [[tePlus.documents at: 1].paragraphs byTest: 
            [TEPIts.characters.first equals: TEPIts.characters.last]]

    // a reference to every file of folder "Documents" of home of application "Finder" ¬
    //      whose name extension is "txt" and size < 10240
    [[finder.home.folders byName: @"Documents"].files byTest:
            [[FNIts.nameExtension equals: @"txt"] AND: [FNIts.size lessThan: @10240]]]


## Insertion location references

    // a reference to end of documents of application "TextEdit"
    textedit.documents.end

    // a reference to before paragraph 1 of text of document 1 of application "TextEdit"
    [[textedit.documents at: 1].text.paragraphs at: 1].before


## `get` command

Get the name of every folder in the user's home folder:

    // tell application "Finder" to get name of every folder of home

    [[finder get: FNApp.home.folders.name] send]

Note that if the direct parameter is omitted from the argument list, the reference that the command is invoked on is used instead. For example, the above example would normally be written as:

    [[finder.home.folders.name get] send]


## `set` command

Set the content of a TextEdit document:

    // tell application "TextEdit" to set text of document 1 to "Hello World"

    [[[[textedit.documents at: 1].text set] to: @"Hello World"] send]


## `count` command

Count the words in a TextEdit document:

    // tell application "TextEdit" to count words of document 1

    [[[textedit.documents at: 1].words count] send]

Count the items in the current user's home folder:

    //tell application "Finder" to count items of home

    [[[finder.home count] each: FNSymbol.item] send]

(Note that Finder and many other Carbon applications require the `count` command's `each` parameter to be given.)


## `make` command

Create a new TextEdit document:

    // tell application "TextEdit" to make new document ¬
    //     with properties {text:"Hello World\n"}

    [[[[textedit make] new_: TESymbol.document]
             withProperties: @{TESymbol.text: @"Hello World\n"}] send]

Append text to a TextEdit document:

    // tell application "TextEdit" to make new paragraph ¬
    //     at end of text of document 1 ¬
    //     with properties {text:"Yesterday\nToday\nTomorrow\n"}

    [[[[[textedit make] new_: TESymbol.paragraph]
                          at: [TEApp.documents at: 1].text.end]
                    withData: @"Yesterday\nToday\nTomorrow\n"] send]


## `duplicate` command

Duplicate a folder to a disk, replacing an existing item if one exists:

    // tell application "Finder" to ¬
    //     duplicate folder "Projects" of home to disk "Work" with replacing

    [[[[[finder.home.folders byName: @"Projects"]
                                       duplicate] to: [FNApp.disks byName: @"Backup"]]
                                           replacing: AEMTrue] send]


## `add` command

Add every person with a known birthday to a group named "Birthdays": 

    // tell application "Address Book" to add ¬
    //     every person whose birth date is not missing value ¬
    //     to group "Birthdays"

    [[[[[addressBook people] byTest: [ABIts.birthDate notEquals: ABSymbol.missingValue]]
                                     add] to: [ABApp.groups byName: @"Birthdays"]] send]

