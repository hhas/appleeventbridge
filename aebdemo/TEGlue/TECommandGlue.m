//
// TECommandGlue.m
// TextEdit
// AppleEventBridge 0.7.0
//

#import "TECommandGlue.h"

@implementation TECommand
- (NSString *)AEBFormatObject:(id)obj appData:(id)appData {
    return [TEFormatter formatObject: obj appData: appData];
}
@end


@implementation TEActivateCommand
- (NSString *)AEBCommandName {
    return @"activate";
}
@end


@implementation TECloseCommand
- (instancetype)saving:(id)value {
    [self setParameter: value forKeyword: 'savo'];
    return self;
}
- (instancetype)savingIn:(id)value {
    [self setParameter: value forKeyword: 'kfil'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"close";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'savo': return @"saving";
        case 'kfil': return @"savingIn";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TECountCommand
- (instancetype)each:(id)value {
    [self setParameter: value forKeyword: 'kocl'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"count";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'kocl': return @"each";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEDeleteCommand
- (NSString *)AEBCommandName {
    return @"delete";
}
@end


@implementation TEDuplicateCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 'insh'];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 'prdt'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"duplicate";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh': return @"to";
        case 'prdt': return @"withProperties";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEExistsCommand
- (NSString *)AEBCommandName {
    return @"exists";
}
@end


@implementation TEGetCommand
- (NSString *)AEBCommandName {
    return @"get";
}
@end


@implementation TELaunchCommand
- (NSString *)AEBCommandName {
    return @"launch";
}
@end


@implementation TEMakeCommand
- (instancetype)at:(id)value {
    [self setParameter: value forKeyword: 'insh'];
    return self;
}
- (instancetype)new_:(id)value {
    [self setParameter: value forKeyword: 'kocl'];
    return self;
}
- (instancetype)withData:(id)value {
    [self setParameter: value forKeyword: 'data'];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 'prdt'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"make";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh': return @"at";
        case 'kocl': return @"new_";
        case 'data': return @"withData";
        case 'prdt': return @"withProperties";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEMoveCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 'insh'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"move";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh': return @"to";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEOpenCommand
- (NSString *)AEBCommandName {
    return @"open";
}
@end


@implementation TEOpenLocationCommand
- (instancetype)window:(id)value {
    [self setParameter: value forKeyword: 'WIND'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"openLocation";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'WIND': return @"window";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEPrintCommand
- (instancetype)printDialog:(id)value {
    [self setParameter: value forKeyword: 'pdlg'];
    return self;
}
- (instancetype)withProperties:(id)value {
    [self setParameter: value forKeyword: 'prdt'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"print";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'pdlg': return @"printDialog";
        case 'prdt': return @"withProperties";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEQuitCommand
- (instancetype)saving:(id)value {
    [self setParameter: value forKeyword: 'savo'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"quit";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'savo': return @"saving";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TEReopenCommand
- (NSString *)AEBCommandName {
    return @"reopen";
}
@end


@implementation TERunCommand
- (NSString *)AEBCommandName {
    return @"run";
}
@end


@implementation TESaveCommand
- (instancetype)as:(id)value {
    [self setParameter: value forKeyword: 'fltp'];
    return self;
}
- (instancetype)in_:(id)value {
    [self setParameter: value forKeyword: 'kfil'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"save";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'fltp': return @"as";
        case 'kfil': return @"in_";
    }
    return [super AEBParameterNameForCode: code];
}
@end


@implementation TESetCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 'data'];
    return self;
}
- (NSString *)AEBCommandName {
    return @"set";
}
- (NSString *)AEBParameterNameForCode:(DescType)code {
    switch (code) {
        case 'data': return @"to";
    }
    return [super AEBParameterNameForCode: code];
}
@end

