#!/bin/bash
# echo-examples.sh – Safe demo for echo

echo "=== echo example script ==="

echo -e "\n1. Simple text:"
echo "Hello, Linux!"

echo -e "\n2. Print variable (HOME):"
echo "Your home is: $HOME"

echo -e "\n3. Arithmetic (no newline at end):"
echo -n "5 + 3 = "
echo $((5 + 3))

echo -e "\n4. Enable escape sequences (-e):"
echo -e "Line1\nLine2\tTabbed"

echo -e "\nDone."
