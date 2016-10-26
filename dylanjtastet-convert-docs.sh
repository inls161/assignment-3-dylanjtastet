#! /bin/bash

# Declare input argument as a variable
FILENAME=$1

read -p "New Filename (exclude ext): " NEWNAME
# Convert markdown to HTML
pandoc --smart -o "$NEWNAME.html" "$FILENAME" 
# Convert markdown to DOCX
pandoc --smart -o "$NEWNAME.docx" "$FILENAME" 
# Convert markdown to ODT
pandoc --smart -o "$NEWNAME.odt" "$FILENAME"
# Convert markdown to PDF
pandoc -- smart -o "$NEWNAME.pdf" "$FILENAME"

# Make the command line read "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF
echo "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF"