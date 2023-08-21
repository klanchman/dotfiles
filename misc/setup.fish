#!/usr/bin/env fish

echo "Installing airdrop-cli..."
pushd $TMPDIR
curl -L -o airdrop-cli.zip https://github.com/vldmrkl/airdrop-cli/archive/refs/heads/main.zip
unzip -o airdrop-cli.zip
pushd airdrop-cli-main
make
cp .build/release/airdrop ~/bin/airdrop
popd # repo
popd # tmpdir
