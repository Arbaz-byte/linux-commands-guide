#!/bin/bash
# tr-examples.sh – Safe demo for the tr command

echo "=== tr example script ==="

# Demo 1: Convert lowercase to uppercase
echo -e "\n1. echo 'hello world' | tr 'a-z' 'A-Z':"
echo 'hello world' | tr 'a-z' 'A-Z'

# Demo 2: Convert uppercase to lowercase
echo -e "\n2. echo 'HELLO' | tr 'A-Z' 'a-z':"
echo 'HELLO' | tr 'A-Z' 'a-z'

# Demo 3: Delete specific characters (digits)
echo -e "\n3. echo 'user123' | tr -d '0-9' (delete digits):"
echo 'user123' | tr -d '0-9'

# Demo 4: Replace spaces with newlines
echo -e "\n4. echo 'one two three' | tr ' ' '\n' (spaces to newlines):"
echo 'one two three' | tr ' ' '\n'

# Demo 5: Squeeze repeated characters
echo -e "\n5. echo 'Helloooooo' | tr -s 'o' (squeeze extra o's):"
echo 'Helloooooo' | tr -s 'o'

echo -e "\nDone. No files created or modified."
