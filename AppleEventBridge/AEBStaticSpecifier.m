//
//  AEBSpecifier.m
//

#import "AEBStaticSpecifier.h"
#import "AEBStaticAppData.h"
#import "AEBStaticCommand.h"


/**********************************************************************/


@implementation AEBSpecifier

+ (instancetype)specifierWithAppData:(id)appData_ aemQuery:(id)aemQuery_ {
	return [[self alloc] initWithAppData: appData_ aemQuery: aemQuery_];
}

- (instancetype)initWithAppData:(AEBStaticAppData *)appData_ aemQuery:(AEMQuery *)aemQuery_ {
	self = [super init];
	if (!self) return self;
	appData = appData_;
	aemQuery = aemQuery_;
	return self;
}


// comparison, hash support

- (BOOL)isEqual:(id)object {
	if (self == object) return YES;
	if (!object || ![object isMemberOfClass: self.class]) return NO;
	return ([[appData targetWithError: nil] isEqual: [[(AEBSpecifier *)object AEBAppData] targetWithError: nil]]
                 && [aemQuery isEqual: [(AEBSpecifier *)object AEMQuery]]);
}

- (NSUInteger)hash {
	return ([[appData targetWithError: nil] hash] + [aemQuery hash]);
}


//

- (NSAppleEventDescriptor *)AEBPackSelf:(id)codecs error:(NSError * __autoreleasing *)error {
	return [aemQuery packWithCodecs: codecs error: error];
}

- (id)AEBAppData {
	return appData;
}

- (id)AEMQuery {
	return aemQuery;
}

- (void)setRelaunchMode:(AEBRelaunchMode)relaunchMode_ {
	[appData setRelaunchMode: relaunchMode_];
}

- (AEBRelaunchMode)relaunchMode {
	return [appData relaunchMode];
}


- (BOOL)isRunning {
	return [appData isRunning];
}

- (BOOL)launchApplication {
	return [self launchApplicationWithError: nil];
}

- (BOOL)launchApplicationWithError:(NSError * __autoreleasing *)error {
	return [appData launchApplicationWithError: error];
}

- (BOOL)reconnectApplication {
	return [[appData targetWithError: nil] reconnect];
}

- (BOOL)reconnectApplicationWithError:(NSError * __autoreleasing *)error {
	return [[appData targetWithError: error] reconnectWithError: error];
}

// transaction support

- (BOOL)beginTransactionWithError:(NSError * __autoreleasing *)error {
    return [[appData targetWithError: nil] beginTransactionWithError: error];
}

- (BOOL)beginTransactionWithSession:(id)session error:(NSError * __autoreleasing *)error {
	 return [[appData targetWithError: nil] beginTransactionWithSession: session error: error];
}

- (BOOL)endTransactionWithError:(NSError * __autoreleasing *)error {
	 return [[appData targetWithError: nil] endTransactionWithError: error];
}

- (BOOL)abortTransactionWithError:(NSError * __autoreleasing *)error {
	 return [[appData targetWithError: nil] abortTransactionWithError: error];
}


// get/set shortcuts

#define NEW_GET_SET_COMMAND(eID) ([AEBGetSetItemCommand commandWithAppData: appData \
                                                                eventClass: kAECoreSuite \
                                                                   eventID: (eID) \
                                                           directParameter: (__bridge id)kAEBNoDirectParameter \
                                                               parentQuery: aemQuery])

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

#define NEW_SPECIFIER(aQuery) ([[self.class alloc] initWithAppData: appData aemQuery: (aQuery)])

- (instancetype)first {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery first]);
}
- (instancetype)middle {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery middle]);
}
- (instancetype)last {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery last]);
}
- (instancetype)any {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery any]);
}

/* by-index, by-name, by-id selectors */

- (instancetype)at:(int)index {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery at: index]);
}
- (instancetype)byIndex:(id)index {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery byIndex: index]);
}
- (instancetype)byName:(id)name {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery byName: name]);
}
- (instancetype)byID:(id)id_ {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery byID: id_]);
}

/* by-relative-position selectors */

- (instancetype)previous:(AEBSymbol *)class_ {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery previous: [class_ AEBCode]]);
}
- (instancetype)next:(AEBSymbol *)class_ {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery next: [class_ AEBCode]]);
}

/* by-range selector */

- (instancetype)at:(int)fromIndex to:(int)toIndex {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery at: fromIndex to: toIndex]);
}
- (instancetype)byRange:(id)fromObject to:(id)toObject {
    // takes two con-based specifiers, with other values being expanded as necessary
    if ([fromObject isKindOfClass: self.class]) fromObject = [fromObject AEMQuery];
    if ([toObject isKindOfClass: self.class]) toObject = [toObject AEMQuery];
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery byRange: fromObject to: toObject]);
}

/* by-test selector */

- (instancetype)byTest:(id)testQuery {
    return NEW_SPECIFIER([(AEMMultipleElementsSpecifier *)aemQuery byTest: [testQuery AEMQuery]]);
}

/* insertion location selectors */

- (instancetype)beginning {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery beginning]);
}
- (instancetype)end {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery end]);
}
- (instancetype)before {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery before]);
}
- (instancetype)after {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery after]);
}

/* Comparison and logic tests */

- (instancetype)greaterThan:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery greaterThan: object]);
}
- (instancetype)greaterOrEquals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery greaterOrEquals: object]);
}
- (instancetype)equals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery equals: object]);
}
- (instancetype)notEquals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery notEquals: object]);
}
- (instancetype)lessThan:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery lessThan: object]);
}
- (instancetype)lessOrEquals:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery lessOrEquals: object]);
}
- (instancetype)beginsWith:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery beginsWith: object]);
}
- (instancetype)endsWith:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery endsWith: object]);
}
- (instancetype)contains:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery contains: object]);
}
- (instancetype)isIn:(id)object {
    return NEW_SPECIFIER([(AEMObjectSpecifier *)aemQuery isIn: object]);
}
- (instancetype)AND:(id)remainingOperands {
    return NEW_SPECIFIER([(AEMTest *)aemQuery AND: remainingOperands]);
}
- (instancetype)OR:(id)remainingOperands {
    return NEW_SPECIFIER([(AEMTest *)aemQuery OR: remainingOperands]);
}
- (instancetype)NOT {
    return NEW_SPECIFIER([(AEMTest *)aemQuery NOT]);
}
@end

