#!/usr/bin/env bash
#
# =========================
# Bash printf — NOTES
# =========================
#
# printf is a builtin in bash (also available as /usr/bin/printf)
# It is more predictable and powerful than echo.
#
# Syntax:
#   printf FORMAT [ARGUMENTS...]
#

echo "========================="
echo "1. Basic string printing"
echo "========================="

s="hello world"

# No automatic newline
printf "%s" "$s"
printf "\n"

# With newline
printf "%s\n" "$s"


echo
echo "========================="
echo "2. Multiple arguments"
echo "========================="

printf "%s %s\n" hello world
printf "%s    %s\n" hello world


echo
echo "========================="
echo "3. Width & alignment"
echo "========================="

# Minimum field width
printf "%5s %5s\n" a b

# Left aligned
printf "%-5s %-5s\n" a b

# Visual markers
printf "<%5s> <%5s>\n" a b
printf "<%-5s> <%-5s>\n" a b


echo
echo "========================="
echo "4. Dynamic width (*)"
echo "========================="

# Width comes from argument
printf "<%*s>\n" 10 hello
printf "<%-*s>\n" 10 hello
printf "<%-*s>\n" 20 hello


echo
echo "========================="
echo "5. Integer formatting"
echo "========================="

printf "%d\n" 55          # decimal
printf "%5d\n" 55         # width
printf "%-5d\n" 55        # left aligned
printf "%05d\n" 55        # zero padded


echo
echo "========================="
echo "6. Invalid numbers"
echo "========================="

# Invalid numeric input
printf "%05d\n" hello
echo "exit code: $?"

# Octal behavior
printf "%d\n" 06   # valid octal -> decimal
printf "%d\n" 07
printf "%d\n" 08   # invalid octal
echo "exit code: $?"

printf "%d\n" 010  # octal -> decimal (8)
printf "%d\n" 0123 # octal -> decimal (83)

# Hexadecimal
printf "%d\n" 0x0a # hex -> decimal (10)


echo
echo "========================="
echo "7. Escape sequences"
echo "========================="

# \n newline
printf "hello world\n"

# \xHH hex byte
printf "%b\n" '\xff'

# Combine string + escape
printf "hello world%b" '\x0a'


echo
echo "========================="
echo "8. %b vs %s"
echo "========================="

# %s does NOT interpret escapes
printf "%s\n" '\n\t\x41'

# %b DOES interpret escapes
printf "%b\n" '\n\t\x41'


echo
echo "========================="
echo "9. Why printf > echo"
echo "========================="

# echo behavior differs across shells
# printf is consistent and POSIX-compliant

printf "Safe output: %s\n" "$s"


echo
echo "========================="
echo "10. Common best practices"
echo "========================="

# Always quote variables
printf "%s\n" "$s"

# Always provide a format string
# BAD:  printf "$s"
# GOOD:
printf "%s\n" "$s"


echo
echo "========================="
echo "End of printf notes"
echo "========================="
