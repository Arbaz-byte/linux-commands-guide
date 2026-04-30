#!/bin/bash
# top-htop-examples.sh – Demo/info for top and htop

echo "=== top / htop example script ==="

# Demo 1: Check if htop is installed
echo -e "\n1. Check if htop is installed:"
if command -v htop &> /dev/null; then
    echo "   htop is available."
else
    echo "   htop not installed. Install with: sudo apt install htop"
fi

# Demo 2: Run top in batch mode (non-interactive) for a single snapshot
echo -e "\n2. top -b -n 1 (batch mode, 1 iteration – first 5 processes shown):"
top -b -n 1 | head -12
echo "   (only showing first 12 lines)"

# Demo 3: Explain interactive keys
echo -e "\n3. Interactive shortcuts in top:"
echo "   q = quit"
echo "   k = kill a process (then enter PID)"
echo "   M = sort by memory usage"
echo "   P = sort by CPU usage"
echo "   h = help"

# Demo 4: Explain htop improvements
echo -e "\n4. htop advantages:"
echo "   - Color-coded display"
echo "   - Mouse support"
echo "   - Easier process navigation"
echo "   Run with: htop"

echo -e "\nDone. No files were created."
