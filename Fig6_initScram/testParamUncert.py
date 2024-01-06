import pandas as pd
import seaborn as sns
import os
import re
import numpy as np
import matplotlib.pyplot as plt
import scramParam
import simdiff

def plotParamUncertainty( location, mapfile ):
    # Iterate over each file
    #sns.set(font_scale=1.4)
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
    cutoffScore = (9*optimal + worst)/10
    dfFiltered = dfSorted[dfSorted['score'] < cutoffScore]
    print( "Num within cutoff = ", len( dfFiltered ) )
    optimalParams = dfSorted.iloc[0:10,:-1].mean()
    paramUncertainty = ( dfFiltered.max()-dfFiltered.min() )/optimalParams
    pu = paramUncertainty.iloc[:-1]
    print(pu) 
    print("Mean = ", pu.mean(), "    Std Dev = ", pu.std())
    
def main():
    plotParamUncertainty( "OPT_D3_b2AR_R4_2.0", "Maps/D3_map_b2AR.json" )
    plotParamUncertainty( "OPT_D4_b2AR_R4_2.0", "Maps/D4_map_b2AR.json" )

if __name__ == "__main__":
    main()
