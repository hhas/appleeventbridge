#/usr/bin/python
# -*- coding: utf-8 -*-

# TO DO: how best to output generated glue? as loose files, as folder of auto-named files, and/or as framework bundle?

import getopt, os, re, string, sys
import xml.etree.ElementTree as ET

import objc # (this script uses system Python, which includes PyObjC as standard)
from Foundation import NSObject, NSBundle, NSURL

kReservedPrefixes = {'NS', 'AEM', 'AEB'} # glues cannot use these prefixes


######################################################################
# IMPORT AEB FRAMEWORK
######################################################################

# TO DO: how best to locate AppleEventBridge.framework? (used to obtain app terminology)

kFrameworkName = 'AppleEventBridge'
#mpath = re.match('(.+/%s.framework)' % kFrameworkName, os.path.abspath(os.path.expanduser(__file__))) # TO DO: uncomment
#if not mpath:
#    print >> sys.stderr, 'aebglue executable must be inside %s.framework bundle.' % kFrameworkName
#    sys.exit(1)
#bundle = objc.loadBundle(kFrameworkName, globals(), bundle_path=mpath.group(1))

bundle = objc.loadBundle(kFrameworkName, globals(), bundle_path='/Users/has/Library/Frameworks/AppleEventBridge.framework') # TO DO: TEST; remove when done

kFrameworkVersion =  bundle.infoDictionary()['CFBundleShortVersionString']


######################################################################
# UTILITIES
######################################################################


def writefile(path, s):
    with open(path, 'w') as f:
        f.write(s.encode('utf-8'))
    
def readfile(path):
    with open(path) as f:
            return f.read().decode('utf-8')


######################################################################
# KEYWORD CONVERTER
######################################################################

# Important: the following must be reserved:
#
# - names of ObjC keywords
# - names of NSObject class and instance methods
# - names of methods used in AEBSymbol, AEBSpecifier classes
# - names of additional methods used in Application classes
# - names of built-in keyword arguments in AEBStaticCommand



# The following tokens are reserved as punctuation and can’t be used as custom operators: 
# (, ), {, }, [, ], ., ,, :, ;, =, @, #, & (as a prefix operator), ->, `, ?, and ! (as a postfix operator).



kSwiftKeywords = [
    # Keywords used in declarations: 
    "class", "deinit", "enum", "extension", "func", "import", "init", "internal", "let", "operator", 
    "private", "protocol", "public", "static", "struct", "subscript", "typealias", "var",

    # Keywords used in statements: 
    "break", "case", "continue", "default", "do", "else", "fallthrough", "for", "if", "in", "return", "switch", "where", "while",

    # Keywords used in expressions and types: 
    "as", "dynamicType", "false", "is", "nil", "self", "Self", "super", "true", "__COLUMN__", "__FILE__", "__FUNCTION__", "__LINE__",

    # Keywords reserved in particular contexts: 
    "associativity", "convenience", "dynamic", "didSet", "final", "infix", "inout", "lazy", "left", "mutating", "none", "nonmutating", 
    "optional", "override", "postfix", "precedence", "prefix", "Protocol", "required", "right", "Type", "unowned", "weak", "willSet",
    # "get", "set",  # TO DO: is it safe not to reserve these? (will be really annoying otherwise)
    
]

kNSObjectMethods = [ # TO DO: introspect NSObject for these, if practical
    "initialize",
    "load",
    "new",
    "alloc",
    "allocWithZone",
    "init",
    "copy",
    "copyWithZone",
    "mutableCopy",
    "mutableCopyWithZone",
    "dealloc",
    "finalize",
    "class",
    "superclass",
    "isSubclassOfClass",
    "instancesRespondToSelector",
    "conformsToProtocol",
    "methodForSelector",
    "instanceMethodForSelector",
    "instanceMethodSignatureForSelector",
    "methodSignatureForSelector",
    "description",
    "poseAsClass",
    "cancelPreviousPerformRequestsWithTarget",
    "forwardInvocation",
    "doesNotRecognizeSelector",
    "awakeAfterUsingCoder",
    "classForArchiver",
    "classForCoder",
    "classForKeyedArchiver",
    "classFallbacksForKeyedArchiver",
    "classForKeyedUnarchiver",
    "classForPortCoder",
    "replacementObjectForArchiver",
    "replacementObjectForCoder",
    "replacementObjectForKeyedArchiver",
    "replacementObjectForPortCoder",
    "setVersion",
    "version",
    "attributeKeys",
    "classDescription",
    "inverseForRelationshipKey",
    "toManyRelationshipKeys",
    "toOneRelationshipKeys",
    "classCode",
    "className",
    "scriptingProperties",
    "setScriptingProperties",
]


