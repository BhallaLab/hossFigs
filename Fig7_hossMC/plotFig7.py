import pandas as pd
import re
import numpy as np

import matplotlib.pyplot as plt

fname4 = "../Fig4_flat/scores.txt"
fname5 = "../Fig5_hoss/scores.txt"
fname6 = "../Fig6_initScram/scores.txt"
fname7 = "scores.txt"

bar_width = 0.35
space_width = 0.2

def readFig4Data():
    # Initialize lists to store extracted data
    targets = []
    optimization_methods = []
    init_scores = []
    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from each line
    pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:OPT_(D[34])_\w*_\w*\/opt\.\w*: flat: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')

    
    # Read the file line by line and extract information
    with open( fname4, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                d_value, target, method, dval2, init_score, optimized_score, time = match.groups()
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
    
def readFig5Data():
    # Initialize lists to store extracted data
    targets = []
    optimization_methods = []
    init_scores = []
    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from each line
    #pattern1 = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:Level \d+ --- Init Score: (\d+\.\d+)   OptimizedScore (\d+\.\d+)       Time: (\d+\.\d+) s')
    #pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:Final  Score for \d+ levels in (\w+).json = (\d+\.\d+), Time=(\d+\.\d+)s')
    pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:OPT_(D[34])_\w*_\w*\/\w*\.\w*: hoss: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')
    
    # Read the file line by line and extract information
    with open( fname5, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                d_value, target, method, dval2, init_score, optimized_score, time = match.groups()
                d_values.append(d_value)
                targets.append(target)
                optimization_methods.append(method)
                init_scores.append(float(init_score))
                optimized_scores.append(float(optimized_score))
                times.append(float(time))
    
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

def readFig6Data():
    # Initialize lists to store extracted data
    targets = []
    scramRange = []
    init_scores = []
    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from each line
    pattern = re.compile(r'LogScr(\d+\.\d+)/log_(D[34])_(b2AR|EGFR)(.*?)\.txt:Models\/\w*\.\w*: initScramble: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')
    # Read the file line by line and extract information
    with open( fname6, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                sr, d_value, target, sr2, init_score, optimized_score, time = match.groups()
                d_values.append(d_value)
                targets.append(target)
                scramRange.append(sr)
                init_scores.append(float(init_score))
                optimized_scores.append(float(optimized_score))
                times.append(float(time))
    
    # Create a pandas DataFrame from the extracted data
    df = pd.DataFrame({
        'D_Value': d_values,
        'Target': targets,
        'ScramRange': scramRange,
        'Init_Score': init_scores,
        'Optimized_Score': optimized_scores,
        'Time': times
    })
    df_sorted = df.sort_values(by=['D_Value', 'Target'])
    grouped_df = df_sorted.groupby(['D_Value', 'Target']).agg({
        'Init_Score': ['mean', 'std'],
        'Optimized_Score': ['min', 'max'],
        'Time': ['mean', 'std']
    }).reset_index()
    '''
    df_sorted = df.sort_values(by=['D_Value', 'Target', 'ScramRange'])
    grouped_df = df_sorted.groupby(['D_Value', 'Target', 'ScramRange']).agg({
        'Init_Score': ['mean', 'std'],
        'Optimized_Score': ['min', 'max'],
        'Time': ['mean', 'std']
    }).reset_index()
    '''

    # Flatten the multi-level column index
    grouped_df.columns = ['_'.join(col).strip() for col in grouped_df.columns.values]
    grouped_df = grouped_df.drop(['Init_Score_std', 'Optimized_Score_max'], axis=1, errors='ignore')
    return grouped_df
############################################################

def readFig7Data():
    # Initialize lists to store extracted data
    targets = []
    scramRange = []
    init_scores = []
    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from each line
    pattern = re.compile(r'Log(\d+\.\d+)/log_(D[34])_(b2AR|EGFR)(.*?)\.txt:(.*?): hossMC: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')
    #pattern = re.compile(r'LogScr\d*\.\d*/log_(D[34])_(b2AR|EGFR)(\d+\.\d+)\.txt:Models\/\w*.\w*: initScramble: Init Score')
    # Read the file line by line and extract information
    with open( fname7, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                sr, d_value, target, sr2, sr3, init_score, optimized_score, time = match.groups()
                d_values.append(d_value)
                targets.append(target)
                scramRange.append(sr)
                init_scores.append(float(init_score))
                optimized_scores.append(float(optimized_score))
                times.append(float(time))
    
    # Create a pandas DataFrame from the extracted data
    df = pd.DataFrame({
        'D_Value': d_values,
        'Target': targets,
        'ScramRange': scramRange,
        'Init_Score': init_scores,
        'Optimized_Score': optimized_scores,
        'Time': times
    })
    df_sorted = df.sort_values(by=['D_Value', 'Target'])
    grouped_df = df_sorted.groupby(['D_Value', 'Target']).agg({
        'Init_Score': ['mean', 'std'],
        'Optimized_Score': ['min', 'max'],
        'Time': ['mean', 'std']
    }).reset_index()
    '''
    df_sorted = df.sort_values(by=['D_Value', 'Target', 'ScramRange'])
    grouped_df = df_sorted.groupby(['D_Value', 'Target', 'ScramRange']).agg({
        'Init_Score': ['mean', 'std'],
        'Optimized_Score': ['min', 'max'],
        'Time': ['mean', 'std']
    }).reset_index()
    '''

    # Flatten the multi-level column index
    grouped_df.columns = ['_'.join(col).strip() for col in grouped_df.columns.values]
    grouped_df = grouped_df.drop(['Init_Score_std', 'Optimized_Score_max'], axis=1, errors='ignore')
    print( "DF7")
    print( grouped_df )
    return grouped_df

############################################################

def plotAllScores( df4, df5, df6, df7, ax ):
    # Here we have to scale the flat scoring scheme to match the 
    # hierarchical scoring. To do this we normalize to the initial value.
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Initial': 'maroon', 'Flat': 'blue', 'Hoss': 'green', 'initScram': 'red', 'hossMC': 'purple'}  # Colors for each optimization method
    
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
            subset6 = df6[(df6['D_Value_'] == d_value) & (df6['Target_'] == target)]
            subset7 = df7[(df7['D_Value_'] == d_value) & (df7['Target_'] == target)]
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
            initScramScore = subset6["Optimized_Score_min"].values[0]
            ax.bar(positions[3], initScramScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['initScram'],
                label='initScram' if i == 0 and j == 0 else "")
            hossMcScore = subset7["Optimized_Score_min"].values[0]
            ax.bar(positions[4], hossMcScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['hossMC'],
                label='hossMC' if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(colors) + space_width))
    ax.set_xticklabels( xticklabels, fontsize = 16 )
    ax.set_ylabel('Optimization score', fontsize = 16)
    ax.set_ylim( 0, 0.65 )
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "B", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Adding legend
    #ax.legend(loc='upper left', title='Optimization Method', frameon = False, fontsize = 14)
    ax.legend(loc='upper left', ncol = 2, frameon = False, fontsize = 14)
    

def plotWallclockTimes( df4, df5, df6, df7, ax ):
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Flat': 'blue', 'Hoss': 'green', 'initScram': 'red', 'hossMC': 'purple'}  # Colors for each optimization method
    
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
            subset6 = df6[(df6['D_Value_'] == d_value) & (df6['Target_'] == target) ]
            subset7 = df7[(df7['D_Value_'] == d_value) & (df7['Target_'] == target)]
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
            initScramTime = subset6["Time_mean"].values[0]
            initScramTimeStd = subset6["Time_std"].values[0]
            ax.bar(positions[2], initScramTime, bar_width, 
                yerr=initScramTimeStd, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['initScram'],
                label='initScram' if i == 0 and j == 0 else "")
            hossMCTime = subset7["Time_mean"].values[0]
            hossMCTimeStd = subset7["Time_std"].values[0]
            ax.bar(positions[3], hossMCTime, bar_width, 
                yerr=hossMCTimeStd, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['hossMC'],
                label='hossMC' if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(colors) + space_width))
    ax.set_xticklabels( xticklabels, fontsize = 16 )
    ax.set_ylabel('Wallclock Time (s)', fontsize = 16)
    ax.set_yscale( 'log' )
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "C", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Adding legend
    #ax.legend(loc='upper left', title='Optimization Method', frameon = False, fontsize = 14)
    
def plotTotalCpuTimes( df4, df5, df6, df7, ax ):
    numProcesses = 24
    orderOfExpts = [ "D3_EGFR", "D3_b2AR", "D4_EGFR", "D4_b2AR"]
    numFlatExpts = [21, 23, 32, 28]
    numExpts = [2, 3, 5, 4]
    meanNumExpts = [11.5, 7.67, 6.4, 7.0]
    # Plotting parameters
    bar_width = 0.2
    space_width = 0.3  # Adjust as needed
    colors = {'Flat': 'blue', 'Hoss': 'green', 'initScram': 'red', 'hossMC': 'purple'}  # Colors for each optimization method
    
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
            subset6 = df6[(df6['D_Value_'] == d_value) & (df6['Target_'] == target) ]
            subset7 = df7[(df7['D_Value_'] == d_value) & (df7['Target_'] == target)]
            idx = i*len( unique_targets ) + j
            positions = grouped_positions[idx] + np.arange( len(colors) ) * bar_width
    
            flatTime = subset4["Time_mean"].values[0] * numFlatExpts[idx]
            flatTimeStd = subset4["Time_std"].values[0] * numFlatExpts[idx]
            ax.bar(positions[0], flatTime, bar_width, yerr=flatTimeStd,
                align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Flat'],
                label='Flat' if i == 0 and j == 0 else "")
            hossTime = subset5["Time_mean"].values[0] * meanNumExpts[idx]
            hossTimeStd = subset5["Time_std"].values[0] * meanNumExpts[idx]
            ax.bar(positions[1], hossTime, bar_width, yerr=hossTimeStd,
                align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Hoss'],
                label='Hoss' if i == 0 and j == 0 else "")
            initScramTime = subset6["Time_mean"].values[0]*24 * meanNumExpts[idx]
            initScramTimeStd = subset6["Time_std"].values[0]*24
            ax.bar(positions[2], initScramTime, bar_width, 
                yerr=initScramTimeStd, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['initScram'],
                label='initScram' if i == 0 and j == 0 else "")
            hossMCTime = subset7["Time_mean"].values[0]*24 * meanNumExpts[idx]
            hossMCTimeStd = subset7["Time_std"].values[0]*24 * meanNumExpts[idx]
            ax.bar(positions[3], hossMCTime, bar_width, 
                yerr=hossMCTimeStd, align='center', 
                alpha=0.7, ecolor='black', capsize=5, 
                color=colors['hossMC'],
                label='hossMC' if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(colors) + space_width))
    ax.set_xticklabels( xticklabels, fontsize = 16 )
    ax.set_ylabel('Total CPU Time (s)', fontsize = 16)
    ax.set_yscale( 'log' )
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "D", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
    # Not Adding legend. We've already done it.
    #ax.legend(loc='upper left', title='Optimization Method', frameon = False)
    

def main():
    df4 = readFig4Data()
    df5 = readFig5Data()
    df6 = readFig6Data()
    df7 = readFig7Data()
    fig, ax = plt.subplots( nrows = 3, ncols=1, figsize = (10, 9) )
    plotAllScores(df4, df5, df6, df7, ax[0])
    plotWallclockTimes(df4, df5, df6, df7, ax[1])
    plotTotalCpuTimes(df4, df5, df6, df7, ax[2])
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
