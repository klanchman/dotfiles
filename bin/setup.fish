#!/usr/bin/env fish

mkdir -p ~/bin

echo "Downloading cbor CLI tool..."
curl -L https://github.com/fiatjaf/cbor/releases/download/v1.0.0/cbor_darwin_amd64 -o ~/bin/cbor

echo "Downloading itermoxyl..."
curl -L https://raw.githubusercontent.com/luciopaiva/itermoxyl/master/itermoxyl -o ~/bin/itermoxyl
chmod u+x ~/bin/itermoxyl
