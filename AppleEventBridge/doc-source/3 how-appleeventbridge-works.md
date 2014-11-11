# How AppleEventBridge works

AppleEventBridge is a high-level Objective-C wrapper for the Carbon Apple Event Manager APIs. 


AppleEventBridge builds upon the Carbon Apple Event Manager and Foundation APIs to provide:

* a high-level RPC mechanism for sending commands to applications via Apple events
* a mechanism for converting data between common Foundation classes and Apple event types
* a simple query building API for specifying one or more objects in an application's object model
* a static glue code generator for writing Apple events and object specifiers in human-readable form
* a collection of base classes for implementing dynamic Apple event bridges.



The AppleEventBridge architecture consists of two layers, identified by the following class name prefixes:

* `AEM` – mid-level wrapper around Mac OS X's Apple Event Manager and Foundation APIs, providing an object-oriented API for building relational AEOM queries and dispatching events.

* `AEB` – high-level wrapper around `AEM...` classes, providing automatic translation between human-readable application terminology and corresponding four-letter codes, and representing relational AEOM queries in an OO-like syntax for ease of use.


The AEM API is largely intended for use by higher-level libraries, though may also be used by developers in cases where an application lacks terminology, or bugs within its terminology prevent its use by AEB.

The AEB layer consists of several `AEBStatic...` base classes and a code generator, `aebglue`, which creates static glue classes for individual applications. A number of `AEBDynamic...` base classes are also provided for use in constructing high-level bridges for scripting languages.


For example, to set the size of the first character of every non-empty paragraph in every document of TextEdit to 24 pt: using `AEM` classes:

    AEMApplication *te = [[AEMApplication alloc] initWithName: @"TextEdit.app"];

    AEMQuery *ref = [[[[[[[AEMApp elements: 'docu']
                                  property: 'ctxt']
                                  elements: 'cpar'] byTest: [AEMIts notEquals: @"\n"]]
                                  elements: 'cha '] at: 1]
                                  property: 'ptsz'];

    AEMEvent *evt = [textedit eventWithEventClass: 'core' eventID: 'getd'];
    [evt setParameter: ref forKeyword: '----'];
    [evt setParameter: @24 forKeyword: 'data'];

    [evt send];


and using `AEB` glue classes:

    TEApplication *te = [[TEApplication alloc] initWithName: @"TextEdit"];

    TESpecifier *ref = [[te.documents.text.paragraphs byTest: [TEIts notEquals: @"\n"]]
                                          .characters at: 1].size;

    [[[ref set] to: @24] send];
