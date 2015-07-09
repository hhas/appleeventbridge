//
//  AEBObjCSpecifier.m
//

#import "AEBObjCSpecifier.h"
#import "AEMTestClause.h"

@implementation AEBObjCSpecifier

// get/set shortcuts

#define NEW_GET_SET_COMMAND(eID) ([AEBGetSetItemCommand commandWithAppData: self.aebAppData \
                                                                eventClass: kAECoreSuite \
                                                                   eventID: (eID) \
                                                           directParameter: (__bridge id)kAEBNoDirectParameter \
                                                               parentQuery: self.aemQuery])

- (id)setItem:(id)data {
    return [self setItem: data error: nil];
}

- (id)setItem:(id)data error:(NSError * __autoreleasing *)error {
    AEBGetSetItemCommand *command = NEW_GET_SET_COMMAND(kAESetData);
    [command setParameter: data forKeyword: keyAEData];
    return [command sendWithError: error];
}

- (id)getItem {
    return [self getItemWithError: nil];
}

- (id)getItemWithError:(NSError * __autoreleasing *)error {
    return [NEW_GET_SET_COMMAND(kAEGetData) sendWithError: error];
}

- (id)getList {
    return [self getListWithError: nil];
}

- (id)getListWithError:(NSError * __autoreleasing *)error {
    return [[NEW_GET_SET_COMMAND(kAEGetData) returnList] sendWithError: error];
}

- (id)getItemOfType:(DescType)type {
    return [self getItemOfType: type error: nil];
}

- (id)getItemOfType:(DescType)type error:(NSError * __autoreleasing *)error {
    AEBGetSetItemCommand *command = NEW_GET_SET_COMMAND(kAEGetData);
    [command setParameter: [NSAppleEventDescriptor descriptorWithTypeCode: type] forKeyword: keyAERequestedType];
    return [[command returnType: type] sendWithError: error];
}

- (id)getListOfType:(DescType)type {
    return [self getListOfType: type error: nil];
}

- (id)getListOfType:(DescType)type error:(NSError * __autoreleasing *)error {
    AEBGetSetItemCommand *command = NEW_GET_SET_COMMAND(kAEGetData);
    [command setParameter: [NSAppleEventDescriptor descriptorWithTypeCode: type] forKeyword: keyAERequestedType];
    return [[command returnListOfType: type] sendWithError: error];
}

- (NSInteger)getIntegerWithError:(NSError * __autoreleasing *)error {
    AEBGetSetItemCommand *command = NEW_GET_SET_COMMAND(kAEGetData);
    [command setParameter: [NSAppleEventDescriptor descriptorWithTypeCode: typeSInt64] forKeyword: keyAERequestedType];
    return [(NSNumber *)[[command returnType: typeSInt64] sendWithError: error] integerValue];
}

- (double)getDoubleWithError:(NSError * __autoreleasing *)error {
    AEBGetSetItemCommand *command = NEW_GET_SET_COMMAND(kAEGetData);
    [command setParameter: [NSAppleEventDescriptor descriptorWithTypeCode: typeIEEE64BitFloatingPoint] forKeyword: keyAERequestedType];
    return [(NSNumber *)[[command returnType: typeIEEE64BitFloatingPoint] sendWithError: error] doubleValue];
}


/*
 * specifier roots and reference forms
 */

// TO DO: add -propertyByCode:, -elementsByCode:, -userProperty:, -commandByCode:

/* +app, +con, +its methods can be used in place of XXApp, XXCon, XXIts macros */
// TO DO: these are probably redundant if this glue is only used in ObjC, as static glues already define their own specifier roots
+ (instancetype)app {
    return [[self alloc] initWithAppData: nil aemQuery: AEMApp];
}
+ (instancetype)con {
    return [[self alloc] initWithAppData: nil aemQuery: AEMCon];
}
+ (instancetype)its {
    return [[self alloc] initWithAppData: nil aemQuery: AEMIts];
}

/* ordinal selectors */

#define NEW_SPECIFIER(aQuery) ([[self.class alloc] initWithAppData: self.aebAppData aemQuery: (aQuery)])

- (instancetype)first {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery first]);
}
- (instancetype)middle {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery middle]);
}
- (instancetype)last {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery last]);
}
- (instancetype)any {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery any]);
}

/* by-index, by-name, by-test selectors */

- (instancetype)objectAtIndexedSubscript:(int)idx {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery at: idx]);
}

- (instancetype)objectForKeyedSubscript:(id)key {
    if ([key isKindOfClass: AEBSpecifier.class] || [key conformsToProtocol: @protocol(AEMQueryProtocol)]) {
        AEMQuery *query = [key aemQuery];
        if ([query isKindOfClass: AEMTestClause.class] && [query.root isEqualTo: AEMIts]) {
            return NEW_SPECIFIER([((AEMMultipleElementsSpecifier *)self.aemQuery) byTest: (AEMTestClause *)query]);
        } else {
            return nil; // TO DO: pack as by-index/by-name if it's a correctly formed app- or customRoot-based specifier?
        }
    } else if ([key isKindOfClass: NSString.class]) {
        return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byName: key]);
    } else {
        return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byIndex: key]);
    }
}

- (instancetype)named:(id)name {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byName: name]);
}

/* by-ID selector */

- (instancetype)ID:(id)elementID {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byID: elementID]);
}

/* by-relative-position selectors */

- (instancetype)previous:(AEBSymbol *)elementClass {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery previous: [elementClass aebCode]]);
}
- (instancetype)next:(AEBSymbol *)elementClass {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery next: [elementClass aebCode]]);
}

/* by-range selector */

- (instancetype)from:(id)fromObject to:(id)toObject {
    // takes two con-based specifiers, with other values being expanded as necessary
    if ([fromObject isKindOfClass: self.class]) fromObject = [fromObject aemQuery]; // TO DO: check unwrapping logic here and in byTest; note: this'd be simpler with AEMQueryProtocol, which'd allow any AEM/AEB query to be passed directly to AEM API, which would automatically unwrap it as needed by calling -aemQuery on it
    if ([toObject isKindOfClass: self.class]) toObject = [toObject aemQuery];
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byRange: fromObject to: toObject]);
}


/* insertion location selectors */

- (instancetype)beginning {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery beginning]);
}
- (instancetype)end {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery end]);
}
- (instancetype)before {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery before]);
}
- (instancetype)after {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery after]);
}

/* Comparison and logic tests */

- (instancetype)gt:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery greaterThan: object]);
}
- (instancetype)ge:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery greaterOrEquals: object]);
}
- (instancetype)eq:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery equals: object]);
}
- (instancetype)ne:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery notEquals: object]);
}
- (instancetype)lt:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery lessThan: object]);
}
- (instancetype)le:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery lessOrEquals: object]);
}
- (instancetype)beginsWith:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery beginsWith: object]);
}
- (instancetype)endsWith:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery endsWith: object]);
}
- (instancetype)contains:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery contains: object]);
}
- (instancetype)isIn:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery isIn: object]);
}
- (instancetype)AND:(id)remainingOperands {
    return NEW_SPECIFIER([(AEMTestClause *)self.aemQuery AND: remainingOperands]);
}
- (instancetype)OR:(id)remainingOperands {
    return NEW_SPECIFIER([(AEMTestClause *)self.aemQuery OR: remainingOperands]);
}
- (instancetype)NOT {
    return NEW_SPECIFIER([(AEMTestClause *)self.aemQuery NOT]);
}

@end
