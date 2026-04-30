#!/bin/bash
# touch-examples.sh – Safe demo for the touch command

echo "=== touch example script ==="

# Step 1: Create a temporary workspace
WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1

echo "Working in: $WORKDIR"

# Step 2: Demo 1 – Create a new empty file
echo -e "\n1. Create a new empty file:"
touch newfile.txt
ls -l newfile.txt

# Step 3: Demo 2 – Update timestamp of existing file
echo -e "\n2. Update timestamp:"
sleep 1
touch newfile.txt
ls -l newfile.txt

# Step 4: Demo 3 – Create multiple files at once
echo -e "\n3. Create multiple files:"
touch file1.txt file2.txt file3.txt
ls

# Step 5: Demo 4 – Use -c flag (don't create if missing)
echo -e "\n4. Try -c on non-existent file:"
touch -c no-such-file.txt
echo "No error, and no file created:"
ls no-such-file.txt 2>&1 | grep -q "No such" && echo "Correct – file was not created."

# Step 6: Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done. All test files removed."
