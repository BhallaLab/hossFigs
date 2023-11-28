#!/bin/tcsh

egrep Init Log*/*.txt > scores.txt

python plotFig4.py
