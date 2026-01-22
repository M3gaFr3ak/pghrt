#!/bin/bash
# make pdf, clean mess, make html, transform html
# please note that /dev/null is used for linux to disregard log files
# repeats for each language
# activate venv for current build
source .venv/bin/activate

# english (en)
# english exceptionalism, sorry
latexmk -pdf -outdir=pdfs -silent pghrt
latexmk -c -outdir=pdfs -silent pghrt
latexmlc --destination=export/index.html --log=/dev/null pghrt
python soup.py en

# currently supported non-english languages
# german,
languages="de"

# all other languages
for lc in $languages; do
    latexmk -pdf -outdir=pdfs -silent trans/$lc/$lc
    latexmk -c -outdir=pdfs -silent trans/$lc/$lc
    latexmlc --destination=export/$lc.html --log=/dev/null trans/$lc/$lc
    python soup.py $lc
done
