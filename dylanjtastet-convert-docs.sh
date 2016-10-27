#! /bin/bash

# Declare input argument as a variable
FILENAME=$1
read -p "New Filename (exclude ext): " NEWNAME
# Convert markdown to HTML. -s Gives the html headers so it can be deployed as a webpage
pandoc --css=gridlines.css --smart -s -o "$NEWNAME.html" "$FILENAME"  # doesn't change anything # && pandoc --smart -V geometry:margin=1in -o "$NEWNAME-better.pdf" "$NEWNAME.html"
# Convert markdown to DOCX
pandoc --smart -o "$NEWNAME.docx" "$FILENAME" 
# Convert markdown to ODT
pandoc --smart -o "$NEWNAME.odt" "$FILENAME"
# Convert markdown to PDF. Specify 1in margins.
pandoc --smart -V geometry:margin=1in -o "$NEWNAME.pdf" "$FILENAME"

# Make the command line read "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF
echo "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF"