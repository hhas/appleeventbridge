//
//  main.m
//  aebdemo
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"

#import "TEDGlue.h"
#import "ITUGlue.h"



@interface AEMThreadTest : NSThread
@end
@implementation AEMThreadTest
-(void)main {
    NSLog(@"start %@", self);
    TEDApplication *te = [TEDApplication application];
    NSError *err = nil;
//    [[[[te.documents.end make] new_: TESymbol.document] timeout: 5] send];

    AEBCommand *cmd = [[te.documents.name get] timeout: 2];
    
//    NSLog(@"%@", cmd.AEMEvent);
    id result = [cmd sendWithError: &err];
    NSLog(@"ended %@\n%@ %@", self, ((NSArray *)result), err);
}
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSError *error = nil;
        // build and send event using low-level 'AEM' API with four-char codes
        /*
        {
            // tell app "TextEdit" to get name of every document
              AEMApplication *te = [[AEMApplication alloc] initWithBundleID: @"com.apple.textedit"];
            AEMEvent *evt = [te eventWithEventClass: 'core' eventID: 'getd'];
            [evt setParameter: [[AEMApp elements: 'docu'] property: 'pnam'] forKeyword: '----'];
            id result = [evt sendWithError: &error];
            AEMLog(@"\n1\nRESULT: %@\nERROR: %@", result, error); // result is array of all document names
        }*/
        // build and send event using high-level 'AEB' API with statically-generated glue classes
        {
            TEDApplication *te = [TEDApplication application];
          {
                // tell app "TextEdit" to make new document with properties {name: "TEST1", text: @"Hi!"}
                TEDMakeCommand *cmd = [[[te.documents.end make] new_: TEDSymbol.document]
                                                     withProperties: @{TED.name: @"TEST1", TED.text: @"Hi!"}];
                id result = [cmd sendWithError: &error];
                AEMLog(@"\n2\nRESULT: %@\nERROR: %@", result, error); // result is specifier for newly created document: [[TEApplication applicationWithName: @"/Applications/TextEdit.app"].documents byName: @"TEST1"]
            }
            {
                // tell app "TextEdit" to get name of document 1
                id result = [te.documents[-1].name getItemWithError: &error];
                AEMLog(@"\n3a\nRESULT: %@\nERROR: %@", result, error); // result is front document's name: "TEST1"
            }
            {
                // tell app "TextEdit" to get text of document "TEST1"
                id result = [te.documents[@"TEST1"].text getItemWithError: &error];
                AEMLog(@"\n3b\nRESULT: %@\nERROR: %@", result, error); // result is front document's name: "TEST1"
            }
            {
                // tell app "TextEdit" to count every document whose name contains "TEST"
                id result = [[te.documents[[TEDIts.name contains: @"TEST"]] count] sendWithError: &error];
                AEMLog(@"\n3c\nRESULT: %@\nERROR: %@", result, error); // result is front document's name: "TEST1"
            }
            {
                // tell app "TextEdit" to get document 1000
                id result = [te.documents[1000] getItemWithError: &error];
                AEMLog(@"\n4\nRESULT: %@\nERROR: %@", result, error); // reports error: "Application error: Can't get reference. Invalid index. (-1719)"
            }
        }
        /*
        {
            AEMThreadTest *thread; // TO DO: do background threads need their own mach ports if there's a main event loop?
            for (int i=0; i<5; i++) {
                thread = [[AEMThreadTest alloc] init];
                [thread start];//sleep(i/10.0 + 0.5);
            }
       //     int x = 0;
            NSLog(@"WAIT");
      //      for (int i=0;i<1000000000;i++) x = x + 2;
      //      NSLog(@"DONE %i", x);
            while (thread.executing) sleep(0.1);
            NSLog(@"FIN");
            sleep(1);
        }
         */
        {
            ITUApplication *itunes = [ITUApplication application];
            AEMLog(@"iTunes player state: %@", [[itunes playerState] getItem]);
            AEMLog(@"iTunes playlists: %@", [[itunes playlists].name getList]);
            // [[itunes play] send];
        }
    }
    return 0;
}
