#!/bin/bash
# cat-examples.sh – Safe demo for the cat command

echo "=== cat example script ==="

# Create temp workspace
WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Prepare test files
echo "Apple" > fruits.txt
echo "Banana" >> fruits.txt
echo "Cherry" >> fruits.txt

echo "" >> fruits.txt
echo "" >> fruits.txt
echo "Dragonfruit" >> fruits.txt

echo "First part of file" > part1.txt
echo "Second part of file" > part2.txt

# Demo 1: Show file contents
echo -e "\n1. cat a file:"
cat fruits.txt

# Demo 2: Number lines
echo -e "\n2. cat -n (number all lines):"
cat -n fruits.txt

# Demo 3: Number only non-blank lines
echo -e "\n3. cat -b (number non-blank lines):"
cat -b fruits.txt

# Demo 4: Squeeze multiple blank lines
echo -e "\n4. cat -s (squeeze blank lines):"
cat -s fruits.txt

# Demo 5: Concatenate files
echo -e "\n5. Combine two files into one:"
cat part1.txt part2.txt > combined.txt
cat combined.txt

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
