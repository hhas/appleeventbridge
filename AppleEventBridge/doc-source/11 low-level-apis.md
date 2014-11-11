# Low-level APIs

## Introduction

AppleEventBridge's lower-level `AEM` classes provides a object-oriented wrapper around the low-level Apple Event Manager and NSAppleEventDescriptor APIs. It provides the following services:

* an object-oriented API for constructing object specifiers
* automatic conversion between standard Foundation classes and Apple event descriptors
* application location and launching, and AEAddressDesc creation
* Apple event construction and dispatch.

AEM provides a direct foundation for the high-level AppleEventBridge package. The AEM API can also be used directly by developers and end-users for controlling scriptable applications in situations where AppleEventBridge is unavailable or unsuitable. Some classes (e.g. `AEMCodecs`) may also be used when working with OSA-related classes such as `NSAppleScript`.

<p class="hilitebox">Note that this documentation is an API reference, not a full user guide. Some familiarity with Apple events and the Apple Event Manager is required in order to understand and use `AEM` classes.</p>


## API overview

The major AEM classes are as follows:

* `AEMApplication` – Represents a scriptable application, and provides methods for constructing `AEMEvent` instances.

* `AEMEvent` – Represents an Apple event, and provides methods for adding parameters and attributes, and for sending it.

* `AEMQuery`, `AEMSpecifier`, `AEMTest` – Abstract base classes for all object and test specifiers (see later). 

* `AEMCodecs` – Provides `-pack:` and `-unpack:` methods for converting Foundation values to NSAppleEventDescriptors, and vice-versa. Clients usually don't need to access this class directly.

* `AEMType`, `AEMEnum`, `AEMProperty` – Represent Apple event type, enumerator, and property name values.

In addition, supporting `AEMBoolean` and `AEMURL` classes are defined to represent Apple event types that do not have a precise Cocoa equivalent; see the [Objective-C/Apple event type mappings](objc-ae-type-mappings.html) chapter for details.

The following macros are exported for use in constructing application references:

* `AEMApp` – Returns an `AEMApplicationRoot` instance used to construct absolute references.

* `AEMCon` – Returns an `AEMCurrentContainerRoot` instance used to construct relative reference to container object (used in by-range specifiers).

* `AEMIts` – Returns an `AEMObjectBeingExaminedRoot` instance used to construct relative reference to object being tested (used in by-filter specifiers).

[TO DO: AEMCustomRoot]

All AEM specifiers are constructed from these base objects using chained property/method calls.


## Packing and unpacking data

The `AEMCodecs` class provides methods for converting Cocoa objects to `NSAppleEventDescriptor` instances, and vice-versa. See `AEMCodecs.h` for API documentation.

When using AEM to send events to other applications, clients don't normally need to work directly with this class; `AEMApplication` will automatically create an instance of `AEMCodecs` to be used by default.

`AEMCodecs` can be subclassed to modify the default packing and/or unpacking behaviour if necessary. For example, if dealing with a legacy application that requires text values to be supplied as `typeChar` instead of `typeUnicodeText` descriptors, the following subclass will modify the default packing behaviour to suit:

    @interface StringCodecs : AEMCodecs
    @end

    @implementation StringCodecs

    /* Pack strings as typeChar descriptors instead of typeUnicodeText */
    - (NSAppleEventDescriptor *)pack:(id)anObject {
        if ([anObject isKindOfClass: [NSString class]])
            return [[NSAppleEventDescriptor descriptorWithString: anObject] 
                    coerceToDescriptorType: typeChar];
        else
            return [super pack:anObject];
    }

    @end

Instances of this custom subclass can be passed to `AEMApplication`'s `-eventWithEventClass:eventID:returnID:codecs:` and `-eventWithEventClass:eventID:codecs:` methods to be used when adding attributes and parameters that event and unpacking its reply.


[TO DO: note about custom classes, with reference to chapter]


## Building queries

### About object specifiers

An object specifier (also known in AppleScript as a "reference") is a simple first-class query, constructed as a linked list of one or more Apple event descriptors of [primarily] `typeObjectSpecifier`. Object specifiers are used to identify properties and elements in the application's AEOM. Each object specifer contains four fields:

* `want` – four-char-code indicating desired element(s)'s class code (e.g. `'docu'` = document), or `'prop'` if it's a property specifier

