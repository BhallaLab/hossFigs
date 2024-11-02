##
## plotSuppFig2.py
## This file generates Supp Fig 2 panels A to F.
##
## It is licenced under GPLv3.0 or later
## Copyright (c) Upinder S. Bhalla
##

import os
import findSim
import numpy as np
import pandas
import argparse
import json
import matplotlib.pyplot as plt

def doPlot( expt, model, mapFile, idx ):
    ax = plt.subplot( 5, 6, idx+1 )
    score, elapsedTime, diagnostics = findSim.innerMain( expt,
            modelFile = model,
            mapFile = mapFile,
            solver = "lsoda",
            bigFont = True, labelPos = "upper right", deferPlot = True )
    if diagnostics == {}:
        return False
    if diagnostics["exptType"] == "directparameter":
        return False
    panel = chr( ord('A') + idx // 2 ) + ("i" if idx%2 == 0 else "ii")
    ax.text( -0.10, 1.05, panel, fontsize = 20, weight = "bold", 
        transform=ax.transAxes )
    ax.set_title("")
    plt.title("")
    plt.suptitle("")
    return True

def doScoreHisto( ax ):
    bins = np.array( np.arange( 0, 0.7501, 0.05 ) )
    df = pandas.read_hdf( "model_params.h5" )
    df.head()
    df.tail()
    df.describe()
    #df.columns == ['cell', 'exc', 'numSq', 'pattern', 'initScore', 
    #'finalScore', 'Ca_bind_RR.Kd', 'Ca_bind_RR.tau', 'docking.Kf', 
    # 'vesicle_release.Kf', 'remove.Kf', 'replenish_vesicle.tau', 
    #'vesicle_pool.concInit', 'ligand_binding.tau', 'ligand_binding.Kd'],
    values = df.loc[(df['exc'] == 1) & (df['numSq'] == 5)]['finalScore']
    ax.hist(values, bins=bins, alpha=0.5, histtype = "step", 
            linewidth = 3, color = None, label = "glu-R" )
    values = df.loc[(df['exc'] == 0) & (df['numSq'] == 5)]['finalScore']
    ax.hist(values, bins=bins, alpha=0.5, histtype = "step", 
            linewidth = 3, color = None, label = "GABA-R" )
    ax.set_xlabel('Optimized model score', fontsize = 16)
    ax.set_ylabel('Frequency', fontsize = 16)
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.legend( fontsize = 14, frameon = False )
    ax.text( -0.10, 1.05, "F", fontsize = 22, weight = "bold",
        transform=ax.transAxes )


def iterate_json_files(directory):
  """Iterates through all JSON files in a given directory.

  Args:
    directory: The directory to search for JSON files.

  Yields:
    The path to each JSON file in the directory.
  """

  for root, _, files in os.walk(directory):
    for file in files:
      if file.endswith('.json'):
        yield os.path.join(root, file)

def main():
    fig = plt.figure( figsize = (20, 20), facecolor = "white" )
    #fig.suptitle( dataset )
    isD3 = True
    if isD3:
        origModel = "Models/D3_model_EGFR_v8.json"
        optModel = "Models/D3_EGFR_opt_initScram.json"
        mapFile = "Maps/D3_map_EGFR.json"
        configFile = "Config/D3_EGFR_hoss.json"
    else:
        origModel = "Models/D4_model_EGFR_v14.g"
        optModel = "Models/D4_EGFR_opt_initScram.g"
        mapFile = "Maps/D4_map_EGFR.json"
        configFile = "Config/D4_EGFR_hoss.json"
    exptDir = "EGFR_Expts"
    try:
        with open( configFile ) as json_file:
            config = json.load( json_file )
    except IOError:
        print( "Error: Unable to find HOSS config file: " + configFile )
        quit()

    idx = 0
    for hh in config["HOSS"]:
        for block in hh:
            if not block in ["name", "hierarchyLevel"]:
                for key in hh[block]["expt"]:
                    print( key )
                    if doPlot( exptDir + "/" + key, origModel, mapFile, idx ):
                        doPlot( exptDir + "/" + key, optModel, mapFile, idx+1 )
                        idx += 2
                    if idx > 24:
                        break

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
