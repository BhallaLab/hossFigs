#!/bin/tcsh

mkdir OPT_D3_b2AR_R3_2.0
mkdir OPT_D4_b2AR_R3_2.0
mkdir OPT_D3_b2AR_R3_1.2
mkdir OPT_D4_b2AR_R3_1.2

hoss Config/D3_b2AR_initScram.json -m OPT_D3_b2AR_R2_2.0/topN_000.json --outputDir OPT_D3_b2AR_R3_2.0 --scrambleRange 2.0 > & ! log_D3_b2AR_R3_2.0.txt
hoss Config/D4_b2AR_initScram.json -m OPT_D4_b2AR_R2_2.0/topN_000.g --outputDir OPT_D4_b2AR_R3_2.0 --scrambleRange 2.0 > & ! log_D4_b2AR_R3_2.0.txt
hoss Config/D3_b2AR_initScram.json -m OPT_D3_b2AR_R2_2.0/topN_000.json --outputDir OPT_D3_b2AR_R3_1.2 --scrambleRange 1.2 > & ! log_D3_b2AR_R3_1.2.txt
hoss Config/D4_b2AR_initScram.json -m OPT_D4_b2AR_R2_2.0/topN_000.g --outputDir OPT_D4_b2AR_R3_1.2 --scrambleRange 1.2 > & ! log_D4_b2AR_R3_1.2.txt

mkdir Log_R3
