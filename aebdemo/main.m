//
//  main.m
//  aebdemo
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"

#import "TEDGlue/TEDGlue.h"
#import "ITUGlue/ITUGlue.h"

void AEMLog(NSString *format, ...) {
    va_list argList; va_start (argList, format);
    NSString *message = [[NSString alloc] initWithFormat: format arguments: argList];
    va_end (argList); CFShow((CFStringRef)message);
}

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
            AEMLog(@"1\nRESULT: %@\nERROR: %@", result, error); // result is array of all document names
        }
        // build and send event using high-level 'AEB' API with statically-generated glue classes
        {
            TEDApplication *te = [TEDApplication application];
            {
                // tell app "TextEdit" to make new document with properties {name: "TEST1", text: @"Hi!"}
                TEDMakeCommand *cmd = [[[te.documents.end make] new_: TEDSymbol.document]
                                                     withProperties: @{TED.name: @"TEST1", TED.text: @"Hi!"}];
                id result = [cmd sendWithError: &error];
                AEMLog(@"2\nRESULT: %@\nERROR: %@", result, error); // result is specifier for newly created document: [[TEApplication applicationWithName: @"/Applications/TextEdit.app"].documents byName: @"TEST1"]
            }
            {
                // tell app "TextEdit" to get name of document 1
                id result = [[te.documents at: 1].name getItemWithError: &error];
                AEMLog(@"3\nRESULT: %@\nERROR: %@", result, error); // result is front document's name: "TEST1"
            }
            {
                // tell app "TextEdit" to get document 1000
                id result = [[te.documents at: 1000] getItemWithError: &error];
                AEMLog(@"4\nRESULT: %@\nERROR: %@", result, error); // reports error: "Application error: Can't get reference. Invalid index. (-1719)"
            }
        }
        {
            ITUApplication *itunes = [ITUApplication application];
            AEMLog(@"iTunes player state: %@", [[itunes playerState] getItem]);
            AEMLog(@"iTunes playlists: %@", [[itunes playlists].name getList]);
            // [[itunes play] send];
        }
    }
    return 0;
}