kAppleEventBridgeMethods = [ # TO DO: update
    # used by AEBSpecifier
    
    # property/element specifiers
    "propertyByCode",
    "elementsByCode",
    
    # element(s) selectors
    "ID",
    "beginning",
    "end",
    "before",
    "after",
    "previous",
    "next",
    "first",
    "middle",
    "last",
    "any",
    
    # test clause constructors
    "beginsWith",
    "endsWith",
    "contains",
    "isIn",
    "doesNotBeginWith",
    "doesNotEndWith",
    "doesNotContain",
    "isNotIn",
    "AND",
    "NOT",
    "OR",
    
    # miscellaneous
    "isRunning",
    "launchApplication",
    "reconnectApplication",
    
    # used by glue-generated XXApplication classes
    "beginTransaction",
    "beginTransactionWithSession",
    "abortTransaction",
    "endTransaction",
    "specifierWithObject",
    
    # used by AEBSymbol
    "symbolWithName",
    "symbolWithCode",
    
    # currently unused
    "help",
]


class KeywordConverter(AEBDefaultKeywordConverter):
    
    _legalchars = string.ascii_letters + '_' # TO DO: extend this as per Swift identifier rules
    _alphanum = _legalchars + string.digits
    _reservedwords = set(kSwiftKeywords + kNSObjectMethods + kAppleEventBridgeMethods)
    
    def init(self):
        self = super(KeywordConverter, self).init()
        if self:
            self._cache = {}
        return self
    
    def convert_(self, s):
        """Convert string to identifier.
            s : str
            Result : str
        """
        if s not in self._cache:
            s = s.strip()
            if s.startswith('init '): # if "init" is first word in name, escape it separately
                s = 'init_ ' + s[5:]
            legal = self._legalchars
            res = ''
            uppercasenext = False
            for c in s:
                if c in legal:
                    if uppercasenext:
                        c = c.upper()
                        uppercasenext = False
                    res += c
                elif c in ' -/':
                    uppercasenext = True
                elif c == '&':
                    res += 'And'
                else:
                    if res == '':
                        res = '_' # avoid creating an invalid identifier
                    res += '0x%2.2X' % ord(c) # TO DO: revise this; use Swift identifier quoting rather than character replacement where possible
                legal = self._alphanum
            if (res in self._reservedwords or res.startswith('_') or res[:3] in {'AEM', 'aem', 'AEB', 'aeb'} or not res): # TO DO: backtick reserved swift keywords? or will that cause more confusion than it solves?
                res = self.escape_(res)
            self._cache[s] = str(res)
        return self._cache[s]
        
    def escape_(self, s):
        return s + '_'


kKeywordConverter = KeywordConverter.alloc().init()


######################################################################
# GLUE RENDERER
######################################################################


def insert(tpl, label, content): # replace all tags with given name
    return tpl.replace(u'«{}»'.format(label), content)

def repeat(tpl, label, contentlist, renderer): # find and render all NEW...END blocks with given name (note: identically named blocks can contain same or different placeholder content, but all will be rendered with same data and renderer callback)
    def insertblock(m):
        subtpl = m.group(1).rstrip()
        return u''.join(renderer(subtpl, content) for content in contentlist)
    return re.sub(u'(?s)\n?«NEW_%s»(.*?)«END_%s»' % (label, label), insertblock, tpl)



def fcc(code): # format OSType as hex int
    return u'0x%08x' % code

def insertcodeandname(tpl, content):
    (code, name) = content
    tpl = insert(tpl, 'NAME', name)
    return insert(tpl, 'CODE', fcc(code))

