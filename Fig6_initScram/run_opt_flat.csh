#!/bin/tcsh

hoss Config/D3_b2AR_initScram.json --method "initScramFlat" --outputDir "OPT_D3_b2AR_flat" --numProcesses 8 > & ! log_D3_b2AR_flat.txt
hoss Config/D4_b2AR_initScram.json --method "initScramFlat" --outputDir "OPT_D4_b2AR_flat" --numProcesses 8 > & ! log_D4_b2AR_flat.txt
hoss Config/D3_EGFR_initScram.json --method "initScramFlat" --outputDir "OPT_D3_EGFR_flat" --numProcesses 8 > & ! log_D3_EGFR_flat.txt
hoss Config/D4_EGFR_initScram.json --method "initScramFlat" --outputDir "OPT_D4_EGFR_flat" --numProcesses 8 > & ! log_D4_EGFR_flat.txt
