# Creating and using static glues

## Generating a glue

The AppleEventBridge framework bundle includes an `aebglue` tool for generating static glue files containing high-level terminology-based APIs.

To put `aebglue` on your Bash shell's search path, add the following line to your `~/.bash_profile` (modify the path to `AppleEventBridge.framework` as needed):

    export $PATH="$PATH:/Library/Frameworks/AppleEventBridge.framework/Resources/bin"

To view the `aebglue` tool's full documentation:

    aebglue -h

`aebglue` generates Swift-based glues by default, so to generate an Objective-C glue instead you must include an `-o` flag. 

The following example generates a glue for the TextEdit application, using an auto-generated class name prefix (in this case `TET`), creating a new `TETGlue` folder in your current working directory:

    aebglue -o TextEdit

while the following command uses a custom class name prefix, `TE`, and creates the new `TEGlue` folder in your home directory's "Documents" folder:

    aebglue -o -p TE TextEdit ~/Documents

The generated glue folder also contains an `.sdef` file containing the application's dictionary (interface documentation) in the correct format. For example, to view the `TEGlue` terminology in Script Editor: 

    open -a 'Script Editor' ~/Documents/TEGlue/TextEdit.h.sdef

Refer to this documentation when using AppleEventBridge glues in your own code, as it shows element, property, command, etc. names as they appear in the generated glue classes. (Make sure Script Editor's dictionary viewer is set to "AppleScript" language; other formats are for use with OS X's Scripting Bridge/JavaScript for Automation bridges only.)

If an identically named folder already exists at the same location, `aebglue` will normally fail with a "path already exists" error. If you wish to force it to overwrite the existing folder without warning, add an `-r` option:

    aebglue -o -r TextEdit

For compatibility, `aebglue` normally sends the application an `ascr/gdte` event to retrieve its terminology in AETE format. However, some Carbon-based applications (e.g. Finder in 10.9 and 10.10) may have buggy `ascr/gdte` event handlers that return Cocoa Scripting's default terminology instead of the application's own. To work around this, add an `-s` option to retrieve the terminology in SDEF format instead:

    aebglue -o -s Finder

(Be aware that OS X's AETE-to-SDEF converter is not 100% reliable; for example, some four-char codes may fail to translate, in which case `aebglue` will warn of their omission. You'll have to correct the glue files manually should you need to use the affected features, or use the lower-level `AEM` APIs instead.)


## Using a glue

[TO DO: this covers ObjC; update for Swift once glue structure, etc. finalzied]

To include the generated glue files in your project:

1. Right-click on the Classes group in the left-hand Groups &amp; Files pane of the Xcode project window, and select Add &gt; Existing Files... from the contextual menu.

2. Select the generated glue folder (e.g. `TEGlue`) and click Add.

3. In the following sheet, check the "Copy items into destination group's folder" and "Recursively create groups for any added folders" options, and click Add.

You can now import the main `<var>XX</var>Glue/<var>XX</var>Glue.h` header file into your own files (where `<var>XX</var>` is the prefix code given in the `osaglue` command). For example:

    #import "TEGlue/TEGlue.h"

Each glue contains the following classes:

* `<var>XX</var>Symbol` -- represents Apple event type, enumerator, and property names, e.g. `TETSymbol`

* `<var>XX</var>Specifier` -- represents Apple Event Object Model queries (a.k.a. object specifiers), e.g. `TETSpecifier`

* `<var>XXNAME</var>Command` -- represents an application command (one class for each application command), e.g. `TETMakeCommand`, `TETMoveCommand`, etc. [TO DO: only in ObjC glues]

* `<var>XX</var>Application` -- represents an application, e.g. `TETApplication` [TO DO: in Swift glues, this class's name is derived from the application's own name, or the `-n` option if given; ObjC glues may be revised in future to adopt same naming scheme]


Each glue also provides three macros - `<var>XX</var>App`, `<var>XX</var>Con` and `<var>XX</var>Its` - for use in constructing object specifiers. [TO DO: only in ObjC glues; in Swift glues, the XXSymbol class provides three class vars, `app`, `con`, `its`, although this is not finalized and may change in future]


<p class="hilitebox">Note that the code examples in this manual assume the presence of suitable glues; e.g. TextEdit-based examples assume a TextEdit glue with the prefix `TET`, Finder-based examples assume a Finder glue with the prefix `FIN`, etc.</p>



## How keywords are converted

Because scriptable applications' terminology resources supply class, property, command, etc. names in AppleScript keyword format, `aebglue` must convert these terms to valid Objective-C class and method names when generating the glue files and accompanying `.sdef` documentation file. For reference, here are the conversion rules used:

* Characters a-z, A-Z, 0-9 and underscores (_) are preserved.

* Spaces, hyphens (-) and forward slashes (/) are removed, and the first character of all but the first word is capitalised, e.g. `document file` is converted to `documentFile`.

* Ampersands (&amp;) are replaced by the word 'And'.

* All other characters are converted to 0x00-style hexadecimal representations.

* Names that begin with '_', 'AEM', or 'AEB' have an underscore appended.

* Names that match ObjC keywords, `NSObject` methods, or methods already defined on AppleEventBridge's `AEBApplication` and `AEBSpecifier` classes have an underscore appended.

* AppleEventBridge provides default terminology for standard type classes such as `integer` and `unicodeText`, and standard commands such as `open` and `quit`. If an application-defined name matches a built-in name but has a different Apple event code, AppleEventBridge will append an underscore to the application-defined name.

