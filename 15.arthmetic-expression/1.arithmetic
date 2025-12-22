#!/usr/bin/env bash

# ==========================================
# Bash Arithmetic Expressions - Notes
# ==========================================
# Bash supports integer arithmetic using:
# 1. $(( expression ))
# 2. (( expression ))
# 3. let command
#
# NOTE:
# - Bash arithmetic works ONLY with integers
# - Floating point math requires external tools (bc, awk)
# ==========================================


# ------------------------------------------
# 1. Variable Declaration
# ------------------------------------------
a=2
b=3

echo "a = $a"
echo "b = $b"
echo


# ------------------------------------------
# 2. Basic Arithmetic Operations
# ------------------------------------------
sum=$((a + b))      # Addition
sub=$((b - a))      # Subtraction
prod=$((a * b))     # Multiplication
div=$((b / a))      # Division (integer division)
mod=$((b % a))      # Modulus (remainder)
power=$((a ** 2))   # Exponentiation

echo "Addition (a + b)        = $sum"
echo "Subtraction (b - a)     = $sub"
echo "Multiplication (a * b)  = $prod"
echo "Division (b / a)        = $div"
echo "Modulus (b % a)         = $mod"
echo "Power (a ** 2)          = $power"
echo


# ------------------------------------------
# 3. Increment & Decrement
# ------------------------------------------
i=0

((i++))    # Post-increment
echo "Post-increment i++  => $i"

((++i))    # Pre-increment
echo "Pre-increment ++i  => $i"

((i--))    # Post-decrement
echo "Post-decrement i-- => $i"

((--i))    # Pre-decrement
echo "Pre-decrement --i => $i"
echo


# ------------------------------------------
# 4. Using (( )) without $
# ------------------------------------------
# (( )) can be used for arithmetic without assignment output

x=5
y=10

((result = x + y))
echo "Result using (( )) : $result"
echo


# ------------------------------------------
# 5. Arithmetic in Conditions
# ------------------------------------------
if (( a < b )); then
  echo "a is less than b"
fi

if (( b > a )); then
  echo "b is greater than a"
fi
echo


# ------------------------------------------
# 6. let Command (older style)
# ------------------------------------------
let c=a+b
let d=b-a

echo "Using let: c = $c"
echo "Using let: d = $d"
echo


# ------------------------------------------
# 7. Common Mistakes
# ------------------------------------------
# ❌ This will NOT work (treated as string)
# sum="a + b"

# ❌ Floating point not supported
# result=$((5 / 2))  # Outputs 2, not 2.5

echo "Integer division example (5 / 2) = $((5 / 2))"
echo


# ------------------------------------------
# 8. Floating Point (using bc)
# ------------------------------------------
# Requires: sudo pacman -S bc

float_result=$(echo "scale=2; 5 / 2" | bc)
echo "Floating point division (5 / 2) = $float_result"
echo


# ------------------------------------------
# 9. Arithmetic Expansion inside echo
# ------------------------------------------
echo "Inline arithmetic: a + b = $((a + b))"
echo "Inline arithmetic: a * b = $((a * b))"
echo


# ------------------------------------------
# 10. Summary
# ------------------------------------------
echo "Summary:"
echo "- Use (( )) or \$(( )) for integer math"
echo "- Bash does NOT support floats natively"
echo "- Use bc for decimal calculations"
echo "- (( )) is preferr

