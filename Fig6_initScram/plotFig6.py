import pandas as pd
import seaborn as sns
import os
import re
import numpy as np
import matplotlib.pyplot as plt
import scramParam
import simdiff

resultDirTail = ["_1.2", "", "_5.0"]

'''
sortedResults = [
        "OPT_D3_b2AR_1.2/sortedResults.txt",
        "OPT_D3_b2AR_5.0/sortedResults.txt",
        "OPT_D3_b2AR/sortedResults.txt",
        "OPT_D3_EGFR_1.2/sortedResults.txt",
        "OPT_D3_EGFR_5.0/sortedResults.txt",
        "OPT_D3_EGFR/sortedResults.txt",
        "OPT_D4_b2AR_1.2/sortedResults.txt",
        "OPT_D4_b2AR_5.0/sortedResults.txt",
        "OPT_D4_b2AR/sortedResults.txt",
        "OPT_D4_EGFR_1.2/sortedResults.txt",
        "OPT_D4_EGFR_5.0/sortedResults.txt",
        "OPT_D4_EGFR/sortedResults.txt"
    ]
'''
fname6 = "scores.txt"

bar_width = 0.35
space_width = 0.2

def plotScramParam( ax, scr = [1.2, 2.0, 5.0] ):
    numSamples = 20000
    label = "B"
    for ss in scr:
        log = np.log( ss )
        # This is the log-lin scramble form
        #y = np.exp( np.random.uniform( -log, log, numSamples ) )
        # 
        # This is the logNormScramble form
        y = np.exp( np.random.normal(0.0, log, numSamples ) )
        bins = np.logspace(np.log10(min(y)), np.log10(max(y)), 40)
        ax.hist( y, bins = bins, alpha = 0.5, label = str(ss), histtype = "step", linewidth = 2, color = None )
    ax.set_xlabel( 'Parameter scaling', fontsize = 16 )
    ax.set_xscale( 'log' )
    ax.set_ylabel( 'Frequency', fontsize = 16 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, label, fontsize = 22, weight = "bold", 
            transform=ax.transAxes )
    ax.legend( title = "Scramble range", frameon = False, fontsize = 14)

def plotResultHistos( ax, location, label ):
    # Iterate over each file
    sortedResults = [ location + tt + "/sortedResults.txt" for tt in resultDirTail ]
    scrambleRange = ["1.2", "2.0", "5.0"]
    
    for file_name, scr in zip(sortedResults, scrambleRange):
        try:
            # Read the second entry from each line and store in a list
            values = []
            with open(file_name, 'r') as file:
                for line in file:
                    entry = line.strip().split()[1]
                    values.append(float(entry))
    
            # Create a histogram for each file
            ax.hist(values, bins=20, alpha=0.5, label=scr, histtype = "step", linewidth = 3, color = None )
        except FileNotFoundError:
            print(f"File {file_name} not found.")
        except Exception as e:
            print(f"Error reading {file_name}: {e}")
    
    # Set labels and title
    ax.set_xlabel('Optimized model cost', fontsize = 16)
    ax.set_ylabel('Frequency', fontsize = 16)
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, label, fontsize = 22, weight = "bold", 
            transform=ax.transAxes )
    
    # Add legend
    ax.legend( title = "Scramble range", frameon = False, fontsize = 14)
    

