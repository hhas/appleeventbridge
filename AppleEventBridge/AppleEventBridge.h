//
//  AppleEventBridge.h
//
//  Mid-level object-oriented wrapper for Carbon Apple Event Manager APIs, plus base classes
//  for high-level static-generated ObjC glues and dynamic bridges.
//
//  WARNING: As this framework relies on legacy and deprecated Carbon APIs, it is not
//  recommended for production use.
//
//  TO DO: remove `k` prefix from all AEM/AEB enums (c.f. Cocoa enums)?
//

#import <Foundation/Foundation.h>

//! Project version number for AppleEventBridge.
FOUNDATION_EXPORT double AppleEventBridgeVersionNumber;

//! Project version string for AppleEventBridge.
FOUNDATION_EXPORT const unsigned char AppleEventBridgeVersionString[];


// AEM (mid-level OO wrapper for low-level procedural Carbon Apple Event Manager API)
#import "AEMApplication.h"
#import "AEMCodecs.h"
#import "AEMEvent.h"
#import "AEMQuery.h"
#import "AEMSpecifier.h"
#import "AEMTestSpecifier.h"
#import "AEMFormatter.h"
#import "AEMTypes.h"
#import "AEMUtils.h"

// AEB (static/dynamic classes for building high-level bridges to ObjC and other languages)
#import "AEBAppData.h"
#import "AEBCommand.h"

#import "AEBStaticAppData.h"
#import "AEBStaticCommand.h"
#import "AEBStaticSymbol.h"
#import "AEBStaticSpecifier.h"
#import "AEBStaticFormatter.h"

#import "AEBDynamicAppData.h"
#import "AEBDynamicAETEParser.h"
#import "AEBDynamicSDEFParser.h"
#import "AEBDynamicTerm.h"
#import "AEBDynamicTerminology.h"

// NSAppleEventDescriptor patches for commonly used functionality
// (Radar enhancement requests 19169736 and 19169791)
#import "NSAppleEventDescriptor+AEDescExtensions.h"
#import "NSAppleEventDescriptor+AEDescMoreExtensions.h"

