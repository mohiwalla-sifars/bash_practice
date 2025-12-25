#!/usr/bin/env bash
#
# ==========================================
# Bash Colored Output — NOTES
# ==========================================
#
# Color output in terminals is done using
# ANSI escape sequences.
#
# Escape prefix:
#   \e[   or   \033[
#

echo "========================="
echo "1. Basic colors"
echo "========================="

# Format:
# \e[<STYLE>;<FG>;<BG>m TEXT \e[0m

printf "\e[31mRed text\e[0m\n"
printf "\e[32mGreen text\e[0m\n"
printf "\e[33mYellow text\e[0m\n"
printf "\e[34mBlue text\e[0m\n"
printf "\e[35mMagenta text\e[0m\n"
printf "\e[36mCyan text\e[0m\n"
printf "\e[37mWhite text\e[0m\n"


echo
echo "========================="
echo "2. Text styles"
echo "========================="

printf "\e[1mBold text\e[0m\n"
printf "\e[2mDim text\e[0m\n"
printf "\e[4mUnderline\e[0m\n"
printf "\e[5mBlink (may not work)\e[0m\n"
printf "\e[7mReverse colors\e[0m\n"


echo
echo "========================="
echo "3. Background colors"
echo "========================="

printf "\e[41mRed BG\e[0m\n"
printf "\e[42mGreen BG\e[0m\n"
printf "\e[43mYellow BG\e[0m\n"
printf "\e[44mBlue BG\e[0m\n"
printf "\e[45mMagenta BG\e[0m\n"
printf "\e[46mCyan BG\e[0m\n"


echo
echo "========================="
echo "4. Combining styles"
echo "========================="

printf "\e[1;31mBold Red\e[0m\n"
printf "\e[4;34mUnderlined Blue\e[0m\n"
printf "\e[1;33;44mBold Yellow on Blue BG\e[0m\n"


echo
echo "========================="
echo "5. Resetting colors"
echo "========================="

# VERY IMPORTANT
# Always reset after colored text
printf "\e[31mRed text"
printf " (still red!)"
printf "\e[0m now reset\n"


echo
echo "========================="
echo "6. Using variables"
echo "========================="

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
BOLD="\e[1m"
RESET="\e[0m"

printf "${RED}Error:${RESET} something failed\n"
printf "${GREEN}Success:${RESET} task completed\n"
printf "${BOLD}${BLUE}Info:${RESET} running task\n"


echo
echo "========================="
echo "7. Functions for colors"
echo "========================="

error()   { printf "\e[31m[ERROR]\e[0m %s\n" "$*"; }
success() { printf "\e[32m[SUCCESS]\e[0m %s\n" "$*"; }
warn()    { printf "\e[33m[WARN]\e[0m %s\n" "$*"; }
info()    { printf "\e[34m[INFO]\e[0m %s\n" "$*"; }

error "File not found"
success "Build completed"
warn "Low disk space"
info "Server started"


echo
echo "========================="
echo "8. 256-color support"
echo "========================="

# Foreground: 38;5;<n>
# Background: 48;5;<n>

printf "\e[38;5;208mOrange text\e[0m\n"
printf "\e[48;5;25mBlue BG\e[0m\n"


echo
echo "========================="
echo "9. True color (24-bit)"
echo "========================="

# Only works in modern terminals
printf "\e[38;2;255;100;0mTrue color orange\e[0m\n"
printf "\e[48;2;50;50;50mDark gray BG\e[0m\n"


echo
echo "========================="
echo "10. Disable colors (scripts)"
echo "========================="

# Detect terminal
if [[ -t 1 ]]; then
    printf "\e[32mColors enabled (TTY)\e[0m\n"
else
    echo "No colors (not a TTY)"
fi


echo
echo "========================="
echo "11. Best practices"
echo "========================="

cat <<'EOF'
✔ Always reset colors (\e[0m)
✔ Use printf instead of echo -e
✔ Disable colors for logs/files
✔ Use functions for consistency
✔ Respect NO_COLOR env var if present
EOF


echo
echo "========================="
echo "End of colored output notes"
echo "========================="
