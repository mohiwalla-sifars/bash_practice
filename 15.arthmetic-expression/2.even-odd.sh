#!/usr/bin/env bash


a=9
b=10

echo "a: $a"
echo "b: $b"

if (($a%2)); then
	echo "a is odd"
else
	echo "a is even"
fi

if (($b%2)); then
	echo "b is odd"
else
	echo "b is even"
fi



