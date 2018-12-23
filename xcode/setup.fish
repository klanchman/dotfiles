#!/usr/bin/env fish

# TODO: Some assumptions are being made here that may not be safe for everyone
set DESTINATION (eval echo (head $CONCERN/$DESTINATION_FILE))
mkdir -p $DESTINATION

# Xcode overwrites key bindings files, so we need to link the entire directory
# instead of the files inside it
# Even with -fF, ln refuses to link the directory if it's not empty
rm -rf $DESTINATION/KeyBindings
ln -sfF (pwd)/xcode/KeyBindings $DESTINATION
