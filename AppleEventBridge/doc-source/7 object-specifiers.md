# Object specifiers

## How object specifiers work

[TO DO: finish (note that this is a bit of a rehash of ch.2; might be simpler just to refer users back to that)]

A property contains either a simple value describing an object attribute (`name`, `class`, `creationDate`, etc.) or an object specifier representing a one-to-one relationship between objects (e.g. `home`, `currentTrack`).

Elements represent a one-to-many relationship between objects (`documents`, `folders`, `fileTracks`, etc). 

TO DO: note both appear as properties on XXSpecifier; users don't instantiate XXSpecifier directly but instead construct via chained property/method calls from XXApplication or generic specifier root (XXapp, XXcon, XXits)

characters/words/paragraphs of documents by index/relative-position/range/filter
 
 [TO DO: list of supported reference forms, with links to sections below]
 
[TO DO: following sections should include AppleScript syntax equivalents for reference]

## Reference forms

### Property
«
  var PROPERTY: XXSpecifier
»«
  -(instancetype)PROPERTY;
»
Syntax:
<pre><code>specifier.<var>property</var></code></pre>

Examples:

<pre><code>textedit.<strong>name</strong>
textedit.documents[1].<strong>text</strong>
finder.<strong>home</strong>.files.<strong>name</strong></code></pre>

### All elements
«
  var ELEMENTS: XXSpecifier
»«
  -(instancetype)ELEMENTS;
»
Syntax:

<pre><code>specifier.<var>elements</var></code></pre>

Examples:

<pre><code>finder.home.<strong>folders</strong>
textedit.<strong>documents</strong>
textedit.<strong>documents</strong>.<strong>paragraphs</strong>.<strong>words</strong></code></pre>


### Element by index
«
  subscript(index: AnyObject) -> XXSpecifier
»«
  - (instancetype)objectAtIndexedSubscript:(int)idx;
  - (instancetype)objectForKeyedSubscript:(id)key;
»
Syntax:

<pre><code>elements<strong>[</strong><var>selector</var><strong>]</strong>
«
    <var>selector</var> : Int | AnyObject -- the object's index (1-indexed), or other identifying value [1]</code></pre>
»«
    <var>selector</var> : int | id -- the object's index (1-indexed), or other identifying value [1]</code></pre>
»

