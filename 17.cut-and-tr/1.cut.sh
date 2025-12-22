#!/usr/bin/env bash


echo "======================================="
echo "1. cut command - Basic Usage"
echo "======================================="

# cut extracts sections from lines of a file or input
echo -e "name,age,city\nAlice,25,Delhi\nBob,30,Mumbai" > demo.csv

echo "Original CSV:"
cat demo.csv
echo

# Extract 1st column (fields separated by comma)
echo "Cut: First column (names):"
cut -d',' -f1 demo.csv
echo

# Extract multiple columns
echo "Cut: Name and City:"
cut -d',' -f1,3 demo.csv
echo

echo "Cut: age and City:"
cut -d',' -f2,3 demo.csv
echo

# Cut characters (instead of fields)
echo "Cut: First 4 characters of each line:"
cut -c1-4 demo.csv
echo

