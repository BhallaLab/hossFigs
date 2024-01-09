# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street, Fifth
# Floor, Boston, MA 02110-1301, USA.
# 
# 

import simdiff
import hoss
import json
import os
import numpy as np
import matplotlib.pyplot as plt

HOSS_SCHEMA = "hossSchema.json"

def countParamsInPathway( configFile ):
    config = loadConfig( "Config/" + configFile )
    pathwayList = []
    hossParams = 0
    for block in config["HOSS"]:
        for pathway in block:
            if not pathway in ["name", "hierarchyLevel" ]:
                numExpts = len( block[pathway]["expt"] )
                numParams = len( block[pathway]["params"] )
                pathwayList.append( [pathway, numExpts, numParams] )
                hossParams += numParams

    return pathwayList, hossParams


def countParamsInModel( modelFile, mapFile ):
    scram = simdiff.Scram( "Models/" + modelFile, "Maps/" + mapFile )
    numAllParams = len( scram.getParamDict()[0] )
    scram.model.clear()
    return numAllParams

# Load in the HOSS config file
# Use it to count # of experiments, possibly # of params if direct param
# Use it to separate subsets of model for counting tweaked params.
# Use it to count params that are going to be tweaked
# Use the expt files to count inputs?

# Load the model files into simdiff.
# Use it to calculate actual # of params.
# Do a linear scaling on # of params in each subset, based on this.
# Plot according to # of subsets in hoss file.

def loadConfig( configFile ):
    # Load and validate the config file
    try:
        with open( configFile ) as json_file:
            config = json.load( json_file )
    except IOError:
        print( "Error: Unable to find HOSS config file: " + configFile )
        quit()
    return config

def plotPanel( label, pl0, pl1, ax, loc ):
    # pl0 and pl1 are arrays of [pathway, numExpt, numParams]
    allparams = pl0 + pl1
    allparams = sorted( allparams, key = lambda pp: pp[1], reverse = True )
    x = np.arange(len(allparams))  # the label locations
    width = 0.25  # the width of the bars
    multiplier = 0
    pathways = [pp[0] for pp in allparams ]
    numExpts = [pp[1] for pp in allparams ]
    numParams = [pp[2] for pp in allparams ]

    label0 = "Parameters" if multiplier == 0 else ""
    label1 = "Experiments" if multiplier == 0 else ""
    offset = width * multiplier
    rects = ax.bar(x + offset, numParams, width, label=label0)
    #ax.bar_label(rects, padding=3)
    multiplier += 1
    offset = width * multiplier
    rects = ax.bar(x + offset, numExpts, width, label=label1)
    #ax.bar_label(rects, padding=3)
    multiplier += 1

    ax.set_xticks( x + width, pathways, rotation = 60 )
    ax.legend(loc=loc, fontsize = 14, frameon = False )
    #ax.set_xlabel( "", fontsize = 16 )
    ax.set_ylabel( "# Parameters; # Experiments", fontsize = 16 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, label, fontsize = 22, weight = "bold", transform=ax.transAxes )

def plotExpt( label, exptFiles, ax, exptdir ):
    quantityScale = {"M": 1e9, "uM": 1e3, "nM": 1.0}
    for ee in exptFiles:
        name = ee.split( "_" )[0]
        ee = exptdir + ee + ".json"
        try:
            with open( ee ) as json_file:
                expt = json.load( json_file )
        except IOError:
            print( "Error: Unable to find findSim expt file: " + ee )
            quit()
        data = np.array( expt["Readouts"]["data"] )
        if expt["Experiment"]["design"] == "DoseResponse":
            xscale = quantityScale[expt["Stimuli"][0]["quantityUnits"]]
            x = data[:,0] * xscale
            ax.set_xlabel("[cAMP] (nM)", fontsize = 16 )
            ax.set_ylabel( "PKA activation (ratio)", fontsize = 16 )
            ax.set_xscale('log')
            loc = "upper left"
        else:
            x = data[:,0] - data[0,0]
            ax.set_xlabel( "Time (s)", fontsize = 16 )
            ax.set_ylabel( "EGFR activation (ratio)", fontsize = 16 )
            loc = "center right"
        y = data[:,1]/max( data[:,1] )
        ax.plot( x, y, "*-", label = name )


    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.legend(loc=loc, fontsize = 14, frameon = False )
    ax.text( -0.10, 1.05, label, fontsize = 22, weight = "bold", transform=ax.transAxes )


def main():
    files = [
        ["D3_b2AR_hoss.json", "D3_model_b2AR_v5.json", "D3_map_b2AR.json"],
        ["D3_EGFR_hoss.json", "D3_model_MAPK_v7.json", "D3_map_EGFR.json"],
        ["D4_b2AR_hoss.json", "b2AR_PKA_v5.g", "D4_map_b2AR.json"],
        ["D4_EGFR_hoss.json", "D4_model_EGFR_v13b.g", "D4_map_EGFR.json"]
    ]

    pl2 = []
    for configFile, modelFile, mapFile in files:
        pathwayList, hossParams = countParamsInPathway( configFile )
        totalParams = countParamsInModel( modelFile, mapFile )
        # Scale # of params according to total computed from model file.
        # This is needed because the hoss config may not tweak all params.
        for pp in pathwayList:
            pp[2] *= totalParams / hossParams
        pl2.append( pathwayList )

    fig, ax = plt.subplots( nrows = 2, ncols=2, figsize = (10, 10) )
    plotPanel( "A", pl2[0], pl2[1], ax[0][0], 'upper right' )
    plotPanel( "B", pl2[2], pl2[3], ax[0][1], 'upper right' )
    exptFiles = ["Mukhin2003_Fig9B_inset", "Saito2004_Fig2C", "Kholodenko1999_Fig2B_slow" ]
    plotExpt( "C", exptFiles, ax[1][0], "EGFR_Expts/" )
    exptFiles = ["Solberg1994_Fig7", "Wolter2011_Fig2A", "Hasler1992_Fig4C"]
    plotExpt( "D", exptFiles, ax[1][1], "b2AR_Expts/" )
    plt.tight_layout( pad = 1.0 )
    plt.show()

#######################################################################
# Run the 'main' if this script is executed standalone.
if __name__ == '__main__':
    main()

