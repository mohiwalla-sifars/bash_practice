#!/usr/bin/env bash

# =====================================================
# Bash Text Processing: awk - Notes
# =====================================================
# awk is a powerful text processing tool:
# - Works line by line
# - Splits lines into fields
# - Can perform arithmetic, pattern matching, and formatting
# =====================================================

echo "======================================="
echo "1. Basic awk usage"
echo "======================================="

echo -e "name,age,city\nAlice,25,Delhi\nBob,30,Mumbai" > demo.csv

echo "Original CSV:"
cat demo.csv
echo

# Print the first column
echo "Print first column (names):"
awk -F',' '{print $1}' demo.csv
echo

# Print multiple columns
echo "Print name and city:"
awk -F',' '{print $1, $3}' demo.csv
echo


echo "======================================="
echo "2. Pattern matching"
echo "======================================="

# Print lines where age > 25
awk -F',' '$2 > 25 {print $0}' demo.csv
echo

# Print lines matching city Delhi
awk -F',' '$3 == "Delhi" {print $1, $3}' demo.csv
echo


echo "======================================="
echo "3. Arithmetic with awk"
echo "======================================="

# Add 5 to age
awk -F',' '{print $1, $2 + 5}' demo.csv
echo

# Calculate sum of ages
awk -F',' 'NR>1 {sum += $2} END {print "Total age:", sum}' demo.csv
echo


echo "======================================="
echo "4. Using awk with pipes"
echo "======================================="

echo "apple 10
banana 20
cherry 30" > fruits.txt

# Print 1st column
cat fruits.txt | awk '{print $1}'
echo

# Print column and multiply 2nd column by 2
awk '{print $1, $2*2}' fruits.txt
echo


echo "======================================="
echo "5. Field separator (-F) & Output separator (OFS)"
echo "======================================="

awk -F',' 'BEGIN{OFS=":"} {print $1,$2,$3}' demo.csv
echo


echo "======================================="
echo "6. NR and NF special variables"
echo "======================================="

# NR = record number (line number)
# NF = number of fields in current line
awk -F',' '{print NR, NF, $0}' demo.csv
echo


echo "======================================="
echo "7. BEGIN and END blocks"
echo "======================================="

awk -F',' 'BEGIN{print "Names and Ages"} {print $1,$2} END{print "Done"}' demo.csv
echo


echo "======================================="
echo "8. Notes / Tips"
echo "======================================="

echo "- $1, $2, ... refer to columns"
echo "- NR = line number, NF = number of fields"
echo "- FS = input field separator (-F) default: space"
echo "- OFS = output field separator"
echo "- BEGIN block runs before processing lines"
echo "- END block runs after processing all lines"
echo "- Powerful for reports, CSV/TSV parsing, calculations, logs"

# Cleanup
rm demo.csv fruits.txt
