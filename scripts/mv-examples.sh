#!/bin/bash
# mv-examples.sh - safe demo for the mv command
echo "=== mv example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Prep test files
echo "I am the old file" > oldname.txt
echo "keep me" > keep.txt
mkdir folder1

# Demo 1: Rename a file
echo -e "\n1. mv oldname.txt newname.txt (rename):"
mv oldname.txt newname.txt
ls -l newname.txt

# Demo 2: Move a file into a directory
echo -e "\n2. mv keep.txt folder1/ (move into folder):"
mv keep.txt folder1/
ls folder1/

# Demo 3: Interactive move (prevent overwrite)
echo "original" > original.txt
echo "replacement" > replacement.txt
echo -e "\n3. mv -i replacement.txt original.txt (interactive, answer 'n'):"
echo "n" | mv -i replacement.txt original.txt 2>&1 || true
cat original.txt   # should still be "original"

# Demo 4: Verbose move
echo -e "\n4. mv -v original.txt final.txt (verbose):"
mv -v original.txt final.txt

# Demo 5: Move multiple files into a directory
echo "file1 content" > file1.txt
echo "file2 content" > file2.txt
mkdir targetdir
echo -e "\n5. mv file1.txt file2.txt targetdir/ (move multiple):"
mv file1.txt file2.txt targetdir/
ls targetdir/

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
