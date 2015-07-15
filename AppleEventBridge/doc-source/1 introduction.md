# Introduction

## What is AppleEventBridge?

AppleEventBridge allows you to control Apple event-aware ("AppleScriptable") Mac OS X applications from «Swift»«Objective-C» programs.

For example, to get the value of the first paragraph of the topmost document in TextEdit:
«
    let result = try TextEdit().documents[1].paragraphs[1].get() as! String
»«
    id result = [[TEDApplication application].documents[1].paragraphs[1] getItem];
»
This is equivalent to the AppleScript statement:

    tell application id "com.apple.TextEdit" to get paragraph 1 of document 1


## "Hello World!" example

The following example uses AppleEventBridge to create a new "Hello World!" document in TextEdit:
«
    let textedit = TextEdit()

    try textedit.make(new: TED.document, withProperties: [TED.text: "Hello World!"])
»«
    TEApplication *textedit = [TEApplication application];

    [[[textedit.make new_: TED.document] withProperties @{TED.text: @"Hello World!"}] send];
»
