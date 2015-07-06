//
//  AEBObjCFormatter.m
//

#import "AEBObjCFormatter.h"


/**********************************************************************/
// Abstract base class for specifier renderers

@implementation AEBObjCFormatter

@synthesize appData, mutableResult;

// clients should avoid calling this method directly; use +formatObject:appData: instead
- (instancetype)initWithAppData:(id)appData_ {
	self = [super init];
	if (!self) return self;
	mutableResult = [NSMutableString string];
	appData = appData_;
	return self;
}




/*******/

// takes an AEMQuery plus AEBStaticAppData instance, and returns the query's literal ObjC representation
+ (NSString *)formatObject:(id)object appData:(id)appData_ {
	if ([object isKindOfClass: AEMQuery.class]) {
		AEBObjCFormatter *renderer = [[self.class alloc] initWithAppData: appData_];
		[object resolveWithObject: renderer];
        return renderer.mutableResult ? renderer.mutableResult.copy : [NSString stringWithFormat: @"[%@ specifierWithObject: %@]", renderer.app, object];
	} else {
		return AEMFormatObject(object);
	}
}

/*******/

// method stub; application-specific subclasses should override to provide class name prefix

- (NSString *)prefix {
	return @"AEB";
}

// method stubs; application-specific subclasses should override to provide code->name translations
- (NSString *)propertyByCode:(OSType)code { 
	return nil;
}

- (NSString *)elementsByCode:(OSType)code {
	return nil;
}

/*******/

- (NSString *)format:(id)object {
	if ([object isKindOfClass: AEMQuery.class]) {
		return [self.class formatObject: object appData: appData];
	} else {
		return AEMFormatObject(object);
    }
}

/*******/

- (instancetype)property:(OSType)code {
    NSString *name = [self propertyByCode: code] ?: [self elementsByCode: code];
	if (!name) { // no code->name translation available
        mutableResult = nil;
        return nil;
	}
	[mutableResult appendFormat: @".%@", name];
    return self;
}

- (instancetype)elements:(OSType)code {
    NSString *name = [self elementsByCode: code] ?: [self propertyByCode: code];
	if (!name) { // no code->name translation available
		mutableResult = nil;
		return nil;
	}
	[mutableResult appendFormat: @".%@", name];
    return self;
}


// by-ordinal selectors

- (instancetype)first {
	[mutableResult appendString: @".first"];
    return self;
}

- (instancetype)middle {
	[mutableResult appendString: @".middle"];
    return self;
}

- (instancetype)last {
	[mutableResult appendString: @".last"];
    return self;
}

- (instancetype)any {
	[mutableResult appendString: @".any"];
    return self;
}

// by-index, by-name, by-id selectors

- (instancetype)byIndex:(id)index {
	[mutableResult insertString: @"[" atIndex: 0];
	if ([index isKindOfClass: NSNumber.class]) {
		[mutableResult appendFormat: @" at: %@]", index];
	} else {
		[mutableResult appendFormat: @" byIndex: %@]", [self format: index]];
    }
    return self;
}

- (instancetype)byName:(id)name {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" byName: %@]", [self format: name]];
    return self;
}

- (instancetype)byID:(id)id_ {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" byID: %@]", [self format: id_]];
    return self;
}

// by-relative-position selectors

- (instancetype)previous:(OSType)class_ {
	NSAppleEventDescriptor *desc = [NSAppleEventDescriptor descriptorWithTypeCode:class_];
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" previous: %@]", [appData unpack: desc error: nil] ?: desc];
    return self;
}

- (instancetype)next:(OSType)class_ {
	NSAppleEventDescriptor *desc = [NSAppleEventDescriptor descriptorWithTypeCode:class_];
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" next: %@]", [appData unpack: desc error: nil] ?: desc];
    return self;
}

// by-range selector

- (instancetype)byRange:(id)fromObject to:(id)toObject {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" byRange: %@ to: %@]", [self format: fromObject], [self format: toObject]];
    return self;
}

// by-test selector

- (instancetype)byTest:(id)testSpecifier {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" byTest: %@]", [self format: testSpecifier]];
    return self;
}

// insertion location selectors

- (instancetype)beginning {
	[mutableResult appendString: @".beginning"];
    return self;
}

- (instancetype)end {
	[mutableResult appendString: @".end"];
    return self;
}

- (instancetype)before {
	[mutableResult appendString: @".before"];
    return self;
}

- (instancetype)after {
	[mutableResult appendString: @".after"];
    return self;
}

// test clause renderers

- (instancetype)greaterThan:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" greaterThan: %@]", [self format: object]];
    return self;
}

- (instancetype)greaterOrEquals:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" greaterOrEquals: %@]", [self format: object]];
    return self;
}

- (instancetype)equals:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" equals: %@]", [self format: object]];
    return self;
}

- (instancetype)notEquals:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" notEquals: %@]", [self format: object]];
    return self;
}

- (instancetype)lessThan:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" lessThan: %@]", [self format: object]];
    return self;
}

- (instancetype)lessOrEquals:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" lessOrEquals: %@]", [self format: object]];
    return self;
}

- (instancetype)beginsWith:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" beginsWith: %@]", [self format: object]];
    return self;
}

- (instancetype)endsWith:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" endsWith: %@]", [self format: object]];
    return self;
}

- (instancetype)contains:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" contains: %@]", [self format: object]];
    return self;
}

- (instancetype)isIn:(id)object {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" isIn: %@]", [self format: object]];
    return self;
}

- (instancetype)AND:(id)remainingOperands {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" AND: %@]", [self format: remainingOperands]];
    return self;
}

- (instancetype)OR:(id)remainingOperands {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendFormat: @" OR: %@]", [self format: remainingOperands]];
    return self;
}

- (instancetype)NOT {
	[mutableResult insertString: @"[" atIndex: 0];
	[mutableResult appendString: @" NOT]"];
    return self;
}


// specifier roots

- (instancetype)app {
	if (appData) {
		NSError *error = nil;
		AEMApplication *target = [appData targetWithError: &error];
		if (target) {
			AEMTargetType targetType = [target targetType];
			id targetData = [target targetData];
			switch (targetType) {
				case AEMTargetCurrent:
					[mutableResult appendFormat: @"[%@Application application]", self.prefix];
					return self;
				case AEMTargetFileURL:
					[mutableResult appendFormat: @"[%@Application applicationWithName: %@]",
                                                    self.prefix, [self format: [targetData path]]];
					return self;
				case AEMTargetEppcURL:
					[mutableResult appendFormat: @"[%@Application applicationWithURL: %@]",
                                                    self.prefix, [self format: targetData]];
					return self;
				case AEMTargetProcessID:
					[mutableResult appendFormat: @"[%@Application applicationWithProcessID: %@]",
                                                    self.prefix, [self format: targetData]];
					return self;
				case AEMTargetDescriptor:
					[mutableResult appendFormat: @"[%@Application applicationWithDescriptor: %@]",
                                                    self.prefix, [self format: targetData]];
					return self;
			}
		}
		[mutableResult appendFormat: @"<%@Application invalid target (error=%li)>", self.prefix, (long)[error code]];
		return self;
	}
	[mutableResult appendFormat: @"%@App", self.prefix];
	return self;
}

- (instancetype)con {
	[mutableResult appendFormat: @"%@Con", self.prefix];
    return self;
}

- (instancetype)its {
	[mutableResult appendFormat: @"%@Its", self.prefix];
    return self;
}

- (instancetype)customRoot:(id)rootObject {
	[mutableResult appendFormat: @"%@CustomRoot(%@)", self.prefix, [self format: rootObject]];
    return self;
}

@end
