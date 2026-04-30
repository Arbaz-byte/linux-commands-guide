#!/bin/bash
# jobs-bg-fg-examples.sh – Safe demo for jobs, bg, fg

echo "=== jobs / bg / fg example script ==="

# Start a background job
echo -e "\n1. Start a background job (sleep 30 &):"
sleep 30 &
echo "   We'll also start a second job:"
sleep 60 &

# List current jobs
echo -e "\n2. jobs (list background jobs):"
jobs

# Bring a job to the foreground (we'll do it with a timeout because it's interactive)
echo -e "\n3. fg %1 would bring job 1 to foreground, but we'll show the command instead."
echo "   Actual usage: fg %1"
echo "   Then Ctrl+Z to suspend, bg %1 to resume in background."

# Demo suspending and backgrounding
echo -e "\n4. Let's demonstrate suspend (Ctrl+Z) conceptually:"
echo "   - Run a command like 'sleep 100' in foreground"
echo "   - Press Ctrl+Z to suspend"
echo "   - Type 'bg' to resume in background"
echo "   - Type 'jobs' to see it running"
echo "   - Type 'fg' to bring it back"

# Demo job control with a safer method: show job numbers
echo -e "\n5. Current jobs before cleanup:"
jobs -l   # shows PIDs as well

# Clean up background jobs we started
echo -e "\n6. Cleaning up background jobs:"
kill %1 2>/dev/null && echo "   Job 1 terminated."
kill %2 2>/dev/null && echo "   Job 2 terminated."
sleep 0.2
echo "   Jobs cleared:"
jobs || echo "   (no jobs left)"

echo -e "\nDone."