def insertcommand(tpl, term):
    params = sorted((p.code(), p.name()) for p in term.parameters())
    tpl = insert(tpl, 'COMMAND_NAME', term.name())
    tpl = insert(tpl, 'EVENT_CLASS', fcc(term.eventClass()))
    tpl = insert(tpl, 'EVENT_ID', fcc(term.eventID()))
    tpl = repeat(tpl, 'COMMAND_ARG', params, insertcodeandname)
    return repeat(tpl, 'EVENT_PARAM', params, insertcodeandname)


kElement = 1
kProperty = 3
kCommand = 4

kType = 0x74797065
kEnum = 0x656e756d

def renderglue(appname, gluename, prefix, appinfo, appvar, terms):
    """
    	appname : str -- application's file name
    	gluename : str -- glue's file name
        prefix : str -- classname prefix
        appbundle : dict | None -- the application's bundle info
        appvar : str -- Swift/C-style identifier
        terms : AEBDynamicTerminology
    """
    templatepath = './SwiftGlueTemplate.txt' # TO DO: where should glue templates, etc. be located?
    tpl = readfile(templatepath)
    # insert general info
    tpl = insert(tpl, 'PREFIX', prefix)
    tpl = insert(tpl, 'GLUE_NAME', gluename)
    tpl = insert(tpl, 'FRAMEWORK_NAME', kFrameworkName+'.framework')
    tpl = insert(tpl, 'FRAMEWORK_VERSION', kFrameworkVersion)
    tpl = insert(tpl, 'APP_VAR_NAME', appvar)
    # include application info, if relevant
    tpl = insert(tpl, 'APP_NAME', appinfo.get('CFBundleDisplayName', '<NONE>'))
    tpl = insert(tpl, 'APP_VERSION', appinfo.get('CFBundleShortVersionString', '<NONE>'))
    tpl = insert(tpl, 'BUNDLE_ID', appinfo.get('CFBundleIdentifier', '<NONE>'))
    # insert name-code mappings
    
    # TO DO: move the following to a reusable struct/class
    # [(str, AEBDynamicTerm),...]
    specifierbyname = sorted(terms.specifiersByName().items(), key=lambda o: o[0]) # selectors, raw constants
    # [((code: int, name: str), desctype: int),...]
    typebyname = sorted((((desc.typeCodeValue(), name), desc.descriptorType()) 
            for name, desc in terms.typesByName().items()), key=lambda o: o[0][1]) # symbol contructors, raw constants
    # [(code: int, name: str),...]
    typebycode = sorted(terms.typesByCode().items(), key=lambda o: o[1]) # symbol lookup
    propertybycode = sorted(terms.propertiesByCode().items(), key=lambda o: o[1])
    elementbycode = sorted(terms.elementsByCode().items(), key=lambda o: o[1])
    
    for label, contentlist in [
            ('PROPERTY_FORMATTER', propertybycode),
            ('ELEMENTS_FORMATTER', elementbycode),
            ('SYMBOL_SWITCH', typebycode),
            ('TYPE_SYMBOL', (v for v, desctype in typebyname if desctype == kType)),
            ('ENUM_SYMBOL', (v for v, desctype in typebyname if desctype == kEnum)),
            ('PROPERTY_SPECIFIER', ((t.code(), t.name()) for name, t in specifierbyname if t.kind() == kProperty)),
            ('ELEMENTS_SPECIFIER', ((t.code(), t.name()) for name, t in specifierbyname if t.kind() == kElement))]:
        tpl = repeat(tpl, label, contentlist, insertcodeandname)
    return repeat(tpl, 'COMMAND', (t for name, t in specifierbyname if t.kind() == kCommand), insertcommand)


######################################################################
# DEFAULT PREFIX GENERATOR
######################################################################


kReservedPrefixes = {'NS', 'AEM', 'AEB'} # glues cannot use these prefixes


