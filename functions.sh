#!/bin/bash

# Function to print a greeting
greet() {
    echo "👋 Hello, $1! Welcome to Bash scripting."
}

# Function to add two numbers
add() {
    echo "🧮 Sum: $(($1 + $2))"
}

# Calling functions
greet "DevOps Engineer"
add 10 20
