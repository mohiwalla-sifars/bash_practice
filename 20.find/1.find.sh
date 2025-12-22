#!/usr/bin/env bash

# =====================================================
# Bash find Command - Notes
# =====================================================
# find searches for files and directories in a directory hierarchy.
# Can filter by:
# - Name / Pattern
# - Type (file / directory)
# - Size
# - Permissions
# - Modification time
# - Execute commands on matched files
# =====================================================

echo "======================================="
echo "1. Basic find usage"
echo "======================================="

# Create demo directories and files
mkdir -p demo_dir/subdir
echo "Hello" > demo_dir/file1.txt
echo "World" > demo_dir/file2.log
echo "Test" > demo_dir/subdir/file3.txt

echo "Directory structure:"
tree demo_dir 2>/dev/null
echo

# Find all files and directories
echo "All files and directories:"
find demo_dir
echo


echo "======================================="
echo "2. Find by name"
echo "======================================="

# Find files named file1.txt
find demo_dir -name "file1.txt"
echo

# Find all .txt files
find demo_dir -name "*.txt"
echo


echo "======================================="
echo "3. Find by type"
echo "======================================="

# Only directories
find demo_dir -type d
echo

# Only regular files
find demo_dir -type f
echo


echo "======================================="
echo "4. Find by size"
echo "======================================="

# Find files larger than 0 bytes
find demo_dir -size +0c
echo

# Find files exactly 5 bytes
find demo_dir -size 5c
echo


echo "======================================="
echo "5. Find by modification time"
echo "======================================="

# Files modified in the last 1 day
find demo_dir -mtime -1
echo

# Files modified more than 0 days ago
find demo_dir -mtime +0
echo


echo "======================================="
echo "6. Execute commands on found files"
echo "======================================="

# Count lines in all .txt files
find demo_dir -name "*.txt" -exec wc -l {} \;
echo

# Delete all .log files (dry run first)
find demo_dir -name "*.log" -exec echo "Deleting {}" \;
# Uncomment below to actually delete
# find demo_dir -name "*.log" -exec rm {} \;
echo


echo "======================================="
echo "7. Using -print, -ls, -maxdepth, -mindepth"
echo "======================================="

# Print matched files
find demo_dir -name "*.txt" -print
echo

# List details
find demo_dir -name "*.txt" -ls
echo

# Limit search depth
find demo_dir -maxdepth 1 -type f
echo


echo "======================================="
echo "8. Notes / Tips"
echo "======================================="

echo "- find [path] [options] [expression] - searches files"
echo "- Common options: -name, -type, -size, -mtime, -perm"
echo "- Execute commands: -exec command {} \;"
echo "- {} is replaced by the found file"
echo "- Use quotes around patterns: \"*.txt\""
echo "- Can combine multiple tests with -and, -or, ! (not)"

# Cleanup
rm -r demo_dir
