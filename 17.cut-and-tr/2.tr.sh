#!/usr/bin/env bash

echo "======================================="
echo "2. tr command - Basic Usage"
echo "======================================="

# tr translates or deletes characters from input

echo "Original text:"
echo "Hello World 123"
echo

# Convert lowercase to uppercase
echo "Uppercase:"
echo "Hello World 123" | tr 'a-z' 'A-Z'
echo

# Convert uppercase to lowercase
echo "Lowercase:"
echo "Hello World 123" | tr 'A-Z' 'a-z'
echo

# Delete characters (example: delete digits)
echo "Delete digits:"
echo "Hello World 123" | tr -d '0-9'
echo

# Squeeze repeated characters
echo "Squeeze repeated spaces:"
echo "A   B   C" | tr -s ' '
echo

# Replace spaces with newlines
echo "Replace spaces with newlines:"
echo "apple banana cherry" | tr ' ' '\n'
echo


echo "======================================="
echo "3. Combining cut and tr"
echo "======================================="

# Example: extract names from CSV and convert to lowercase
cut -d',' -f1 demo.csv | tr 'A-Z' 'a-z'
echo


echo "======================================="
echo "4. Notes / Tips"
echo "======================================="

echo "- cut:"
echo "  * -d specifies delimiter (default: TAB)"
echo "  * -f specifies field numbers"
echo "  * -c specifies character positions"
echo
echo "- tr:"
echo "  * translates, deletes (-d), squeezes (-s) characters"
echo "  * works with stdin only (cannot take file as argument)"
echo "  * common for case conversion, whitespace normalization"
echo
echo "- cut + tr together are very powerful in pipelines"

# Cleanup
rm demo.csv
