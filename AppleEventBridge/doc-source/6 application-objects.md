# Application objects

## Creating application objects

Before you can communicate with a scriptable application you must create an application object. When targeting local applications, the glue's <code>+[<var>XX</var>Application application]</code> method is usually the best choice. For example, to target TextEdit:

    #import "TEGlue/TEGlue.h"

    TEApplication *textedit = [TEApplication application];

This uses the bundle identifier of the application from which the glue was originally generated (e.g. `com.apple.TextEdit`) to locate the application on the current machine, or returns `nil` if no match is found. (See `-[NSWorkspace URLForApplicationWithBundleIdentifier:]` for more information.)

Alternatively, one of the following methods may be used (e.g. if multiple versions of the application are installed, or the application is running on another machine):

    // application's name or full path (.app suffix is optional)
    + (instancetype)applicationWithName:(NSString *)name;
    
    // application's bundle ID
    + (instancetype)applicationWithBundleID:(NSString *)bundleID; 

    // `file:` URL for local application or `eppc:` URL for remote process
    + (instancetype)applicationWithURL:(NSURL *)url; 

    // Unix process id
    + (instancetype)applicationWithProcessID:(pid_t)pid; 

    // AEAddressDesc
    + (instancetype)applicationWithDescriptor:(NSAppleEventDescriptor *)desc; 

    // the current (host) process
    + (instancetype)currentApplication; 

For example, to target a specific version of InDesign by name:
    
    #import "AIDGlue/AIDGlue.h"

    AIDApplication *indesign = [AIDApplication applicationWithName: @"Adobe InDesign CS6.app"];

Or to control an iTunes process on another machine using Remote Apple Events:

    #import "ITSGlue/ITSGlue.h"

    NSURL *url = [NSURL URLWithString: @"eppc://jsmith@media-mac.local/iTunes"];
    ITSApplication *itunes = [ITSApplication applicationWithURL: url];


Note that local applications will be launched if not already running when `+application`, `+applicationWithName:`, `+applicationWithBundleID:` or `+applicationWithURL:` is invoked, and events will be sent to the running application according to its process ID. If the process is later terminated, that process ID is no longer valid and events sent subsequently using this application object will fail as application objects currently don't provide a 'reconnect' facility [TO DO: update this].

If `+applicationWithURL:` is invoked with an `eppc://` URL, or if `+applicationWithProcessID:` or `+applicationWithDescriptor:` are used, the caller is responsible for ensuring the target application is running before sending any events to it.



## Basic commands

All applications should respond to the following commands:

    -run // Run an application

    -activate // Bring the application to the front

    -reopen // Reactivate a running application

    -open: // Open the specified file(s), e.g. an NSArray of NSURL

    -print: // Print the specified file(s), e.g. an NSArray of NSURL

    -quit // Quit an application.
        -saving: AEBSymbol.yes | AEBSymbol.ask | AEBSymbol.no 
                 // optional; should currently open documents be saved first?


Some applications may provide their own definitions of some or all of these commands, so check their terminology before use.

AppleEventBridge also defines `get` and `set` commands for any scriptable application that doesn't supply its own definitions:

    -get: // Get the value of the given object specifier

    -set: // Set the value of the given object specifier
        -to: // The new value; may be anything

Note that these commands are only useful in applications that define an Apple Event Object Model as part of their Apple event interface.


## Transaction support

Application objects implement four additional methods, `-startTransactionWithSession:`, `-startTransaction`, `-endTransaction` and `-abortTransaction` that allow a sequence of related commands to be handled as a single operation by applications that support transactions, e.g. FileMaker Pro.

Once the application object's `-startTransaction` or `-startTransactionWithSession:` method is called, all subsequent commands to that application will be sent as part of the same transaction until `-endTransaction` or `-abortTransaction` is called.

The `-startTransactionWithSession:` method takes an argument that indicates the specific transaction session to open (in applications that support this).

Remember to call `-endTransaction` or `-abortTransaction` at the end of every transaction. (This includes transactions interrupted by a raised exception.) If a transaction is accidentally left open, AppleEventBridge will try to end it automatically when the application object is disposed of, but this is not guaranteed to succeed.


## Local application launching notes

Note: the following information only applies to local applications as AppleEventBridge cannot directly launch applications on a remote Mac. To control a remote application, the application must be running beforehand or else launched indirectly (e.g. by using the remote Mac's Finder to open it).


### How applications are identified

When you create an Application object by application name, bundle id or creator type, AppleEventBridge uses LaunchServices to locate an application matching that description. If you have more than one copy of the same application installed, you can identify the one you want by providing its full path, otherwise LaunchServices will identify the newest copy for you.

AppleEventBridge identifies locally run applications by their process ids so it's possible to control multiple versions of an application running at the same time if their Application objects are created using process ids or `eppc://` URLs.


### Checking if an application is running

You can check if the application specified by an Application object is currently running by calling its `-isRunning` method:

    - (BOOL)isRunning

This is useful if you don't want to perform commands on an application that isn't already running. For example:

    TEApplication *textedit = [TEApplication application];
    
    // Only perform TextEdit-related commands if it's already running:
    if (textedit.isRunning) {
        // all TextEdit-related commands go here...
    }

AppleEventBridge automatically launches a non-running application the first time your script makes sends a command. To avoid accidental launches, _all_ commands relating to that application must be included in a conditional block that only executes if `-isRunning` returns `YES`.


### Launching applications via `-launchApplicationWithError:`

When AppleEventBridge launches a non-running application, it normally sends it a `run` command as part of the launching process. If you wish to avoid this, you should start the application by sending it a `launch` command before doing anything else:

    - (BOOL)launchApplicationWithError:(NSError **)error;

    - (BOOL)launchApplication; // convenience shortcut for above

The result is a Boolean value indicating if the application was successfully launched (or was already running).

This is useful when you want to start an application without it going through its normal startup procedure, and is equivalent to the using AppleScript's `launch` command. For example, to launch TextEdit without causing it to display a new, empty document (its usual behaviour):

    TEApplication *textedit = [TEApplication application];
    [textedit launchApplication];
    // other TextEdit-related code goes here...

The lower level `AEMApplication` class also provides several class methods that allow fine-grained control over application launches.


### Restarting applications

As soon as you start to construct a reference or command using a newly created Application objects, if the application is not already running then AppleEventBridge will automatically launch it in order to obtain its terminology.

If the target application has stopped running since the Application object was created, trying to send it a command using that Application object will result in an invalid connection error (-609), unless that command is `run` or `launch`. This restriction prevents AppleEventBridge accidentally restarting an application that has unexpectedly quit while a script is controlling it. Scripts can restart an application by sending an explicit `run` or `launch` command, or by creating a new Application object for it.

Note that you can still use Application objects to control applications that have been quit _and_ restarted since the Application object was created. AppleEventBridge will automatically update the Application object's process id information as needed.


<p class="hilitebox">There is a known problem with quitting and immediately relaunching an application via AppleEventBridge, where the relaunch instruction is sent to the application before it has actually quit. This timing issue appears to be the OS's fault; one workaround is to send the `quit` command, wait until `-isRunning` returns `NO`, then send the `run`/`launch` command.</p>


