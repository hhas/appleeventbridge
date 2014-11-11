//
//  AEBDynamicTerm.m
//

#import "AEBDynamicTerm.h"


/**********************************************************************/


@implementation AEBDynamicTerm

@synthesize name, kind;

- (instancetype)init {
	return nil;
}

- (instancetype)initWithName:(NSString*)name_ kind:(AEBDynamicTermType)kind_ {
	self = [super init];
	if (!self) return self;
    name = name_;
    kind = kind_;
	return self;
}

@end




@implementation AEBDynamicKeywordTerm // type/enumerator/property/element/parameter name

@synthesize code;

- (instancetype)initWithName:(NSString*)name_ code:(OSType)code_ kind:(AEBDynamicTermType)kind_ {
	self = [super initWithName: name_ kind: kind_];
	if (!self) return self;
    code = code_;
	return self;
}


- (NSUInteger)hash {
	return (NSUInteger)code;
}

- (BOOL)isEqual:(id)anObject {
	return (anObject == self || ([anObject isMemberOfClass: self.class]
                                 && [self.name isEqual: [(AEBDynamicKeywordTerm *)anObject name]]
                                        && self.code == [(AEBDynamicKeywordTerm *)anObject code]));
}

- (NSString *)description {
	return [NSString stringWithFormat: @"<AEBDynamicKeywordTerm (%i) \"%@\" '%@'>",
                                       self.kind, self.name, AEMFormatOSType(code)];
}

@end




@implementation AEBDynamicCommandTerm : AEBDynamicTerm

@synthesize eventClass, eventID, parameters;


- (instancetype)initWithName:(NSString*)name_ eventClass:(OSType)eventClass_ eventID:(OSType)eventID_ {
    self = [super initWithName: name_ kind: kAEBTermCommand];
	if (!self) return self;
    eventClass = eventClass_;
    eventID = eventID_;
    parametersByName = [[NSMutableDictionary alloc] init];
    parametersByCode = [[NSMutableDictionary alloc] init];
    return self;
}



- (NSUInteger)hash {
	return (NSUInteger)eventClass + (NSUInteger)eventID;
}

- (BOOL)isEqual:(id)anObject {
	return (anObject == self || ([anObject isMemberOfClass: self.class]
                                 && [self.name isEqual: [(AEBDynamicCommandTerm *)anObject name]]
                                       && eventClass == [(AEBDynamicCommandTerm *)anObject eventClass]
                                          && eventID == [(AEBDynamicCommandTerm *)anObject eventID]
                                 && [self.parameters isEqual: [(AEBDynamicCommandTerm *)anObject parameters]]));
}

- (NSString *)description {
	return [NSString stringWithFormat: @"<AEBDynamicKeywordCommand \"%@\" '%@'/'%@' %@>", self.name,
			AEMFormatOSType(eventClass), AEMFormatOSType(eventID), self.parameters];
}



- (AEBDynamicCommandTerm *)addParameterWithName:(NSString *)name_ code:(OSType)code_ {
    AEBDynamicKeywordTerm *paramDef = [[AEBDynamicKeywordTerm alloc] initWithName: name_
                                                                             code: code_
                                                                             kind: kAEBTermParameter];
	parametersByName[name_] = parametersByCode[@(code_)] = paramDef;
    return self;
}


- (NSSet *)parameters {
    return [NSSet setWithArray: parametersByName.allValues];
}

- (AEBDynamicKeywordTerm *)parameterForName:(NSString *)name_ {
	return parametersByName[name_];
}

- (AEBDynamicKeywordTerm *)parameterForCode:(OSType)code_ {
    return parametersByCode[@(code_)];
}

@end


