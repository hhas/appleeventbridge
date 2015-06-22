# Object specifiers

## How object specifiers work

A property contains either a simple value describing an object attribute (`name`, `class`, `creationDate`, etc.) or an object specifier representing a one-to-one relationship between objects (e.g. `home`, `currentTrack`).

Elements represent a one-to-many relationship between objects (`documents`, `folders`, `fileTracks`, etc). 

TO DO: note both appear as properties on XXSpecifier; users don't instantiate XXSpecifier directly but instead construct via chained property/method calls from XXApplication or generic specifier root (XX.app, XX.con, XX.its)

characters/words/paragraphs of documents by index/relative-position/range/filter
 
[TO DO: finish]

## Reference forms

### Property

    var PROPERTY: XXSpecifier!

Syntax:

<pre><code>specifier.<var>property</var></code></pre>

Examples:

<pre><code>textedit.<strong>name</strong>
textedit.documents[1].<strong>text</strong>
finder.<strong>home</strong>.files.<strong>name</strong></code></pre>

### All elements

    var ELEMENTS: XXSpecifier!

Syntax:

<pre><code>specifier.<var>elements</var></code></pre>

Examples:

<pre><code>finder.home.<strong>folders</strong>
textedit.<strong>documents</strong>
textedit.<strong>documents</strong>.<strong>paragraphs</strong>.<strong>words</strong></code></pre>

### Element by index

    subscript(index: AnyObject!) -> XXSpecifier!
    
Syntax:

<pre><code>elements<strong>[</strong><var>selector</var><strong>]</strong>
    <var>selector</var> : Int! | AnyObject! -- the object's index (1-indexed), or other identifying value [1]</code></pre>

[1] While element indexes are normally integers, some applications may also accept other types (e.g. Finder's file/folder/disk specifiers also accept alias values). The only exceptions are `String` and `XXSpecifier`, which are used to construct by-name and by-test specifiers respectively.

Examples:

    words[3]
    items[-1]

<p class="hilitebox">Be aware that index-based object specifiers always use _one-indexing_ (i.e. the first item is 1, the second is 2, etc.), not zero-indexing as in Swift (where the first item is 0, the second is 1, etc.).</p>


### Element by name

    subscript(index: String!) -> XXSpecifier!

Specifies the first element with the given name.

Syntax:

<pre><code>elements<strong>[</strong><var>selector</var><strong>]</strong>
        <var>selector</var> : String -- the object's name (as defined in its 'name' property)</code></pre>
        
Examples:

    disks["Macintosh HD"]
    files["index.html"]

<p class="hilitebox">Applications usually treat object names as case-insensitive. Where multiple element have the same name, a by-name specifier only identifies the first element found with that name. (Tip: to identify _all_ elements with a particular name, use a by-test specifier instead.)</p>


### Element by ID

    func ID(uid:AnyObject!) -> XXSpecifier! // by-ID

Syntax:

<pre><code>elements.<strong>ID</strong>(uid: <var>selector</var>)
        <var>selector</var> : AnyObject! -- the object's id (as defined in its 'id' property)</code></pre>

Examples:

    windows.ID(4321)


### Element by absolute position

    var first: XXSpecifier!
    var middle: XXSpecifier!
    var last: XXSpecifier!
    var any: XXSpecifier!

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

    func previous(class_: AEBSymbol!) -> XXSpecifier!
    func next(class_: AEBSymbol!) -> XXSpecifier!

Syntax:

<pre><code>
// nearest element of a given class to appear before the specified element:
element.<strong>previous</strong>(class_: <var>typeName</var>)
// nearest element of a given class to appear after the specified element
element <strong>next:</strong> <var>typeName</var>]
        <var>typeName</var> : AEBSymbol -- the name of the previous/next element's class</code></pre>

Examples:

    words[3].next(TET.word) // gets word 4
    paragraphs[-1].previous(TET.character) // gets last character before last paragraph


### Elements by range

    subscript(from: AnyObject!, to: AnyObject!) -> XXSpecifier! // by-range

Range references select all elements between and including two object specifiers indicating the start and end of the range. The start and end specifiers are normally declared relative to the container of the elements being selected. 

// TO DO: unsure about ABC.con vs ABCCon; overloaded meaning may confuse

