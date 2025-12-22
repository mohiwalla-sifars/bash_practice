#!/usr/bin/env bash

declare -A hosts=(
    [hp]="192.168.1.50"
    [dell]="192.168.1.60"
    [nas]="192.168.1.100"
)

echo "${hosts[hp]}"

