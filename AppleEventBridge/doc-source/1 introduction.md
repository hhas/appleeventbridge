# Introduction

## What is AppleEventBridge?

AppleEventBridge allows you to control Apple event-aware ("AppleScriptable") Mac OS X applications from Objective-C programs.

For example, to get the value of the first paragraph of the topmost document in TextEdit:

    TEApplication *te = [[TEApplication alloc] initWithName: @"TextEdit.app"];
                            
    TESpecifier *ref = [[te.documents at: 1].paragraphs at: 1];

    NSString *result = [[ref get] send];

This is equivalent to the AppleScript statement:

    tell application "TextEdit"
        get paragraph 1 of document 1
    end tell


## "Hello World!" example

The following program uses AppleEventBridge to create a new "Hello World!" document in TextEdit:

    #import "TEGlue/TEGlue.h"

    int main(int argc, char *argv[]) {
      @autoreleasepool {
        
        TEApplication *te = [[TEApplication alloc] initWithName: @"TextEdit.app"];
    
        TEMakeCommand *cmd = [[[te make] new_: TESymbol.document]
                               withProperties: @{TESymbol.text: @"Hello World!"}];
    
        [cmd send];
  
      }
      return 0;
    }