def plotParamProximity( ax, location, mapfile, label ):
    # Iterate over each file
    sns.set(font_scale=1.4)
    suffix = "json" if mapfile[6] == "3" else "g"
    topN = [ location + "/topN_{:03d}.{}".format(ii, suffix ) for ii in range(10) ]
    rowNames = [ "topN_{:03d}".format(ii) for ii in range(10) ]
    scrams = []
    pds = []
    for modelfile in topN:
        scr = simdiff.Scram( modelfile, mapfile )
        scrams.append( scr )
        pds.append( scr.getParamDict()[0] )
        if modelfile != topN[-1]:
            scr.model.clear()

    matrix = []
    for p1 in pds:
        row = [ scrams[-1].compare( p1, p2 )[0] for p2 in pds ]
        matrix.append( row )
    df = pd.DataFrame( matrix, index = rowNames, columns = rowNames )
    #clustergrid = sns.clustermap(df, cmap='coolwarm', ax=ax)
    clustergrid = sns.clustermap(df, cmap='magma', figsize=(7, 6), annot_kws={"fontsize": 26})
    # Adjust the position of the colorbar if needed
    #clustergrid.ax_col_dendrogram.set_position([0.95, 0.1, 0.02, 0.6])
    # Set labels and title for the main axis
    #ax.set_xlabel('X Label')
    #ax.set_ylabel('Y Label')
    #ax.set_title('Clustermap Embedded in Matplotlib Axis')
    #ax.text( -0.10, 1.05, label, fontsize = 22, weight = "bold", 
    #        transform=ax.transAxes )
    

def readFig6Data():
    # Initialize lists to store extracted data
    targets = []
    optimization_methods = []
    init_scores = []
    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from scores line
    #pattern = re.compile(r'LogScr(\d+\.\d+)/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:OPT_(D[34])_\w*_\w*\/opt\.\w*: flat: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')
    pattern = re.compile(r'log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:OPT_(D[34])_\w*_\w*\/opt\.\w*: flat: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')

    
    # Read the file line by line and extract information
    with open( fname6, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                scr, d_value, target, method, dval2, init_score, optimized_score, time = match.groups()
                targets.append(target)
                optimization_methods.append(method)
                init_scores.append(float(init_score))
                optimized_scores.append(float(optimized_score))
                times.append(float(time))
                d_values.append(d_value)
    
    # Create a pandas DataFrame from the extracted data
    df = pd.DataFrame({
        'D_Value': d_values,
        'Target': targets,
        'Optimization_Method': optimization_methods,
        'Init_Score': init_scores,
        'Optimized_Score': optimized_scores,
        'Time': times
    })
    df_sorted = df.sort_values(by=['D_Value', 'Target', 'Optimization_Method'])
    grouped_df = df_sorted.groupby(['D_Value', 'Target', 'Optimization_Method']).agg({
        'Init_Score': ['mean', 'std'],
        'Optimized_Score': ['mean', 'std'],
        'Time': ['mean', 'std']
    }).reset_index()

    # Flatten the multi-level column index
    grouped_df.columns = ['_'.join(col).strip() for col in grouped_df.columns.values]
    grouped_df = grouped_df.drop(['Init_Score_std', 'Optimized_Score_std'], axis=1, errors='ignore')
    return grouped_df


############################################################

def plotScore( df, ax ):
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Initial': 'maroon', 'BFGS': 'blue', 'COBYLA': 'orange', 'SLSQP': 'green'}  # Colors for each optimization method
    
    # Extracting data for plotting
    unique_d_values = df['D_Value_'].unique()
    unique_targets = df['Target_'].unique()
    unique_methods = df['Optimization_Method_'].unique()
    xticklabels = []
    
    grouped_positions = np.arange(len(unique_d_values) * (len(unique_targets) ) ) * (bar_width * len(unique_methods) + space_width)
    
    for i, d_value in enumerate(unique_d_values):
        for j, target in enumerate(unique_targets):
            xticklabels.append( d_value + "_" + target )
            subset = df[(df['D_Value_'] == d_value) & (df['Target_'] == target)]
            positions = grouped_positions[i*len( unique_d_values ) + j] + np.arange( len(unique_methods)+1 ) * bar_width
    
            initScore = subset["Init_Score_mean"]
            initScore = initScore.values[0]
            ax.bar(positions[0], initScore, bar_width, align='center', alpha=0.7, 
                ecolor='black', capsize=5, color=colors['Initial'], label='Initial' if i == 0 and j == 0 else "")
            for k, method in enumerate(unique_methods):
                method_subset = subset[subset['Optimization_Method_'] == method]
                ax.bar(positions[k+1], method_subset['Optimized_Score_mean'], bar_width,
                       align='center', alpha=0.7, ecolor='black', capsize=5, color=colors[method], label=method if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(unique_methods) + space_width))
    #ax.set_xticklabels([f"{d}_{t}" for d, t in zip(unique_d_values, unique_targets)])
    ax.set_xticklabels( xticklabels )
    #ax.set_xlabel('')
    ax.set_ylabel('Optimization cost (low is better)')
    #ax.set_yscale( 'log' )
    ax.set_title('Optimization cost')
    ax.text( -0.10, 1.05, "C", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Adding legend
    #ax.legend(loc='upper left', bbox_to_anchor=(1, 1), title='Optimization Method')
    ax.legend(loc='upper left', title='Optimization Method', frameon = False)
    
    # Show the plot
    
def plotTime( df, ax ):
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'BFGS': 'blue', 'COBYLA': 'orange', 'SLSQP': 'green'}  # Colors for each optimization method
    
    # Extracting data for plotting
    unique_d_values = df['D_Value_'].unique()
    unique_targets = df['Target_'].unique()
    unique_methods = df['Optimization_Method_'].unique()
    xticklabels = []
    
    grouped_positions = np.arange(len(unique_d_values) * (len(unique_targets) ) ) * (bar_width * len(unique_methods) + space_width)
    
    for i, d_value in enumerate(unique_d_values):
        for j, target in enumerate(unique_targets):
            xticklabels.append( d_value + "_" + target )
            subset = df[(df['D_Value_'] == d_value) & (df['Target_'] == target)]
            positions = grouped_positions[i*len( unique_d_values ) + j] + np.arange( len(unique_methods ) ) * bar_width
    
            for k, method in enumerate(unique_methods):
                method_subset = subset[subset['Optimization_Method_'] == method]
                ax.bar(positions[k], method_subset['Time_mean'], bar_width, yerr=method_subset['Time_std'],
                       align='center', alpha=0.7, ecolor='black', capsize=5, color=colors[method], label=method if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(unique_methods) + space_width))
    #ax.set_xticklabels([f"{d}_{t}" for d, t in zip(unique_d_values, unique_targets)])
    ax.set_xticklabels( xticklabels )
    #ax.set_xlabel('')
    ax.set_ylabel('Time Mean (s)')
    ax.set_yscale( 'log' )
    ax.text( -0.10, 1.05, "D", fontsize = 22, weight = "bold", transform=ax.transAxes )
    ax.set_title('Wallclock time (s)')
    
    # Adding legend
    ax.legend(loc='upper left', title='Optimization Method', frameon = False)


