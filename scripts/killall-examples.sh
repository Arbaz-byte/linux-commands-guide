#!/bin/bash
# killall-examples.sh – Safe demo for the killall command

echo "=== killall example script ==="

# Create a safe dummy executable with a unique name
DUMMY="/tmp/linux-guide-dummy-$$.sh"
cat > "$DUMMY" << 'DUMMYEOF'
#!/bin/bash
sleep 60
DUMMYEOF
chmod +x "$DUMMY"

# Start multiple instances
echo -e "\n1. Starting 3 dummy processes..."
"$DUMMY" &
"$DUMMY" &
"$DUMMY" &

# Wait a moment for them to start
sleep 0.5

# Show running dummy processes using pgrep (safer than ps aux)
echo -e "\n2. Dummy processes running (pgrep -f linux-guide-dummy):"
pgrep -af "linux-guide-dummy"

# Demo 1: killall with default signal (TERM)
echo -e "\n3. killall $(basename "$DUMMY") (graceful termination):"
killall "$(basename "$DUMMY")"
sleep 0.5
if pgrep -f "linux-guide-dummy" > /dev/null; then
    echo "   Some processes still alive."
else
    echo "   All dummy processes terminated."
fi

# Start new batch for demo of -9
echo -e "\n4. Starting 2 more dummy processes for force kill..."
"$DUMMY" &
"$DUMMY" &
sleep 0.5
echo "   Before killall -9:"
pgrep -af "linux-guide-dummy"

echo -e "\n5. killall -9 $(basename "$DUMMY") (SIGKILL):"
killall -9 "$(basename "$DUMMY")" 2>/dev/null
sleep 0.5
if pgrep -f "linux-guide-dummy" > /dev/null; then
    echo "   Processes still alive (unexpected)."
else
    echo "   All force‑killed immediately."
fi

# Safety cleanup
rm -f "$DUMMY"
# Ensure any leftover processes are gone
pkill -f "linux-guide-dummy" 2>/dev/null

echo -e "\nDone. All test processes and files cleaned up."
