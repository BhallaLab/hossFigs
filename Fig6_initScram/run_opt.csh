#!/bin/tcsh

hoss Config/D3_b2AR_initScram.json > & ! log_D3_b2AR.txt
hoss Config/D4_b2AR_initScram.json > & ! log_D4_b2AR.txt
hoss Config/D3_EGFR_initScram.json > & ! log_D3_EGFR.txt
hoss Config/D4_EGFR_initScram.json > & ! log_D4_EGFR.txt
