#!/bin/bash
# make pdf, clean mess, make html, transform html
# please note that /dev/null is used for linux to disregard log files
# repeats for each language
# activate venv for current build
source .venv/bin/activate

# english (en)
# english exceptionalism, sorry
latexmk -pdf -outdir=pdfs -silent pghrt;
latexmk -c -outdir=pdfs -silent pghrt;
latexmlc --destination=export/index.html --log=/nul pghrt;
python soup.py en;