def makeprefix(name, minlen=3): # TO DO: need to test this with various typical app names
    """ Auto-generate a reasonable default classname prefix from an application name.
        
        Notes:
        
        - Only A-Z/a-z characters are used, so is most effective when app's name is mostly composed of those characters.
        
        - Raises ValueError if name doesn't contain enough suitable characters to construct minimum-length prefix.
    """
    words = u''.join(re.findall(u'([A-Za-z ])', name)).split()
    if len(words) >= minlen: # use first letter of each word
        acronym = u''.join(word[0].upper() for word in words)
        if acronym not in kReservedPrefixes:
            return acronym
    words = [word[0].upper()+word[1:] for word in words]
    caps = re.sub(u'[^A-Z]', '', u''.join(words)) # include any other uppercase letters
    if len(caps) >= minlen and caps not in kReservedPrefixes:
        return caps
    phoneticwords = re.sub(u'[A-Z]|[a-z]\\b|[b-df-hj-np-tv-z ]', '', ''.join(words)).split() # eliminate lowercase vowels, except at end of word
    i = len(phoneticwords)
    short = minlen - len(caps) # how many more characters are needed?
    while i and short: # start uppercasing last character of each word, working backwards
        i -= 1
        word = phoneticwords[i]
        if re.search(u'[a-z]$', word):
            words[i] = word[:-1]+word[-1].upper()
            short -= 1
    if not short:
        phonetic = re.sub(u'[a-z]', '', u''.join(phoneticwords))
        if phonetic not in kReservedPrefixes:
            return phonetic
    all = u''.join(words).upper().replace(' ', '') # starting to run short, so reinclude lowercase vowels
    if len(all) == minlen:
        if all in kReservedPrefixes:
            raise ValueError('Auto-generated prefix conflicts with reserved prefix: %r' % all)
        return all
    elif len(all) > minlen:
        for _ in range(minlen):
            for i in range(len(words)):
                word = words[i]
                words[i] = word[:prefixlen].upper() + word[prefixlen]
                caps = re.sub(u'[^A-Z]', '', u''.join(words)) # use first letter of each word plus other uppercase letters (acronym-like)
                if len(caps) >= minlen and caps not in kReservedPrefixes:
                    return caps
            prefixlen += 1
    raise ValueError('Not enough characters to construct a %i-character prefix.' % minlen)


######################################################################
# SDEF EXPORTER
######################################################################


def _convertnode(node, attrname, suffix='', prefix=''):
    attr = node.get(attrname)
    if attr:
        node.set(attrname, prefix+kKeywordConverter.convert_(attr)+suffix)


def exportsdef(appurl, outpath, prefix):
    """ Export .sdef file containing Swift-style keywords as user documentation. """
    sdef = AEBDynamicSDEFParser.copyScriptingDefinitionAtURL_error_(appurl, None)
    if not sdef:
        raise ValueError("Can't export SDEF for %r: %s" % (appurl,  "can't get terminology."))
    exportsdef(str(sdef), prefix, os.path.join(appurl.path()+'.sdef'))
    root = ET.XML(sdef)
    symbolnamespace = 'k%s.' % prefix
    for suite in root.findall('./suite'):
        for key in ['command', 'event']:
            for command in suite.findall(key):
                _convertnode(command, 'name', '' if command.find('direct-parameter') is None else ':')
                for param in command.findall('parameter'):
                    _convertnode(param, 'name', ':')
        for key in ['class', 'class-extension', 'record-type']:
            for klass in suite.findall(key):
                _convertnode(klass, 'name')
                # optional plural names require extra fiddling
                pluralname = klass.get('plural')
                if not pluralname:
                    pluralname = klass.get('name')
                    if pluralname:
                        pluralname += 's'
                if pluralname:
                    klass.set('plural', pluralname)
                for elem in klass.findall('element'):
                    _convertnode(elem, 'type')
                for prop in klass.findall('property'):
                    _convertnode(prop, 'name')
                cont = klass.find('contents')
                if cont is not None and cont.get('name'):
                    _convertnode(cont, 'name')
                for resp in klass.findall('responds-to'):
                    _convertnode(resp, 'name')
                    _convertnode(resp, 'command')
        for enumeration in suite.findall('enumeration'):
            for enum in enumeration.findall('enumerator'):
                _convertnode(enum, 'name', prefix=symbolnamespace)
        for value in suite.findall('value-type'):
            _convertnode(value, 'name')
    ET.ElementTree(root).write(outpath, encoding="utf-8", xml_declaration=True)


######################################################################
# MAKE GLUE
######################################################################

