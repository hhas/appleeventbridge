//
//  AppleEventBridge.h
//
//  Mid-level object-oriented wrapper for Carbon Apple Event Manager APIs, plus base classes
//  for high-level static-generated ObjC glues and dynamic bridges.
//

#import <Foundation/Foundation.h>

//! Project version number for AppleEventBridge.
FOUNDATION_EXPORT double AppleEventBridgeVersionNumber;

//! Project version string for AppleEventBridge.
FOUNDATION_EXPORT const unsigned char AppleEventBridgeVersionString[];


// AEM (mid-level OO wrapper for low-level procedural Carbon Apple Event Manager API)
#import "AEMApplication.h"
#import "AEMCodecs.h"
#import "AEMQuery.h"
#import "AEMSpecifier.h"
#import "AEMTestClause.h"
#import "AEMEvent.h"
#import "AEMTypes.h"
#import "AEMFormatter.h"
#import "AEMUtils.h"

// AEB (base classes for high-level static/dynamic bridges to ObjC and other languages)
#import "AEBAppData.h"
#import "AEBSpecifier.h"
#import "AEBCommand.h"
#import "AEBSymbol.h"
#import "AEBDefaultTerms.h"

#import "AEBStaticAppData.h"
#import "AEBStaticSpecifier.h"
#import "AEBStaticCommand.h"
#import "AEBStaticFormatter.h"
#import "AEBStaticSymbol.h"
#import "AEBStaticKeywordConverter.h"

#import "AEBDynamicAppData.h"
#import "AEBDynamicAETEParser.h"
#import "AEBDynamicSDEFParser.h"
#import "AEBDynamicTerm.h"
#import "AEBDynamicTerminology.h"
#import "AEBKeywordConverter.h"

// NSAppleEventDescriptor patches for 10.10.x and earlier
#if __MAC_OS_X_VERSION_MIN_REQUIRED < 101100
#import "NSAppleEventDescriptor+AEDescExtensions.h"
#import "NSAppleEventDescriptor+AEDescMoreExtensions.h"
#endif

#import "AEMCopyScriptingDefinitionFromURL.h"

