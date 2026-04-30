 

```markdown
# 🐧 Linux Commands Guide

Welcome! This guide is for beginners who want to learn the most useful Linux commands.  
Each command includes:
- A **friendly intro** (what it does, why it matters)
- **Basic usage** with examples
- **Powerful flags** (table format)
- **Real‑world tips**
- **Comparisons** when helpful

Let’s dive in.

---

## 📄 1. File Operations

### `touch` – Create a file or update its timestamp
Think of `touch` as a way to tell the system, “This file exists now.” If the file doesn’t exist, `touch` creates it empty. If it does exist, `touch` updates its last‑modified time (handy for scripts).

```bash
touch myfile.txt
```

| Flag | Name | Effect |
|------|------|--------|
| `-c` | No create | Don’t create the file if missing |
| `-t` | Time | Set a specific timestamp (e.g., `202512311200`) |

**Pro tip:** Use `touch` to quickly create multiple files: `touch file1.txt file2.txt file3.txt`

---

### `cat` – Concatenate & display
`cat` is like opening a book and reading everything at once. Great for small files. For huge logs, use `less` instead.

```bash
cat myfile.txt
```

| Flag | Name | Effect |
|------|------|--------|
| `-n` | Number | Show line numbers |
| `-b` | Number non‑blank | Number only non‑empty lines |
| `-s` | Squeeze | Replace multiple blank lines with one |

**Combine with `>`** to join files: `cat part1.txt part2.txt > full.txt`

---

### `cp` – Copy files
`cp` duplicates files or folders. Think “copy‑paste” in the terminal.

```bash
cp source.txt destination.txt
cp file1.txt file2.txt folder/   # copy multiple into folder
```

| Flag | Name | Effect |
|------|------|--------|
| `-r` | Recursive | Copy entire folders (must use for directories) |
| `-i` | Interactive | Ask before overwriting |
| `-v` | Verbose | Show what’s being copied |
| `-u` | Update | Copy only when source is newer |

**Pro tip:** `cp -i` saves you from accidental overwrites. Make it an alias: `alias cp='cp -i'`

> **⚠️ Tricky Scenario #2 – Filenames with spaces**
> 
> ```bash
> # Wrong: cp my file.txt destination/
> # Correct:
> cp "my file.txt" destination/
> cp my\ file.txt destination/
> ```
> Always quote or escape spaces. Tab completion does this automatically.

---

### `mv` – Move or rename
`mv` is like cutting and pasting. Moving a file to a new name renames it; moving to another folder relocates it.

```bash
mv oldname.txt newname.txt   # rename
mv file.txt /some/where/      # move
```

| Flag | Name | Effect |
|------|------|--------|
| `-i` | Interactive | Ask before overwriting |
| `-v` | Verbose | Show what’s being moved |
| `-u` | Update | Move only when source is newer |

**Remember:** Renaming and moving are the same operation. `mv a.txt b.txt` just changes the path.

---

### `rm` – Remove files (and directories with `-r`)
`rm` is permanent. No recycle bin. Be careful.

```bash
rm file.txt
rm -r myfolder/   # delete folder and everything inside
```

| Flag | Name | Effect |
|------|------|--------|
| `-i` | Interactive | Ask before each removal |
| `-r` (or `-R`) | Recursive | Delete directories |
| `-f` | Force | Ignore nonexistent files, never prompt |
| `-v` | Verbose | Show what’s removed |

**⚠️ Warning:** `rm -rf` is powerful. Double‑check your paths.

> **⚠️ Tricky Scenario #1 – Removing a file that starts with a dash (`-`)**
> 
> ```bash
> # This WRONGLY looks like flags to rm
> rm -linux-command
> 
> # Correct ways:
> rm ./-linux-command
> rm -- -linux-command
> ```
> The `--` means “end of options” – everything after is a filename.

> **⚠️ Tricky Scenario #3 – Accidentally running `rm -rf /` or `rm -rf ./*`**
> 
> ```bash
> # This would delete your entire system (don't run it!)
> # rm -rf /
> 
> # Safer: always double-check your path, and use --preserve-root (default on many systems)
> ```
> **Pro tip:** Use `rm -ri` (interactive) when deleting important things. Also, `alias rm='rm -i'` saves lives.

> **⚠️ Tricky Scenario #16 – Removing a file with a newline in its name**
> 
> ```bash
> # Create a file with a newline in the name (don't do this on purpose!)
> # touch $'bad\nname'
> 
> # Remove by inode:
> ls -li               # find inode number
> find . -inum 12345 -delete
> ```
> Moral: avoid special characters in filenames.

---

### `head` – Show the beginning
`head` is the opening paragraph. By default, it shows the first 10 lines.

```bash
head access.log
head -n 20 access.log   # first 20 lines
```

| Flag | Name | Effect |
|------|------|--------|
| `-n` | Lines | Number of lines to show |
| `-c` | Bytes | Show first N bytes |

**Use case:** Preview a huge CSV: `head -n 5 data.csv`

> **⚠️ Tricky Scenario #20 – Using `head`/`tail` on binary files**
> 
> ```bash
> head /bin/ls          # corrupt output, may mess up your terminal
> strings /bin/ls | head  # safe: extract readable text first
> ```
> Run `reset` if your terminal becomes garbled.

---

### `tail` – Show the end (the conclusion)
`tail` is where the story ends—often where errors and the latest logs live.

```bash
tail error.log
tail -f /var/log/syslog   # follow live updates
```

| Flag | Name | Effect |
|------|------|--------|
| `-n` | Lines | Last N lines |
| `-f` | Follow | Keep watching for new lines (Ctrl+C to stop) |
| `-F` | Follow with retry | Like `-f` but survives log rotation |

**Pro trick:** Combine with `head` to see a slice: `head -n 50 file.txt | tail -n 10` → lines 41–50.

> **⚠️ Tricky Scenario #20 – Also applies to `tail` (binary files produce garbage)**

---

### `nano` – Simple terminal text editor
`nano` is beginner‑friendly. Edit files without leaving the terminal.

```bash
nano script.py
```

| Shortcut | Effect |
|----------|--------|
| `Ctrl+O` | Save (Write Out) |
| `Ctrl+X` | Exit |
| `Ctrl+W` | Search |
| `Ctrl+K` | Cut line |
| `Ctrl+U` | Paste |

**Pro tip:** `nano ~/.bashrc` lets you edit your shell configuration.

---

### `code` – Open VS Code (if installed)
Microsoft’s VS Code can be launched from the terminal if you have the `code` command in your PATH.

```bash
code .                     # open current folder
code myfile.txt            # open that file
code -r .                  # reuse last window
```

Not installed? Run `sudo apt install code` (if using the .deb package).

---

### `wc` – Count lines, words, characters
`wc` tells you how big a file is—quickly.

```bash
wc myfile.txt
# outputs: lines words characters filename
```

| Flag | Name | Effect |
|------|------|--------|
| `-l` | Lines | Only line count |
| `-w` | Words | Only word count |
| `-c` | Bytes | Byte count |
| `-m` | Characters | Character count |

**Pipe it:** `ls -l | wc -l` counts files in a directory.

---

### `sort` – Sort lines alphabetically or numerically
Sort rearranges your data. Perfect for logs or CSV files.

```bash
sort names.txt
sort -n numbers.txt   # numeric sort
```

| Flag | Name | Effect |
|------|------|--------|
| `-n` | Numeric | Sort by number |
| `-r` | Reverse | Reverse order |
| `-u` | Unique | Remove duplicates (like uniq) |
| `-k` | Key | Sort by a specific column |

**Real‑world:** `du -h | sort -h` sorts disk usage by size.

---

### `uniq` – Report or remove duplicate lines
`uniq` works on **sorted** input. It filters out repeated adjacent lines.

```bash
sort names.txt | uniq        # show each name once
sort names.txt | uniq -c     # count occurrences
```

| Flag | Name | Effect |
|------|------|--------|
| `-c` | Count | Prefix lines with occurrence count |
| `-d` | Duplicates | Only show duplicate lines |
| `-u` | Unique | Only show lines that appear once |

---

### `cut` – Extract columns from text
`cut` slices out fields or character positions—great for CSV or log files.

```bash
cut -d',' -f1,3 data.csv   # first and third column, comma‑separated
cut -c1-10 fixed-width.txt # first 10 characters
```

| Flag | Name | Effect |
|------|------|--------|
| `-d` | Delimiter | Field separator (default tab) |
| `-f` | Fields | Which fields to keep |
| `-c` | Characters | Character positions |

---

### `diff` – Compare files line by line
`diff` shows what changed between two files. Essential for programmers.

```bash
diff old.txt new.txt
```

| Flag | Name | Effect |
|------|------|--------|
| `-u` | Unified | Side‑by‑side style (easier to read) |
| `-i` | Ignore case | Ignore uppercase/lowercase |
| `-w` | Ignore whitespace | Ignore spaces and tabs |
| `-r` | Recursive | Compare folders |

**Pro tip:** `diff -u file1 file2` is the format used by `patch`.

---

## 📂 2. Folder / Directory Operations

### `pwd` – Print Working Directory
`pwd` shows you exactly where you are in the filesystem. No flags needed.

```bash
pwd
# /home/username/projects
```

---

### `ls` – List directory contents
`ls` is your flashlight in the dark. It shows what files/folders exist.

```bash
ls
ls -l   # detailed list (permissions, size, date)
ls -a   # show hidden files (dotfiles)
```

| Flag | Name | Effect |
|------|------|--------|
| `-l` | Long | Permissions, owner, size, date |
| `-a` | All | Include hidden files (starting with `.`) |
| `-h` | Human‑readable | File sizes like `4K`, `12M` (use with `-l`) |
| `-R` | Recursive | List subdirectories |
| `-t` | Time | Sort by modification time (newest first) |

**Pro tip:** `ls -lah` is the most common combination.

---

### `cd` – Change Directory
`cd` moves you into another folder.

```bash
cd /var/log
cd ~        # go home
cd ..       # go up one level
cd -        # go back to previous folder
```

No flags, but many shortcuts: `cd` alone returns to home.

> **⚠️ Tricky Scenario #12 – `cd` into a directory with a strange name**
> 
> ```bash
> cd "My (weird) folder"
> cd My\ \(weird\)\ folder/
> # Use tab completion to avoid mistakes
> ```

---

### `mkdir` – Make Directory
`mkdir` creates new folders.

```bash
mkdir myfolder
mkdir -p parent/child/grandchild   # create full path
```

| Flag | Name | Effect |
|------|------|--------|
| `-p` | Parents | Create intermediate directories (no error if exist) |
| `-v` | Verbose | Print a message for each created directory |

---

### `rmdir` – Remove empty directory
`rmdir` only works on empty folders. Safe but limited.

```bash
rmdir emptydir
```

To delete non‑empty directories, use `rm -r`.

> **⚠️ Tricky Scenario #5 – Deleting a non‑empty directory**
> 
> ```bash
> rmdir myfolder/   # fails with "Directory not empty"
> rm -r myfolder/   # works
> rm -rf myfolder/  # force delete without prompt
> ```

---

## 🔍 3. Search & Find

### `grep` – Global Regular Expression Print
`grep` is your treasure hunter. It searches inside files for text patterns.

```bash
grep "error" log.txt
grep -i "warning" *.log      # case‑insensitive
```

| Flag | Name | Effect |
|------|------|--------|
| `-i` | Ignore case | Case‑insensitive |
| `-r` | Recursive | Search folders |
| `-n` | Line number | Show line numbers |
| `-v` | Invert | Show lines **not** matching |
| `-c` | Count | Only show count of matches |
| `-e` | Pattern | Multiple patterns (`-e "foo" -e "bar"`) |

**Classic:** `grep -rn "TODO" .` finds all TODO comments in a project.

> **⚠️ Tricky Scenario #11 – Searching for literal dots or asterisks**
> 
> ```bash
> grep "*.txt" file.txt   # Wrong: * is a regex
> grep -F "*.txt" file.txt  # Fixed string search
> grep "\*.txt" file.txt     # Escape the asterisk
> ```

> **⚠️ Tricky Scenario #18 – `ps aux | grep firefox` also shows the grep itself**
> 
> ```bash
> ps aux | grep firefox
> # Output includes: user 12345 grep firefox
> 
> # Solutions:
> pgrep firefox
> ps aux | grep [f]irefox   # regex trick: grep doesn't match itself
> ```
> *(This trick is also useful with any `grep` to avoid matching the grep process.)*

---

### `find` – Search for files and folders
`find` is the most powerful search tool. It looks for actual files (not contents).

```bash
find . -name "*.txt"
find /home -type d -name "Downloads"
```

| Flag | Name | Effect |
|------|------|--------|
| `-name` | Name | Case‑sensitive filename |
| `-iname` | Insensitive | Case‑insensitive |
| `-type` | Type | `f` (file), `d` (directory) |
| `-size` | Size | e.g., `+100M` (bigger than 100MB) |
| `-mtime` | Modified time | e.g., `-7` (last 7 days) |
| `-exec` | Execute | Run a command on each result |

**Real‑world:** `find . -name "*.log" -exec rm {} \;` deletes all log files.

> **⚠️ Tricky Scenario #6 – Finding files with special characters**
> 
> ```bash
> # Wrong: find . -name *.txt  (the shell expands * before find runs)
> # Correct:
> find . -name "*.txt"
> ```
> Always quote patterns passed to `find`.

---

### `locate` – Quick file lookup by database
`locate` is faster than `find` but uses a pre‑built database (updated daily usually). To update manually: `sudo updatedb`.

```bash
locate myfile.txt
```

---

## 🔐 4. Permissions & Links

### `chmod` – Change file permissions
Permissions are like locks on your files. `chmod` changes who can read, write, or execute.

```bash
chmod +x script.sh           # make executable
chmod 755 myprogram          # owner: rwx, group: r-x, others: r-x
```

**Numeric mode:**  
- 4 = read, 2 = write, 1 = execute. Sum them.  
Common: `777` (all access), `755` (owner full, others read/execute), `644` (owner read/write, others read)

| Symbolic | Meaning |
|----------|---------|
| `u` | user (owner) |
| `g` | group |
| `o` | others |
| `a` | all |
| `+` | add permission |
| `-` | remove permission |
| `=` | set exactly |

**Pro tip:** `chmod -R 755 folder/` sets permissions recursively.

> **⚠️ Tricky Scenario #17 – `chmod 777` is usually a bad idea**
> 
> ```bash
> chmod 777 sensitive.sh   # anyone can write/execute – security risk
> # Better:
> chmod 755 script.sh      # owner full, others read/execute
> chmod 644 data.txt       # owner read/write, others read
> ```
> For directories, the execute bit (`x`) allows entering the directory.

---

### `ln` – Create links (shortcuts)
`ln` makes a new name pointing to an existing file. Symbolic links (soft links) are like Windows shortcuts.

```bash
ln -s /real/path/to/file linkname   # symbolic (soft) link
ln realfile hardlink                 # hard link (same inode)
```

| Flag | Name | Effect |
|------|------|--------|
| `-s` | Symbolic | Create a symbolic link (most common) |
| `-f` | Force | Remove existing destination |

**Use case:** `ln -s /var/log/nginx/access.log current.log` – a convenient short name.

> **⚠️ Tricky Scenario #7 – Changing permissions on a symbolic link**
> 
> ```bash
> ln -s target mylink
> chmod 777 mylink   # This changes 'target', not the link itself!
> ```
> Symlinks always show `lrwxrwxrwx`; their permissions don't matter.

---

## ⚙️ 5. Process Management

### `ps` – Process status
`ps` shows running programs (processes). By default, only your own in the current terminal.

```bash
ps aux     # all processes, detailed (common)
ps -ef     # another standard format
```

| Flag | Name | Effect |
|------|------|--------|
| `a` | All users | Show processes for all users |
| `u` | User‑friendly | Show user, CPU, memory |
| `x` | Without terminal | Include daemons |
| `-e` | Every | All processes |
| `-f` | Full format | More columns |

**Combine with `grep`:** `ps aux | grep firefox`

---

### `kill` – Terminate by process ID
`kill` sends signals. The default signal is TERM (15), which asks nicely.

```bash
kill 1234          # ask process 1234 to stop
kill -9 1234       # force kill (SIGKILL) – last resort
```

| Signal number | Name | Effect |
|---------------|------|--------|
| 15 (default) | TERM | Graceful termination |
| 9 | KILL | Immediate, cannot be ignored |
| 2 | INT | Same as Ctrl+C |
| 1 | HUP | Reload configuration |

**Find PID:** `pidof firefox` or `pgrep firefox`

> **⚠️ Tricky Scenario #8 – Killing a zombie/defunct process**
> 
> ```bash
> kill -9 <PID>   # won't work on zombies
> ps aux | grep Z
> ```
> Zombies can only be removed by killing their parent process or rebooting.

---

### `killall` – Kill by name
`killall` kills all processes with a given name.

```bash
killall firefox
killall -9 chrome
```

---

### `top` / `htop` – Real‑time system monitor
`top` shows live processes, CPU, memory. `htop` is improved (install with `sudo apt install htop`).

```bash
top
htop
```

Inside `top`: Press `q` to quit, `k` to kill a process, `M` to sort by memory.

---

### `jobs`, `bg`, `fg` – Manage background tasks
When you append `&` to a command, it runs in the background.

```bash
long_command &
jobs            # list background jobs
fg %1           # bring job 1 to foreground
bg %2           # resume job 2 in background
```

---

## 💻 6. System Information & Environment

### `df` – Disk free space
`df` shows how much space is left on your drives.

```bash
df -h     # human‑readable sizes (GB, MB)
```

| Flag | Name | Effect |
|------|------|--------|
| `-h` | Human | Sizes like `4.2G`, `512M` |
| `-T` | Type | Show filesystem type (ext4, xfs) |
| `-i` | Inodes | Show inode usage (max files) |

**Pro tip:** `df -hT` to see mount points and filesystem types.

---

### `du` – Disk usage of files/directories
`du` tells you the size of a specific folder.

```bash
du -sh myfolder/     # summary in human format
du -h --max-depth=1  # sizes of immediate subfolders
```

| Flag | Name | Effect |
|------|------|--------|
| `-s` | Summary | Only total size |
| `-h` | Human | Human‑readable |
| `-a` | All | Show files as well |
| `--max-depth=N` | Depth | Limit recursion |

**Find large files:** `du -ah /home | sort -hr | head -10`

> **⚠️ Tricky Scenario #19 – `du` shows smaller size than expected**
> 
> ```bash
> du -sh hugefolder/   # shows 1.0G, but folder has 10G
> ```
> Possible reasons: hard links, sparse files, or mount points. Use `du -sh --apparent-size` for a different view.

---

### `ifconfig` / `ip` – Network interfaces
`ifconfig` (deprecated but common) shows IP addresses. Install with `sudo apt install net-tools`.

```bash
ifconfig
ip addr show
```

Modern replacement: `ip` command.

---

### `uname` – System information
```bash
uname -a   # kernel name, hostname, kernel release, architecture
```

---

### `whoami`, `who`, `uptime`
```bash
whoami     # your username
who        # list logged‑in users
uptime     # how long system has been running + load average
```

---

### `printenv` – Show environment variables
```bash
printenv
printenv HOME     # show value of $HOME
```

---

### `echo` – Print text or variable
```bash
echo "Hello World"
echo $PATH
echo $((5 + 3))   # arithmetic (bash)
```

| Flag | Name | Effect |
|------|------|--------|
| `-e` | Enable escapes | Interpret `\n` (newline), `\t` (tab) |
| `-n` | No newline | Suppress trailing newline |

---

### `export` – Set environment variable
```bash
export MY_VAR="hello"
echo $MY_VAR      # prints hello
```

Variable lasts only for the current shell session. To make permanent, add to `~/.bashrc`.

> **⚠️ Tricky Scenario #15 – Environment variable doesn’t persist after reboot**
> 
> ```bash
> export MY_VAR="hello"   # only for current shell
> echo "export MY_VAR='hello'" >> ~/.bashrc   # permanent
> ```

---

### `man` – Manual pages
`man` is the built‑in documentation.

```bash
man ls
man 5 passwd    # section 5 (file formats)
```

Navigate with arrow keys, `q` to quit.

---

### `history` – Command history
```bash
history
!123      # re‑run command number 123
!!        # re‑run last command
```

---

### `alias` – Create shortcuts
```bash
alias ll='ls -lah'
alias ..='cd ..'
```

To make permanent, add to `~/.bashrc`. To remove: `unalias ll`.

---

### `sudo` – Superuser do
Run commands as root.

```bash
sudo apt update
```

> **⚠️ Tricky Scenario #9 – Forgetting `sudo` and getting “permission denied”**
> 
> ```bash
> cat /etc/shadow          # Permission denied
> sudo !!                  # re‑runs last command with sudo
> ```
> `!!` means “the previous command”. Very handy.

---

## 🧠 Shell Basics – Redirection Pitfalls

### `>` vs `>>`
```bash
echo "hello" > file.txt   # overwrites
echo "world" >> file.txt  # appends

# ⚠️ Tricky Scenario #13 – Accidentally overwriting a file
set -o noclobber          # prevents > from overwriting (bash)
>| file.txt               # force overwrite even with noclobber
```

> **⚠️ Tricky Scenario #14 – Too much output flooding the terminal**
> 
> ```bash
> cat hugefile.txt         # floods
> cat hugefile.txt | less  # paginated
> cat hugefile.txt | head  # only beginning
> ```
> During a flood: `Ctrl+S` pauses output, `Ctrl+Q` resumes.

---

## 📦 7. Package Management (Ubuntu/Debian)

All commands need `sudo` (superuser privileges).

```bash
sudo apt update          # refresh package list
sudo apt upgrade         # upgrade all packages
sudo apt install htop    # install htop
sudo apt remove htop     # remove but keep configs
sudo apt purge htop      # remove everything
sudo apt search grep     # search for packages
```

**xdg‑utils** example: `xdg-open https://google.com` opens URL in default browser.

---

## 🗜️ 8. Compression / Archiving

### `zip` / `unzip`
```bash
zip archive.zip file1.txt file2.txt
unzip archive.zip
```

| Flag | Effect |
|------|--------|
| `-r` | Recursively zip folders |
| `-d` | Extract to directory `unzip archive.zip -d target/` |

---

### `tar` – Tape archive (most common on Linux)
```bash
tar -cvf archive.tar folder/           # create uncompressed
tar -xvf archive.tar                   # extract

tar -czvf archive.tar.gz folder/       # compress with gzip
tar -xzvf archive.tar.gz               # extract gzip

tar -cjvf archive.tar.bz2 folder/      # bzip2 (smaller, slower)
```

| Flag | Name | Effect |
|------|------|--------|
| `-c` | Create | Create archive |
| `-x` | Extract | Extract |
| `-v` | Verbose | Show progress |
| `-f` | File | Archive filename |
| `-z` | Gzip | Use gzip compression |
| `-j` | Bzip2 | Use bzip2 compression |

> **⚠️ Tricky Scenario #10 – `tar` errors with spaces in paths**
> 
> ```bash
> tar -czvf my archive.tar.gz "My Folder"   # Wrong
> tar -czvf "my archive.tar.gz" "My Folder" # Correct, but better to avoid spaces
> ```

---

## 🎛️ 9. Text Processing (sed, awk, tr)

### `sed` – Stream editor (find/replace)
```bash
sed 's/old/new/g' file.txt          # replace all, print to stdout
sed -i 's/old/new/g' file.txt       # edit file in‑place
```

| Flag | Name | Effect |
|------|------|--------|
| `-i` | In‑place | Edit file directly (optional backup with `-i.bak`) |
| `-e` | Expression | Multiple commands |
| `-n` | Quiet | Suppress automatic printing |

**Example:** `sed -n '5,10p' file.txt` prints lines 5‑10.

---

### `awk` – Pattern scanning & processing
`awk` is like a mini programming language for text.

```bash
awk '{print $1}' file.txt          # print first column
awk -F',' '{print $2}' data.csv    # comma‑separated, second field
```

---

### `tr` – Translate or delete characters
```bash
echo "hello" | tr 'a-z' 'A-Z'      # HELLO
echo "hello 123" | tr -d '0-9'     # delete digits → "hello "
```

---

## 🎉 10. Fun Commands (Just for Fun)

Install them first:  
`sudo apt install cowsay cmatrix sl fortune figlet lolcat`  
`btop` requires `sudo apt install btop`

```bash
cowsay "Hello Linux!"
cmatrix               # Matrix rain (Ctrl+C to exit)
sl                    # steam locomotive – a joke for `ls`
fortune               # random quote
fortune | cowsay      # combine!
figlet "Linux Rocks"
echo "colorful" | lolcat
btop                  # fancy resource monitor
```

**Pro tip:** Add `fortune | cowsay | lolcat` to your `.bashrc` for a fun welcome message.

---

## 📚 Conclusion

This cheat sheet covers the most essential Linux commands. Remember:
- Use `man command` for full details.
- Practice in a safe environment (try `~/tmp` folder).
- Combine commands with pipes (`|`) and redirections (`>`, `>>`).

Happy Linux journey! 🐧
```
