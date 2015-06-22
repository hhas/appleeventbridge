# Introduction

## What is AppleEventBridge?

AppleEventBridge allows you to control Apple event-aware ("AppleScriptable") Mac OS X applications from Swift programs.

For example, to get the value of the first paragraph of the topmost document in TextEdit:
    
    let textedit = TextEdit()

    let query = textedit.documents[1].paragraphs[1]

    let result = query.get() as! String

This is equivalent to the AppleScript statement:

    tell application id "com.apple.TextEdit"
        get paragraph 1 of document 1
    end tell


## "Hello World!" example

The following example uses AppleEventBridge to create a new "Hello World!" document in TextEdit:

    let textedit = TextEdit()

    let query = textedit.make(new: TET.document, withProperties: [TET.text: "Hello World!"])
