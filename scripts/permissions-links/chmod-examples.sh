#!/bin/bash
# chmod-examples.sh – Safe demo for the chmod command

echo "=== chmod example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test files
touch myprogram mydata.txt secret.key
echo 'echo "hello"' > myprogram

# Demo 1: View current permissions
echo -e "\n1. Current permissions (ls -l):"
ls -l

# Demo 2: Make a script executable
echo -e "\n2. chmod +x myprogram (add execute):"
chmod +x myprogram
ls -l myprogram

# Demo 3: Symbolic mode – set permissions exactly
echo -e "\n3. chmod u=rw,g=r,o=r mydata.txt (user: read/write, group: read, others: read):"
chmod u=rw,g=r,o=r mydata.txt
ls -l mydata.txt

# Demo 4: Numeric mode – 755 (rwxr-xr-x)
echo -e "\n4. chmod 755 myprogram (numeric, owner full, others read/execute):"
chmod 755 myprogram
ls -l myprogram

# Demo 5: Remove write permission from group & others
echo -e "\n5. chmod go-w secret.key (remove write from group and others):"
chmod go-w secret.key
ls -l secret.key

# Demo 6: Tricky scenario – avoid 777
echo -e "\n6. chmod 777 is usually a bad idea (we'll show it safely on a temp file):"
touch temp.txt
chmod 777 temp.txt
ls -l temp.txt
echo "   Notice everyone can read/write/execute – often unsafe."
# Show better alternative
chmod 644 temp.txt
echo "   Better: chmod 644 temp.txt (rw-r--r--)"

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
