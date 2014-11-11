# Creating and using static glues

## Generating a glue

The AppleEventBridge framework bundle includes an `aebglue` tool for generating static glue files containing high-level terminology-based APIs.

To put `aebglue` on your Bash shell's search path, add the following line to your `~/.bash_profile` (modify the path to `AppleEventBridge.framework` as needed):

    export $PATH="$PATH:/Library/Frameworks/AppleEventBridge.framework/Resources/bin"

To view the `aebglue` tool's full documentation:

    aebglue -h

The following example generates a glue for the TextEdit application, using `TE` as the class name prefix, and saving the generated glue to your home folder as `TEGlue`:

    aebglue -a TextEdit  -p TE -o ~/TEGlue

The generated glue includes an `.sdef` file containing the application's dictionary documentation in AEB format. For example, to view the `TEGlue` terminology in Script Editor: 

    open -a 'Script Editor' ~/TEGlue/TextEdit.sdef


## Using a glue

To include the generated glue files in your project:

1. Right-click on the Classes group in the left-hand Groups &amp; Files pane of the Xcode project window, and select Add &gt; Existing Files... from the contextual menu.

2. Select the generated glue folder (e.g. `TEGlue`) and click Add.

3. In the following sheet, check the "Copy items into destination group's folder" and "Recursively create groups for any added folders" options, and click Add.

You can now import the main `<var>XX</var>Glue/<var>XX</var>Glue.h` header file into your own files (where `<var>XX</var>` is the prefix code given in the `osaglue` command). For example:

    #import "TEGlue/TEGlue.h"

Each glue contains the following classes:

* `<var>XX</var>Symbol` -- represents Apple event type, enumerator, and property names, e.g. `TESymbol`

* `<var>XX</var>Specifier` -- represents Apple Event Object Model queries (a.k.a. object specifiers), e.g. `TESpecifier`

* `<var>XXNAME</var>Command` -- represents an application command (one class for each application command), e.g. `TEMakeCommand`, `TEMoveCommand`, etc.

* `<var>XX</var>Application` -- represents an application, e.g. `TEApplication`


Each glue also provides three macros - `<var>XX</var>App`, `<var>XX</var>Con` and `<var>XX</var>Its` - for use in constructing object specifiers.


<p class="hilitebox">Note that the code examples in this manual assume the presence of suitable glues; e.g. TextEdit-based examples assume a TextEdit glue with the prefix `TE`, Finder-based examples assume a Finder glue with the prefix `FN`, etc.</p>



## How keywords are converted

Because application terminology resources specify AppleScript-style keywords for class, property, command, etc. names, AppleEventBridge uses the following rules to translate these keywords to legal ObjC class and method names:

* Characters a-z, A-Z, 0-9 and underscores (_) are preserved.

* Spaces, hyphens (-) and forward slashes (/) are removed, and the first character of all but the first word is capitalised, e.g. `document file` is converted to `documentFile`.

* Ampersands (&amp;) are replaced by the word 'And'.

* All other characters are converted to 0x00-style hexadecimal representations.

* Names that begin with '_', 'AEM', or 'AEB' have an underscore appended.

* Names that match ObjC keywords, `NSObject` methods, or methods already defined on AppleEventBridge's `AEBApplication` and `AEBSpecifier` classes have an underscore appended. The reserved method names are: [TO DO]

AppleEventBridge provides default terminology for standard type classes such as `integer` and `unicodeText`, and standard commands such as `open` and `quit`. If an application-defined name matches a built-in name but has a different Apple event code, AppleEventBridge will append an underscore to the application-defined name.


