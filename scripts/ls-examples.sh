#!/bin/bash
# ls-examples.sh – Safe demo for the ls command

echo "=== ls example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Set up test files and directories
mkdir docs
touch file1.txt file2.txt .hidden
touch fileA fileB fileC
mkdir emptydir

# Demo 1: Basic listing
echo -e "\n1. ls (plain list):"
ls

# Demo 2: Long listing
echo -e "\n2. ls -l (long format):"
ls -l

# Demo 3: All files including hidden
echo -e "\n3. ls -a (show hidden):"
ls -a

# Demo 4: Human-readable sizes
echo -e "\n4. ls -lh (human-readable sizes with long format):"
ls -lh

# Demo 5: Recursive listing
echo -e "\n5. ls -R (recursive, shows subdirectories):"
ls -R

# Demo 6: Sort by modification time
echo -e "\n6. ls -lt (sort by time, newest first):"
ls -lt

# Demo 7: Combine flags (common combo)
echo -e "\n7. ls -lah (all, human, long – super combo):"
ls -lah

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