[1] While element indexes are normally integers, some applications may also accept other types (e.g. Finder's file/folder/disk specifiers also accept alias values). The only exceptions are `«»«NS»String` and `XXSpecifier`, which are used to construct by-name and by-test specifiers respectively.

<p class="hilitebox">Be aware that index-based object specifiers always use _one-indexing_ (i.e. the first item is 1, the second is 2, etc.), not zero-indexing as in «Swift»«Objective-C» (where the first item is 0, the second is 1, etc.).</p>

Examples:

  words[3]
  items[-1]


### Element by name
«
  subscript(index: String) -> XXSpecifier
  func named(name: AnyObject) -> XXSpecifier
»«
  - (instancetype)objectForKeyedSubscript:(id)key; // key must be NSString*
  - (instancetype)named:(id)name;
»
Specifies the first element with the given name. (The subscript syntax is preferred; the `named` method would only need used if a non-string value was required.)

Syntax:

<pre><code>elements<strong>[</strong><var>selector</var><strong>]</strong>
        <var>selector</var> : «String»«NSString*» -- the object's name (as defined in its 'name' property)</code></pre>

<p class="hilitebox">Applications usually treat object names as case-insensitive. Where multiple element have the same name, a by-name specifier only identifies the first element found with that name. (To identify <em>all</em> elements with a particular name, use a by-test specifier instead.)</p>

Examples:

  disks[«»«@»"Macintosh HD"]
  files[«»«@»"index.html"]


### Element by ID
«
  func ID(elementID:AnyObject) -> XXSpecifier
»«
  - (instancetype)ID:(id);
»
Syntax:
«
<pre><code>elements.<strong>ID</strong>(<var>selector</var>)
        <var>selector</var> : AnyObject -- the object's id (as defined in its 'id' property)</code></pre>
»«
<pre><code>[elements <strong>ID:</strong> <var>selector</var>]
        <var>selector</var> : id -- the object's ID (as defined in its 'id' property)</code></pre>
»
Examples:
«
  windows.ID(4321)
»«
  [windows ID: 4321]
»

### Element by absolute position
«
  var first: XXSpecifier
  var middle: XXSpecifier
  var last: XXSpecifier
  var any: XXSpecifier
»«
  - (instancetype)first;
  - (instancetype)middle;
  - (instancetype)last;
  - (instancetype)any;
»
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
«
  func previous(elementClass: AEBSymbol) -> XXSpecifier
  func next(elementClass: AEBSymbol) -> XXSpecifier
»«
  - (instancetype)previous:(AEBSymbol *)elementClass;
  - (instancetype)middle:(AEBSymbol *)elementClass;
»
Syntax:
«
<pre><code>// nearest element of a given class to appear before the specified element:
element.<strong>previous</strong>(<var>elementClass</var>)

// nearest element of a given class to appear after the specified element
element.<strong>next</strong>(<var>elementClass</var>)

        <var>elementClass</var> : AEBSymbol -- the name of the previous/next element's class</code></pre>
»«
<pre><code>// nearest element of a given class to appear before the specified element:
[element <strong>previous:</strong> <var>typeName</var>]

// nearest element of a given class to appear after the specified element
[element <strong>next:</strong> <var>typeName</var>]

        <var>typeName</var> : AEBSymbol* -- the name of the previous/next element's class</code></pre>
»
Examples:
«
  words[3].next(TED.word) // word 4
  paragraphs[-1].previous(TED.character) // the last character before the last paragraph
»«
  [words[3] next: TED.word] // word 4
  [paragraphs[-1] previous: TED.character] // the last character before the last paragraph
»

### Elements by range
«
  subscript(from: AnyObject, to: AnyObject) -> XXSpecifier // by-range
»«
  - (instancetype)from:(id)to:(id);
»
Range references select all elements between and including two object specifiers indicating the start and end of the range. The start and end specifiers are normally declared relative to the container of the elements being selected. 

These sub-specifiers are constructed using the glue's' `XXcon` constant, e.g. `TEDCon`, as their root. For example, to indicate the third paragraph relative to the currrent container object:

  TEDCon.paragraphs[3]

Thus, to specify all paragraphs from paragraph 3 to paragraph -1:
«
  paragraphs[TEDCon.paragraphs[3], TEDCon.paragraphs[-1]]
»«
  [paragraphs from: TEDCon.paragraphs[3] to: TEDCon.paragraphs[-1]]
»
For convenience, sub-specifiers can be written in shorthand form where their element class is the same as the elements being selected; thus the above can be written more concisely as:
«
  paragraphs[3, -1]
»«
»
Some applications can handle more complex range references. For example, the following will work in Tex-Edit Plus:
«
  words[TEPcon.characters[5], TEPcon.paragraphs[-2]]
»«
  [words from: TEPcon.characters[5] to: TEPcon.paragraphs[-2]]
»
Syntax:
«
<pre><code>elements<strong>[</strong> <var>start</var>, </strong> <var>end</var>]
        <var>start</var> : Int | String | AEBSpecifier -- start of range
        <var>end</var> : Int | String | AEBSpecifier -- end of range</code></pre>
»«
<pre><code>elements<strong>[</strong> <var>start</var>, </strong> <var>end</var>]
        <var>start</var> : NSNumber* | NSString* | AEBSpecifier* -- start of range
        <var>end</var> : NSNumber* | NSString* | AEBSpecifier* -- end of range</code></pre>
»
Examples:
«
  documents[1, 3]
  folders["Documents", "Movies"]
  text[TEPCon.characters[5], TEPCon.words[-2]]
»«
  [documents from: @1 to: @3]
  [folders from: @"Documents" to: @"Movies"]
  [text from: TEPCon.characters[5] to: TEPCon.words[-2]]
»

### Elements by test
«
  subscript(index: XXSpecifier) -> XXSpecifier
»«
  - (instancetype)objectForKeyedSubscript:(id)key; // key must be AEBSpecifier*
»

A specifier to each element that satisfies one or more conditions specified by a test specifier:

<pre><code>elements<strong>[</strong><var>selector</var><strong>]</strong>
        <var>selector</bar> : XXSpecifier«»«*» -- test specifier</code></pre>

Test expressions consist of the following:

* A test specifier relative to each element being tested. This specifier must be constructed using the glue's 'XXits' root, e.g. `TEDIts`. Its-based references support all valid reference forms, allowing you to construct references to its properties and elements. For example:
    
    TEDIts
    TEDIts.size
    TEDIts.words.first

* One or more conditional tests, implemented as operators/methods on the specifier being tested. The «left-hand operand or »«»receiver must be an `XXSpecifier` instance; the «other operand or »«»argument can be anything.

  Syntax:
«
  <pre><code>specifier <strong>&lt;</strong> <var>value</var>
specifier <strong>&lt;=</strong> <var>value</var>
specifier <strong>==</strong> <var>value</var>
specifier <strong>!=</strong> <var>value</var>
specifier <strong>&gt;</strong> <var>value</var>
specifier <strong>&gt;=</strong> <var>value</var>
specifier <strong>beginsWith</strong>(<var>value</var>)
specifier <strong>endsWith</strong>(<var>value</var>)
specifier <strong>contains</strong>(<var>value</var>)
specifier <strong>isIn</strong>(<var>value</var>)</code></pre>
»«
  <pre><code>[specifier <strong>lt:</strong> <var>value</var>] // less than
[specifier <strong>le:</strong> <var>value</var>] // less or equal
[specifier <strong>eq:</strong> <var>value</var>] // equal
[specifier <strong>ne:</strong> <var>value</var>] // not equal
[specifier <strong>gt:</strong> <var>value</var>] // greater than
[specifier <strong>ge:</strong> <var>value</var>] // greater or equal
[specifier <strong>beginsWith:</strong> <var>value</var>]
[specifier <strong>endsWith:</strong> <var>value</var>]
[specifier <strong>contains:</strong> <var>value</var>]
[specifier <strong>isIn:</strong> <var>value</var>]</code></pre>
»
  Examples:
«
    TEDIts == ""
    FINits.size > 1024
    TEDIts.words.first.beginsWith("A")
    TEDIts.characters.first == TEDIts.characters.last

  Caution: if assigning a test specifier to a variable, the variable must be explicitly typed to ensure the compiler uses the correct operator overload, e.g.:
  
    let test: AEBSpecifier = TEDIts.color == [0,0,0]
    let query = textedit.documents[1].words[test]
»«
    [TEDIts eq: @""]
    [FINits.size gt: @1024]
    [TEDIts.words.first beginsWith: @"A"]
    [TEDIts.characters.first eq: TEDIts.characters.last]
»
* Zero or more logical tests, implemented as properties/methods on conditional tests. All «operands»«arguments» must be conditional and/or logic test specifiers.

  Syntax:
«
  <pre><code><var>test</var> <strong>&amp;&amp;</strong> <var>test</var>
<var>test</var> <strong>||</strong> <var>test</var>
<strong>!</strong><var>test</var></code></pre>
»«
  <pre><code>[<var>test</var> <strong>AND:</strong> <var>test</var>]
[<var>test</var> <strong>OR:</strong> <var>test</var>]
<var>test</var> <strong>.NOT</strong></code></pre>
»
  Examples:
«
    !(TEDIts.contains("?"))

    FINits.size > 1024 && FINits.size < 10240

    TEDIts.words[1].beginsWith("A") || TEDIts.words[1].contains("ce") || TEDIts.words[2] == "foo"
»«
    [TEDIts contains: @"?"].NOT

    [[FINits.size gt: @1024] AND: [FINits.size lt: @10240]]

    [[[TEDIts.words[1] beginsWith: @"A"] OR: [TEDIts.words[1] contains: @"ce"]] OR: [TEDIts.words[2] eq: @"foo"]]
»

### Element insertion location

Insertion locations can be specified at the beginning or end of all elements, or before or after a specified element or element range.
«
  var beginning: XXSpecifier
  var end: XXSpecifier
  var before: XXSpecifier
  var after: XXSpecifier
»«
  - (instancetype)beginning;
  - (instancetype)end;
  - (instancetype)before;
  - (instancetype)after;
»
Syntax:

<pre><code>elements.<strong>beginning</strong>
elements.<strong>end</strong>
element.<strong>before</strong>
element.<strong>after</strong></code></pre>
    
Examples:

  documents.end
  paragraphs.last.before

