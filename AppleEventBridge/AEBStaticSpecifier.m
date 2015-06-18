//
//  AEBStaticSpecifier.m
//

#import "AEBStaticSpecifier.h"
#import "AEMTestClause.h"

@implementation AEBStaticSpecifier

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

/* +app, +con, +its methods can be used in place of XXApp, XXCon, XXIts macros */

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

/* by-index, by-name, by-id selectors */

- (instancetype)at:(int)index {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery at: index]);
}
- (instancetype)byIndex:(id)index {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byIndex: index]);
}
- (instancetype)byName:(id)name {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byName: name]);
}
- (instancetype)byID:(id)id_ {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byID: id_]);
}

/* by-relative-position selectors */

- (instancetype)previous:(AEBSymbol *)class_ {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery previous: [class_ aebCode]]);
}
- (instancetype)next:(AEBSymbol *)class_ {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery next: [class_ aebCode]]);
}

/* by-range selector */

- (instancetype)at:(int)fromIndex to:(int)toIndex {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery at: fromIndex to: toIndex]);
}
- (instancetype)byRange:(id)fromObject to:(id)toObject {
    // takes two con-based specifiers, with other values being expanded as necessary
    if ([fromObject isKindOfClass: self.class]) fromObject = [fromObject aemQuery]; // TO DO: check unwrapping logic here and in byTest; note: this'd be simpler with AEMQueryProtocol, which'd allow any AEM/AEB query to be passed directly to AEM API, which would automatically unwrap it as needed by calling -aemQuery on it
    if ([toObject isKindOfClass: self.class]) toObject = [toObject aemQuery];
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byRange: fromObject to: toObject]);
}

/* by-test selector */

- (instancetype)byTest:(id)testQuery { // TO DO: use <id>AEMTestQueryProtocol
    if ([testQuery isKindOfClass: self.class]) testQuery = [testQuery aemQuery]; // TO DO: also implement AEMTestQueryProtocol? this'd simplify AEM's byTest: method, since it could be typed as id<AEMTestQueryProtocol>, avoiding the need for extra fiddling
    if (![testQuery isKindOfClass: AEMTestClause.class]) return nil;
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)self.aemQuery byTest: testQuery]); // TO DO: check unwrapping logic here and in byRange
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

- (instancetype)greaterThan:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery greaterThan: object]);
}
- (instancetype)greaterOrEquals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery greaterOrEquals: object]);
}
- (instancetype)equals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery equals: object]);
}
- (instancetype)notEquals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery notEquals: object]);
}
- (instancetype)lessThan:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)self.aemQuery lessThan: object]);
}
- (instancetype)lessOrEquals:(id)object {
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