* `from` – an object specifer identifying container object(s)</dd>

* `form` – four-char-code indicating how the element(s) should be selected (by index [`'indx'`], name [`'name'`], etc.), or `'prop'` if it's a property specifier</dd>

* `seld` – selector data (e.g. in a by-name specifier, this would be a string)

The Apple Event Manager provides several ways to construct object specifiers and assemble them into a complete reference, but these are all rather verbose and low-level. AppleEventBridge's `AEM` layer hides all these details behind an object-oriented wrapper that uses chained property and method calls to gather the data needed to create object specifiers and assemble them into linked lists.

For example, consider the AppleScript reference `text of document 1`. The code for constructing this object specifier using `NSAppleEventDescriptor` would be:

    NSAppleEventDescriptor *ref0, *ref1, *ref2;

    // Application root:
    ref0 = [NSAppleEventDescriptor nullDescriptor];

    // Pack 'document 1' element specifier:
    ref1 = [[NSAppleEventDescriptor recordDescriptor] coerceToDescriptorType: 'obj '];
    [ref1 setDescriptor: [NSAppleEventDescriptor descriptorWithTypeCode: 'docu'] forKeyword: 'want'];
    [ref1 setDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: 'indx'] forKeyword: 'form'];
    [ref1 setDescriptor: [NSAppleEventDescriptor descriptorWithInt32: 1] forKeyword: 'seld'];
    [ref1 setDescriptor: ref0 forKeyword: 'from'];

    // Pack 'text' property specifier:
    ref2 = [[NSAppleEventDescriptor recordDescriptor] coerceToDescriptorType: 'obj ';
    [ref2 setDescriptor: [NSAppleEventDescriptor descriptorWithTypeCode: 'prop'] forKeyword: 'want'];
    [ref2 setDescriptor: [NSAppleEventDescriptor descriptorWithEnumCode: 'prop'] forKeyword: 'form'];
    [ref2 setDescriptor: [NSAppleEventDescriptor descriptorWithTypeCode: 'ctxt'] forKeyword: 'seld'];
    [ref2 setDescriptor: ref1 forKeyword: 'from'];

    NSLog(@"ref2 = %@", ref2);

This code works by creating an empty record descriptor (`typeAERecord`), coercing it to the required type (`typeObjectSpecifier`), then adding the appropriate properties. Each object specifier descriptor is nested within the next to form a linked list of object specifier records; the last (innermost) descriptor indicates the reference's root object in the AEOM (in this case, the `application` object, which is represented by a null descriptor).

Now, compare the above with the AEM equivalent:

    id ref = [[[AEMApp elements: 'docu'] at: 1] property: 'ctxt'];

As you can see, AEM still uses low-level four-character codes to identify the `text` property and `document` class, but is otherwise a high-level object-oriented API. Once again, each reference begins with a root object, in this case `AEMApp`. New AEM specifiers are constructed by method calls; each call returning a new specifier object whose own methods can be called, and so on. This allows clients to build up a chain of AEM specifier objects that AEM can later pack into Apple event descriptors for sending to applications.

One more thing to notice: in AEM, specifying a class of elements and indicating which of those elements should be selected are performed by separate method calls, although the information provided will eventually be packed into a single descriptor of `typeObjectSpecifier`. This two-step approach makes it easier to integrate AEM with the higher-level AppleEventBridge bridge, which also uses two calls to construct element specifiers (one to specify the element class, e.g. `-document`, and another to specify the selection, e.g. `-at: 1`).

Note that `[AEMApp elements: 'docu']` is itself a valid reference, identifying _all_ the document elements of the application class. You do not have to call an explicit `all` selector (indeed, none is provided) as AEM automatically handles the details for you. AEM even allows for some convenient shorthand, e.g. writing:

    [[AEMApp elements: 'docu'] byTest: ...].first

is equivalent to writing:

    [[[AEMApp elements: 'docu'] byTest: ...] elements: 'docu'].first

This allows clients to specify the first document that matches the given condition without having to specify the element class a second time. In AppleScript, the equivalent to this is:

    first document whose ...

which is short for:

    first document of (documents whose ...)


### Reference forms

AEM defines a number of classes representing each of the AEOM reference forms (see `AEMQuery.h`, `AEMSpecifier.h`, and `AEMTestSpecifier.h`). There are nine AEOM reference forms, each represented by a different `AEMSpecifier` subclass:

* insertion location – `AEMInsertionSpecifier` refers to insertion point before or after/at start or end of element(s); e.g. `ref.before`

* property – `AEMPropertySpecifier`) refers to a property (whose value may be a basic AE type or object specifier); e.g. `[ref property: 'ctxt']`

