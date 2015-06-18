//
//  main.m
//  aebdemo
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"

#import "TEGlue/TEGlue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSError *error = nil;
        // build and send event using low-level 'AEM' API with four-char codes
        {
            // tell app "TextEdit" to get name of every document
            AEMApplication *te = [[AEMApplication alloc] initWithBundleID: @"com.apple.textedit"];
            AEMEvent *evt = [te eventWithEventClass: 'core' eventID: 'getd'];
            [evt setParameter: [[AEMApp elements: 'docu'] property: 'pnam'] forKeyword: '----'];
            id result = [evt sendWithError: &error];
            NSLog(@"1\nRESULT: %@\nERROR: %@", result, error); // result is array of all document names
        }
        // build and send event using high-level 'AEB' API with statically-generated glue classes
        {
            TEApplication *te = [TEApplication application];
            {
                // tell app "TextEdit" to make new document with properties {name: "TEST1", text: @"Hi!"}
                TEMakeCommand *cmd = [[[te.documents.end make] new_: TESymbol.document]
                                                     withProperties: @{TESymbol.name: @"TEST1", TESymbol.text: @"Hi!"}];
                id result = [cmd sendWithError: &error];
                NSLog(@"2\nRESULT: %@\nERROR: %@", result, error); // result is specifier for newly created document: [[TEApplication applicationWithName: @"/Applications/TextEdit.app"].documents byName: @"TEST1"]
            }
            {
                // tell app "TextEdit" to get name of document 1
                id result = [[te.documents at: 1].name getItemWithError: &error];
                NSLog(@"3\nRESULT: %@\nERROR: %@", result, error); // result is front document's name: "TEST1"
            }
            {
                // tell app "TextEdit" to get document 1000
                id result = [[te.documents at: 1000] getItemWithError: &error];
                NSLog(@"4\nRESULT: %@\nERROR: %@", result, error); // reports error: "Application error: Can't get reference. Invalid index. (-1719)"
            }
        }
    }
    return 0;
}
