//
//  AEBDynamicTerminology.m
//

// TO DO: check conflicting terms are correctly disambiguated (note that property/element names currently aren't; this should be fixed)


#import "AEBDynamicTerminology.h"


@implementation AEBDynamicTerminology

@synthesize typesByName, propertiesByName, elementsByName, commandsByName, specifiersByName,
            typesByCode, propertiesByCode, elementsByCode, commandsByCode;

- (instancetype)init {
	return [self initWithKeywordConverter: nil defaultTerminology: nil];
}

- (instancetype)initWithKeywordConverter:(AEBKeywordConverter *)converter
                      defaultTerminology:(id)defaultTerms {
	self = [super init];
	if (!self) return self;
	keywordConverter = converter ?: [[AEBKeywordConverter alloc] init];

    typesByName = [[NSMutableDictionary alloc] init];
    propertiesByName = [[NSMutableDictionary alloc] init];
    elementsByName = [[NSMutableDictionary alloc] init];
    commandsByName = [[NSMutableDictionary alloc] init];
    
    typesByCode = [[NSMutableDictionary alloc] init];
    propertiesByCode = [[NSMutableDictionary alloc] init];
    elementsByCode = [[NSMutableDictionary alloc] init];
    commandsByCode = [[NSMutableDictionary alloc] init];
    
    if ([defaultTerms isEqual: kAEBUseDefaultTerminology]) { // use built-in default terms
        // TO DO: currently this uses pre-converted names, but eventually AEBDefaultTerms should contain
        // AS-style names and convert these as required (not sure what difference this might make to performance
        // but if significant then cache the converted terms here in a key-value list using converter_ as
        // key (note: AEBDynamic must support >1 language at a time, so any caches must be client language-aware)
        static dispatch_once_t pred = 0;
        __strong static AEBDefaultTerms *defaultRawTerms = nil;
        dispatch_once(&pred, ^{
            defaultRawTerms = [[AEBDefaultTerms alloc] initWithKeywordConverter: keywordConverter];
        });
        [self addRawTerminology: defaultRawTerms];
    } else if ([defaultTerms conformsToProtocol: @protocol(AEMSelfPackingProtocol)]) { // an object containing raw (dumped) terminology
        [self addRawTerminology: defaultTerms];
    } else if (![defaultTerms isEqual: kAEBNoTerminology]) { // bad argument
//        NSLog(@"Invalid defaultTerms value: %@", defaultTerms);
        return nil;
    } // else do not use default terms
    // retain copies of default type and command terms; these will be used to disambiguate
    // any conflicting application-defined terms added later
    defaultTypeByName = [[NSDictionary alloc] initWithDictionary: typesByName];
	defaultCommandByName = [[NSDictionary alloc] initWithDictionary:  commandsByName];
	return self;
}



// PRIVATE

- (void)addTypeTableDefinitions:(NSArray *)definitions ofType:(OSType)descType {
	NSUInteger len = [definitions count];
	for (NSUInteger i = 0; i < len; i++) {
		// add a definition to typeByCode table
		// to handle synonyms, if same code appears more than once then use name from last definition in list
        {
            AEBDynamicKeywordTerm *keywordTerm = definitions[i];
            NSString *name = [keywordConverter convertSpecifierName: keywordTerm.name]; // TO DO: this should be redundant now; review, delete
            OSType code = keywordTerm.code;
            // escape definitions that semi-overlap default definitions
            NSAppleEventDescriptor *desc = defaultTypeByName[name];
            if (desc && desc.typeCodeValue != code) name = keywordTerm.name = [keywordConverter escapeName: name];
            // add item
            typesByCode[@(code)] = name;
        }
		// add a definition to typeByName table
		// to handle synonyms, if same name appears more than once then use code from first definition in list
        {
            AEBDynamicKeywordTerm *keywordTerm = definitions[(len - 1 - i)];
            NSString *name = keywordTerm.name;
            OSType code = keywordTerm.code;
            // escape definitions that semi-overlap default definitions
            NSAppleEventDescriptor *desc = defaultTypeByName[name];
            if (desc && desc.typeCodeValue != code) name = keywordTerm.name = [keywordConverter escapeName: name];
            // add item
            typesByName[name] = desc = [[NSAppleEventDescriptor alloc] initWithDescriptorType: descType
                                                                                        bytes: (void *)(&code)
                                                                                       length: sizeof(code)];
        }
	}
}


