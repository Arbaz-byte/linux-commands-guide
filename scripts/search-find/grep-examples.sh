#!/bin/bash
# grep-examples.sh – Safe demo for the grep command

echo "=== grep example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test file with mixed content
cat > test.txt << 'EOF'
apple
Banana
Apple pie
cherry
grape
Error: something went wrong
warning: disk space low
error: another problem
WARNING: CPU high
Everything is fine
EOF

# Create a subfolder with a file for recursive search
mkdir sub
echo "Banana split" > sub/data.txt

# Demo 1: Simple string search
echo -e "\n1. grep 'apple' test.txt:"
grep "apple" test.txt

# Demo 2: Case-insensitive search
echo -e "\n2. grep -i 'apple' test.txt (ignore case):"
grep -i "apple" test.txt

# Demo 3: Recursive search
echo -e "\n3. grep -r 'Banana' . (recursive):"
grep -r "Banana" .

# Demo 4: Show line numbers
echo -e "\n4. grep -n 'error' test.txt (line numbers):"
grep -n "error" test.txt

# Demo 5: Invert match (lines NOT containing)
echo -e "\n5. grep -v 'error' test.txt (invert, no 'error'):"
grep -v "error" test.txt

# Demo 6: Count matches
echo -e "\n6. grep -c 'error' test.txt (count):"
grep -c "error" test.txt

# Demo 7: Tricky scenario – literal dot
echo -e "\n7. grep -F 'warning: disk space low' test.txt (fixed string):"
grep -F "warning: disk space low" test.txt

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
