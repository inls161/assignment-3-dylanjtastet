#! /bin/bash
# test for verbose option. If statements before each command will print additional information.
if getopts "v" FLAG ; then
FILENAME=$2
else
FILENAME=$1
fi
# Declare input argument as a variable
read -p "New Filename (exclude ext): " NEWNAME
# Convert markdown to HTML. -s Gives the html headers so it can be deployed as a webpage
if [ $FLAG = "v" ]; then
echo "Converting $FILENAME to $NEWNAME.html"
fi
pandoc --css=gridlines.css --smart -s -o "$NEWNAME.html" "$FILENAME"  # doesn't change anything # && pandoc --smart -V geometry:margin=1in -o "$NEWNAME-better.pdf" "$NEWNAME.html"
# Convert markdown to DOCX
if [ $FLAG = "v" ]; then
echo "Converting $FILENAME to $NEWNAME.docx"
fi
pandoc --smart -o "$NEWNAME.docx" "$FILENAME" 
# Convert markdown to ODT
if [ $FLAG = "v" ]; then
echo "Converting $FILENAME to $NEWNAME.odt"
fi
pandoc --smart -o "$NEWNAME.odt" "$FILENAME"
# Convert markdown to PDF. Specify 1in margins.
if [ $FLAG = "v" ]; then
echo "Converting $FILENAME to $NEWNAME.pdf"
fi
pandoc --smart -V geometry:margin=1in -o "$NEWNAME.pdf" "$FILENAME"

# Make the command line read "Converted INPUT-FILENAME to HTML, DOCX, ODT, PDF
echo "Converted $FILENAME to HTML, DOCX, ODT, PDF"