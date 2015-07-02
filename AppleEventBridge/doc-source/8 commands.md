# Commands
// TO DO: waitReply should be nil; all attributes should be kAEBNoAttribute (or make them all AEBNoValue/AEBNoArgument?)

## Syntax

For convenience, AppleEventBridge makes application commands available as methods on every object specifier. (Note: due to the limitations of aete-based terminology, the user must determine for themselves which commands can operate on a particular reference. Some applications document this information separately.) All application commands have the same basic structure: a single, optional direct parameter, followed by zero or more named parameters specific to that command, followed by zero or more event attributes that determine how the Apple event is processed:

<pre><code>func <var>commandName</var>(directParameter: AnyObject = kAEBNoParameter,
                 <var>namedParameter1:</var> AnyObject = kAEBNoParameter,
                 <var>namedParameter2:</var> AnyObject = kAEBNoParameter,
                 ...
                 returnType:      AEBReturnType?         = nil,
                 waitReply:       Bool?                  = nil,
                 withTimeout:     NSTimeInterval?        = nil,
                 considering:     AEBConsiderIgnoreType? = nil,
                 ignoring:        AEBConsiderIgnoreType? = nil) throws -> AnyObject!</code></pre>

* `directParameter:` -- An application command can have either zero or one direct parameters. The application's dictionary indicates which commands take a direct parameter, and if it is optional or required.

* `namedParameterN:`An application command can have zero or more named parameters. The application's dictionary describes the named parameters for each command, and if they are optional or required.

* `returnType:` -- Some applications may allow the return value's type to be specified for certain commands (typically `get`). For example, the Finder's `get` command returns filesystem references as alias objects if the resulttype is `FIN.alias`. [TO DO: this is preliminary and subject to change]

* `waitReply:` -- If `true` (the default), the command will block until the application sends a reply or the request times out. If `false`, it will return as soon as the request is sent, ignoring any return values or application errors.

* `withTimeout:` -- The number of seconds to wait for the application to reply before raising a timeout error. The default timeout (`AEBDefaultTimeout`) is 120 seconds but this can be changed if necessary; use `AEBNoTimeout` to wait indefinitely. For example, a longer timeout may be needed to prevent a timeout error occurring during a particularly long-running application command. Note: due to a quirk in the Apple Event Manager API, timeout errors may be reported as either error -1712 (the Apple event timed out) or -609 (connection invalid, which is also raised when an application unexpectedly quits while handling a command).

* `considering:`/`ignoring:` -- Some applications may allow the client to specify text attributes that should be considered or ignored when performing string comparisons, e.g. when resolving by-test references. When specifying the attributes to ignore, the list should contain zero or more of the following enumerators: `XX.case`, `XX.diacriticals`, `XX.numericStrings`, `XX.hyphens`, `XX.punctuation`, `XX.whitespace` [TO DO: these are standard terms so should eventually be defined on AEBSymbol base class, allowing `AEB.case`, etc to be used across all apps, but for now must use the glue's own prefix code, e.g. `TED.case`]. Note that most applications currently ignore this setting and always use the default behaviour, which is to ignore case but consider everything else.



## Examples

    // tell application "TextEdit" to activate
    TextEdit().activate()

    // tell application "TextEdit" to open fileList
    TextEdit().open(fileList)

    // tell application "Finder" to get version
    Finder().version.get()

    // tell application "Finder" to set name of file "foo.txt" of home to "bar.txt"
    Finder().home.files["foo.txt"].name.set(to: "bar.txt")

    // tell application "TextEdit" to count (text of first document) each paragraph
    TextEdit().documents.first.text.count(each: TED.paragraph)

    // tell application "TextEdit" to make new document at end of documents
    TextEdit().documents.end.make(new: TED.document)

    // tell application "Finder" to get items of home as alias list
    Finder().home.items.get(returnType: FIN.alias)



## Special cases

The following special-case behaviours are implemented for convenience:

* Commands that take an object specifier as a direct parameter may be written in the following form:

        objSpec.command(namedParameter1:, namedParameter2:, ...)

    The conventional form is also supported should you ever wish (or need) to use it:

        appObj.command(objSpec, namedParameter1:, namedParameter2:, ...)

The two forms are equivalent (`AEBSpecifier` converts the first form to the second behind the scenes) although the first form is preferred for conciseness.


* If a command that already has a direct parameter is called on an object specifier, i.e.:

        objSpec.command(directParameter:, ...)

the object specifier upon which it is called will be packed as the Apple event's "subject" attribute (`keySubjectAttr`).


* If the `make` command is called on an insertion location specifier (`before`/`after`/`beginning`/`end`), appscript will pack that specifier as the Apple event's `at:` parameter if it doesn't already have one; i.e.:

        insertionLoc.make(new: className)

   is equivalent to:

        appObj.make(new: className, at: insertionLoc)

   If the `make` command is called on an object specifier, appscript will pack that specifier as the Apple event's "subject" attribute. Be aware that some applications may not handle this attribute correctly, in which case the specifier should be passed via the `make` command's `at:` parameter.


## Command errors

The `AEBCommandError` exception describes an error raised by the target application or Apple Event Manager when sending a command.

    CommandError(Exception)

        Properties:
            errornumber : int -- Mac OS error number
            errormessage : str -- application-supplied/generic error description
            offendingobject : anything | None -- object that caused the error, 
                                                 if given by application
            expectedtype : anything | None -- object that caused a coercion error, 
                                              if given by application
            partialresult : anything | None -- part of return value constructed 
                                               before error occurred, if given 
                                               by application

        Methods:
    
            __int__() -- Mac OS error number

            __str__() -- formatted description of error



## Note to AppleScript users

Unlike AppleScript, which implicitly sends a `get` command to any unresolved application object references at the end of evaluating an expression, appscript only resolves a reference when it receives an appropriate command. For example:

    let v = TextEdit().documents

is _not_ the same as:

    set v to documents of app "TextEdit"

even though the two may look similar. In the first case, the value assigned to `d` is an object specifier: `TextEdit(name: "/Applications/TextEdit.app").documents`. In the second, AppleScript evaluates the `documents of app "TextEdit"` reference by performing an implicit `get` command and then assigning its result, a list of references to individual documents, to `v`. To obtain the original reference as an AppleScript value, the literal reference must be preceded by an `a reference to` operator as shown below.

To get a single reference to all documents:

    set v to a reference to documents of app "TextEdit"
    v
    --> a reference to documents of app "TextEdit"


    let v = TextEdit().documents
    print(v)
    // TextEdit(name: "/Applications/TextEdit.app").documents


To get a list of references to each document:

    set v to get documents of app "TextEdit" -- (explicit 'get' is optional)
    v
    --> {document 1 of app "TextEdit", document 2 of app "TextEdit"}


    let v = TextEdit().documents.get() // (explicit 'get' is required)
    print(v)
    // [TextEdit(name: "/Applications/TextEdit.app").documents[1], 
    //  TextEdit(name: "/Applications/TextEdit.app").documents[2]]

