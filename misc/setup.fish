#!/usr/bin/env fish

echo "Installing unxip..."
curl -L -o $TMPDIR/unxip.swift https://raw.githubusercontent.com/saagarjha/unxip/main/unxip.swift
swiftc -parse-as-library -O -o ~/bin/unxip $TMPDIR/unxip.swift
