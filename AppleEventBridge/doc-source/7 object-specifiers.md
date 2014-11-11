# Object specifiers

## How object specifiers work

A property contains either a simple value describing an object attribute (`name`, `class`, `creationDate`, etc.) or an object specifier representing a one-to-one relationship between objects (e.g. `home`, `currentTrack`).

Elements represent a one-to-many relationship between objects (`documents`, `folders`, `fileTracks`, etc). 

characters/words/paragraphs of documents by index/relative-position/range/filter
 
[TO DO: finish]

## Reference forms

[TO DO: finish]

[TO DO: table for reference forms + methods]
    -byIndex:
    -at:
    -byName:
    -byID:
    -first
    -middle
    -last
    -any
    -previous:
    -next:
    -byRange:to:
    -at:to:
    -byTest:
    -beginning
    -end
    -before
    -after


### Property

Syntax:

<pre><code>specifier.<var>property</var></code></pre>

Examples:

<pre><code>textedit.<strong>name</strong>
[textedit.documents at: 1].<strong>text</strong>
finder.<strong>home</strong>.files.<strong>name</strong></code></pre>

### All elements

Syntax:

<pre><code>specifier.<var>elements</var></code></pre>

Examples:

<pre><code>finder.home.<strong>folders</strong>
textedit.<strong>documents</strong>
textedit.<strong>documents</strong>.<strong>paragraphs</strong>.<strong>words</strong></code></pre>

### Element by index
    
Syntax:

<pre><code>[elements <strong>byIndex:</strong> <var>selector</var>]
    <var>selector</var> : NSNumber | any -- the object's index (1-indexed), or other identifying value [1]

[elements <strong>at:</strong> <var>selector</var>]
    selector : int -- the object's index (1-indexed)</code></pre>

