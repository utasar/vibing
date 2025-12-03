#!/bin/bash

# Assemble the LC-3 programs
echo "Assembling LC-3 programs..."
f_lc3 -c main.asm -c trap.asm -c input.asm -c output.asm

SCRIPT_FILE="./lc3sim_script.txt"

# Check if the script file is created and writable
echo "Creating lc3sim script file at $SCRIPT_FILE..."

cat <<EOF > "$SCRIPT_FILE"
file trap.obj
dump x0040 x0042
file input.obj
file output.obj
file main.obj
c
EOF

if [ -f "$SCRIPT_FILE" ]; then
    echo "Script file created successfully. Running lc3sim..."

    lc3sim -s "$SCRIPT_FILE"
else
    echo "Error: Unable to create script file. Please check file permissions and paths."
fi

f_lc3 --clean -r
