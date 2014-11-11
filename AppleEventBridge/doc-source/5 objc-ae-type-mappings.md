# Objective-C/Apple event type mappings

## Overview

The following standard AE types are mapped to and from Foundation/AppleEventBridge classes as follows:

<table width="100%" summary="AE-Foundation type mappings">
<thead>
<tr><th>AppleScript type</th><th>AE type</th><th>`AEBSymbol` name</th><th>Objective-C class</th></tr>
</thead>
<tbody>
<tr><td>(no data)</td><td>`typeNull`</td><td>`null`</td><td>`NSNull`</td></tr>
<tr><td>`boolean`</td><td>`typeBoolean`</td><td>`boolean`</td><td>`AEMBoolean`</td></tr>
<tr><td>`integer`</td><td>`typeSInt32`</td><td>`integer`</td><td>`NSNumber`</td></tr>
<tr><td>`real`</td><td>`typeIEEE64BitFloatingPoint`</td><td>`float`</td><td>`NSNumber`</td></tr>
<tr><td>`[Unicode] text` [1]</td><td>`typeUnicodeText`</td><td>`unicodeText`</td><td>`NSString`</td></tr>
<tr><td>`list`</td><td>`typeAEList`</td><td>`list`</td><td>`NSArray`</td></tr>
<tr><td>`record`</td><td>`typeAERecord`</td><td>`record`</td><td>`NSDictionary`</td></tr>
<tr><td>`date`</td><td>`typeLongDateTime`</td><td>`date`</td><td>`NSDate`</td></tr>
<tr><td>`«class bmrk»`</td><td>`typeBookmarkData`</td><td>`bookmarkData`</td><td>`AEMURL`</td></tr>
<tr><td>`alias`</td><td>`typeAlias`</td><td>`alias`</td><td>`AEMURL`</td></tr>
<tr><td>`«class furl»`</td><td>`typeFileURL`</td><td>`fileURL`</td><td>`AEMURL`</td></tr>
<tr><td>`reference`</td><td>`typeObjectSpecifier`</td><td>`reference`</td><td>`AEMSpecifier`/`AEBSpecifier` [3]</td></tr>
<tr><td>`location reference`</td><td>`typeInsertionLoc`</td><td>`locationReference`</td><td>`AEMSpecifier`/`AEBSpecifier` [3]</td></tr>
<tr><td>`class`</td><td>`typeType`</td><td>`typeClass`</td><td>`AEMType/AEBSymbol` [3]</td></tr>
<tr><td>`constant`</td><td>`typeEnumerated`</td><td>`enumerator`</td><td>`AEMEnum/AEBSymbol` [3]</td></tr>
<tr><td>`property`</td><td>`typeProperty`</td><td>`property`</td><td>`AEMProp/AEBSymbol` [3]</td></tr>
</tbody>
</table>

[1] AppleScript treats `string`, `text`, and `Unicode text` keywords as synonyms for `typeUnicodeText`. When specifying a command's return type, always use `AEB.unicodeText`/`typeUnicodeText`.

[2] Static glues define their own `AEBSpecifier` and `AEBSymbol` subclasses.


## Mapping notes

While AE-ObjC type conversions generally work quite seamlessly, it is sometimes useful to know some of the details involved, particularly when troubleshooting code that deals with older or buggy applications. The following sections provide additional information.


### Boolean

AppleEventBridge currently maps `typeBoolean` descriptors to its own `AEMBoolean` class. `AEMTrue` and `AEMFalse` macros are also provided for convenience. [TO DO: this may change in future, if/when a robust mapping to `NSNumber` or an `NSNumber` subclass is implemented.]

(AppleEventBridge can also unpack descriptors of `typeTrue` and `typeFalse`, though these are not normally used by applications.)


### Numbers

While the Apple Event Manager defines a range of numerical descriptor types with different bit-widths and formats, most applications normally use `typeSInt32` (`int`) and `typeIEEE64BitFloatingPoint` (`double`) only.

When packing a signed integer, AppleEventBridge will pack it either as a 32-bit signed integer (most preferred), 64-bit signed integer, or 64-bit float (least preferred), depending on the value's size. When packing a 32-bit unsigned integer, AppleEventBridge will pack it as a 32-bit signed integer if possible.


### Strings

When packing and unpacking `NSString` instances, AppleEventBridge uses the `NSAppleEventDescriptor` class's `+descriptorWithString:` and `-stringValue` methods, both of which use descriptors of `typeUnicodeText`, coercing other types as needed.

Note that while the CoreServices framework's `AEDataModel.h` header states that `typeUnicodeText` is deprecated in favor `typeUTF8Text` and `typeUTF16ExternalRepresentation`, it remains in widespread use; therefore AppleEventBridge continues to use `typeUnicodeText` to ensure the broadest compatibility with existing scriptable applications.

Some older applications may return text values as descriptors of `typeChar`, `typeIntlText`, or `typeStyledText`. These types are long-deprecated and their use strongly discouraged in Mac OS X. AppleEventBridge will coerce these descriptors to `typeUnicodeText` before unpacking them, or return nil/error if the coercion fails.


### File system references

