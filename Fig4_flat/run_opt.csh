#!/bin/tcsh

hoss Config/D3_b2AR_flat.json --algorithm COBYLA --outputDir OPT_D3_b2AR_COBYLA > & ! log_D3_b2AR_COBYLA.txt
hoss Config/D3_b2AR_flat.json --algorithm SLSQP --outputDir OPT_D3_b2AR_SLSQP > & ! log_D3_b2AR_SLSQP.txt
hoss Config/D3_b2AR_flat.json --algorithm BFGS --outputDir OPT_D3_b2AR_BFGS > & ! log_D3_b2AR_BFGS.txt

hoss Config/D4_b2AR_flat.json --algorithm COBYLA --outputDir OPT_D4_b2AR_COBYLA > & ! log_D4_b2AR_COBYLA.txt
hoss Config/D4_b2AR_flat.json --algorithm SLSQP --outputDir OPT_D4_b2AR_SLSQP > & ! log_D4_b2AR_SLSQP.txt
hoss Config/D4_b2AR_flat.json --algorithm BFGS --outputDir OPT_D4_b2AR_BFGS > & ! log_D4_b2AR_BFGS.txt

hoss Config/D3_EGFR_flat.json --algorithm COBYLA --outputDir OPT_D3_EGFR_COBYLA > & ! log_D3_EGFR_COBYLA.txt
hoss Config/D3_EGFR_flat.json --algorithm SLSQP --outputDir OPT_D3_EGFR_SLSQP > & ! log_D3_EGFR_SLSQP.txt
hoss Config/D3_EGFR_flat.json --algorithm BFGS --outputDir OPT_D3_EGFR_BFGS > & ! log_D3_EGFR_BFGS.txt

hoss Config/D4_EGFR_flat.json --algorithm COBYLA --outputDir OPT_D4_EGFR_COBYLA > & ! log_D4_EGFR_COBYLA.txt
hoss Config/D4_EGFR_flat.json --algorithm SLSQP --outputDir OPT_D4_EGFR_SLSQP > & ! log_D4_EGFR_SLSQP.txt
hoss Config/D4_EGFR_flat.json --algorithm BFGS --outputDir OPT_D4_EGFR_BFGS > & ! log_D4_EGFR_BFGS.txt