These sub-specifiers are constructed using the `XXSymbol.con` statc var, e.g. `TET.con`, as their root. For example, to indicate the third paragraph relative to the currrent container object:

    TET.con.paragraphs[3]

Thus, to specify all paragraphs from paragraph 3 to paragraph -1:
    
    ref.paragraphs[TET.con.paragraphs[3], TET.con.paragraphs[-1]]

For convenience, sub-specifiers can be written in shorthand form where their element class is the same as the elements being selected; thus the above can be written more concisely as:

    ref.paragraphs[3, -1]

Some applications can handle more complex range references. For example, the following will work in Tex-Edit Plus:

<pre><code>ref.words[TEP.con.characters[5], TEP.con.paragraphs[-2]]</code></pre>

Syntax:

<pre><code>elements<strong>[</strong> <var>start</var> to:</strong> <var>end</var>]
        <var>start</var> : NSNumber | NSString | AEBSpecifier -- start of range
        <var>end</var> : Int | NSString | AEBSpecifier -- end of range

[elements <strong>at:</strong> <var>start</var> <strong>to:</strong> <var>end</var>]
        <var>start</var> : int -- start of range
        <var>end</var> : int -- end of range</code></pre>
    
Examples:

    [documents at: 1 to: 3]
    [folders byRange: @"Documents" to: @"Movies"]
    [text byRange: [TEPCon.characters at: 5] to: [TEPCon.words] at: -2]


### Elements by test

    subscript(index: XXSpecifier!) -> XXSpecifier!

A specifier to each element that satisfies one or more conditions specified by a test specifier:

<pre><code>elements<strong>[</strong><var>selector</var><strong>]</strong>
        <var>selector</bar> : XXSpecifier -- test specifier</code></pre>

Test expressions consist of the following:

* A test specifier relative to each element being tested. This specifier must be constructed using the glue's 'XX.its' root, e.g. `TET.its`. Its-based references support all valid reference forms, allowing you to construct references to its properties and elements. For example:
    
        TET.its
        TET.its.size
        TET.its.words.first

* One or more conditional tests, implemented as operators/methods on the specifier being tested. Each operator takes a test specifier as its first operand and any value as its second. Each method takes any value as its sole argument.

  Syntax:

  <pre><code>specifier <strong>&lt;</strong> <var>value</var>
specifier <strong>&lt;=</strong> <var>value</var>
specifier <strong>==</strong> <var>value</var>
specifier <strong>!=</strong> <var>value</var>
specifier <strong>&gt;</strong> <var>value</var>
specifier <strong>&gt;=</strong> <var>value</var>
specifier <strong>beginsWith</strong>(<var>value</var>)
specifier <strong>endsWith</strong>(<var>value</var>)
specifier <strong>contains</strong>(<var>value</var>)
specifier <strong>isIn</strong>(<var>value</var>)
        <var>value</var> : XXSpecifier -- the test specifier</code></pre>

  Examples:

    TET.its == ""
    FNR.its.size > 1024
    TET.its.words.first.beginsWith("A")
    TET.its.characters.first == TET.its.characters.last
    
 // TO DO: note about `==` -> Bool vs Specifier

* Zero or more logical tests, implemented as properties/methods on conditional tests. The `-AND:` and `-OR:` methods take conditional and/or logic test specifiers as arguments.

  Syntax:

  <pre><code><var>test</var> <strong>&amp;&amp;</strong> <var>test</var>
<var>test</var> <strong>||</strong> <var>test</var>]
<strong>!</strong><var>test</var></code></pre>

  Examples:

    !TET.its.contains("?")

    FNR.its.size > 1024 && FNR.its.size < 10240

    TET.its.words[1].beginsWith("A") || TET.its.words[1].contains("ce") || TET.its.words[2] == "foo"


### Element insertion location

Insertion locations can be specified at the beginning or end of all elements, or before or after a specified element or element range.

    var beginning: XXSpecifier!
    var end: XXSpecifier!
    var before: XXSpecifier!
    var after: XXSpecifier!

Syntax:

<pre><code>elements.<strong>beginning</strong>
elements.<strong>end</strong>
element.<strong>before</strong>
element.<strong>after</strong></code></pre>
    
Examples:

    documents.end
    paragraphs.last.before

