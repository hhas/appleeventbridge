//
//  main.m
//  aebdemo
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"

#import "TEGlue/TEGlue.h"


@interface AEMThreadTest : NSThread
@end

@implementation AEMThreadTest

-(void)main {
    NSLog(@"start %@", self);
    TEApplication *te = [TEApplication application];
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
                NSLog(@"2\nRESULT: %@\nERROR: %@", result, error); // result is specifier for newly created document
            }
            {
                // tell app "TextEdit" to get name of document 1
                id result = [[te.documents at: 1].name getItemWithError: &error];
                NSLog(@"3\nRESULT: %@\nERROR: %@", result, error); // result is front document's name
            }
            {
                // tell app "TextEdit" to get document 1000
                id result = [[te.documents at: 1000] getItemWithError: &error];
                NSLog(@"4\nRESULT: %@\nERROR: %@", result, error); // reports bad index error (-1719)
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
    }
    return 0;
}
