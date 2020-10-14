#!/usr/bin/env fish

set XCODE_KEYBINDINGS_RELPATH "Contents/Frameworks/IDEKit.framework/Resources/IDETextKeyBindingSet.plist"
set CUSTOM_KEYBINDINGS_FILE (pwd)/Extras/xcode/CustomKeyBindings.plist

set XCODE_APPS_DIR /Applications
if test -d /Applications/Xcode
  set XCODE_APPS_DIR /Applications/Xcode
end

for f in (find "$XCODE_APPS_DIR" -maxdepth 1 -name "Xcode*.app")
  echo "Patching keybindings in $f"
  set XCODE_KEYBINDINGS_PATH "$f/$XCODE_KEYBINDINGS_RELPATH"
  sudo /usr/libexec/PlistBuddy -c "Delete :Custom" $XCODE_KEYBINDINGS_PATH
  sudo /usr/libexec/PlistBuddy -c "Merge $CUSTOM_KEYBINDINGS_FILE" $XCODE_KEYBINDINGS_PATH
end
