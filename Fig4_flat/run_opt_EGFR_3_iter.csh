#!/bin/tcsh

hoss Config/D3_EGFR_flat.json --algorithm COBYLA --outputDir OPT_D3_EGFR_COBYLA > & ! log_D3_EGFR_COBYLA.txt
cp OPT_D3_EGFR_COBYLA/OPTI_000.json OPT_D3_EGFR_COBYLA/opt_round1.json
hoss Config/D3_EGFR_flat.json --algorithm COBYLA --model OPT_D3_EGFR_COBYLA/opt_round1.json --outputDir OPT_D3_EGFR_COBYLA >> & ! log_D3_EGFR_COBYLA.txt
cp OPT_D3_EGFR_COBYLA/OPTI_000.json OPT_D3_EGFR_COBYLA/opt_round2.json
hoss Config/D3_EGFR_flat.json --algorithm COBYLA --model OPT_D3_EGFR_COBYLA/opt_round2.json --outputDir OPT_D3_EGFR_COBYLA >> & ! log_D3_EGFR_COBYLA.txt
cp OPT_D3_EGFR_COBYLA/OPTI_000.json OPT_D3_EGFR_COBYLA/opt_round3.json

hoss Config/D4_EGFR_flat.json --algorithm COBYLA --outputDir OPT_D4_EGFR_COBYLA > & ! log_D4_EGFR_COBYLA.txt
cp OPT_D4_EGFR_COBYLA/OPTI_000.g OPT_D4_EGFR_COBYLA/opt_round1.g
hoss Config/D4_EGFR_flat.json --algorithm COBYLA --model OPT_D4_EGFR_COBYLA/opt_round1.g --outputDir OPT_D4_EGFR_COBYLA >> & ! log_D4_EGFR_COBYLA.txt
cp OPT_D4_EGFR_COBYLA/OPTI_000.g OPT_D4_EGFR_COBYLA/opt_round2.g
hoss Config/D4_EGFR_flat.json --algorithm COBYLA --model OPT_D4_EGFR_COBYLA/opt_round2.g --outputDir OPT_D4_EGFR_COBYLA >> & ! log_D4_EGFR_COBYLA.txt
cp OPT_D4_EGFR_COBYLA/OPTI_000.g OPT_D4_EGFR_COBYLA/opt_round3.g

