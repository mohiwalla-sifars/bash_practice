#!/usr/bin/env bash

# =====================================================
# Bash Parameter Expansion - Path Manipulation Notes
# =====================================================
# This script demonstrates how Bash parameter expansion
# can replace external commands like:
#   - dirname
#   - basename
#
# Focus: # ## % %% // replacements
# =====================================================


# -------------------------------------
# 1. Base variable
# -------------------------------------
path="/home/dave/foo.txt"

echo "Path            : $path"
echo


# -------------------------------------
# 2. External commands (reference)
# -------------------------------------
echo "Using dirname   : $(dirname "$path")"
echo "Using basename  : $(basename "$path")"
echo


# -------------------------------------
# 3. Remove prefix using # and ##
# -------------------------------------
# #   → remove shortest match from start
# ##  → remove longest match from start

echo "Remove shortest prefix (#*/)"
echo "${path#*/}"
echo

echo "Remove longest prefix (##*/)"
echo "${path##*/}"
echo "# Equivalent to basename"
echo


# -------------------------------------
# 4. Remove suffix using % and %%
# -------------------------------------
# %   → remove shortest match from end
# %%  → remove longest match from end

echo "Remove shortest suffix (%/*)"
echo "${path%/*}"
echo "# Equivalent to dirname"
echo

echo "Remove longest suffix (%%/*)"
echo "${path%%/*}"
echo


# -------------------------------------
# 5. Search & replace (first occurrence)
# -------------------------------------
echo "Replace first 'a' with 'o'"
echo "${path/a/o}"
echo


# -------------------------------------
# 6. Global replacement (//)
# -------------------------------------
echo "Replace all 'a' with 'o'"
echo "${path//a/o}"
echo


# -------------------------------------
# 7. Character classes in replacement
# -------------------------------------
echo "Replace all [af] with 'o'"
echo "${path//[af]/o}"
echo

echo "Replace all [af] with '5'"
echo "${path//[af]/5}"
echo

echo "Replace all [advf] with '5'"
echo "${path//[advf]/5}"
echo


# -------------------------------------
# 8. Using & (matched text)
# -------------------------------------
echo "Replace [advf] with matched text (&)"
echo "${path//[advf]/&}"
echo


# -------------------------------------
# 9. Using matched text inside strings
# -------------------------------------
echo "Wrap matched chars with __&__"
echo "${path//[advf]/__&__}"
echo

echo "Escaped & (literal &)"
echo "${path//[advf]/__\&__}"
echo


# -------------------------------------
# 10. Summary (as comments)
# -------------------------------------
# ${var##*/}   → basename
# ${var%/*}    → dirname
# ${var/a/b}   → replace first
# ${var//a/b}  → replace all
# &            → matched text
#
# Parameter expansion:
# - Built-in
# - Faster than sed/awk/dirname
# - Preferred in scripts
