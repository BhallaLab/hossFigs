import pandas as pd
import re
import numpy as np

import matplotlib.pyplot as plt

fname4 = "../Fig4_flat/scores.txt"
fname5 = "scores.txt"

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
    pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:Level \d+ --- Init Score: (\d+\.\d+)   OptimizedScore (\d+\.\d+)       Time: (\d+\.\d+) s')
    
    # Read the file line by line and extract information
    with open( fname4, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                d_value, target, method, init_score, optimized_score, time = match.groups()
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
    #init_scores = []
    # From the scores obtained in the flat run.
    init_scores = [ 0.356,0.250,0.326,0.458,0.356,0.250,0.326,0.458,0.356,0.250,0.326,0.458 ]
    init_scores2 = []
    for ii in init_scores:
        init_scores2.extend( [ ii, ii, ii ] )

    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from each line
    #pattern1 = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:Level \d+ --- Init Score: (\d+\.\d+)   OptimizedScore (\d+\.\d+)       Time: (\d+\.\d+) s')
    #pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:Final  Score for \d+ levels in (\w+).json = (\d+\.\d+), Time=(\d+\.\d+)s')
    pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:Final Score for \d+ levels in (\w+)/\w*.\w* = (\d+\.\d+), Time=(\d+\.\d+)s')
    
    # Read the file line by line and extract information
    with open( fname5, 'r') as file:
        for line in file:
            match = pattern.search(line)
            if match:
                d_value, target, method, fx, optimized_score, time = match.groups()
                d_values.append(d_value)
                targets.append(target)
                optimization_methods.append(method)
                optimized_scores.append(float(optimized_score))
                times.append(float(time))
    
    # Create a pandas DataFrame from the extracted data
    df = pd.DataFrame({
        'D_Value': d_values,
        'Target': targets,
        'Optimization_Method': optimization_methods,
        'Init_Score': init_scores2,
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
    ax.set_ylabel('Optimization score (low is better)')
    #ax.set_yscale( 'log' )
    ax.set_title('Optimization score')
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
    
            initScore = subset4["Init_Score_mean"]
            initScore = initScore.values[0]
            ax.bar(positions[0], initScore, bar_width, align='center', 
                alpha=0.7, ecolor='black', capsize=5, color=colors['Initial'],
                label='Initial' if i == 0 and j == 0 else "")
            flatScore = subset4["Optimized_Score_mean"].values[0]
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
    ax.set_ylabel('Optimization score (low is better)')
    #ax.set_yscale( 'log' )
    ax.set_title('Optimization score')
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
    

def main():
    df5 = readFig5Data()
    df4 = readFig4Data()
    fig, ax = plt.subplots( nrows = 4, ncols=1, figsize = (8, 16) )
    plotScore( df5, ax[0] )
    plotTime( df5, ax[1] )
    plotHossVsFlatScore(df4, df5, ax[2])
    plotHossVsFlatTime(df4, df5, ax[3])
    #plotHossVsFlatTime(d4, d5, ax[3])
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
