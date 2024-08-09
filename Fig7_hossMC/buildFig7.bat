#!/bin/tcsh

egrep "Final =" ../Fig6_initScram/LogScr5.0/*.txt > scores6.txt
egrep "Final =" ../Fig6_initScram/LogScr2.0/*.txt >> scores6.txt
egrep "Final =" ../Fig6_initScram/LogScr1.2/*.txt >> scores6.txt

egrep "Final =" R1/log*.txt > scores.txt
egrep "Final =" R2/log*.txt >> scores.txt
egrep "Final =" R3/log*.txt >> scores.txt

python plotFig7.py
