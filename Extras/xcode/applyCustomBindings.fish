#!/usr/bin/env fish

set XCODE_KEYBINDINGS_FILE "/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/IDETextKeyBindingSet.plist"
set CUSTOM_KEYBINDINGS_FILE (pwd)/Extras/xcode/CustomKeyBindings.plist

sudo /usr/libexec/PlistBuddy -c "Delete :Custom" $XCODE_KEYBINDINGS_FILE
sudo /usr/libexec/PlistBuddy -c "Merge $CUSTOM_KEYBINDINGS_FILE" $XCODE_KEYBINDINGS_FILE
