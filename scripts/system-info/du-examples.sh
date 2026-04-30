#!/bin/bash
# du-examples.sh – Safe demo for the du command

echo "=== du example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test folders and files
mkdir empty-dir
mkdir small-dir
echo "Hello" > small-dir/file1.txt
echo "World" > small-dir/file2.txt
mkdir -p deep/dir
echo "A bit more content" > deep/dir/fileA.txt

# Demo 1: Summary size of a folder (human‑readable)
echo -e "\n1. du -sh small-dir (summary, human):"
du -sh small-dir

# Demo 2: Size of all folders one level deep
echo -e "\n2. du -h --max-depth=1 (immediate sub‑folder sizes):"
du -h --max-depth=1

# Demo 3: Show files as well as folders
echo -e "\n3. du -ah --max-depth=1 (all files and folders):"
du -ah --max-depth=1

# Demo 4: Compare apparent size vs disk usage
echo -e "\n4. du -sh small-dir vs du -sh --apparent-size small-dir:"
du -sh small-dir
du -sh --apparent-size small-dir
echo "   (disk usage may be slightly larger due to block size)"

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
