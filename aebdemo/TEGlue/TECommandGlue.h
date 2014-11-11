//
// TECommandGlue.h
// TextEdit
// (aebglue 0.6.0)
//

#import <Foundation/Foundation.h>
#import "AppleEventBridge/AppleEventBridge.h"
#import "TEFormatterGlue.h"

@interface TECommand : AEBStaticCommand
@end


@interface TEActivateCommand : TECommand
@end


@interface TECloseCommand : TECommand
- (instancetype)saving:(id)value;
- (instancetype)savingIn:(id)value;
@end


@interface TECountCommand : TECommand
- (instancetype)each:(id)value;
@end


@interface TEDeleteCommand : TECommand
@end


@interface TEDuplicateCommand : TECommand
- (instancetype)to:(id)value;
- (instancetype)withProperties:(id)value;
@end


@interface TEExistsCommand : TECommand
@end


@interface TEGetCommand : TECommand
@end


@interface TELaunchCommand : TECommand
@end


@interface TEMakeCommand : TECommand
- (instancetype)at:(id)value;
- (instancetype)new_:(id)value;
- (instancetype)withData:(id)value;
- (instancetype)withProperties:(id)value;
@end


@interface TEMoveCommand : TECommand
- (instancetype)to:(id)value;
@end


@interface TEOpenCommand : TECommand
@end


@interface TEOpenLocationCommand : TECommand
- (instancetype)window:(id)value;
@end


@interface TEPrintCommand : TECommand
- (instancetype)printDialog:(id)value;
- (instancetype)withProperties:(id)value;
@end


@interface TEQuitCommand : TECommand
- (instancetype)saving:(id)value;
@end


@interface TEReopenCommand : TECommand
@end


@interface TERunCommand : TECommand
@end


@interface TESaveCommand : TECommand
- (instancetype)as:(id)value;
- (instancetype)in_:(id)value;
@end


@interface TESetCommand : TECommand
- (instancetype)to:(id)value;
@end

