#!/bin/bash
# pwd-examples.sh – Safe demo for the pwd command

echo "=== pwd example script ==="

# Create temp workspace with a subfolder
WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
mkdir subfolder
cd subfolder || exit 1

echo "Working in: $WORKDIR/subfolder"

# Demo 1: Print current directory
echo -e "\n1. pwd (print working directory):"
pwd

# Demo 2: Move to a symlinked path and show physical vs logical
echo -e "\n2. pwd after following symlink (logical vs physical):"
cd "$WORKDIR" || exit 1
mkdir realdir
ln -s realdir linkdir
cd linkdir || exit 1
echo "Logical (default):"
pwd -L
echo "Physical (real path):"
pwd -P

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