# TO DO: also need to generate constants file[s] (Q. what about AEBSwiftSymbol? should that also be autogenerated each time? if so, need to check how best to get and process AS's terminology)


def makeappglue(appurl, outurl, prefix, appvar, usesdef):
    """
        appurl : NSURL -- application path
        outurl : NSURL -- path to glue folder
        prefix : str | None -- ObjC-style classname prefix, e.g. 'TE'
        appvar : str | None -- C-style identifier, e.g. 'TextEdit'
        usesdef : bool -- if True, get application's terminology as SDEF instead of AETE
    """
    # get app info
    appbundle = NSBundle.bundleWithURL_(appurl)
    # get app dictionary
    appdata = AEBDynamicAppData.alloc().initWithApplicationURL_useSDEF_keywordConverter_(
            appurl, usesdef, kKeywordConverter)
    terms = appdata.terminologyWithError_(None)
    if not terms:
        raise ValueError("Can't get terminology for: %s" % appurl)
    appinfo = dict(appbundle.infoDictionary() or {}) if appbundle else {}
    if not prefix:
        prefix = makeprefix(appinfo.get('CFBundleDisplayName', 'UNKNOWN'))
    if not appvar:
        appvar = kKeywordConverter.convert_(appinfo.get('CFBundleDisplayName', 'UNKNOWN'))
    glue = renderglue(appurl.lastPathComponent(), outurl.lastPathComponent(), prefix, appinfo, appvar, terms)
    writefile(outurl.path(), glue)



def makedefaultglue(outurl, prefix, appvar): # TO DO: finish
    """
    """
    appdata = AEBDynamicAppData.alloc().initWithApplicationURL_useSDEF_keywordConverter_(
            None, False, kKeywordConverter)
    terms = appdata.terminologyWithError_(None)


######################################################################
# MAIN
######################################################################


if __name__ == '__main__':
#    try:
        opts, args = getopt.getopt(sys.argv[1:], 'a:hn:p:s')
        opts = dict(opts)
        if not opts or '-h' in opts:
            print >> sys.stderr, "Generate Swift application glues for AppleEventBridge"
            print >> sys.stderr
            print >> sys.stderr, "Usage:"
            print >> sys.stderr
            print >> sys.stderr, "    aebglue [-a PATH] [-n NAME] [-p PREFIX] [-s] outputpath"
            print >> sys.stderr
            print >> sys.stderr, "Options:"
            print >> sys.stderr
            print >> sys.stderr, "    -a PATH    Name or full path to application; if omitted,"
            print >> sys.stderr, "                 use default terminology only"
            print >> sys.stderr, "    -h         Show this help and exit"
            print >> sys.stderr, "    -n NAME    Application's name as a C-style identifier;"
            print >> sys.stderr, "                 if omitted, a default name is auto-generated"
            print >> sys.stderr, "    -p PREFIX  Class names prefix; if omitted, a default "
            print >> sys.stderr, "                 prefix is auto-generated"
            print >> sys.stderr, "    -s         Use SDEF terminology instead of AETE, e.g."
            print >> sys.stderr, "                 if application's ascr/gdte handler is broken"
            print >> sys.stderr
            print >> sys.stderr, "Example:"
            print >> sys.stderr
            print >> sys.stderr, "    aebglue -a TextEdit -p TE ~/TEGlue"
            print >> sys.stderr
            sys.exit()
        if len(args) != 1:
            raise ValueError('A single output path must be given.')
        outpath = os.path.abspath(os.path.expanduser(args[0]))
        if not outpath.endswith('.swift'):
            outpath += '.swift'
        outurl = NSURL.fileURLWithPath_(outpath)
        if '-a' in opts:
            appname = opts['-a']
            appurl = AEMApplication.fileURLForApplicationWithName_(appname)
            if not appurl:
                raise ValueError("Can't make glue for %r: %s" % (appname,  "can't find application."))
            
            makeappglue(appurl, outurl, opts.get('-p'), opts.get('-n'), '-s' in opts)
        else:
            makedefaultglue(opts['-p'], outurl)
        print >> sys.stderr, "Written glue to:", outpath
#    except Exception, e:
 #       print >> sys.stderr, "Error:", e
   #     sys.exit(1)



