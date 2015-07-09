//
//  AEMCopyScriptingDefinitionFromURL.h
//
//  On 10.10 and earlier, wraps buggy OSACopyScriptingDefinitionFromURL function to handle file: URLs correctly.
//  This involves calling older OSACopyScriptingDefinition function, which in turn requires use of deprecated FSRefs.
//
//  On 10.11 and later, simply calls OSACopyScriptingDefinitionFromURL directly.
//
//  TO DO: As AEMCopyScriptingDefinitionFromURL is only used by dynamic bridges and aebglue, when building
//  embedded release framework targeting 10.10.x and earlier for use with static glues only, replace its implementation
//  with `return resNotFound` or other appropriate error code.
//

#ifndef __AppleEventBridge__AEMCopyScriptingDefinitionFromURL__
#define __AppleEventBridge__AEMCopyScriptingDefinitionFromURL__

#include <Carbon/Carbon.h>


extern OSAError AEMCopyScriptingDefinitionFromURL(CFURLRef url, SInt32 modeFlags, CFDataRef *sdef);


#endif /* defined(__AppleEventBridge__AEMCopyScriptingDefinitionFromURL__) */
