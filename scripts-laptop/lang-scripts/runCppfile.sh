#!/bin/bash

# Check if filename is provided
if [ -z "$1" ]; then
	echo "Error: Please provide a filename as an argument."
	exit 1
fi

# Extract filename and lowercase extension
set filename "${1%.*}"
set extension "${1##*.}"
set extension $(tr [A-Z] [a-z] <<<"$extension") # Lowercase extension

# Compile and run based on extension
case "$extension" in
cpp)
	compiler="g++"
	outfile="$filename"
	flags="-Wall" # Add additional flags as needed
	;;
c)
	compiler="gcc"
	outfile="$filename"
	flags="-Wall" # Add additional flags as needed
	;;
java)
	compiler="javac"
	outfile="$filename.class"
	;;
go)
	compiler="go"
	outfile="" # No separate output file for Go
	;;
python)
	compiler="python"
	outfile="" # No separate compilation step for Python
	;;
rust)
	compiler="rustc"
	outfile="$filename"
	;;
*)
	echo "Error: Unsupported file extension: $extension"
	exit 1
	;;
esac

# Compile the source code (if applicable)
if [ "$compiler" != "python" ]; then
	"$compiler" "$1" -o "$outfile" $flags
	if [ $? -ne 0 ]; then
		echo "Error: Compilation failed."
		exit 1
	fi
fi

# Run the program
if [ "$outfile" ]; then
	# Executable for compiled languages
	./"$outfile"
else
	# Script for Python
	"$compiler" "$1"
fi

echo "Compilation and execution successful!"
