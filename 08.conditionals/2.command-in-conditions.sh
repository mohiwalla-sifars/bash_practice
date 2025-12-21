#!/usr/bin/env bash


if echo hi; then
	echo "echo worked"
fi

if cat file.txt; then
	echo "cat worked"
else 
	echo "cat did not work"
fi
