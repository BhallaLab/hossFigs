#!/bin/bash

hoss Config/D3_b2AR_initScram.json --algorithm COBYLA --outputDir OPT_D3_b2AR_COBYLA > log_D3_b2AR_COBYLA.txt 2>&1 &
hoss Config/D3_b2AR_initScram.json --algorithm SLSQP --outputDir OPT_D3_b2AR_SLSQP > log_D3_b2AR_SLSQP.txt 2>&1 &
hoss Config/D3_b2AR_initScram.json --algorithm BFGS --outputDir OPT_D3_b2AR_BFGS > log_D3_b2AR_BFGS.txt 2>&1 &

hoss Config/D4_b2AR_initScram.json --algorithm COBYLA --outputDir OPT_D4_b2AR_COBYLA > log_D4_b2AR_COBYLA.txt 2>&1 &
hoss Config/D4_b2AR_initScram.json --algorithm SLSQP --outputDir OPT_D4_b2AR_SLSQP > log_D4_b2AR_SLSQP.txt 2>&1 &
hoss Config/D4_b2AR_initScram.json --algorithm BFGS --outputDir OPT_D4_b2AR_BFGS > log_D4_b2AR_BFGS.txt 2>&1 &

hoss Config/D3_EGFR_initScram.json --algorithm COBYLA --outputDir OPT_D3_EGFR_COBYLA > log_D3_EGFR_COBYLA.txt 2>&1 &
hoss Config/D3_EGFR_initScram.json --algorithm SLSQP --outputDir OPT_D3_EGFR_SLSQP > log_D3_EGFR_SLSQP.txt 2>&1 &
hoss Config/D3_EGFR_initScram.json --algorithm BFGS --outputDir OPT_D3_EGFR_BFGS > log_D3_EGFR_BFGS.txt 2>&1 &

hoss Config/D4_EGFR_initScram.json --algorithm COBYLA --outputDir OPT_D4_EGFR_COBYLA > log_D4_EGFR_COBYLA.txt 2>&1 &
hoss Config/D4_EGFR_initScram.json --algorithm SLSQP --outputDir OPT_D4_EGFR_SLSQP > log_D4_EGFR_SLSQP.txt 2>&1 &
hoss Config/D4_EGFR_initScram.json --algorithm BFGS --outputDir OPT_D4_EGFR_BFGS > log_D4_EGFR_BFGS.txt 2>&1 &
