#!/bin/bash
# uname-examples.sh – Safe demo for uname

echo "=== uname example script ==="

echo -e "\n1. uname (kernel name):"
uname

echo -e "\n2. uname -a (all system info):"
uname -a

echo -e "\n3. uname -r (kernel release):"
uname -r

echo -e "\n4. uname -m (machine hardware):"
uname -m

echo -e "\nDone."
