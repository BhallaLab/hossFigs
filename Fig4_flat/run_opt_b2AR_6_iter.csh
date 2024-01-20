#!/bin/tcsh

hoss Config/D3_b2AR_flat.json --algorithm COBYLA --model OPT_D3_b2AR_COBYLA/opt_round3.json --outputDir OPT_D3_b2AR_COBYLA >> & ! log_D3_b2AR_COBYLA.txt
cp OPT_D3_b2AR_COBYLA/OPTI_000.json OPT_D3_b2AR_COBYLA/opt_round4.json
hoss Config/D3_b2AR_flat.json --algorithm COBYLA --model OPT_D3_b2AR_COBYLA/opt_round4.json --outputDir OPT_D3_b2AR_COBYLA >> & ! log_D3_b2AR_COBYLA.txt
cp OPT_D3_b2AR_COBYLA/OPTI_000.json OPT_D3_b2AR_COBYLA/opt_round5.json
hoss Config/D3_b2AR_flat.json --algorithm COBYLA --model OPT_D3_b2AR_COBYLA/opt_round5.json --outputDir OPT_D3_b2AR_COBYLA >> & ! log_D3_b2AR_COBYLA.txt
cp OPT_D3_b2AR_COBYLA/OPTI_000.json OPT_D3_b2AR_COBYLA/opt_round6.json

hoss Config/D4_b2AR_flat.json --algorithm COBYLA --model OPT_D4_b2AR_COBYLA/opt_round3.g --outputDir OPT_D4_b2AR_COBYLA >> & ! log_D4_b2AR_COBYLA.txt
cp OPT_D4_b2AR_COBYLA/OPTI_000.g OPT_D4_b2AR_COBYLA/opt_round4.g
hoss Config/D4_b2AR_flat.json --algorithm COBYLA --model OPT_D4_b2AR_COBYLA/opt_round4.g --outputDir OPT_D4_b2AR_COBYLA >> & ! log_D4_b2AR_COBYLA.txt
cp OPT_D4_b2AR_COBYLA/OPTI_000.g OPT_D4_b2AR_COBYLA/opt_round5.g
hoss Config/D4_b2AR_flat.json --algorithm COBYLA --model OPT_D4_b2AR_COBYLA/opt_round5.g --outputDir OPT_D4_b2AR_COBYLA >> & ! log_D4_b2AR_COBYLA.txt
cp OPT_D4_b2AR_COBYLA/OPTI_000.g OPT_D4_b2AR_COBYLA/opt_round6.g

