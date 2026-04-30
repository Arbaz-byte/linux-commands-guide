#!/bin/bash
# df-examples.sh – Safe demo for the df command

echo "=== df example script ==="

# Demo 1: Basic human-readable output
echo -e "\n1. df -h (disk free, human-readable):"
df -h

# Demo 2: Show filesystem types
echo -e "\n2. df -T (show filesystem types):"
df -T

# Demo 3: Combine flags (human-readable + type)
echo -e "\n3. df -hT (human + type):"
df -hT

# Demo 4: Check a specific filesystem (e.g., root)
echo -e "\n4. df -h / (only the root filesystem):"
df -h /

# Done
echo -e "\nDone. No files were created."
