//
//  AEMCopyScriptingDefinitionFromURL.c
//

#include "AEMCopyScriptingDefinitionFromURL.h"


extern OSAError AEMCopyScriptingDefinitionFromURL(CFURLRef url, SInt32 modeFlags, CFDataRef *sdef) {
#if __MAC_OS_X_VERSION_MIN_REQUIRED < 101100
    OSAError err = noErr;
    CFStringRef scheme = CFURLCopyScheme(url);
    if (CFStringCompare(scheme, CFSTR("file"), kCFCompareCaseInsensitive) == kCFCompareEqualTo) {
        FSRef fs;
        if (!CFURLGetFSRef(url, &fs)) return fnfErr; // DEPRECATED API
        err = OSACopyScriptingDefinition(&fs, modeFlags, sdef);
    } else {
        err = OSACopyScriptingDefinitionFromURL(url, modeFlags, sdef);
    }
    CFRelease(scheme);
    return err;
#else
    return OSACopyScriptingDefinitionFromURL(url, modeFlags, sdef);
#endif
}

