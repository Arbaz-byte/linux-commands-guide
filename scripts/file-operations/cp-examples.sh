#!/bin/bash
# cp-examples.sh – Safe demo for the cp command

echo "=== cp example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Prep test files
echo "Original content" > source.txt
mkdir targetdir

# Demo 1: Simple copy
echo -e "\n1. cp source.txt dest.txt (copy file):"
cp source.txt dest.txt
ls -l dest.txt

# Demo 2: Interactive copy (will overwrite without asking by default, but we show -i)
echo "changed" > dest.txt   # modify dest to demonstrate -i
echo -e "\n2. cp -i source.txt dest.txt (interactive, answer 'n'):"
echo "n" | cp -i source.txt dest.txt 2>&1 || true
cat dest.txt   # content unchanged

# Demo 3: Recursive copy
echo -e "\n3. cp -r targetdir copy_of_targetdir (recursive directory copy):"
cp -r targetdir copy_of_targetdir
ls -ld copy_of_targetdir

# Demo 4: Verbose copy
echo -e "\n4. cp -v source.txt verbose-copy.txt:"
cp -v source.txt verbose-copy.txt

# Demo 5: Update (copy only if newer)
touch -t 202001010000 old.txt
echo "new content" > new.txt
echo -e "\n5. cp -u new.txt old.txt (update – should copy because new is newer):"
cp -u new.txt old.txt
cat old.txt   # should be "new content"

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
