#!/usr/bin/env fish

set MINT_PKGS \
  erica/xcopen \
  kiliankoe/swift-outdated \
  klanchman/untrack \
  marinofelipe/swift-package-info \

for MINT_PKG in $MINT_PKGS
  mint install $MINT_PKG
end
