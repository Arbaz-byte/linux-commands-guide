#!/bin/bash
# kill-examples.sh – Safe demo for the kill command

echo "=== kill example script ==="

# Demo 1: Start a background sleep process
echo -e "\n1. Start a background process (sleep 60) and get its PID:"
sleep 60 &
PID=$!
echo "   sleep process PID: $PID"

# Demo 2: Show the process is running
echo -e "\n2. ps -p $PID (process is running):"
ps -p $PID

# Demo 3: Terminate gracefully (signal 15 – TERM, the default)
echo -e "\n3. kill $PID (send TERM, ask nicely to stop):"
kill $PID
sleep 0.5
if ps -p $PID > /dev/null 2>&1; then
    echo "   Process still running (should be dead)."
else
    echo "   Process terminated gracefully."
fi

# Demo 4: Start another process and force kill (signal 9 – KILL)
echo -e "\n4. kill -9 (SIGKILL, force stop – last resort):"
sleep 60 &
PID2=$!
echo "   New process PID: $PID2"
kill -9 $PID2
sleep 0.5
if ps -p $PID2 > /dev/null 2>&1; then
    echo "   Process still running (unexpected)."
else
    echo "   Process forcefully killed."
fi

# Demo 5: Show common signal numbers (for reference)
echo -e "\n5. Common signals:"
echo "   1 (HUP)  – reload config"
echo "   2 (INT)  – same as Ctrl+C"
echo "   9 (KILL) – immediate, cannot be blocked"
echo "  15 (TERM) – graceful termination (default)"

# Demo 6: Tricky scenario – zombie processes (explanatory)
echo -e "\n6. Note on zombies:"
echo "   Zombie processes cannot be killed with kill -9."
echo "   They must be removed by killing their parent or rebooting."
echo "   You can see zombies with: ps aux | grep Z"

# Clean up any leftover sleep processes we might have missed
kill $PID 2>/dev/null
kill $PID2 2>/dev/null
echo -e "\nDone. All test processes cleaned up."
