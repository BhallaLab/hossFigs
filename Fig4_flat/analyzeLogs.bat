#!/bin/tcsh

egrep flat Log*/*.txt > scores.txt

python plotFig4.py
