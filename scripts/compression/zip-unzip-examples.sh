#!/bin/bash
# zip-unzip-examples.sh – Safe demo for zip and unzip

echo "=== zip / unzip example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Prepare test files and folders
mkdir myfolder
echo "File 1 contents" > file1.txt
echo "File 2 contents" > file2.txt
echo "Secret data" > myfolder/secret.txt

# Demo 1: Create a zip archive
echo -e "\n1. zip archive.zip file1.txt file2.txt:"
zip archive.zip file1.txt file2.txt
ls -l archive.zip

# Demo 2: Zip a folder recursively
echo -e "\n2. zip -r folder.zip myfolder (recursive):"
zip -r folder.zip myfolder
ls -l folder.zip

# Demo 3: List contents of a zip without extracting
echo -e "\n3. unzip -l archive.zip (list contents):"
unzip -l archive.zip

# Demo 4: Extract to a specific directory
mkdir extracted
echo -e "\n4. unzip archive.zip -d extracted/ (extract to directory):"
unzip archive.zip -d extracted/
ls extracted/

# Demo 5: Extract folder zip
mkdir extracted2
echo -e "\n5. unzip folder.zip -d extracted2/ (extract folder):"
unzip folder.zip -d extracted2/
ls -R extracted2/

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
