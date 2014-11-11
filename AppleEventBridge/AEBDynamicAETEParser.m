//
//  AEBDynamicAETEParser.m
//

#import "AEBDynamicAETEParser.h"

#ifdef AEB_DEBUG
//#define AEB_DEBUG_PARSER
#endif

/**********************************************************************/


// kAEInheritedProperties isn't defined in OpenScripting.h for some reason
#define kAEBAEInheritedProperties 'c@#^'

// skip unneeded aete data
#define SKIP_UINT16 cursor += 2;
#define SKIP_OSTYPE cursor += 4;
#define SKIP_STRING cursor += (unsigned char)aeteData[cursor]; cursor += 1;

// realign aete data cursor after reading strings
#define ALIGN_CURSOR cursor += cursor & 1;

// perform a bounds check on aete data cursor to protect against malformed aete data
#define CHECK_CURSOR \
	if (cursor > aeteSize) { \
		errorMessage = [NSString stringWithFormat: \
                        @"The AETE ended prematurely (%li bytes expected, %li bytes read)", aeteSize, cursor]; \
        return NO; \
    }


/**********************************************************************/


@implementation AEBDynamicAETEParser

- (instancetype)init {
	self = [super init];
	if (!self) return self;
	commands    = [[NSMutableDictionary alloc] init];
	properties  = [[NSMutableSet alloc] init];
	elements    = [[NSMutableSet alloc] init];
	classes     = [[NSMutableSet alloc] init];
	enumerators = [[NSMutableSet alloc] init];
	// following are used in -parse: to supply 'missing' singular/plural class names
	classAndElementDefsByCode = [[NSMutableDictionary alloc] init];
	foundClassCodes           = [[NSMutableSet alloc] init];
	foundElementCodes         = [[NSMutableSet alloc] init];
	return self;
}


// Data source methods

- (unsigned short)integer {
	unsigned short *n = (void *)aeteData + cursor;
	cursor += 2;
	return *n;
}

- (OSType)word {
	OSType *t = (void *)aeteData + cursor;
	cursor += 4;
	return *t;
}

- (NSString *)name {
	NSString *s;
	unsigned char len = aeteData[cursor]; // Pascal string
	cursor += 1;
	if (len) {
		s = [[NSString alloc] initWithBytes: (aeteData + cursor)
									 length: len
								   encoding: NSMacOSRomanStringEncoding];
	} else {
		s = [[NSString alloc] init];
	}
	cursor += len;
	return s;
}

// Parse methods

- (BOOL)parseCommand {
	NSString *name = [self name];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"Parse Command %@\n", name);
#endif
	SKIP_STRING;		// description
	ALIGN_CURSOR;
	OSType classCode = [self word];
	OSType code = [self word];
	AEBDynamicCommandTerm *commandDef = [[AEBDynamicCommandTerm alloc] initWithName: name 
                                                                         eventClass: classCode
                                                                            eventID: code];
	// skip result
	SKIP_OSTYPE;		// datatype
	SKIP_STRING;		// description
	ALIGN_CURSOR;
	SKIP_UINT16;		// flags
	// skip direct parameter
	SKIP_OSTYPE;		// datatype
	SKIP_STRING;		// description
	ALIGN_CURSOR;
	SKIP_UINT16;		// flags
	// parse keyword parameters
	/* Note: overlapping command definitions (e.g. InDesign) should be processed as follows:
		- If their names and codes are the same, only the last definition is used; other definitions are ignored and will not compile.
		- If their names are the same but their codes are different, only the first definition is used; other definitions are ignored and will not compile.
		- If a dictionary-defined command has the same name but different code to a built-in definition, escape its name so it doesn't conflict with the default built-in definition.
	*/
	AEBDynamicCommandTerm *otherCommandDef = commands[name];
	if (!otherCommandDef || ([commandDef eventClass] == [otherCommandDef eventClass]
                             && [commandDef eventID] == [otherCommandDef eventID])) {
		commands[name] = commandDef;
    }
	int n = [self integer];
	for (int i = 0; i < n; i++) {
		NSString *paramName = [self name];
		ALIGN_CURSOR;
        OSType paramCode = [self word];
		SKIP_OSTYPE;	// datatype
		SKIP_STRING;	// description
		ALIGN_CURSOR;
		SKIP_UINT16;	// flags
		[commandDef addParameterWithName: paramName code: paramCode];
		CHECK_CURSOR;
	}
    return YES;
}