* user property – `AEMUserPropertySpecifier` refers to a user-defined property (typically in an OSA applet); e.g. `[ref userProperty: @"myVar"]`

* element by index – `AEMElementByIndexSpecifier` refers to a single element in the referenced container object(s) by index; e.g. `[ref at: 3]`, `[ref byIndex: @3]`

* element by name – `AEMElementByNameSpecifier` refers to a single element in the referenced container object(s) by name; e.g. `[ref byName: @"Documents"]`

* element by id – `AEMElementByIDSpecifier` refers to a single element in the referenced container object(s) by unique id; e.g. `[ref byID: @3456]`

* element by ordinal – `AEMElementByOrdinalSpecifier` refers to first, middle, last or any element in the referenced container object(s); e.g. `ref.first`; `AEMAllElementsSpecifier` refers to all elements of the given class in the referenced container object(s); e.g. `[ref elements: 'docu']`


* element by relative position – `AEMElementByRelativePositionSpecifier` refers to the previous or next element of the given class in the referenced container object(s); e.g. `[ref next: 'cpar']`

* elements by range – `AEMElementsByRangeSpecifier` refers to a range of elements in the referenced container object(s), including start and end points; e.g. `[ref at: 2 to: -1]`, `[ref byRange: [[AEMCon elements: 'cpar'] at: 2] to: [[AEMCon elements: 'cpar'] last]]`

* elements by test – `AEMElementsByTestSpecifier` refers to all elements in the referenced container object(s) that meet the given condition(s); e.g. `[ref byTest: [[AEMIts property: 'pnam'] beginsWith: @"a"]]`


The following diagram shows the AEM reference class hierarchy (slightly simplified for legibility):

![AEM query class hierarchy](aem_query_inheritance.gif)

Clients shouldn't instantiate these classes directly; instead, AEM will instantiate them as appropriate when the client calls the methods of other AEM query objects, starting with the `AEMApp`, `AEMCon` and `AEMIts` objects that form the root of all AEM queries.

In fact, it isn't really necessary to remember the class hierarchy at all, only to know which concrete classes (shown in bold on the above diagram) support which methods. All public methods are inherited from just three abstract superclasses: `AEMObjectSpecifier`, `AEMMultipleElementsSpecifier`, and `AEMTest` (highlighted above). The following sections list these methods for reference.

### `AEMObjectSpecifier` methods

The abstract `AEMObjectSpecifier` class implements behaviors supported by all object specifiers.

* Construct an insertion location specifier:
    
        -(AEMInsertionSpecifier *)beginning;
        -(AEMInsertionSpecifier *)end;
        -(AEMInsertionSpecifier *)before;
        -(AEMInsertionSpecifier *)after;

* Identify a property:

        -(AEMPropertySpecifier     *)property:(OSType)propertyCode;
        -(AEMUserPropertySpecifier *)userProperty:(NSString *)propertyName;

* Identify all elements:

        -(AEMAllElementsSpecifier  *)elements:(OSType)classCode;

* Identify the previous or next element:

        -(AEMElementByRelativePositionSpecifier *)previous:(OSType)classCode;
        -(AEMElementByRelativePositionSpecifier *)next:(OSType)classCode;

* Construct a comparison test (for use on `AEMIts`-based references only):

        - (AEMGreaterThanTest     *)greaterThan:    (id)object;
        - (AEMGreaterOrEqualsTest *)greaterOrEquals:(id)object;
        - (AEMEqualsTest          *)equals:         (id)object;
        - (AEMNotEqualsTest       *)notEquals:      (id)object;
        - (AEMLessThanTest        *)lessThan:       (id)object;
        - (AEMLessOrEqualsTest    *)lessOrEquals:   (id)object;
        - (AEMBeginsWithTest      *)beginsWith:     (id)object;
        - (AEMEndsWithTest        *)endsWith:       (id)object;
        - (AEMContainsTest        *)contains:       (id)object;
        - (AEMIsInTest            *)isIn:           (id)object;


