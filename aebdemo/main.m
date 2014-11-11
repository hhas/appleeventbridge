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
            AEMApplication *te = [[AEMApplication alloc] initWithBundleID: @"com.apple.textedit"];
            AEMEvent *evt = [te eventWithEventClass: 'core' eventID: 'getd'];
            [evt setParameter: [[AEMApp elements: 'docu'] property: 'pnam'] forKeyword: '----'];
            id result = [evt sendWithError: &error];
            NSLog(@"1\nRESULT: %@\nERROR: %@", result, error); // result is array of all document names
        }
        // build and send event using high-level 'AEB' API with statically-generated glue classes
        {
            TEApplication *te = [TEApplication applicationWithName: @"TextEdit"];
            {
                TEMakeCommand *cmd = [[[te.documents.end make] new_: TESymbol.document]
                                                     withProperties: @{TESymbol.name: @"TEST1"}];
                id result = [cmd sendWithError: &error];
                NSLog(@"2\nRESULT: %@\nERROR: %@", result, error); // result is specifier for newly created document
            }
            {
                id result = [[te.documents at: 1].name getItemWithError: &error]; // result is front document's name
                NSLog(@"3\nRESULT: %@\nERROR: %@", result, error);
            }
            {
                id result = [[te.documents at: 1000] getItemWithError: &error]; // raises bad index error (-1719)
                NSLog(@"4\nRESULT: %@\nERROR: %@", result, error);
            }
        }
    }
    return 0;
}
