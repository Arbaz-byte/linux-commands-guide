#!/bin/bash
# mkdir-examples.sh – Safe demo for the mkdir command

echo "=== mkdir example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Demo 1: Create a single directory
echo -e "\n1. mkdir myfolder (single directory):"
mkdir myfolder
ls -ld myfolder

# Demo 2: Create multiple directories at once
echo -e "\n2. mkdir dir1 dir2 dir3:"
mkdir dir1 dir2 dir3
ls -l | grep "^d"

# Demo 3: Create directory with verbose output
echo -e "\n3. mkdir -v verbose_dir:"
mkdir -v verbose_dir

# Demo 4: Create nested directories with -p
echo -e "\n4. mkdir -p a/b/c/d (parents):"
mkdir -p a/b/c/d
echo "Created:"
ls -R a

# Demo 5: -p with existing directories (no error)
echo -e "\n5. mkdir -p myfolder (existing, no error):"
mkdir -p myfolder
echo "No error message – just worked."

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
