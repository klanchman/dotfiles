#!/usr/bin/env fish

set XCODE_KEYBINDINGS_FILE "/Applications/Xcode.app/Contents/Frameworks/IDEKit.framework/Resources/IDETextKeyBindingSet.plist"
set XCODE_BETA_KEYBINDINGS_FILE "/Applications/Xcode-beta.app/Contents/Frameworks/IDEKit.framework/Resources/IDETextKeyBindingSet.plist"
set CUSTOM_KEYBINDINGS_FILE (pwd)/Extras/xcode/CustomKeyBindings.plist

echo "Patching Xcode keybindings"
sudo /usr/libexec/PlistBuddy -c "Delete :Custom" $XCODE_KEYBINDINGS_FILE
sudo /usr/libexec/PlistBuddy -c "Merge $CUSTOM_KEYBINDINGS_FILE" $XCODE_KEYBINDINGS_FILE

if test -e $XCODE_BETA_KEYBINDINGS_FILE
  echo "Patching Xcode-beta keybindings"
  sudo /usr/libexec/PlistBuddy -c "Delete :Custom" $XCODE_BETA_KEYBINDINGS_FILE
  sudo /usr/libexec/PlistBuddy -c "Merge $CUSTOM_KEYBINDINGS_FILE" $XCODE_BETA_KEYBINDINGS_FILE
end
