#!/bin/tcsh

hoss Config/D3_b2AR_initScram.json --outputDir OPT_D3_b2AR_1.2 --scrambleRange 1.2 > & ! log_D3_b2AR1.2.txt
hoss Config/D4_b2AR_initScram.json --outputDir OPT_D4_b2AR_1.2 --scrambleRange 1.2 > & ! log_D4_b2AR1.2.txt
hoss Config/D3_EGFR_initScram.json --outputDir OPT_D3_EGFR_1.2 --scrambleRange 1.2 > & ! log_D3_EGFR1.2.txt
hoss Config/D4_EGFR_initScram.json --outputDir OPT_D4_EGFR_1.2 --scrambleRange 1.2 > & ! log_D4_EGFR1.2.txt
hoss Config/D3_b2AR_initScram.json --outputDir OPT_D3_b2AR_5.0 --scrambleRange 5.0 > & ! log_D3_b2AR5.0.txt
hoss Config/D4_b2AR_initScram.json --outputDir OPT_D4_b2AR_5.0 --scrambleRange 5.0 > & ! log_D4_b2AR5.0.txt
hoss Config/D3_EGFR_initScram.json --outputDir OPT_D3_EGFR_5.0 --scrambleRange 5.0 > & ! log_D3_EGFR5.0.txt
hoss Config/D4_EGFR_initScram.json --outputDir OPT_D4_EGFR_5.0 --scrambleRange 5.0 > & ! log_D4_EGFR5.0.txt
