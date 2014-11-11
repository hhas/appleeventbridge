#!/bin/sh


frameworkDir="$TARGET_BUILD_DIR/AppleEventBridge.framework"
bridgeSupportDir="$frameworkDir/Resources/BridgeSupport"

gen_bridge_metadata -f "$frameworkDir" \
    -o "$bridgeSupportDir/AppleEventBridge.bridgesupport" \
    -c "-I $SDKROOT/usr/include -F $SDKROOT/System/Library/Frameworks"


