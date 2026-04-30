#!/bin/bash
# awk-examples.sh – Safe demo for the awk command

echo "=== awk example script ==="

WORKDIR=$(mktemp -d /tmp/linux-guide-demo.XXXXXX)
cd "$WORKDIR" || exit 1
echo "Working in: $WORKDIR"

# Create test CSV-like file
cat > data.csv << 'EOF'
name,age,city
Alice,30,London
Bob,25,Paris
Charlie,35,Berlin
EOF

# Create space-separated file
cat > log.txt << 'EOF'
ERROR 2025-04-30 disk full
WARN  2025-04-30 memory high
ERROR 2025-04-30 timeout
INFO  2025-04-30 all systems go
EOF

# Demo 1: Print first column (default space/tab separator)
echo -e "\n1. awk '{print \$1}' log.txt (first column of log):"
awk '{print $1}' log.txt

# Demo 2: Print second column
echo -e "\n2. awk '{print \$2}' log.txt (second column):"
awk '{print $2}' log.txt

# Demo 3: Use comma as field separator
echo -e "\n3. awk -F',' '{print \$1, \$3}' data.csv (name and city):"
awk -F',' '{print $1, $3}' data.csv

# Demo 4: Print line numbers (NR is built-in variable)
echo -e "\n4. awk '{print NR, \$0}' log.txt (line numbers):"
awk '{print NR, $0}' log.txt

# Demo 5: Filter lines matching a pattern
echo -e "\n5. awk '/ERROR/ {print \$0}' log.txt (only ERROR lines):"
awk '/ERROR/ {print $0}' log.txt

# Clean up
echo -e "\nCleaning up..."
cd /tmp
rm -rf "$WORKDIR"
echo "Done."
