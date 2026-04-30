#!/bin/bash
# ps-examples.sh – Safe demo for the ps command

echo "=== ps example script ==="

# Demo 1: Show processes in current terminal
echo -e "\n1. ps (processes in this shell):"
ps

# Demo 2: Show all user processes (BSD style)
echo -e "\n2. ps aux (all users, simple format):"
ps aux | head -n 5
echo "   (only showing first 5 lines for readability)"

# Demo 3: Show all processes (standard style)
echo -e "\n3. ps -ef (all processes, full format):"
ps -ef | head -n 5
echo "   (only showing first 5 lines)"

# Demo 4: Filter with grep – tricky scenario (grep matches itself)
echo -e "\n4. ps aux | grep bash (notice grep itself shows up):"
ps aux | grep bash
echo ""
echo "   Solution – use [b]ash trick:"
ps aux | grep '[b]ash'
echo "   Now grep doesn't match itself."

# Done – no temp workspace needed because ps doesn't modify files
echo -e "\nDone. No files were created or need cleaning."
