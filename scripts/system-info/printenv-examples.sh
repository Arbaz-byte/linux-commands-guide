#!/bin/bash
# printenv-examples.sh – Safe demo for printenv

echo "=== printenv example script ==="

echo -e "\n1. printenv (all environment variables – showing first 10 lines):"
printenv | head

echo -e "\n2. printenv HOME (single variable):"
printenv HOME

echo -e "\n3. printenv SHELL:"
printenv SHELL

echo -e "\nDone."
