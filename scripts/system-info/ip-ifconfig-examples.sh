#!/bin/bash
# ip-ifconfig-examples.sh – Safe demo for ip and ifconfig

echo "=== ip / ifconfig example script ==="

# Check which command is available
echo "Checking available network tools:"
if command -v ip &>/dev/null; then
    echo "  ✓ ip command available (modern)"
    IP_AVAILABLE=true
else
    echo "  ✗ ip command not found"
    IP_AVAILABLE=false
fi

if command -v ifconfig &>/dev/null; then
    echo "  ✓ ifconfig available (legacy, install with: sudo apt install net-tools)"
    IFCONFIG_AVAILABLE=true
else
    echo "  ✗ ifconfig not installed"
    IFCONFIG_AVAILABLE=false
fi

# Demo 1: Show all interfaces with ip (preferred)
echo -e "\n1. ip addr show (all network interfaces):"
if $IP_AVAILABLE; then
    ip addr show
else
    echo "   ip command not available; install iproute2 package."
fi

# Demo 2: Show only IPv4 addresses (shorter output)
echo -e "\n2. ip -4 addr show (only IPv4):"
if $IP_AVAILABLE; then
    ip -4 addr show
fi

# Demo 3: Show routing table
echo -e "\n3. ip route show (routing table):"
if $IP_AVAILABLE; then
    ip route show
fi

# Demo 4: ifconfig fallback (if installed)
echo -e "\n4. ifconfig (legacy, shows active interfaces):"
if $IFCONFIG_AVAILABLE; then
    ifconfig
else
    echo "   ifconfig not installed (run sudo apt install net-tools)."
fi

echo -e "\nDone. No files created."
