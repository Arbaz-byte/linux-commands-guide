#!/bin/bash
# find-examples.sh – Safe demo for the find command

echo "=== find example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test files and folders
mkdir deep
mkdir deep/nested
touch file1.txt file2.sh .hidden.log
touch deep/file3.txt deep/file4.jpg deep/nested/deep-file.md
# Create a file that is larger than 1 byte (we'll write a little)
echo "This is a test file with some content" > medium.txt
# Create a file with a special character (space) to demonstrate quoting
touch "my notes.txt"

# Demo 1: Find files by name
echo -e "\n1. find . -name '*.txt' (all .txt files):"
find . -name "*.txt"

# Demo 2: Case‑insensitive search
echo -e "\n2. find . -iname '*.JPG' (case‑insensitive, should find .jpg):"
find . -iname "*.JPG"

# Demo 3: Find directories only
echo -e "\n3. find . -type d (directories only):"
find . -type d

# Demo 4: Find by size (bigger than 1 byte)
echo -e "\n4. find . -size +1c (files bigger than 1 byte):"
find . -size +1c

# Demo 5: Find files modified in the last 1 day (this will include everything we just created)
echo -e "\n5. find . -mtime -1 (modified less than 1 day ago):"
find . -mtime -1

# Demo 6: Execute a command on found files (ls -lh on each)
echo -e "\n6. find . -name '*.sh' -exec ls -lh {} \; (run ls -lh on each .sh file):"
find . -name "*.sh" -exec ls -lh {} \;

# Demo 7: Tricky scenario – searching with spaces (quoting is essential)
echo -e "\n7. find . -name 'my notes.txt' (file with space in name, correct quoting):"
find . -name "my notes.txt"

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
