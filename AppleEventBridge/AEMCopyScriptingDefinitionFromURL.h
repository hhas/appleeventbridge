//
//  AEMCopyScriptingDefinitionFromURL.h
//
//  Wraps buggy OSACopyScriptingDefinitionFromURL function to handle file: URLs correctly. This involves
//  calling older OSACopyScriptingDefinition function, which in turn requires use of deprecated FSRefs.
//
//  TO DO: As AEMCopyScriptingDefinitionFromURL is only used by dynamic bridges and aebglue, when building
//  embedded release framework used by static glues only, replace its implementation with `return resNotFound`.
//

#ifndef __AppleEventBridge__AEMCopyScriptingDefinitionFromURL__
#define __AppleEventBridge__AEMCopyScriptingDefinitionFromURL__

#include <Carbon/Carbon.h>


extern OSAError AEMCopyScriptingDefinitionFromURL(CFURLRef url, SInt32 modeFlags, CFDataRef *sdef);


#endif /* defined(__AppleEventBridge__AEMCopyScriptingDefinitionFromURL__) */
