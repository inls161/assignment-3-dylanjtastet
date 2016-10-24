#! /bin/bash

# Declare input argument as a variable
FILENAME=$1

read -p "New Filename (exclude ext): " NEWNAME
# Convert markdown to HTML
pandoc -o "$NEWNAME.html" "$FILENAME" 
# Convert markdown to DOCX
pandoc -o "$NEWNAME.docx" "$FILENAME" 
# Convert markdown to ODT
pandoc -o "$NEWNAME.odt" "$FILENAME"
# Convert markdown to PDF
pandoc -o "$NEWNAME.pdf" "$FILENAME"

# Make the command line read "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF
echo "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF"