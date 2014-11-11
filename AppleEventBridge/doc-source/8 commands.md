# Commands

## Using commands

Sending application commands in AppleEventBridge involves the following steps:

1. Create a new command instance, optionally supplying a direct parameter.
2. Add any attributes and/or keyword parameters to the command.
3. Send the command to the application, checking for a return value and/or command error as needed.

This granular approach provides plenty of power and flexibility along with a reasonably terse, efficient syntax.


### Creating a command

Each application command is defined as a pair of methods on the glue's <var>XXX</var>Application and <var>XXX</var>Specifier classes. One takes a value representing the command's direct parameter as its single argument, the other doesn't. For example, TextEdit's `duplicate` command is represented as:

    - (TEDuplicateCommand *)duplicate;
    - (TEDuplicateCommand *)duplicate:(id)directParameter;

(Note that all commands take this form, regardless of whether the application dictionary lists them as taking a direct parameter or not; it's up to the client to use them as appropriate.)

### Adding keyword parameters

Once a command object has been created, keyword parameters can be added one at a time. Each keyword parameter is represented by a method of the command object that takes a value of any class and returns `self`, allowing multiple parameter calls to be chained together for convenience. For example, TextEdit's `TEDuplicateCommand` class defines the following parameter methods:

    - (TEDuplicateCommand *)to:(id)value;
    - (TEDuplicateCommand *)withProperties:(id)value

Note: all required parameters must be supplied, along with zero or more optional parameters, before the command is sent, otherwise the target application will raise a 'missing parameter' error. The application dictionary will indicate if parameters are optional or required; for example, the `duplicate` command requires a direct parameter while the `to` and `withProperties` parameters are optional:

<pre><strong>duplicate:</strong> -- Copy object(s) and put the copies at a new location.
    <em>specifier</em> -- the object for the command
    [<strong>to:</strong> <em>insertionLocation</em>] -- The location for the new object(s).
    [<strong>withProperties:</strong> <em>record</em>] -- Properties to be set in the new duplicated object(s).</pre>


### Specifying considering/ignoring flags

Application commands may include flags that that instruct the application to consider or ignore case, diacriticals, etc. when comparing strings (e.g. when resolving equality tests in a by-test specifier). By default, AppleEventBridge specifies that case should be ignored and all other attributes considered; other options may be specified via the `-considering:` method:

    - (instancetype)considering:(UInt32)flags;

The `flags` argument should be composed from zero or more of the following bit masks:

    kAECaseConsiderMask
    kAEDiacriticConsiderMask
    kAEWhiteSpaceConsiderMask
    kAEHyphensConsiderMask
    kAEExpansionConsiderMask
    kAEPunctuationConsiderMask
    kASConsiderRepliesConsiderMask
    kASNumericStringsConsiderMask

    kAECaseIgnoreMask
    kAEDiacriticIgnoreMask
    kAEWhiteSpaceIgnoreMask
    kAEHyphensIgnoreMask
    kAEExpansionIgnoreMask
    kAEPunctuationIgnoreMask
    kASConsiderRepliesIgnoreMask
    kASNumericStringsIgnoreMask

(Note that, in practice, most applications don't respect considering/ignoring flags.)

### Specifying send mode flags

Every command object provides a `-sendMode:` method for specifying how the target application should handle the event:

    - (id)sendMode:(AESendMode)flags;

The Apple Event Manager defines the following `AESendMode` constants:

    enum {
        kAENoReply               = 0x00000001,
        kAEQueueReply            = 0x00000002,
        kAEWaitReply             = 0x00000003,

        kAENeverInteract         = 0x00000010,
        kAECanInteract           = 0x00000020,
        kAEAlwaysInteract        = 0x00000030,

        kAECanSwitchLayer        = 0x00000040,

        kAEDontRecord            = 0x00001000,
        kAEDontExecute           = 0x00002000,

        kAEProcessNonReplyEvents = 0x00008000
    };

By default, AppleEventBridge uses `kAEWaitReply` and `kAECanSwitchLayer`.

For convenience, a command object's reply mode can also be specified via the following methods:

    - (id)ignoreReply;
    - (id)queueReply;
    - (id)waitForReply;

See the Apple Event Manager documentation for more information.



### Specifying the event timeout

Every command object provides a `-timeout:` method for specifying the number of seconds the sender is willing to wait for the target application to reply when the `kAEWaitReply` send mode is used:

    - (instancetype)timeout:(long)timeout_;

The following constants may also be used here:

    kAEDefaultTimeout
    kNoTimeOut

See the Apple Event Manager documentation for more information.



### Specifying the reply value's desired type

Where supported by the target application's event handler, the sender can use a command object's `-requestedClass:`/`-requestedType:` method to specify the desired type for the reply value:

    - (id)requestedClass:(AEBSymbol *)classSymbol;
    - (id)requestedType:(DescType)type;


The target application will attempt to coerce the reply value to this type before returning it. The argument for `-requestedClass:` is usually a standard AE type, e.g. `[AEBSymbol alias]`, though may occasionally be an application-defined type. The `-requestedType:` method takes a descriptor type, e.g. `typeAlias` as argument.

Note that most applications don't support this option, and those that do usually only support it for `get` events (e.g. Finder).


### Specifying how the reply value should be unpacked

Command objects provide the following methods to control how `-sendWithError:` unpacks the returned result descriptor:

    - (id)returnClass:(AEBSymbol *)typeName;
    - (id)returnType:(DescType)type;

    - (id)returnList;

    - (id)returnListOfClass:(AEBSymbol *)classSymbol;
    - (id)returnListOfType:(DescType)type;

    - (id)returnDescriptor;

The `-returnClass:`/`-returnType:` method can be used to specify the AE type that the result descriptor returned by the application must be coerced to before unpacking. The default is `[AEBSymbol anything]`/`typeWildCard`.

The `-returnListOfClass:`/`-returnListOfType:` method is similar, except that the returned result descriptor is first coerced to to a list descriptor (`typeAEList`); each list item is then coerced to the specified type.

The `-returnList` method provides a convenient shortcut for `[cmd returnType: typeAEList]`.

Note that these coercions are performed on the returned value by the `-sendWithError:` method using built-in or user-installed AE coercion handlers (if available). If the coercion fails, `-sendWithError:` will return `nil` and the associated `NSError` instance will have error code -1700 (`errAECoercionFail`).

If the `-returnDescriptor` method is invoked, `-sendWithError:` will return the result descriptor as an `NSAppleEventDescriptor` object without unpacking it.

### Sending a command

To send a command, just call its `-sendWithError:` method:

    - (id)sendWithError:(NSError **)error;

This will send the command to the application and return one of the following:

* If the command is successful and the application supplies a return value, that value is returned.

* If the command is successful and the application doesn't supply a return value, an `NSNull` instance is returned.

* If the command is unsuccessful, either due to an Apple Event Manager error or an application error, `nil` is returned.


To determine if a command was successful or not, the calling code should check if the `-sendWithError:` message's result is an object or `nil`. 

Detailed error information is provided via the `-sendWithError:` method's error argument. On return, this will contain an NSError object that describes the Apple Event Manager or application error if one has occurred, or `nil` if the command was successful.

If detailed error information is not required, pass `nil` as the `-sendWithError:` method's error argument, or invoke the command object's `-send` method which provides a convenient shortcut for this:

    - (id)send;

As with `-sendWithError:`, the caller is responsible for checking the result of the `-send` message to determine if the command was successful or not.



## Examples

    // tell application "TextEdit" to activate
    [[textedit activate] send]


    // tell application "TextEdit" to open POSIX file "/Users/jsmith/help.txt"
    [[textedit open: [NSURL fileURLWithPath: @"/Users/jsmith/help.txt"]] send]


    // tell application "Finder" to get version
    [[finder.version get] send]


    // tell application "Finder" to set name of file "foo.txt" of home to "bar.txt"
    [[[[finder.home.files byName: @"foo.txt"].name set] to: @"bar.txt"] send]


    // tell application "TextEdit" to count (text of first document) each paragraph
    [[[textedit.documents.first.text count] each: TESymbol.paragraph] send]


    // tell application "TextEdit" to make new document at end of documents
    [[[textedit.documents.end make] new_: TESymbol.document] send]


    // tell application "Finder" to get items of home as alias list
    [[[finder.home.items get] requestedClass: TESymbol.alias] send]


    // tell application "TextEdit" to make new document with properties {text:"Hi!"}

    TEApplication *te = [TEApplication applicationWithName: @"TextEdit.app"];
    TEMakeCommand *makeCmd = [[[te make] new_: TESymbol.document]
                                         withProperties: @{TESymbol.text: @"Hi!"}];
    id result = [makeCmd send];


    // try
    //     tell application "TextEdit" to return text of document 2
    // on error errString number errNumber
    //     return "error:\n number: " &amp; errNumber &amp; "\n message: " &amp; errString 
    // end try

    TEApplication *te = [TEApplication applicationWithName: @"TextEdit.app"];
    TEGetCommand *getCmd = [te.documents at: 2].text;
    NSError *error = nil;
    NSString *result = [[getCmd returnType: typeUnicodeText] sendWithError: &error];
    if (result) {
        NSLog(@"Result:\n%@\n\n", result);
    } else {
        NSLog(@"Error %i:\n%@\n\n", error.code, error.localizedDescription);
    }


## Command errors

The `NSError` object returned by `-sendWithError:` when a command fails contains the following information:

* `domain` – The NSError domain is `kASErrorDomain`.

* `code` – This is the Carbon `OSStatus` error code returned by the Apple Event Manager, the target application, or AppleEventBridge itself. This value is also available as an `NSNumber` under the `kASErrorNumberKey` key in the `userInfo` dictionary.

* `localizedDescription` – This is a human-readable description of the error generated by AppleEventBridge.

* `userInfo` – The `userInfo` dictionary contains an `kASErrorNumberKey` key and zero or more additional keys:

    * `kASErrorNumberKey` – the Carbon error code
    * `kASErrorStringKey` – error string returned by application, if given
    * `kASErrorBriefMessageKey` – brief error string returned by application, if given
    * `kASErrorExpectedTypeKey` – AE type responsible for a coercion error (-1700), if given
    * `kASErrorOffendingObjectKey` – value or object specifer responsible for error, if given
    * `kASErrorFailedEvent` – the `ASCommand` instance for the failed command



## Special cases

The following special-case behaviours are implemented for convenience:

1. Commands that take a reference to one or more application objects as their direct parameter may be written in the following form:

        [reference command]

   The conventional form is also supported should you ever wish (or need) to use it:

        [application command: reference]

   The two forms are equivalent (AppleEventBridge converts the first form to the second behind the scenes) although the first form is preferred for conciseness. 


2. If a command is called on a reference object and a direct parameter is also given, i.e.:

        [reference command: directParameter]

   The reference upon which it is called will be packed as the Apple event's 'subject' attribute (`keySubjectAttr`).


3. The following methods are provided as convenient shortcuts for creating and sending `get` and `set` commands:

        // shortcut for [[[ref set] to: value] send]
        - (id)setItem:(id)data;
        - (id)setItem:(id)data error:(NSError **)error;

        // shortcut for [[ref get] send]
        - (id)getItem; 
        - (id)getItemWithError:(NSError **)error;

        // shortcut for [[[ref get] returnList] send]
        - (id)getList;
        - (id)getListWithError:(NSError **)error;

        // shortcut for [[[[ref get] requestedType: descType] returnType: descType] send]
        - (id)getItemOfType:(DescType)type;
        - (id)getItemOfType:(DescType)type error:(NSError **)error;

        // shortcut for [[[[ref get] requestedType: descType] returnListOfType: descType] send]
        - (id)getListOfType:(DescType)type;
        - (id)getListOfType:(DescType)type error:(NSError **)error;

        // shortcuts for getting numerical property values as C primitives
        - (int)getIntWithError:(NSError **)error;
        - (long)getLongWithError:(NSError **)error;
        - (double)getDoubleWithError:(NSError **)error;


