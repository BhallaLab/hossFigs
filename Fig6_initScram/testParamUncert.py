import pandas as pd
import seaborn as sns
import os
import re
import numpy as np
import matplotlib.pyplot as plt
import scramParam
import simdiff

def plotParamUncertainty( location, mapfile, ax ):
    scramRange = location.split('_')[-1]
    # Iterate over each file
    suffix = "json" if mapfile[6] == "3" else "g"
    #optFiles = [ location + "/OPTI_{:03d}.{}".format(ii, suffix ) for ii in range(200) ]
    #rowNames = [ "OPTI_{:03d}".format(ii) for ii in range(10) ]
    scrams = []
    pds = []
    goodFiles = []
    for idx in range( 200 ):
        modelfile = location + "/OPTI_{:03d}.{}".format(idx, suffix )
        if os.path.exists( modelfile ):
            scr = simdiff.Scram( modelfile, mapfile )
            scrams.append( scr )
            pds.append( scr.getParamDict()[0] )
            scr.model.clear()
            goodFiles.append( idx )

    with open( location + "/sortedResults.txt", "r" ) as file:
        content = file.read()
    lines = content.split( '\n')
    scores = {}
    for line in lines:
        if len( line ) == 0:
            continue
        numbers = line.split()
        scores[int(numbers[0])] = float( numbers[1] )
    assert( len( scores ) == len( pds ) )

    matrix = []
    for idx, fileIdx in enumerate( goodFiles ):
        row = list(pds[idx].values())
        row.append( fileIdx )
        row.append( scores[fileIdx] )
        matrix.append( row )

    colNames = list(pds[0].keys())
    colNames.append( "fileIdx" )
    colNames.append( "score" )
    df = pd.DataFrame( matrix, columns = colNames )
    #print( "SHAPE = ", df.shape )
    #print( df )

    optimal = min( scores.values() )
    worst = max( scores.values() )
    
    dfSorted = df.sort_values( by = 'score' )
    dfSorted.drop( columns = ["fileIdx", "score"], inplace = True )
    #cutoffScore = (9*optimal + worst)/10
    #dfFiltered = dfSorted[dfSorted['score'] < cutoffScore]
    dfFiltered = dfSorted.iloc[:len( dfSorted )// 4]
    print( "Num within cutoff = ", len( dfFiltered ) )
    optimalParams = dfSorted.iloc[0:10].mean()
    paramUncertainty = ( dfFiltered.max()-dfFiltered.min() )/optimalParams
    pu = paramUncertainty
    #print(pu) 
    #print("Mean = ", pu.mean(), "    Std Dev = ", pu.std())

    ratio = dfFiltered/optimalParams
    #print( "SH = ", dfFiltered.shape, optimalParams.shape, ratio.shape, dfFiltered.iloc[0,0], optimalParams.iloc[0], ratio.iloc[0,0] )
    flat = ratio.values.flatten()
    print("File={}, Mean={:.3f}, std={:.3f}, mean of norm param = {:.3f}, std={:.3f}".format( location, pu.mean(),pu.std(), np.mean( flat ), np.std( flat )) )
    #plt.hist(ratio.values.flatten(), bins=40, linewidth = 2, color = None, histtype ='step' )
    bins = np.logspace(np.log10(min(flat)), np.log10(max(flat)), 40)
    ax.hist( flat, bins = bins, alpha = 0.5, label = "Range="+scramRange, histtype = "step", linewidth = 2, color = None )
    ax.set_xscale( 'log' )
    ax.set_title('Frequency Histogram')
    ax.set_xlabel('Parameter normalized to mean', fontsize = 16)
    ax.xaxis.set_tick_params(labelsize=14)
    ax.set_ylabel('Frequency', fontsize = 16)
    ax.yaxis.set_tick_params(labelsize=14)
    
def main():
    fig, ax = plt.subplots( nrows = 2, ncols = 1, figsize = (6,8 ) )
    plt.rcParams.update({'font.size': 16})
    plotParamUncertainty( "OPT_D3_b2AR_R4_1.2", "Maps/D3_map_b2AR.json", ax[0] )
    plotParamUncertainty( "OPT_D3_b2AR_R4_2.0", "Maps/D3_map_b2AR.json", ax[0] )
    plotParamUncertainty( "OPT_D3_b2AR_R4_5.0", "Maps/D3_map_b2AR.json", ax[0] )
    ax[0].set_xlim( 1e-4, 1e2)
    ax[0].legend( loc = 'upper left', frameon = False )
    plotParamUncertainty( "OPT_D4_b2AR_R4_1.2", "Maps/D4_map_b2AR.json", ax[1] )
    plotParamUncertainty( "OPT_D4_b2AR_R4_2.0", "Maps/D4_map_b2AR.json", ax[1] )
    plotParamUncertainty( "OPT_D4_b2AR_R4_5.0", "Maps/D4_map_b2AR.json", ax[1] )
    ax[1].legend( loc = 'upper left', frameon = False )
    ax[1].set_xlim( 1e-4, 1e2)
    plt.tight_layout( pad = 1.0 )
    plt.show()

if __name__ == "__main__":
    main()
