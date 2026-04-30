
#!/bin/bash
# rmdir-examples.sh - safe demo for the rmdir command


echo "=== rmdir example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "working in : $WORKDIR"


#Prepare directories
mkdir emptydir
mkdir nonempty
touch nonempty/file.txt


#Demo 1: Remove an empty directory
echo -e "\n1. rmdir emptydir (remove empty):"
ls -d emptydir

rmdir emptydir

echo "Check - emptydir is gone :"
ls -d emptydir 2>&1 || echo "(directory removed)"


#Demo 2:Try to remove a non-empty directory
echo -e "\n2. rmdir nonempty (should fail):"
rmdir nonempty 2>&1 || echo "correct - directory not empty, not removed"


#Demo 3: Verbose removal 
mkdir for-verbose
echo -e "\n3. rmdir -v for-verbose (verbose):"
rmdir -v for-verbose


#Clean up
echo -e "\nCleaning up ..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
