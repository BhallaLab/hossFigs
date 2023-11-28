#!/bin/tcsh

egrep Final Log*/*.txt > scores.txt

python plotFig5.py