The Apple Event Manager defines a number of modern (`typeFileURL`, `typeBookmarkData`), legacy (`typeAlias`), and deprecated (`typeFSRef`, `typeFSS`) descriptor types for identifying file system objects. Object specifiers of form `{want:file,from:null,form:name,seld:"HFS:PATH:STRING"}` (an AppleScript-ism) are also recognized by most applications. Fortunately, the Apple Event Manager also implements a number of coercion handlers for coercing between these types, so when interacting with most applications you should not need to know or care exactly which of these types are used: the application should coerce supplied values to whichever type(s) it requires.

AppleEventBridge always packs `NSURL` instances containing `file://` URLs as descriptors of `typeFileURL`, which the majority of applications should accept.

AppleEventBridge unpacks all file system descriptors as `AEMURL` instances. AppleEventBridge defines `AEMURL` as  a subclass of `NSURL`, so `AEMURL` instances should be accepted by any Cocoa API that uses `NSURL`. Unlike `NSURL`, however, an `AEMURL` instance retains the original Apple event descriptor from which it was created, allowing descriptors to be fully round-tripped. For example, if an application comman returns a `typeAlias` descriptor, then the resulting `AEMURL` will re-pack as the same `typeAlias` descriptor when used in another command.

While OS X has deprecated HFS path strings in favor of POSIX, some older Carbon applications may still occasionally require these. `AEMURL` provides the following compatibility methods for converting to and from HFS path strings:

    - (instancetype)initFileURLWithHFSPath:(NSString *)path;

    - (NSString *)HFSPath;

`AEMURL` also defines the following method in case the underlying descriptor needs to be coerced to a specific AE type:

    - (instancetype)coerceToDescriptorType:(DescType)descType;

The `descType` argument should be one of the following: `typeAlias`, `typeFileURL`, `typeObjectSpecifier`, or `typeBookmarkData`. (`typeFSRef` or `typeFSS` may also be used, but as these are deprecated/not fully supported they are not guaranteed to work correctly).

For example, if an application requires a `typeAlias` descriptor but doesn't coerce the given value itself:

    AEMURL *url = [[AEMURL fileURLWithPath: @"/some/path..."]
                           coerceToDescriptorType: typeAlias];
    
Be aware when specifying a command's required/result type, you must specify the exact AE type (`AEMSymbol.alias`/`typeAlias`, `AEMSymbol.fileURL`/`typeFileURL`, etc). For example, the Finder normally returns file system references as object specifiers:

        [[finder.home get] send]
        // Result: [[[Finder.startupDisk elements: @"cfol"] byName: @"Users"] ...]

 To get the current user's home folder as an `AEMURL` instead:

        [[[finder.home get] resultType: AEBSymbol.fileURL] send]
        // Result: <NSURL file:///Users/jsmith>


### Records

The `typeAERecord` AE type is a struct-like data structure containing zero or more properties. AppleEventBridge represents AE records as `NSMutableDictionary` instances. The keys in this dictionary are normally instances of `AEBSymbol` or glue-defined subclass representing AppleEventBridge-style property names, e.g. `TESymbol.text`. Dictionary keys may also be `AEMType`/`AEMProperty` instances (if no equivalent human-readable terminology exists) or `NSString` instances representing "user-defined" keys (an AppleScript-ism, rarely used by applications).

If a dictionary includes a `AEBSymbol.class_` (or `[AEMProperty propertyWithCode:'pcls']`) key containing a `AEBSymbol`/`AEMType` type value, AppleEventBridge will pack the other items into an AE record coerced to the specified type. Similarly, when unpacking an record-based descriptor that isn't `typeAERecord`, `typeObjectSpecifier` or other known type, AppleEventBridge will unpack it as an `NSDictionary` instance with an additional `AEBSymbol.class_` key and `AEBSymbol`/`AEMType` value to indicate the descriptor's type.


### Types and enumerators

For your convenience, AppleEventBridge represents Apple event type names and application-specific class and enumerator names as instances of the glue's `AEBSymbol` subclass. Examples:

    // AEM-defined data types
    TESymbol.boolean
    TESymbol.unicodeText
    TESymbol.list

    // Application-defined class names
    TESymbol.document
    TESymbol.window
    TESymbol.disk

    // Application-defined enumerators
    TESymbol.yes
    TESymbol.no
    TESymbol.ask

Occasionally an application dictionary defines a type or enumerator without providing it with a corresponding name name. In these cases, the value will be represented as a raw `AEMType` or `AEMEnum` instance instead, e.g.: 

    [AEMType typeWithCode: 'abcd']
    [AEMEnum enumWithCode: 'xyz ']

Descriptors of `typeType`, `typeEnumerated`, and `typeProperty` are unpacked as `AEBSymbol` subclass instances when the corresponding terminology is available, otherwise they are unpacked as `AEMType`, `AEMEnum`, and `AEMProperty` respectively.


### Other types

The Apple Event Manager defines many other AE types whose names and codes are defined by AppleEventBridge for completeness. A few of these types are of occasional interest to users, the rest can simply be ignored. In most cases, values of these types will be represented by `NSAppleEventDescriptor` instances as AppleEventBridge doesn't automatically convert them.

[TO DO: AEB includes support for unit types, though these are poorly documented by Apple and rarely used by applications, and something of a pain in general. Like transaction support, this feature seems headed for real-world extinction, so isn't documented here.]


