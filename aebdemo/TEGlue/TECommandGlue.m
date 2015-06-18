//
// TECommandGlue.m
// TextEdit
// AppleEventBridge 0.7.0
//

#import "TECommandGlue.h"

@implementation TECommand
- (NSString *)aebFormatObject:(id)obj appData:(id)appData {
    return [TEFormatter formatObject: obj appData: appData];
}
@end


@implementation TEActivateCommand
- (NSString *)aebCommandName {
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
- (NSString *)aebCommandName {
    return @"close";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'savo': return @"saving";
        case 'kfil': return @"savingIn";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TECountCommand
- (instancetype)each:(id)value {
    [self setParameter: value forKeyword: 'kocl'];
    return self;
}
- (NSString *)aebCommandName {
    return @"count";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'kocl': return @"each";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TEDeleteCommand
- (NSString *)aebCommandName {
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
- (NSString *)aebCommandName {
    return @"duplicate";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh': return @"to";
        case 'prdt': return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TEExistsCommand
- (NSString *)aebCommandName {
    return @"exists";
}
@end


@implementation TEGetCommand
- (NSString *)aebCommandName {
    return @"get";
}
@end


@implementation TELaunchCommand
- (NSString *)aebCommandName {
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
- (NSString *)aebCommandName {
    return @"make";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh': return @"at";
        case 'kocl': return @"new_";
        case 'data': return @"withData";
        case 'prdt': return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TEMoveCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 'insh'];
    return self;
}
- (NSString *)aebCommandName {
    return @"move";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'insh': return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TEOpenCommand
- (NSString *)aebCommandName {
    return @"open";
}
@end


@implementation TEOpenLocationCommand
- (instancetype)window:(id)value {
    [self setParameter: value forKeyword: 'WIND'];
    return self;
}
- (NSString *)aebCommandName {
    return @"openLocation";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'WIND': return @"window";
    }
    return [super aebParameterNameForCode: code];
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
- (NSString *)aebCommandName {
    return @"print";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'pdlg': return @"printDialog";
        case 'prdt': return @"withProperties";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TEQuitCommand
- (instancetype)saving:(id)value {
    [self setParameter: value forKeyword: 'savo'];
    return self;
}
- (NSString *)aebCommandName {
    return @"quit";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'savo': return @"saving";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TEReopenCommand
- (NSString *)aebCommandName {
    return @"reopen";
}
@end


@implementation TERunCommand
- (NSString *)aebCommandName {
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
- (NSString *)aebCommandName {
    return @"save";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'fltp': return @"as";
        case 'kfil': return @"in_";
    }
    return [super aebParameterNameForCode: code];
}
@end


@implementation TESetCommand
- (instancetype)to:(id)value {
    [self setParameter: value forKeyword: 'data'];
    return self;
}
- (NSString *)aebCommandName {
    return @"set";
}
- (NSString *)aebParameterNameForCode:(DescType)code {
    switch (code) {
        case 'data': return @"to";
    }
    return [super aebParameterNameForCode: code];
}
@end