def plotHossVsFlatScore( df4, df5, ax ):
    # Here we have to scale the flat scoring scheme to match the 
    # hierarchical scoring. To do this we normalize to the initial value.
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Initial': 'maroon', 'Flat': 'blue', 'Hoss': 'green'}  # Colors for each optimization method
    
    # Extracting data for plotting
    unique_d_values = df4['D_Value_'].unique()
    unique_targets = df4['Target_'].unique()
    xticklabels = []
    
    grouped_positions = np.arange(len(unique_d_values) * (len(unique_targets) ) ) * (bar_width * len(colors) + space_width)
    
    for i, d_value in enumerate(unique_d_values):
        for j, target in enumerate(unique_targets):
            xticklabels.append( d_value + "_" + target )
            subset4 = df4[(df4['D_Value_'] == d_value) & (df4['Target_'] == target) & (df4['Optimization_Method_'] == "COBYLA")]
            subset5 = df5[(df5['D_Value_'] == d_value) & (df5['Target_'] == target) & (df5['Optimization_Method_'] == "COBYLA")]
            positions = grouped_positions[i*len( unique_d_values ) + j] + np.arange( len(colors) ) * bar_width
    
            initScore4 = subset4["Init_Score_mean"].values[0]
            initScore5 = subset5["Init_Score_mean"].values[0]
            ax.bar(positions[0], initScore5, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Initial'],
                label='Initial' if i == 0 and j == 0 else "")
            flatScore = subset4["Optimized_Score_mean"].values[0] * initScore5 / initScore4
            ax.bar(positions[1], flatScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Flat'],
                label='Flat' if i == 0 and j == 0 else "")
            hossScore = subset5["Optimized_Score_mean"].values[0]
            ax.bar(positions[2], hossScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Hoss'],
                label='Hoss' if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(colors) + space_width))
    #ax.set_xticklabels([f"{d}_{t}" for d, t in zip(unique_d_values, unique_targets)])
    ax.set_xticklabels( xticklabels )
    #ax.set_xlabel('')
    ax.set_ylabel('Optimization cost (low is better)')
    #ax.set_yscale( 'log' )
    ax.set_title('Optimization cost')
    ax.text( -0.10, 1.05, "E", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Adding legend
    #ax.legend(loc='upper left', bbox_to_anchor=(1, 1), title='Optimization Method')
    ax.legend(loc='upper left', title='Optimization Method', frameon = False)
    

def plotHossVsFlatTime( df4, df5, ax ):
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Flat': 'blue', 'Hoss': 'green'}  # Colors for each optimization method
    
    # Extracting data for plotting
    unique_d_values = df4['D_Value_'].unique()
    unique_targets = df4['Target_'].unique()
    xticklabels = []
    
    grouped_positions = np.arange(len(unique_d_values) * (len(unique_targets) ) ) * (bar_width * len(colors) + space_width)
    
    for i, d_value in enumerate(unique_d_values):
        for j, target in enumerate(unique_targets):
            xticklabels.append( d_value + "_" + target )
            subset4 = df4[(df4['D_Value_'] == d_value) & (df4['Target_'] == target) & (df4['Optimization_Method_'] == "COBYLA")]
            subset5 = df5[(df5['D_Value_'] == d_value) & (df5['Target_'] == target) & (df5['Optimization_Method_'] == "COBYLA")]
            positions = grouped_positions[i*len( unique_d_values ) + j] + np.arange( len(colors) ) * bar_width
    
            flatTime = subset4["Time_mean"].values[0]
            flatTimeStd = subset4["Time_std"].values[0]
            ax.bar(positions[0], flatTime, bar_width, yerr=flatTimeStd,
                align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Flat'],
                label='Flat' if i == 0 and j == 0 else "")
            hossTime = subset5["Time_mean"].values[0]
            hossTimeStd = subset5["Time_std"].values[0]
            ax.bar(positions[1], hossTime, bar_width, yerr=hossTimeStd,
                align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Hoss'],
                label='Hoss' if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(colors) + space_width))
    #ax.set_xticklabels([f"{d}_{t}" for d, t in zip(unique_d_values, unique_targets)])
    ax.set_xticklabels( xticklabels )
    ax.set_ylabel('Optimization Time (s)')
    #ax.set_yscale( 'log' )
    ax.set_title('Wallclock Time')
    ax.text( -0.10, 1.05, "F", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Adding legend
    ax.legend(loc='upper left', title='Optimization Method', frameon = False)

def readBestScore( logFileList ):
    r0Score = -1
    iterScore = []
    for logset in logFileList:
        optScore = []
        initScore = []
        for fname in logset:
            with open(fname, 'r') as file:
                lines = file.read().splitlines()
                lastLine = lines[-1]
                pattern = re.compile('(.*?): initScramble: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')
                match = pattern.search( lastLine )
                if match:
                    front, initScore, optimizedScore, time = match.groups()
                else:
                    print( "Error: no match for fname ", fname, ", Line: ", lastLine )
                    quit()
                    
            if r0Score == -1:
                r0Score = float(initScore)
            optScore.append( float(optimizedScore) )
        iterScore.append( min( optScore ) )
    iterScore.insert( 0, r0Score )
    return iterScore

def plotIteratedScore( ax ):
    R1D3Logs = [ "LogScr1.2/log_D3_b2AR1.2.txt", 
            "LogScr2.0/log_D3_b2AR.txt", 
            "LogScr5.0/log_D3_b2AR5.0.txt"]
    R2D3Logs = ["Log_R2/log_D3_b2AR_R2_2.0.txt", 
            "Log_R2/log_D3_b2AR_R2_5.0.txt"]
    R3D3Logs = ["Log_R3/log_D3_b2AR_R3_1.2.txt", 
            "Log_R3/log_D3_b2AR_R3_2.0.txt"]
    R1D4Logs = [ "LogScr1.2/log_D4_b2AR1.2.txt", 
            "LogScr2.0/log_D4_b2AR.txt", 
            "LogScr5.0/log_D4_b2AR5.0.txt"]
    R2D4Logs = ["Log_R2/log_D4_b2AR_R2_2.0.txt", 
            "Log_R2/log_D4_b2AR_R2_5.0.txt"]
    R3D4Logs = ["Log_R3/log_D4_b2AR_R3_1.2.txt", 
            "Log_R3/log_D4_b2AR_R3_2.0.txt"]

    d3scores = readBestScore( [R1D3Logs, R2D3Logs, R3D3Logs] ) 
    d4scores = readBestScore( [R1D4Logs, R2D4Logs, R3D4Logs] ) 
    ax.plot( range( len(d3scores) ), d3scores, "*-", label = "D3_b2AR" )
    ax.plot( range( len(d4scores) ), d4scores, "*-", label = "D4_b2AR" )
    ax.set_xlabel('# Times through optimization', fontsize = 16)
    ax.set_ylabel('Cost', fontsize = 16)
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.set_ylim(0, 0.5)
    ax.text( -0.10, 1.05, "C", fontsize = 22, weight = "bold", transform=ax.transAxes )
    ax.legend(loc='upper right', title='Model', frameon = False, fontsize = 14 )



def estimateDiff( scramRange, origModel, mapfile ):
    numScramble = 10
    suffix = os.path.splitext( origModel )[-1]
    scramFileName = "SCRAM/scram{}".format( suffix )
    scramParam.generateScrambled( "Models/"+origModel, "Maps/"+mapfile, 
            scramFileName, numScramble, None, scramRange )
    scramFiles = [ "SCRAM/scram_{:03d}{}".format( idx, suffix ) for idx in range( numScramble )]

    paramDicts = []
    for idx in range( numScramble ):
        scramFileName = "SCRAM/scram_{:03d}{}".format( idx, suffix )
        scr = simdiff.Scram( scramFileName, "Maps/"+mapfile )
        paramDicts.append( scr.getParamDict()[0] )
        if idx != numScramble - 1:
            scr.model.clear()

    means = []
    for p1 in paramDicts:
        row = np.array( [ scr.compare( p1, p2 )[0] for p2 in paramDicts ] )
        means.append( np.mean( row[row > 0.0] ) )
    scr.model.clear()

    for ff in scramFiles:
        os.remove( ff )

    print( ".", end = "", flush = True )
    return( np.mean( means ) )

def plotModelDifferenceVsScramRange( ax ):
    models = ["D3_model_b2AR_v6.json", "D3_model_EGFR_v8.json",
            "D4_model_b2AR_v6.g", "D4_model_EGFR_v14.g"]
    maps = ["D3_map_b2AR.json", "D3_map_EGFR.json",
            "D4_map_b2AR.json", "D4_map_EGFR.json"]

    for mod, mmap in zip( models, maps ):
        x = []
        y = []
        for scramRange in [1.05, 1.1, 1.2, 1.5, 2.0, 2.5, 3.0, 4.0, 5.0, 10.0]:
            diff = estimateDiff( scramRange, mod, mmap )
            x.append( scramRange )
            y.append( diff )
            #print( mmap, scramRange, diff )
        ax.plot( x, y, label = mmap )

    ax.set_xlabel( "Scramble Range", fontsize = 16 )
    ax.set_ylabel( "Model difference (NRMS)", fontsize = 16 )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "F", fontsize = 22, weight = "bold", transform=ax.transAxes )
    ax.legend( loc = 'lower right', frameon = False )


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
    # Get rid of 'isBuffered' field because it is a bool and not optimized
    colNames.append( "fileIdx" )
    colNames.append( "score" )
    dropThis = [ nn for nn in colNames if "isBuffered" in nn ]
    df = pd.DataFrame( matrix, columns = colNames )
    df.drop( columns = dropThis, inplace = True )
    #print( "SHAPE = ", df.shape )
    #print( df )

    optimal = min( scores.values() )
    worst = max( scores.values() )
    
    dfSorted = df.sort_values( by = 'score' )
    dfSorted.drop( columns = ["fileIdx", "score"], inplace = True )
    #cutoffScore = (9*optimal + worst)/10
    #dfFiltered = dfSorted[dfSorted['score'] < cutoffScore]
    dfFiltered = dfSorted.iloc[:len( dfSorted )// 4]
    print( "Num within cutoff = ", len( dfFiltered ), dfFiltered.shape )
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
    ax.hist( flat, bins = bins, alpha = 0.5, label = scramRange, histtype = "step", linewidth = 2, color = None )
    ax.set_xscale( 'log' )
    ax.set_xlabel('Parameter normalized to mean', fontsize = 16)
    ax.xaxis.set_tick_params(labelsize=14)
    ax.set_ylabel('Frequency', fontsize = 16)
    ax.yaxis.set_tick_params(labelsize=14)

def main():
    fig, ax = plt.subplots( nrows = 4, ncols=2, figsize = (14, 20.5) )
    # setting font sizeto 30
    plt.rcParams.update({'font.size': 16})
    plotScramParam( ax[0][0] )
    plotIteratedScore( ax[0][1] )
    plotResultHistos( ax[1][0], "OPT_D3_b2AR", "D" )
    plotResultHistos( ax[1][1], "OPT_D4_b2AR", "E" )
    plotModelDifferenceVsScramRange( ax[2][0] )
    ax[2][1].set_axis_off()

    plotParamUncertainty( "OPT_D3_b2AR_1.2", "Maps/D3_map_b2AR.json", ax[3][0] )
    plotParamUncertainty( "OPT_D3_b2AR_2.0", "Maps/D3_map_b2AR.json", ax[3][0] )
    plotParamUncertainty( "OPT_D3_b2AR_5.0", "Maps/D3_map_b2AR.json", ax[3][0] )
    ax[3][0].text( -0.10, 1.05, "H", fontsize = 22, weight = "bold", 
            transform=ax[3][0].transAxes )
    ax[3][0].set_xlim( 1e-4, 1e2)
    ax[3][0].legend( title = "Scramble range", loc = 'upper left', frameon = False )
    plotParamUncertainty( "OPT_D4_b2AR_1.2", "Maps/D4_map_b2AR.json", ax[3][1] )
    plotParamUncertainty( "OPT_D4_b2AR_2.0", "Maps/D4_map_b2AR.json", ax[3][1] )
    plotParamUncertainty( "OPT_D4_b2AR_5.0", "Maps/D4_map_b2AR.json", ax[3][1] )
    ax[3][1].text( -0.10, 1.05, "I", fontsize = 22, weight = "bold", 
            transform=ax[3][1].transAxes )
    ax[3][1].legend( title = "Scramble range", loc = 'upper left', frameon = False )
    ax[3][1].set_xlim( 1e-4, 1e2)

    plt.tight_layout( pad = 1.0 )






    plotParamProximity( ax[0], "OPT_D3_b2AR", "Maps/D3_map_b2AR.json", "E" )
    plotParamProximity( ax[1], "OPT_D4_b2AR", "Maps/D4_map_b2AR.json", "F" )
    plt.show()

if __name__ == "__main__":
    main()







