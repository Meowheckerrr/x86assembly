# check if the user provide an args 
if [ -z "$1" ]; then
	echo "Usage $0 <filename>"
	exit 1
fi 

FILE="$1"

# Create directory if it doesn't exist
mkdir -p $FILE

# Move source file into the directory (correcting the command)
cp $FILE.asm ./$FILE/ || { echo "Error: Could not move $FILE.asm"; exit 1; }

cd ./$FILE

# Assemble with NASM
nasm -f elf32 $FILE.asm -o $FILE.o || { echo "Error: NASM assembly failed"; exit 1; }

# Link with ld
gcc -m32 $FILE.o -o $FILE || { echo "Error: GCC link failed"; exit 1; }

./$FILE