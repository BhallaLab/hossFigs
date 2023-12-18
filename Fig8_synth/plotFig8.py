import pandas as pd
import re
import numpy as np
import findSim
import simWrap as sw
import dispAllExpts as dae

import matplotlib.pyplot as plt

bar_width = 0.35
space_width = 0.2

optFiles = ["OPT_FLAT/OPTI_000.g", "OPT_HOSS/OPTI_000.g", "OPT_INITSCRAM/topN_000.g", "OPT_HOSSMC/topN_6_000.g" ]
origFile = "Models/D4_model_EGFR_v13b.g"
origOptFile = "Models/top_initScram_realdata.g"

d3File = "Models/topN_003.json"
synthConfigFile = "Config/D4_EGFR_mix_synth_hoss.json"
dataConfigFile = "Config/D4_EGFR_hoss.json"
mapFile = "Maps/D4_map_EGFR.json"
d3mapFile = "Maps/D3_map_EGFR.json"

class Args( ):
    def __init__( self, modelFile, mapFile, configFile ):
        self.model = modelFile
        self.map = mapFile
        self.config = configFile
        self.scoreFunc = "NRMS"
        self.solver = "LSODA"
        self.exptDir = None
        self.hidePlot = True
        self.verbose = False
        self.blocks = []
        self.plot = ""

def computeScores( configFile, modelFile ):
    args = Args( modelFile, "Maps/D4_map_EGFR.json", configFile )
    return dae.innerMain( args )

def plotEGFR( ax ):
    #exptFile = "EGFR_Expts/Saito2004_Fig2C.json"
    #exptFile = "EGFR_Expts/Mukhin2003_Fig9B_inset.json"
    exptFile = "EGFR_Expts/Pinilla-Macua2016_Fig3A_surface.json"
    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            simWrap = "HillTau", ignoreMissingObj = True,
            modelFile = d3File, mapFile = d3mapFile, hidePlot = True )
    ex = ret["exptX"]
    ey = ret["exptY"]
    synthY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = origOptFile, mapFile = mapFile, hidePlot = True )
    origOptY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = optFiles[3], mapFile = mapFile, hidePlot = True )
    newOptY = ret["sim"]

    ax.plot( ex, ey, "o-", label = "Expt", ms = 10 )
    ax.plot( ex, synthY, "o:", label = "Synth", ms = 10 )
    ax.plot( ex, origOptY, "+--", label = "Opt1", ms = 16 )
    ax.plot( ex, newOptY, "+:", label = "Opt2", ms = 16 )

    ax.set_xlabel('Time (s)', fontsize = 16)
    ax.set_ylabel('[L.EGFR] (ratio)', fontsize = 16)
    #ax.set_ylim( 1.0, 3.2 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.legend(loc='lower right', ncol = 1, frameon = False, fontsize = 14)
    ax.text( -0.10, 1.05, "A", fontsize = 22, weight = "bold", transform=ax.transAxes )

def plotSHC( ax ):
    exptFile = "EGFR_Expts/Kholodenko1999_Fig3B.json"
    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            simWrap = "HillTau", ignoreMissingObj = True,
            modelFile = d3File, mapFile = d3mapFile, hidePlot = True )
    ex = ret["exptX"]
    ey = ret["exptY"]
    synthY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = origOptFile, mapFile = mapFile, hidePlot = True )
    origOptY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = optFiles[3], mapFile = mapFile, hidePlot = True )
    newOptY = ret["sim"]

    ax.plot( ex, ey, "o-", label = "Expt" )
    ax.plot( ex, synthY, label = "Synth" )
    ax.plot( ex, origOptY, label = "Opt1" )
    ax.plot( ex, newOptY, label = "Opt2" )

    ax.set_xlabel('Time (s)', fontsize = 16)
    ax.set_ylabel('SHC_p (Fraction of total)', fontsize = 16)
    #ax.set_ylim( 1.0, 3.2 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.legend(loc='upper left', ncol = 4, frameon = False, fontsize = 14)
    ax.text( -0.10, 1.05, "B", fontsize = 22, weight = "bold", transform=ax.transAxes )


def plotRas( ax ):
    exptFile = "EGFR_Expts/ZhouY2010_Fig3D.json"
    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            simWrap = "HillTau", ignoreMissingObj = True,
            modelFile = d3File, mapFile = d3mapFile, hidePlot = True )
    ex = ret["exptX"]
    ey = ret["exptY"]
    synthY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = origOptFile, mapFile = mapFile, hidePlot = True )
    origOptY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = optFiles[3], mapFile = mapFile, hidePlot = True )
    newOptY = ret["sim"]

    ax.plot( ex, ey, "o-", label = "Expt" )
    ax.plot( ex, synthY, label = "Synth" )
    ax.plot( ex, origOptY, label = "Opt1" )
    ax.plot( ex, newOptY, label = "Opt2" )

    ax.set_xlabel('Time (s)', fontsize = 16)
    ax.set_ylabel('Active Ras (ratio)', fontsize = 16)
    #ax.set_ylim( 1.0, 3.2 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.legend(loc='upper left', ncol = 4, frameon = False, fontsize = 14)
    ax.text( -0.10, 1.05, "C", fontsize = 22, weight = "bold", transform=ax.transAxes )

