#!/bin/tcsh

egrep "Final =" Log2.0/*.txt > scores.txt
egrep "Final =" Log1.2/*.txt >> scores.txt

python plotFig7.py
