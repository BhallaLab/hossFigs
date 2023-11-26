#!/bin/tcsh

initScram Config/D3_b2AR_initScram.json > & ! log_D3_b2AR.txt
initScram Config/D4_b2AR_initScram.json > & ! log_D4_b2AR.txt
initScram Config/D3_EGFR_initScram.json > & ! log_D3_EGFR.txt
initScram Config/D4_EGFR_initScram.json > & ! log_D4_EGFR.txt
