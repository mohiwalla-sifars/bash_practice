#!/usr/bin/env bash

s='dave eddy'

echo s: $s
echo "same string: $s"
echo "same string: ${s}"
echo "length of string: ${#s}"
echo "capitalize string: ${s^}"
echo "upper case string: ${s^^}"
echo "only d in case string: ${s^^d}"
echo "invalid upper case d, a: ${s^^da}"
echo "valid upper case d, a: ${s^^[da]}"
echo "=================="
s2="DAVE EDDY"
echo s2: $s2
echo "lowercase string2: ${s2,,}"
echo "lowercase only first character: ${s2,}"
echo "lowercase only d first character: ${s2,D}"
echo "invalid lowercase d,a only first character: ${s2,DA}"
echo "valid lowercase d,a only first character: ${s2,,[DA]}"