- (BOOL)parseClass {
	BOOL isPlural = NO;
	NSString *className = [self name];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"Parse Class %@\n", className);
#endif
	ALIGN_CURSOR;
	OSType classCode = [self word];
	SKIP_STRING;		// description
	ALIGN_CURSOR;
	// properties
	int n = [self integer];
	for (int i = 0; i < n; i++) {
		NSString *propertyName = [self name];
#ifdef AEB_DEBUG_PARSER
        NSLog(@"    property: %@\n", propertyName);
#endif
		ALIGN_CURSOR;
		OSType propertyCode = [self word];
		SKIP_OSTYPE;	// datatype
		SKIP_STRING;	// description
		ALIGN_CURSOR;
		short flags = [self integer];
		if (propertyCode != kAEBAEInheritedProperties) { // it's a normal property definition, not a superclass  definition
            AEBDynamicKeywordTerm *propertyDef;
			propertyDef = [[AEBDynamicKeywordTerm alloc] initWithName: propertyName code: propertyCode kind: kAEBTermProperty];
			if (flags & 1) { // class name is plural
				isPlural = YES;
			} else if (![properties containsObject: propertyDef]) { // add to list of property definitions
				[properties addObject: propertyDef];
            }
		}
		CHECK_CURSOR;
	}
	// skip elements
	n = [self integer];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"    skipping %i elements\n", n);
#endif
	for (int i = 0; i < n; i++) {
		SKIP_OSTYPE;	// code
		int m = [self integer]; // number of reference forms
		cursor += 4 * m;
		CHECK_CURSOR;
	}
	// add either singular (class) or plural (element) name definition
	AEBDynamicKeywordTerm *classDef = [[AEBDynamicKeywordTerm alloc] initWithName: className code: classCode kind: kAEBTermType];
	NSNumber *code = @(classCode);
	if (isPlural) {
		if (![elements containsObject: classDef]) {
			[elements addObject: classDef];
			[foundElementCodes addObject: code];
		}
	} else {
		if (![classes containsObject: classDef]) {
			[classes addObject: classDef];
			[foundClassCodes addObject: code];
		}
	}
	classAndElementDefsByCode[code] = classDef;
    return YES;
}

- (BOOL)parseComparison { // comparison info isn't used
	SKIP_STRING;		// name
	ALIGN_CURSOR;
	SKIP_OSTYPE;		// code
	SKIP_STRING;		// description
	ALIGN_CURSOR;
    return YES;
}

- (BOOL)parseEnumeration {
	
	SKIP_OSTYPE;		// code
	int n = [self integer];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"parsing %i enumerators\n", n);
#endif
	// enumerators
	for (int i = 0; i < n; i++) {
		NSString *name = [self name];
		ALIGN_CURSOR;
        AEBDynamicKeywordTerm *enumeratorDef;
		enumeratorDef = [[AEBDynamicKeywordTerm alloc] initWithName: name code: [self word] kind: kAEBTermEnumerator];
#ifdef AEB_DEBUG_PARSER
        NSLog(@"enum: %@\n", [enumeratorDef name]);
#endif
		SKIP_STRING;	// description
		ALIGN_CURSOR;
		if (![enumerators containsObject: enumeratorDef]) [enumerators addObject: enumeratorDef];
		CHECK_CURSOR;
	}
    return YES;
}

- (BOOL)parseSuite {
#ifdef AEB_DEBUG_PARSER
    NSLog(@"\n\nParse Suite %@\n", [self name]);
#else
		SKIP_STRING;	// name string
#endif
	SKIP_STRING;		// description
	ALIGN_CURSOR;
	SKIP_OSTYPE;		// code
	SKIP_UINT16;		// level
	SKIP_UINT16;		// version
	int n = [self integer];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"\nparsing %i commands...\n", n);
