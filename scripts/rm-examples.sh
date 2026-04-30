#!/bin/bash
# rm-examples.sh – Safe demo for the rm command

echo "=== rm example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Prepare test items
echo "I will be deleted" > delete-me.txt
touch preserve.txt
mkdir mydir
touch mydir/file1.txt mydir/file2.txt

# Demo 1: Remove a single file
echo -e "\n1. rm delete-me.txt (remove a file):"
ls delete-me.txt
rm delete-me.txt
echo "After removal:"
ls delete-me.txt 2>&1 || echo "   (file gone, as expected)"

# Demo 2: Interactive removal (safe)
echo -e "\n2. rm -i preserve.txt (interactive, answer 'n'):"
echo "n" | rm -i preserve.txt 2>&1 || true
echo "File still exists:"
ls preserve.txt

# Demo 3: Recursive removal of a directory
echo -e "\n3. rm -r mydir (remove directory and all contents):"
rm -r mydir
echo "Check if mydir is gone:"
ls -d mydir 2>&1 || echo "   (directory deleted)"

# Demo 4: Verbose removal
echo -e "\n4. rm -v preserve.txt (verbose):"
rm -v preserve.txt

# Demo 5: Handle filename starting with a dash (tricky scenario from cheat sheet)
echo -e "\n5. Remove a file that starts with a dash:"
touch -- '-hard-to-delete'
# Wrong: rm -hard-to-delete (this fails)
# Correct:
rm -- -hard-to-delete
echo "File with leading dash removed:"
ls ./-hard-to-delete 2>&1 || echo "   (gone)"

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
