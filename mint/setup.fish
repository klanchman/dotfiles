#!/usr/bin/env fish

set MINT_PKGS \
  erica/xcopen \

for MINT_PKG in $MINT_PKGS
  mint install $MINT_PKG
end