#endif
	for (int i = 0; i < n; i++) {
		if (![self parseCommand]) return NO;
		CHECK_CURSOR;
	}
	n = [self integer];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"\nparsing %i classes...\n", n);
#endif
	for (int i = 0; i < n; i++) {
		if (![self parseClass]) return NO;
		CHECK_CURSOR;
	}
	n = [self integer];
	for (int i = 0; i < n; i++) {
		if (![self parseComparison]) return NO;
		CHECK_CURSOR;
	}
	n = [self integer];
#ifdef AEB_DEBUG_PARSER
    NSLog(@"\nparsing %i enumerations...\n", n);
#endif
	for (int i = 0; i < n; i++) {
		if (![self parseEnumeration]) return NO;
		CHECK_CURSOR;
	}
    return YES;
}

- (BOOL)parseAETEDescriptor:(NSAppleEventDescriptor *)aete error:(NSError * __autoreleasing *)error {
	if (aete.descriptorType == typeAETE || aete.descriptorType == typeAEUT) {
		NSData *data = [aete data];
		aeteData = (char *)[data bytes];
		aeteSize = [data length];
		cursor = 6; // skip version, language, script integers
		int n = [self integer];
		for (int j = 0; j < n; j++) {
			if (![self parseSuite]) {
                NSLog(@"parseSuite failed");
                if (error) *error = AEMErrorWithInfo(errOSACorruptTerminology,
                                                     errorMessage ?: @"An error occurred while parsing AETE.");
                return NO;
            }
        }
	}
    return YES;
}

- (BOOL)parse:(id)aetes error:(NSError * __autoreleasing *)error {
    if (error) *error = nil;
        if ([aetes isKindOfClass: NSAppleEventDescriptor.class]) {
            if ([aetes descriptorType] != typeAEList) {
                aetes = [aetes coerceToDescriptorType: typeAEList];
            }
            for (int i = 1; i <= [aetes numberOfItems]; i++) {
                if (![self parseAETEDescriptor: [aetes descriptorAtIndex: i] error: error]) {
                    NSLog(@"parse:error: failed %@", *error);
                    return NO;
                }
            }
        } else if ([aetes isKindOfClass: NSArray.class]) {
            for (int i = 0; i < [aetes count]; i++) {
                if (![self parseAETEDescriptor: aetes[i] error: error]) return NO;
            }
        } else {
            if (error) {
                NSString *message = [NSString stringWithFormat:
                                     @"Not an AETE descriptor or AEList/NSArray of AETE descriptors: %@", aetes];
                *error = AEMErrorWithInfo(errOSATypeError, message);
            }
            return NO;
        }
        /* singular names are normally used in the classes table and plural names in the elements table. However, if an aete defines a singular name but not a plural name then the missing plural name is substituted with the singular name; and vice-versa if there's no singular equivalent for a plural name.
        */
        for (NSNumber *code in foundClassCodes) {
            if (![foundElementCodes containsObject: code]) {
#ifdef AEB_DEBUG_PARSER
                NSLog(@"missing element: %@\n", code);
#endif
                [elements addObject: classAndElementDefsByCode[code]];
            }
        }
        for (NSNumber *code in foundElementCodes) {
            if (![foundClassCodes containsObject: code]) {
#ifdef AEB_DEBUG_PARSER
                NSLog(@"missing class: %@\n", code);
#endif
                [classes addObject: classAndElementDefsByCode[code]];
            }
        }
	return YES;
}

- (NSArray *)types {
	return [classes allObjects];
}

- (NSArray *)enumerators {
	return [enumerators allObjects];
}
- (NSArray *)properties {
	return [properties allObjects];
}

- (NSArray *)elements {
	return [elements allObjects];
}
- (NSArray *)commands {
	return [commands allValues];
}
@end


