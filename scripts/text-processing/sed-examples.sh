#!/bin/bash
# sed-examples.sh – Safe demo for the sed command

echo "=== sed example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test file
cat > fruits.txt << 'EOF'
apple
banana
Apple
cherry
apple pie
EOF

# Demo 1: Replace first occurrence on each line
echo -e "\n1. sed 's/apple/APPLE/' fruits.txt (replace first apple):"
sed 's/apple/APPLE/' fruits.txt

# Demo 2: Replace all occurrences globally
echo -e "\n2. sed 's/apple/APPLE/g' fruits.txt (global replace):"
sed 's/apple/APPLE/g' fruits.txt

# Demo 3: Case‑insensitive replace
echo -e "\n3. sed 's/apple/APPLE/gi' fruits.txt (case‑insensitive global):"
sed 's/apple/APPLE/gi' fruits.txt

# Demo 4: In‑place editing (with backup)
cp fruits.txt fruits.bak
echo -e "\n4. sed -i.bak 's/apple/APPLE/g' fruits.txt (in‑place with backup):"
sed -i.bak 's/apple/APPLE/g' fruits.txt
echo "New file:"
cat fruits.txt
echo "Backup file:"
cat fruits.bak

# Demo 5: Print specific lines
echo -e "\n5. sed -n '2,4p' fruits.txt (print lines 2‑4):"
sed -n '2,4p' fruits.txt

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
