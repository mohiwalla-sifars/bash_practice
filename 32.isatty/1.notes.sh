#!/usr/bin/env bash
#
# ==========================================
# isatty — NOTES
# ==========================================
#
# isatty checks whether a file descriptor
# is connected to a terminal (TTY).
#
# In bash, this is commonly done with:
#   test -t FD
#   [[ -t FD ]]
#

echo "========================="
echo "1. What is a TTY?"
echo "========================="

cat <<'EOF'
TTY = Terminal device

Examples:
  keyboard + screen
  ssh session
  interactive shell

Not a TTY:
  pipes
  files
  command substitution
EOF


echo
echo "========================="
echo "2. File descriptors"
echo "========================="

cat <<'EOF'
FD 0 -> stdin
FD 1 -> stdout
FD 2 -> stderr
EOF


echo
echo "========================="
echo "3. isatty in bash"
echo "========================="

# Check stdout
if [[ -t 1 ]]; then
    echo "stdout is a TTY"
else
    echo "stdout is NOT a TTY"
fi

# Check stdin
if [[ -t 0 ]]; then
    echo "stdin is a TTY"
else
    echo "stdin is NOT a TTY"
fi

# Check stderr
if [[ -t 2 ]]; then
    echo "stderr is a TTY"
else
    echo "stderr is NOT a TTY"
fi


echo
echo "========================="
echo "4. Pipe vs terminal"
echo "========================="

echo "hello" | {
    if [[ -t 1 ]]; then
        echo "piped stdout is a TTY"
    else
        echo "piped stdout is NOT a TTY"
    fi
}


echo
echo "========================="
echo "5. Redirected output"
echo "========================="

{
    if [[ -t 1 ]]; then
        echo "stdout is a TTY"
    else
        echo "stdout is NOT a TTY"
    fi
} > /tmp/isatty-test.txt


echo
echo "========================="
echo "6. Practical use: colors"
echo "========================="

if [[ -t 1 ]]; then
    GREEN="\e[32m"
    RESET="\e[0m"
else
    GREEN=""
    RESET=""
fi

printf "${GREEN}Success${RESET}: operation completed\n"


echo
echo "========================="
echo "7. Practical use: prompts"
echo "========================="

if [[ -t 0 ]]; then
    read -rp "Enter your name: " name
    echo "Hello $name"
else
    echo "No prompt (non-interactive input)"
fi


echo
echo "========================="
echo "8. isatty vs test -t"
echo "========================="

cat <<'EOF'
C:
  isatty(fd)

Bash:
  test -t fd
  [ -t fd ]
  [[ -t fd ]]

All mean:
  "Is this FD connected to a terminal?"
EOF


echo
echo "========================="
echo "9. Exit codes"
echo "========================="

# test -t sets exit code
[[ -t 1 ]]
echo "exit code: $?"


echo
echo "========================="
echo "10. Common patterns"
echo "========================="

cat <<'EOF'
# Enable colors only in terminal
[[ -t 1 ]] && USE_COLOR=1

# Disable pager in pipes
[[ -t 1 ]] && less

# Detect CI / automation
[[ ! -t 0 ]] && NON_INTERACTIVE=1
EOF


echo
echo "========================="
echo "11. Best practices"
echo "========================="

cat <<'EOF'
✔ Always disable colors for non-TTY
✔ Check stderr separately for errors
✔ Avoid prompts when stdin is not a TTY
✔ Use [[ -t FD ]] in bash scripts
✔ Combine with NO_COLOR env var
EOF


echo
echo "========================="
echo "End of isatty notes"
echo "========================="
