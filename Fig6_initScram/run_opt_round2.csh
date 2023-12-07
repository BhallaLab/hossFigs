#!/bin/tcsh

mkdir OPT_D3_b2AR_R2_2.0
mkdir OPT_D4_b2AR_R2_2.0
mkdir OPT_D3_b2AR_R2_5.0
mkdir OPT_D4_b2AR_R2_5.0

hoss Config/D3_b2AR_initScram.json -m OPT_D3_b2AR_5.0/topN_000.json --outputDir OPT_D3_b2AR_R2_2.0 --scrambleRange 2.0 > & ! log_D3_b2AR_R2_2.0.txt
hoss Config/D4_b2AR_initScram.json -m OPT_D4_b2AR_5.0/topN_000.g --outputDir OPT_D4_b2AR_R2_2.0 --scrambleRange 2.0 > & ! log_D4_b2AR_R2_2.0.txt
hoss Config/D3_b2AR_initScram.json -m OPT_D3_b2AR_5.0/topN_000.json --outputDir OPT_D3_b2AR_R2_5.0 --scrambleRange 5.0 > & ! log_D3_b2AR_R2_5.0.txt
hoss Config/D4_b2AR_initScram.json -m OPT_D4_b2AR_5.0/topN_000.g --outputDir OPT_D4_b2AR_R2_5.0 --scrambleRange 5.0 > & ! log_D4_b2AR_R2_5.0.txt

mkdir Log_R2
