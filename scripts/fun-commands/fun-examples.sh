#!/bin/bash
# fun-examples.sh – Demo for the fun Linux commands

echo "=== Fun Commands Example Script ==="

# Helper function to check availability
check_cmd() {
    if command -v "$1" &>/dev/null; then
        echo "   ✓ $1 is installed"
        return 0
    else
        echo "   ✗ $1 not installed (sudo apt install $2)"
        return 1
    fi
}

echo -e "\n1. Checking what's available:"
check_cmd cowsay cowsay
check_cmd fortune fortune-mod
check_cmd cmatrix cmatrix
check_cmd sl sl
check_cmd figlet figlet
check_cmd lolcat lolcat
check_cmd btop btop

# cowsay
if command -v cowsay &>/dev/null; then
    echo -e "\n2. cowsay 'Hello Linux!':"
    cowsay "Hello Linux!"
else
    echo -e "\n2. cowsay not installed – skip."
fi

# fortune
if command -v fortune &>/dev/null; then
    echo -e "\n3. fortune (random quote):"
    fortune
else
    echo -e "\n3. fortune not installed – skip."
fi

# fortune | cowsay
if command -v fortune &>/dev/null && command -v cowsay &>/dev/null; then
    echo -e "\n4. fortune | cowsay:"
    fortune | cowsay
else
    echo -e "\n4. Need both fortune and cowsay – skip."
fi

# figlet
if command -v figlet &>/dev/null; then
    echo -e "\n5. figlet 'Linux Rocks':"
    figlet "Linux Rocks"
else
    echo -e "\n5. figlet not installed – skip."
fi

# lolcat (only if installed, otherwise just echo)
if command -v lolcat &>/dev/null; then
    echo -e "\n6. echo 'colorful' | lolcat:"
    echo "colorful" | lolcat
else
    echo -e "\n6. lolcat not installed – skip."
fi

# cmatrix, sl, btop – interactive (just explain)
echo -e "\n7. Interactive fun commands (run them yourself):"
echo "   cmatrix  – Matrix rain (Ctrl+C to exit)"
echo "   sl       – steam locomotive (a joke for 'ls'), runs once"
echo "   btop     – beautiful resource monitor (q to quit)"

echo -e "\n🎉 Done. Install any missing ones with:"
echo "   sudo apt install cowsay cmatrix sl fortune figlet lolcat btop"