[1] While element indexes are normally integers, some applications may also accept other types (e.g. Finder's file/folder/disk specifiers also accept alias values).

Examples:

    [words byIndex: @3]
    [items at: -1]

<p class="hilitebox">Be aware that index-based object specifiers always use _one-indexing_ (i.e. the first item is 1, the second is 2, etc.), not zero-indexing as in Objective-C (where the first item is 0, the second is 1, etc.).</p>

[TO DO: should -at: and -at:to: methods use zero-indexing for convenience?]


### Element by name
    
Syntax:

<pre><code>[elements <strong>byName:</strong> <var>selector</var>]
        <var>selector</var> : NSString -- the object's name (as defined in its 'name' property)</code></pre>
        
Examples:

    [disks byName: @"Macintosh HD"]
    [files byName: @"index.html"]

<p class="hilitebox">Applications usually treat object names as case-insensitive. Where multiple element have the same name, a by-name specifier only identifies the first element found with that name. (Tip: to identify _all_ elements with a particular name, use a by-test specifier instead.)</p>


### Element by ID

Syntax:

<pre><code>[elements <strong>byID:</strong> <var>selector</var>]
        <var>selector</var> : anything -- the object's id (as defined in its 'id' property)</code></pre>

Examples:

    [windows byID: 4321]


### Element by absolute position

Syntax:

<pre><code>elements.<strong>first</strong> -- first element
elements.<strong>middle</strong> -- middle element
elements.<strong>last</strong> -- last element
elements.<strong>any</strong> -- random element</code></pre>
    
Examples:

    documents.first
    paragraphs.last
    files.any


### Element by relative position

Syntax:

<pre><code>
// nearest element of a given class to appear before the specified element:
[element <strong>previous:</strong> <var>typeName</var>]
// nearest element of a given class to appear after the specified element
[element <strong>next:</strong> <var>typeName</var>]
        <var>typeName</var> : AEBSymbol -- the name of the previous/next element's class</code></pre>

Examples:

    [[words at: 3] next: TESymbol.word] // gets word 4
    [[paragraphs at: -1] previous: TESymbol.character] // gets last character before last paragraph


### Elements by range

Range references select all elements between and including two references indicating the start and end of the range. The start and end references are normally declared relative to the container of the elements being selected. 

These references are constructed using a glue-defined 'Con' macro, e.g. `TECon`, as their root. For example, to indicate the third paragraph relative to the currrent container object:

    [TECon.paragraphs at: 3]

For convenience, the `-byRange:to:` method also allows start and end references to be written in shorthand form where their element class is the same as the elements being selected; thus:

    [ref.paragraphs byRange: [TECon.paragraphs at: 3] to: [TECon.paragraphs at: -1]]

can be written more concisely as:

    [ref.paragraphs byRange: @3 to: @-1]

Where start and end points are both indexes (the most common form), this can be shortened even further by using the `-at:to:` convenience method:

    [ref.paragraphs at: 3 to: -1]

Some applications can handle more complex range references. For example, the following will work in Tex-Edit Plus:

<pre><code>[ref.words byRange: [TEPCon.characters at: 5]
                           to: [TEPCon.paragraphs at: -2]]</code></pre>

Syntax:

<pre><code>[elements <strong>byRange:</strong> <var>start</var> to:</strong> <var>end</var>]
        <var>start</var> : NSNumber | NSString | AEBSpecifier -- start of range
        <var>end</var> : NSNumber | NSString | AEBSpecifier -- end of range

[elements <strong>at:</strong> <var>start</var> <strong>to:</strong> <var>end</var>]
        <var>start</var> : int -- start of range
        <var>end</var> : int -- end of range</code></pre>
    
Examples:

    [documents at: 1 to: 3]
    [folders byRange: @"Documents" to: @"Movies"]
    [text byRange: [TEPCon.characters at: 5] to: [TEPCon.words] at: -2]


### Elements by test

A specifier to each element that satisfies one or more conditions specified by a test specifier:

<pre><code>[elements <strong>byTest:</strong> <var>test</var>]
        <var>test</bar> : AEBSpecifier -- test specifier</code></pre>

Test expressions consist of the following:

* A test specifier relative to each element being tested. This specifier must be constructed using the glue's 'Its' macro as its root, e.g. `TEIts`. Its-based references support all valid reference forms, allowing you to construct references to its properties and elements. For example:
    
        TEIts
        TEIts.size
        TEIts.words.first

* One or more conditional tests, implemented as methods on the specifier being tested. Each method takes a test specifier or a value as its sole argument.

  Syntax:

  <pre><code>[specifier <strong>lessThan:</strong> <var>value</var>]
[specifier <strong>lessOrEquals:</strong> <var>value</var>]
[specifier <strong>equals:</strong> <var>value</var>]
[specifier <strong>notEquals:</strong> <var>value</var>]
[specifier <strong>greaterThan:</strong> <var>value</var>]
[specifier <strong>greaterOrEquals:</strong> <var>value</var>]
[specifier <strong>beginsWith:</strong> <var>value</var>]
[specifier <strong>endsWith:</strong> <var>value</var>]
[specifier <strong>contains:</strong> <var>value</var>]
[specifier <strong>isIn:</strong> <var>value</var>]
[specifier <strong>doesNotBeginWith:</strong> <var>value</var>]
[specifier <strong>doesNotEndWith:</strong> <var>value</var>]
[specifier <strong>doesNotContain:</strong> <var>value</var>]
[specifier <strong>isNotIn:</strong> <var>value</var>]
        <var>value</var> : AEBSpecifier -- the test specifier</code></pre>

  Examples:

    [TEIts equals: @""]
    [FNIts.size greaterThan: @1024]
    [TEIts.words.first beginsWith: @"A"]
    [TEIts.characters.first equals: TEIts.characters last]

    Note that Boolean comparison tests can be written as either `[specifier equals: AEMTrue]` or just `specifier`, e.g. `[folderRef.files byTest: FNIts.locked]`

* Zero or more logical tests, implemented as properties/methods on conditional tests. The `-AND:` and `-OR:` methods take conditional and/or logic test specifiers as arguments.

  Syntax:

  <pre><code>[<var>test</var> <strong>AND:</strong> <var>test</var>]
[<var>test</var> <strong>OR:</strong> <var>test</var>]
[<var>test</var> <strong>NOT</strong>]</code></pre>

  Examples:

    [[TEIts equals: @""] NOT]

    [[FNIts.size greaterThan: @1024] AND: [FNIts.size lessThan: @10240]]

    [[[TEIts.words at: 1] beginsWith: @"A"]
     OR: @[[[TEIts.words at: 1] contains: @"ce"],
           [[TEIts.words at: 2] equals: @"foo"]]]


### Element insertion location

Insertion locations can be specified at the beginning or end of all elements, or before or after a specified element or element range.

Syntax:

<pre><code>elements.<strong>beginning</strong>
elements.<strong>end</strong>
element.<strong>before</strong>
element.<strong>after</strong></code></pre>
    
Examples:

    documents.end
    [paragraphs at: 1].before

