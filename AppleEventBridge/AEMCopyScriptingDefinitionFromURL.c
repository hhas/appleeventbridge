//
//  AEMCopyScriptingDefinitionFromURL.c
//

#include "AEMCopyScriptingDefinitionFromURL.h"


extern OSAError AEMCopyScriptingDefinitionFromURL(CFURLRef url, SInt32 modeFlags, CFDataRef *sdef) {
    OSAError err = noErr;
    CFStringRef scheme = CFURLCopyScheme(url);
    if (CFStringCompare(scheme, CFSTR("file"), kCFCompareCaseInsensitive) == kCFCompareEqualTo) {
        FSRef fs;
        if (!CFURLGetFSRef(url, &fs)) return fnfErr; // DEPRECATED API
        err = OSACopyScriptingDefinition(&fs, 0, sdef);
    } else {
        err = OSACopyScriptingDefinitionFromURL(url, 0, sdef);
    }
    CFRelease(scheme);
    return err;
}

