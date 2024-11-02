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

def doPlot( expt, model, mapFile, idx, ret ):
    ax = plt.subplot( 5, 6, idx+1 )
    score, elapsedTime, diagnostics = findSim.innerMain( expt,
            modelFile = model,
            mapFile = mapFile,
            solver = "lsoda",
            bigFont = True, labelPos = "upper right", deferPlot = True )
    if diagnostics == {}:
        print( "Empty diagnostics for ", expt )
        return False
    if diagnostics["exptType"] == "directparameter":
        ret.append( [expt, score, "direct"] )
        return False
    panel = chr( ord('A') + idx // 2 ) + ("i" if idx%2 == 0 else "ii")
    ret.append( [expt, score, panel] )
    ax.text( -0.20, 1.05, panel, fontsize = 20, weight = "bold", 
        transform=ax.transAxes )
    scorestr = "Score: {:.3f}".format( score )
    ax.text( 0.2, 1.05, scorestr, fontsize = 14, transform=ax.transAxes )
    ax.set_title("")
    if idx > 0:
        ax.get_legend().remove()
    plt.title("")
    plt.suptitle("")
    return True

def main():
    fig = plt.figure( figsize = (20, 20), facecolor = "white" )
    isD3 = False
    if isD3:
        origModel = "Models/D3_model_b2AR_v6.json"
        optModel = "Models/D3_b2AR_opt_initScram.json"
        mapFile = "Maps/D3_map_b2AR.json"
        configFile = "Config/D3_b2AR_hoss.json"
    else:
        origModel = "Models/D4_model_b2AR_v6.g"
        optModel = "Models/D4_b2AR_opt_initScram.g"
        mapFile = "Maps/D4_map_b2AR.json"
        configFile = "Config/D4_b2AR_hoss.json"
    exptDir = "b2AR_Expts"
    try:
        with open( configFile ) as json_file:
            config = json.load( json_file )
    except IOError:
        print( "Error: Unable to find HOSS config file: " + configFile )
        quit()

    idx = 0
    orig = []
    opt = []
    for hh in config["HOSS"]:
        for block in hh:
            if not block in ["name", "hierarchyLevel"]:
                for key in hh[block]["expt"]:
                    print( key )
                    doPlot( exptDir + "/" + key, origModel, mapFile, idx, orig )
                    if doPlot( exptDir + "/" + key, optModel, mapFile, idx+1, opt ):
                        idx += 2
                    if idx > 24:
                        break

    print()
    print( len( orig ), len( opt ) )
    for xx, yy in zip( orig, opt ):
        exptName = xx[0][len( exptDir )+1:]
        print( "{:40} {:.3f} {:.3f} {}".format(exptName, xx[1], yy[1], xx[2]) )

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