- (void)addSpecifierTableDefinitions:(NSArray *)definitions
						 toNameTable:(NSMutableDictionary *)nameTable
						   codeTable:(NSMutableDictionary *)codeTable {
	NSUInteger len = [definitions count];
	for (NSUInteger i = 0; i < len; i++) {
		// add a definition to the byCode table
		// to handle synonyms, if same code appears more than once then use name from last definition in list
        {
            AEBDynamicKeywordTerm *keywordTerm = definitions[i];
            codeTable[@(keywordTerm.code)] = keywordTerm.name;
        }
        // TO DO: escape definitions that semi-overlap default definitions? (see TODO at top)
		// add a definition to the byName table
		// to handle synonyms, if same name appears more than once then use code from first definition in list
        {
            AEBDynamicKeywordTerm *keywordTerm = definitions[(len - 1 - i)];
            nameTable[keywordTerm.name] = keywordTerm;
        }
	}
}


- (void)addCommandTableDefinitions:(NSArray *)commands {
	// To handle synonyms, if two commands have same name but different codes, only the first
	// definition should be used (iterating array in reverse ensures this)
	NSUInteger len = [commands count];
	for (NSUInteger i = 0; i < len; i++) {
		AEBDynamicCommandTerm *commandTerm = commands[(len - 1 - i)];
		NSString *name = commandTerm.name;
		OSType eventClass = commandTerm.eventClass;
		OSType eventID = commandTerm.eventID;
		// Avoid collisions between default commands and application-defined commands with same name
		// but different code (e.g. 'get' and 'set' in InDesign CS2):
        AEBDynamicCommandTerm *commandDef, *existingCommandDef;
		existingCommandDef = defaultCommandByName[name];
		if (existingCommandDef && (existingCommandDef.eventClass != eventClass
                                   || existingCommandDef.eventID != eventID)) {
			name = commandTerm.name = [keywordConverter escapeName: name];
        }
		// add item
		commandDef = [[AEBDynamicCommandTerm alloc] initWithName: name // TO DO: redundant
                                                      eventClass: eventClass
                                                         eventID: eventID];
        commandsByName[name] = commandsByCode[AEBCommandKeyForCodes(eventClass, eventID)] = commandDef;
		for (AEBDynamicKeywordTerm *parameterDef in [commandTerm parameters]) {
			[commandDef addParameterWithName: parameterDef.name code: parameterDef.code];
		}
	}
}




// PUBLIC

- (void)addRawTerminology:(id<AEBDynamicRawTermsProtocol>)terms {
	// build type tables
	[self addTypeTableDefinitions: terms.properties ofType: typeType];
	[self addTypeTableDefinitions: terms.enumerators ofType: typeEnumerated];
	[self addTypeTableDefinitions: terms.types ofType: typeType];
	// build specifier tables
	[self addSpecifierTableDefinitions: terms.elements toNameTable: elementsByName codeTable: elementsByCode];
	[self addSpecifierTableDefinitions: terms.properties toNameTable: propertiesByName codeTable: propertiesByCode];
	// build command table
	[self addCommandTableDefinitions: terms.commands];
	// special case: if property table contains a 'text' definition, move it to element table
	// (AppleScript always packs 'text of...' as an all-elements specifier, not a property specifier)
    // TO DO: should check if this rule only applies to 'text', or other ambiguous property/element names too
	AEBDynamicKeywordTerm *specialTerm = propertiesByName[@"text"];
	if (specialTerm) {
		elementsByName[@"text"] = [[AEBDynamicKeywordTerm alloc] initWithName: specialTerm.name
                                                                          code: specialTerm.code
                                                                          kind: kAEBTermType];
		[propertiesByName removeObjectForKey: @"text"];
	}
}

- (NSDictionary *)specifiersByName {
    if (!specifiersByName) {
        specifiersByName = [NSMutableDictionary dictionary];
        [specifiersByName addEntriesFromDictionary: elementsByName];
        [specifiersByName addEntriesFromDictionary: propertiesByName];
        [specifiersByName addEntriesFromDictionary: commandsByName];
    }
    return specifiersByName;
}

@end