### `AEMMultipleElementsSpecifier` methods

The abstract `AEMMultipleElementsSpecifier` class extends `AEMObjectSpecifier` with additional behaviors appropriate to object specifiers that identify multiple elements.

* Identify a single element:

        -(AEMElementByOrdinalSpecifier *)first;
        -(AEMElementByOrdinalSpecifier *)middle;
        -(AEMElementByOrdinalSpecifier *)last;
        -(AEMElementByOrdinalSpecifier *)any;

        - (AEMElementByIndexSpecifier *)byIndex:(id)index; 
        - (AEMElementByIndexSpecifier *)at:(int)index;

        - (AEMElementByNameSpecifier  *)byName:(NSString *)name;

        - (AEMElementByIDSpecifier    *)byID:(id)id_;

  (The `-byIndex:` method's argument is normally an integer-based `NSNumber`, though some apps may accept additional types. The `-at:` method provides a convenient shortcut for `-byIndex:` when using `int`-based indexes.)

* Identify multiple elements by range:

        - (AEMElementsByRangeSpecifier *)byRange:(id)startSpecifier
                                              to:(id)stopSpecifier;
                                          
        - (AEMElementsByRangeSpecifier *)at:(int)startIndex
                                         to:(int)stopIndex;

  (The `-byRange:to:` method normally takes two `AEMApp`-/`AEMCon`-based specifiers, indicating the first and last elements in the range. `NSInteger` and `NSString` are also acceptable; these are automatically expanded to `AEMCon`-based by-index and by-name specifiers. The `-at:to:` method provides a convenient shortcut when using `int`-based indexes.)

* Identify multiple elements by test (the `testSpecifier` argument must be an `AEMIts`-based specifier):

        - (AEMElementsByTestSpecifier *)byTest:(AEMTest *)testSpecifier;


### `AEMTest` methods

The abstract `AEMTest` class implements Boolean logic tests applicable to all test specifiers:

    - (AEMANDTest *)AND:(id)remainingOperands;
    - (AEMORTest  *)OR:(id)remainingOperands;
    - (AEMNOTTest *)NOT;

(The `-AND:` and `-OR:` methods' `remainingOperands` argument may be either a single AEMTest instance or an NSArray of AEMTest instances.)


## Creating application objects

An `AEMApplication` instance represents an application to which Apple events will be sent. `AEMApplication` instances may be initialized using the application's name or full path (the `.app` suffix is optional), local `file://` or remote `eppc://` URL, bundle ID, Unix process ID, or an existing Apple event address descriptor:

    - (instancetype)initWithName:(NSString *)name
                   launchOptions:(NSWorkspaceLaunchOptions)options
                           error:(NSError * __autoreleasing *)error;

    - (instancetype)initWithName:(NSString *)name;
    
    - (instancetype)initWithURL:(NSURL *)url
                  launchOptions:(NSWorkspaceLaunchOptions)options
                          error:(NSError * __autoreleasing *)error;

    - (instancetype)initWithURL:(NSURL *)url;
    
    - (instancetype)initWithBundleID:(NSString *)bundleID
                       launchOptions:(NSWorkspaceLaunchOptions)options
                               error:(NSError * __autoreleasing *)error;

    - (instancetype)initWithBundleID:(NSString *)bundleID;
    
    - (instancetype)initWithProcessID:(pid_t)pid;

    - (instancetype)initWithDescriptor:(NSAppleEventDescriptor *)desc;

Applications identified by name/path, `file://` URL, or bundle ID will be launched automatically if not already running. You can use the `options` argument to customize the launching behavior (e.g. to hide the process upon launch); see the AppKit documentation for `NSWorkspaceLaunchOptions` for details. Once running, `AEMApplication` identifies the target application by its process ID for reliability. If the application cannot be launched (e.g. it can't be found) then the initializer returns `nil`; if the `error` argument is not `nil` then an `NSError` containing additional error information is also returned.

Applications identified by `eppc://` URL, process ID, or AEAddressDesc are not launched automatically, so must be running before the `AEMApplication` instance is used, or an error will occur when an Apple event is sent.

[TO DO: what utility methods to document? note: transaction methods aren't currently documented as no apps seem to use those nowadays]


## Sending Apple events

Sending an Apple event is a four-step process:

1. Create a new `AppleEvent` descriptor.

2. Add any parameters and/or attributes to the descriptor.

3. Send the Apple event to the target process.

4. Extract the return value or error information from the reply event (if any).

The `AEM` APIs streamline this process as follows:

1. Once an `AEMApplication` instance is created for the target process, send it the following message to create a new `AppleEvent` descriptor:

    - (id)eventWithEventClass:(AEEventClass)eventClass eventID:(AEEventID)eventID;

  The `eventClass` and `eventID` arguments are four-char codes representing the event handler's "name", the same as in `AECreateAppleEvent`/`+[NSAppleEventDescriptor appleEventWithEventClass:eventID:targetDescriptor:returnID:transactionID]`.
  
  This method normally returns a new `AEMEvent` instance representing a new `AppleEvent` descriptor targeted at this application.
  
  [TO DO: note that the above method is a shortcut? additional methods are available for customizing return event ID or codecs object, but the former is only used when sending events asynchronously (generally not done nowadays) and the latter is only relevant when implementing high-level bridges on top of AEM APIs]
  
  Should you need to customize event creation or dispatch, the `Class` objects used to construct this return value can be replaced by assigning alternate classes to an `AEMApplication` instance's `AEMEventClass` and/or `AppleEventDescriptorClass` properties. (Caution: Any replacement classes _must_ implement identical public interfaces to `AEMEvent` and `NSAppleEventDescriptor` respectively, otherwise "unrecognized selector" exceptions will occur.)

2. The following `AEMEvent` methods can be used to add any attributes and/or parameters to the `AppleEvent` descriptor:

        - (instancetype)setAttribute:(id)value forKeyword:(AEKeyword)key error:(NSError * __autoreleasing *)error;
        - (instancetype)setParameter:(id)value forKeyword:(AEKeyword)key error:(NSError * __autoreleasing *)error;

   The `AEMEvent` instance is returned on success. If a value cannot be added for any reason (e.g. if `AEMCodecs` is unable to pack it), `nil` is returned along with an optional `NSError` containing additional information. If error details are not required, the following shortcuts can be used instead:
    
        - (instancetype)setAttribute:(id)value forKeyword:(AEKeyword)key;
        - (instancetype)setParameter:(id)value forKeyword:(AEKeyword)key;

   [TO DO: also mention getters? (they're not used in sending events)]

   In addition, the `-[AEMEvent setUnpackFormat:type:]` method may be used to specify how the reply event's result descriptor should be unpacked:

        - (void)setUnpackFormat:(AEMUnpackFormat)format type:(DescType)type;

   The `type` argument is the AE type to which the returned descriptor should be coerced before unpacking; for example, to ensure the return value is unpacked as `NSString`, use `typeUnicodeText` (the default is `typeWildCard`). The `format` argument should be one of the following values:
   
   * `kAEMUnpackAsItem` – unpack the result descriptor as the specified type (this is the default)
   * `kAEMUnpackAsList` – coerce the result descriptor to `typeAEList`, then unpack each of its items as the specified type (the result is an `NSArray` of zero or more objects of the specified type)
   * `kAEMDontUnpack` – return the result descriptor (if any) without unpacking it.

3. The following `AEMEvent` method is used to dispatch the Apple event:

        - (id)sendWithMode:(AESendMode)sendMode 
                   timeout:(long)timeoutInTicks
                     error:(NSError **)error;

   The `sendMode` argument should be composed via bitwise-OR of zero or more of the following flags (see the Apple Event Manager documentation for details):

        kAENoReply
        kAEQueueReply
        kAEWaitReply
        kAEDontReconnect
        kAEWantReceipt
        kAENeverInteract
        kAECanInteract
        kAEAlwaysInteract
        kAECanSwitchLayer
   
   The `timeoutInTicks` argument is the number of ticks (1 tick = 1/60 sec) that the Apple Event Manager should wait for the target process to reply. If the process doesn't reply within that time, a timeout error is returned instead. The following constants may also be used: `kDefaultTimeout` or `kNoTimeOut`.
    
   On success, the reply event's return value is returned, or an `NSNull` or empty `NSArray` (depending on the unpack format specified) if no return value was given. If the event fails due to an Apple Event Manager error or an application error, `nil` is returned; if the `error` argument is not `nil` then an `NSError` object containing the `OSStatus` code and any other error details is also returned.

   The following shortcuts can also be used to dispatch the event with default mode (`kAEWaitReply`) and timeout (`kDefaultTimeout`) values:

        - (id)sendWithError:(NSError **)error;
        - (id)send;

   (Tip: Should you need to send an event without processing the reply event, extract the underlying `NSAppleEventDescriptor` from `AEMEvent.descriptor` and invoke its `-sendAppleEventWithMode:timeout:error:` method directly. The result is an `NSAppleEventDescriptor` instance containing the full reply event (or `nil` if an Apple Event Manager error occurred). This can be useful with applications such as Final Cut Pro that use non-standard parameter keys in their reply events.)
   
   Note that `-send...` methods are intended to be invoked once per `AEMEvent` instance. (The Apple Event Manager documentation doesn't specify behavior where multiple identical Apple events are received by a process; at miminum, each event should have a unique return ID to ensure reply events are correctly returned.)


## Examples

### Targeting applications

    AEMApplication *textedit;
    // application "TextEdit"
    textedit = [[AEMApplication alloc] initWithName: @"TextEdit"];

    // application id "com.apple.TextEdit"
    textedit = [[AEMApplication alloc] initWithBundleID: @"com.apple.TextEdit"];

    // application "Macintosh HD:Applications:TextEdit.app"
    NSURL *fileURL = [NSURL fileURLWithPath: @"/Applications/TextEdit.app"];
    textedit = [[AEMApplication alloc] initWithURL: fileURL];

    // application "TextEdit" of machine "eppc://jsmith@some-mac.local"
    NSURL *url = [NSURL URLWithString: @"eppc://jsmith@some-mac.local/TextEdit"];
    textedit = [[AEMApplication alloc] initWithURL: url];

### Building queries

    // text of every document
    AEMQuery *textRef = [[AEMApp elements: 'docu'] property: 'ctxt'];

    // end of every paragraph of text of document 1
    [[[[AEMApp elements: 'docu'] at: 1]
               property: 'ctxt']
               elements: 'cpar'].end;

    // paragraphs 2 thru last of first document
    [[[AEMApp elements: 'docu'].first
              elements: 'cpar'] byRange: [[AEMCon elements: 'cpar'] at: 2]
                                     to:  [AEMCon elements: 'cpar'].last];

    // paragraphs of document 1 where it != "\n"
    [[[[AEMApp elements: 'docu'] at: 1]
               elements: 'cpar'] byTest: [AEMIts notEquals: @"\n"]];

### Sending events

    // quit TextEdit
    AEMEvent *evt = [textedit eventWithEventClass: 'aevt' eventID: 'quit'];
    [evt send];

    // count documents of TextEdit
    AEMEvent *evt = [textedit eventWithEventClass: 'core' eventID: 'cnte'];
    [evt setParameter: [AEMApp elements: 'docu'] forKeyword: '----'];
    [evt send];

    // make new document at end of documents of TextEdit
    AEMEvent *evt = [textedit eventWithEventClass: 'core' eventID: 'crel'];
    [evt setParameter: [[AEMType typeWithCode: 'docu'] forKeyword: 'kocl'];
    [evt setParameter: [AEMApp elements: 'docu'].end   forKeyword: 'insh'];
    [evt send];

    // get name of front document of TextEdit, with error checking
    NSError *error = nil;
    AEMEvent *evt = [textedit eventWithEventClass: 'core' eventID: 'getd'];
    AEMQuery *nameRef = [[AEMApp elements: 'docu'].first property: 'pnam'];
    // (Note: -setParameter:forKeyword: returns nil on error.)
    evt = [evt setParameter: nameRef forKeyword: '----'];
    [evt setUnpackFormat: kAEMUnpackAsItem type: typeUnicodeText];
    NSString *result = [evt sendWithError: &error];
    if (result) {
        NSLog(@"Result: %@", result);
    } else {
        NSLog(@"Error: %@", error); // e.g. -1728 if no documents are open
    }

