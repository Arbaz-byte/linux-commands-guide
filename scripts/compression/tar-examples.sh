#!/bin/bash
# tar-examples.sh – Safe demo for the tar command

echo "=== tar example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test files and folders
mkdir project
echo "int main() { return 0; }" > project/main.c
echo "all: main" > project/Makefile
echo "# My Project" > project/README.md

# Demo 1: Create an uncompressed tar archive
echo -e "\n1. tar -cvf project.tar project/ (create uncompressed):"
tar -cvf project.tar project/
ls -lh project.tar

# Demo 2: Create a gzip‑compressed archive (.tar.gz)
echo -e "\n2. tar -czvf project.tar.gz project/ (gzip compressed):"
tar -czvf project.tar.gz project/
ls -lh project.tar.gz

# Demo 3: Create a bzip2‑compressed archive (.tar.bz2)
echo -e "\n3. tar -cjvf project.tar.bz2 project/ (bzip2 compressed, smaller but slower):"
tar -cjvf project.tar.bz2 project/
ls -lh project.tar.bz2

# Demo 4: List contents of an archive
echo -e "\n4. tar -tvf project.tar.gz (list contents):"
tar -tvf project.tar.gz

# Demo 5: Extract an archive
echo -e "\n5. tar -xzvf project.tar.gz (extract gzip):"
mkdir extracted
cd extracted || exit 1
tar -xzvf ../project.tar.gz
echo "Extracted contents:"
ls -R
cd "$WORKDIR" || exit 1

# Demo 6: Tricky scenario – spaces in filenames (warning)
echo -e "\n6. Handling spaces in paths (just a tip):"
echo "   tar -czvf 'my archive.tar.gz' 'My Folder'   # correctly quoted"
echo "   tar -czvf  my archive.tar.gz   My Folder     # WRONG – breaks"

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
