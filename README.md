


## 🐧Linux Commands Guide

> A beginner‑friendly, hands‑on guide to the most useful Linux commands — with a **cheat sheet** and **safe, runnable shell scripts**.

![GitHub repo size](https://img.shields.io/github/repo-size/Arbaz-byte/linux-commands-guide)
![GitHub last commit](https://img.shields.io/github/last-commit/Arbaz-byte/linux-commands-guide)



## 📘 What’s inside?

- **`cheat-sheet.md`** – a beautifully organised cheat sheet with:
  - Friendly intros for every command
  - Syntax, flags (in tables), and real‑world examples
  - “Tricky scenarios” that even experienced users forget
- **`scripts/`** – safe, ready‑to‑run shell scripts, one per command (plus grouped ones), organised into **10 category folders**:
  - `file-operations` (touch, cat, cp, mv, rm)
  - `directory-operations` (pwd, ls, cd, mkdir, rmdir)
  - `search-find` (grep, find)
  - `permissions-links` (chmod, ln)
  - `process-management` (ps, kill, killall, top/htop, jobs/bg/fg)
  - `system-info` (df, du, ip/ifconfig, uname, whoami/who/uptime, printenv, echo, export, man, history, alias, sudo)
  - `package-management` (apt)
  - `compression` (zip/unzip, tar)
  - `text-processing` (sed, awk, tr)
  - `fun-commands` (cowsay, fortune, figlet, lolcat, cmatrix, sl, btop)
    

## 🚀 Quick start

### 1. Read the cheat sheet
Open [`cheat-sheet.md`](cheat-sheet.md) right here on GitHub — or clone the repo and read it locally.

### 2. Run a script
Every script is **self‑contained and safe** — it creates a temporary workspace in `/tmp/`, runs real commands there, and cleans up afterwards. No files on your system are touched.

```bash
# Clone the repo
git clone https://github.com/Arbaz-byte/linux-commands-guide.git
cd linux-commands-guide

# Make sure scripts are executable (they should be, but just in case)
find scripts -name "*.sh" -exec chmod +x {} \;

# Try one!
./scripts/file-operations/touch-examples.sh
./scripts/search-find/grep-examples.sh
./scripts/fun-commands/fun-examples.sh
```

---

## 🧭 Repository structure

```
linux-commands-guide/
├── README.md                ← You are here
├── cheat-sheet.md           ← The full cheat sheet
└── scripts/
    ├── file-operations/
    │   ├── touch-examples.sh
    │   ├── cat-examples.sh
    │   ├── cp-examples.sh
    │   ├── mv-examples.sh
    │   └── rm-examples.sh
    ├── directory-operations/
    │   ├── pwd-examples.sh
    │   ├── ls-examples.sh
    │   ├── cd-examples.sh
    │   ├── mkdir-examples.sh
    │   └── rmdir-examples.sh
    ├── search-find/
    │   ├── grep-examples.sh
    │   └── find-examples.sh
    ├── permissions-links/
    │   ├── chmod-examples.sh
    │   └── ln-examples.sh
    ├── process-management/
    │   ├── ps-examples.sh
    │   ├── kill-examples.sh
    │   ├── killall-examples.sh
    │   ├── top-htop-examples.sh
    │   └── jobs-bg-fg-examples.sh
    ├── system-info/
    │   ├── df-examples.sh
    │   ├── du-examples.sh
    │   ├── ip-ifconfig-examples.sh
    │   ├── uname-examples.sh
    │   ├── whoami-who-uptime-examples.sh
    │   ├── printenv-examples.sh
    │   ├── echo-examples.sh
    │   ├── export-examples.sh
    │   ├── man-examples.sh
    │   ├── history-examples.sh
    │   ├── alias-examples.sh
    │   └── sudo-examples.sh
    ├── package-management/
    │   └── apt-examples.sh
    ├── compression/
    │   ├── zip-unzip-examples.sh
    │   └── tar-examples.sh
    ├── text-processing/
    │   ├── sed-examples.sh
    │   ├── awk-examples.sh
    │   └── tr-examples.sh
    └── fun-commands/
        └── fun-examples.sh
```

---

## 🛡️ Safety first

All scripts:
- Create a temporary folder with `mktemp -d` under `/tmp/`
- Perform all demos inside that folder
- Remove the folder completely when done (even if they fail)
- **Never** touch your home directory or personal files

You can run any script without fear.

---

## 📦 Requirements

- **Linux** (native, WSL, or a virtual machine)
- **Bash** (default on almost all Linux distributions)
- Some scripts check for optional tools like `htop`, `cowsay`, `figlet`, etc. — they’ll tell you how to install them if missing.

---

## 🤝 How to use this repo

- **Absolute beginners**: Start with `cheat-sheet.md`, then run the `file-operations` scripts.
- **Improvers**: Work through the categories one by one; each script contains comments that explain what’s happening.
- **Teachers / presenters**: Use the scripts as live demos in workshops — zero setup, zero risk.

---

## 🎉 Shout‑out

This project was built step‑by‑step, with love, over several days — from a handwritten list of commands to a fully organised, tested, and documented GitHub repository.  
If you find it useful, give it a ⭐ and share it with a friend.

---

**Happy Linux journey! 🐧**

