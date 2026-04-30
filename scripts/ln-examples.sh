#!/bin/bash
# ln-examples.sh – Safe demo for the ln command

echo "=== ln example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create a real file
echo "Real file content" > realfile.txt
mkdir subdir

# Demo 1: Create a hard link
echo -e "\n1. ln realfile.txt hardlink.txt (hard link):"
ln realfile.txt hardlink.txt
echo "Both point to same inode:"
ls -li realfile.txt hardlink.txt
echo "Hard link shows same content:"
cat hardlink.txt

# Demo 2: Create a symbolic link (soft link)
echo -e "\n2. ln -s realfile.txt symlink.txt (symbolic link):"
ln -s realfile.txt symlink.txt
ls -l symlink.txt

# Demo 3: Create a symbolic link to a directory
echo -e "\n3. ln -s subdir link_to_subdir (symlink to directory):"
ln -s subdir link_to_subdir
ls -l link_to_subdir
echo "Use the symlink to go into directory:"
cd link_to_subdir || exit 1
pwd
cd "$WORKDIR" || exit 1

# Demo 4: Tricky scenario – permissions on symlinks don't matter
echo -e "\n4. chmod on a symlink changes the target, not the link:"
echo "Before:"
ls -l realfile.txt symlink.txt
chmod 444 symlink.txt   # This will make realfile.txt read-only
echo "After chmod 444 symlink.txt:"
ls -l realfile.txt symlink.txt
echo "   Notice realfile.txt lost write permission, symlink still shows lrwxrwxrwx"

# Demo 5: Force overwrite an existing symlink
echo -e "\n5. ln -sf realfile.txt symlink.txt (force replace symlink):"
ln -sf realfile.txt symlink.txt
ls -l symlink.txt

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