def plotMAPK( ax ):
    #exptFile = "EGFR_Expts/Shah2003_Fig1B_pkScale.json"
    exptFile = "EGFR_Expts/Tucker1993_Fig7_pkScale.json"
    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            simWrap = "HillTau", ignoreMissingObj = True,
            modelFile = d3File, mapFile = d3mapFile, hidePlot = True )
    ex = ret["exptX"]
    ey = ret["exptY"]
    synthY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = origOptFile, mapFile = mapFile, hidePlot = True )
    origOptY = ret["sim"]

    score, elapsedTime, ret = findSim.innerMain( exptFile, 
            ignoreMissingObj = True,
            modelFile = optFiles[3], mapFile = mapFile, hidePlot = True )
    newOptY = ret["sim"]

    ax.plot( ex, ey, "o-", label = "Expt" )
    ax.plot( ex, synthY, label = "Synth" )
    ax.plot( ex, origOptY, label = "Opt1" )
    ax.plot( ex, newOptY, label = "Opt2" )

    ax.set_xlabel('Time (s)', fontsize = 16)
    ax.set_ylabel('MAPK_p (ratio to max)', fontsize = 16)
    #ax.set_ylim( 1.0, 3.2 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.legend(loc='upper left', ncol = 4, frameon = False, fontsize = 14)
    ax.text( -0.10, 1.05, "D", fontsize = 22, weight = "bold", transform=ax.transAxes )


def plotAllScores( ax ):
    # Here we have to scale the flat scoring scheme to match the 
    # hierarchical scoring. To do this we normalize to the initial value.
    # Plotting parameters

    synthInitScore = computeScores( synthConfigFile, origFile )
    realInitScore = computeScores( dataConfigFile, origFile )
    synthExpt2SynthScores = [ computeScores( synthConfigFile, mm ) for mm in optFiles ]
    realExpt2SynthScores = [ computeScores( dataConfigFile, mm ) for mm in optFiles ]
    scoreDict = {"Synthetic": synthExpt2SynthScores, 
            "Real": realExpt2SynthScores }

    categories = [key for key in scoreDict]

    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Initial': 'maroon', 'Flat': 'blue', 'Hoss': 'green', 'initScram': 'red', 'hossMC': 'purple'}  # Colors for each optimization method
    
    # Extracting data for plotting
    xticklabels = []
    
    grouped_positions = np.arange(len(categories) ) * (bar_width * len(colors) + space_width)
    
    for idx, cc in enumerate( categories ):
            xticklabels.append( cc )
            positions = grouped_positions[idx] + np.arange( len(colors) ) * bar_width
    
            initScore = synthInitScore if idx == 0 else realInitScore
            ax.bar(positions[0], initScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['Initial'],
                label='Initial' if idx == 0 else "")
            flatScore = scoreDict[cc][0]
            ax.bar(positions[1], flatScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Flat'],
                label='Flat' if idx == 0 else "")
            hossScore = scoreDict[cc][1]
            ax.bar(positions[2], hossScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Hoss'],
                label='Hoss' if idx == 0 else "")
            initScramScore = scoreDict[cc][2]
            ax.bar(positions[3], initScramScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['initScram'],
                label='initScram' if idx == 0 else "")
            hossMcScore = scoreDict[cc][3]
            ax.bar(positions[4], hossMcScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['hossMC'],
                label='hossMC' if idx == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(categories) - 1) / 2) * (bar_width * len(colors) + space_width))
    ax.set_xticklabels( xticklabels, fontsize = 16 )
    ax.set_ylabel('Optimization score', fontsize = 16)
    ax.set_ylim( 0, 0.65 )
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "E", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Adding legend
    #ax.legend(loc='upper left', title='Optimization Method', frameon = False, fontsize = 14)
    ax.legend(loc='upper left', ncol = 2, frameon = False, fontsize = 14)
    
def main():
    fig, ax = plt.subplots( nrows = 5, ncols=1, figsize = (8, 16) )
    plotEGFR( ax[0] )
    plotSHC( ax[1] )
    plotRas( ax[2] )
    plotMAPK( ax[3] )
    #plotAllScores( ax[4])
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()