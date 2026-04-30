#!/bin/bash
# cd-examples.sh – Safe demo for the cd command

echo "=== cd example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1

# Create a nested directory structure
mkdir -p colors/red colors/green colors/blue
echo "Working in: $WORKDIR"

# Demo 1: Show current directory with pwd
echo -e "\n1. Current directory:"
pwd

# Demo 2: Move into a subfolder
echo -e "\n2. cd colors (go into folder):"
cd colors
pwd

# Demo 3: Go to home
echo -e "\n3. cd ~ (go home):"
cd ~
pwd

# Demo 4: Return to previous directory
echo -e "\n4. cd - (back to previous):"
cd - || exit 1
pwd

# Demo 5: Go up one level
echo -e "\n5. cd .. (go up):"
cd ..
pwd

# Demo 6: Go to root
echo -e "\n6. cd / (go to root):"
cd /
pwd

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
