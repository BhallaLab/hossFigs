#!/bin/tcsh
exptSynth -m Models/topN_003.json -a -d Synth_EGFR_Expts
exptSynth -sr egf 5e-8 10e-6 1000 -r intEGFR aSHC aSos aRas acraf1 aMAPK -d Synth_EGFR_Expts -m Models/topN_003.json
exptSynth -sr aMAPK 0 0.36e-3 600 -r aSos aRas acraf1 -d Synth_EGFR_Expts -m Models/topN_003.json -b aSHC 0.4e-3

hoss Config/D4_EGFR_synth_flat.json > & ! log_flat.txt
hoss Config/D4_EGFR_synth_hoss.json > & ! log_hoss.txt
hoss Config/D4_EGFR_synth_initScram.json > & ! log_initScram.txt
hoss Config/D4_EGFR_synth_hossMC.json > & ! log_hossMC.txt

