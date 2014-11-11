//
//  AEBStaticFormatter.m
//

#import "AEBStaticFormatter.h"


/**********************************************************************/
// Abstract base class for specifier renderers

@implementation AEBStaticFormatter

// clients should avoid calling this method directly; use +formatObject:appData: instead
- (instancetype)initWithAppData:(id)appData_ {
	self = [super init];
	if (!self) return self;
	result = [NSMutableString string];
	appData = appData_;
	return self;
}




/*******/

// takes an AEMQuery plus AEBStaticAppData instance, and returns the query's literal ObjC representation
+ (NSString *)formatObject:(id)object appData:(id)appData_ {
	if ([object isKindOfClass: AEMQuery.class]) {
		AEBStaticFormatter *renderer = [[self.class alloc] initWithAppData: appData_];
		[object resolveWithObject: renderer];
        return [renderer result] ?: [NSString stringWithFormat: @"[%@ specifierWithObject: %@]", renderer.app, object];
	} else {
		return AEMFormatObject(object);
	}
}

- (NSString *)result {
	return result;
}

/*******/

// method stubs; application-specific subclasses should override to provide code->name translations
- (NSString *)propertyByCode:(OSType)code { 
	return nil;
}

- (NSString *)elementByCode:(OSType)code {
	return nil;
}

// method stub; application-specific subclasses should override to provide class name prefix

- (NSString *)prefix {
	return @"AEB";
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
    NSString *name = [self propertyByCode: code] ?: [self elementByCode: code];
	if (!name) { // no code->name translation available
		result = nil;
		return nil;
	}
	[result appendFormat: @".%@", name];
    return self;
}

- (instancetype)elements:(OSType)code {
    NSString *name = [self elementByCode: code] ?: [self propertyByCode: code];
	if (!name) { // no code->name translation available
		result = nil;
		return nil;
	}
	[result appendFormat: @".%@", name];
    return self;
}


- (instancetype)first {
	[result appendString: @".first"];
    return self;
}

- (instancetype)middle {
	[result appendString: @".middle"];
    return self;
}

- (instancetype)last {
	[result appendString: @".last"];
    return self;
}

- (instancetype)any {
	[result appendString: @".any"];
    return self;
}

// by-index, by-name, by-id selectors

- (instancetype)byIndex:(id)index {
	[result insertString: @"[" atIndex: 0];
	if ([index isKindOfClass: NSNumber.class]) {
		[result appendFormat: @" at: %@]", index];
	} else {
		[result appendFormat: @" byIndex: %@]", [self format: index]];
    }
    return self;
}

- (instancetype)byName:(id)name {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" byName: %@]", [self format: name]];
    return self;
}

- (instancetype)byID:(id)id_ {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" byID: %@]", [self format: id_]];
    return self;
}

// by-relative-position selectors

- (instancetype)previous:(OSType)class_ {
	NSAppleEventDescriptor *desc = [NSAppleEventDescriptor descriptorWithTypeCode:class_];
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" previous: %@]", [appData unpack: desc error: nil] ?: desc];
    return self;
}

- (instancetype)next:(OSType)class_ {
	NSAppleEventDescriptor *desc = [NSAppleEventDescriptor descriptorWithTypeCode:class_];
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" next: %@]", [appData unpack: desc error: nil] ?: desc];
    return self;
}

// by-range selector

- (instancetype)byRange:(id)fromObject to:(id)toObject {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" byRange: %@ to: %@]", [self format: fromObject], [self format: toObject]];
    return self;
}

// by-test selector

- (instancetype)byTest:(id)testSpecifier {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" byTest: %@]", [self format: testSpecifier]];
    return self;
}

// insertion location selectors

- (instancetype)beginning {
	[result appendString: @".beginning"];
    return self;
}

- (instancetype)end {
	[result appendString: @".end"];
    return self;
}

- (instancetype)before {
	[result appendString: @".before"];
    return self;
}

- (instancetype)after {
	[result appendString: @".after"];
    return self;
}

// test clause renderers

- (instancetype)greaterThan:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" greaterThan: %@]", [self format: object]];
    return self;
}

- (instancetype)greaterOrEquals:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" greaterOrEquals: %@]", [self format: object]];
    return self;
}

- (instancetype)equals:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" equals: %@]", [self format: object]];
    return self;
}

- (instancetype)notEquals:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" notEquals: %@]", [self format: object]];
    return self;
}

- (instancetype)lessThan:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" lessThan: %@]", [self format: object]];
    return self;
}

- (instancetype)lessOrEquals:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" lessOrEquals: %@]", [self format: object]];
    return self;
}

- (instancetype)beginsWith:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" beginsWith: %@]", [self format: object]];
    return self;
}

- (instancetype)endsWith:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" endsWith: %@]", [self format: object]];
    return self;
}

- (instancetype)contains:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" contains: %@]", [self format: object]];
    return self;
}

- (instancetype)isIn:(id)object {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" isIn: %@]", [self format: object]];
    return self;
}

- (instancetype)AND:(id)remainingOperands {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" AND: %@]", [self format: remainingOperands]];
    return self;
}

- (instancetype)OR:(id)remainingOperands {
	[result insertString: @"[" atIndex: 0];
	[result appendFormat: @" OR: %@]", [self format: remainingOperands]];
    return self;
}

- (instancetype)NOT {
	[result insertString: @"[" atIndex: 0];
	[result appendString: @" NOT]"];
    return self;
}


// specifier roots

- (instancetype)app {
	if (appData) {
		NSError *error = nil;
		id target = [appData targetWithError: &error];
		if (target) {
			AEMTargetType targetType = [target targetType];
			id targetData = [target targetData];
			switch (targetType) {
				case kAEMTargetCurrent:
					[result appendFormat: @"[%@Application application]", self.prefix];
					return self;
				case kAEMTargetFileURL:
					[result appendFormat: @"[%@Application applicationWithName: %@]", 
											self.prefix, [self format: [targetData path]]];
					return self;
				case kAEMTargetEppcURL:
					[result appendFormat: @"[%@Application applicationWithURL: %@]", 
											self.prefix, [self format: targetData]];
					return self;
				case kAEMTargetProcessID:
					[result appendFormat: @"[%@Application applicationWithProcessID: %@]", 
											self.prefix, [self format: targetData]];
					return self;
				case kAEMTargetDescriptor:
					[result appendFormat: @"[%@Application applicationWithDescriptor: %@]", 
											self.prefix, [self format: targetData]];
					return self;
			}
		}
		[result appendFormat: @"<%@Application invalid target (error=%li)>", self.prefix, (long)[error code]];
		return self;
	}
	[result appendFormat: @"%@App", self.prefix];
	return self;
}

- (instancetype)con {
	[result appendFormat: @"%@Con", self.prefix];
    return self;
}

- (instancetype)its {
	[result appendFormat: @"%@Its", self.prefix];
    return self;
}

- (instancetype)customRoot:(id)rootObject {
	[result appendFormat: @"%@CustomRoot(%@)", self.prefix, rootObject];
    return self;
}

@end
