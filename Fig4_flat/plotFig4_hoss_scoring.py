import pandas as pd
import re
import numpy as np
import seaborn as sb
import matplotlib.pyplot as plt
import dispAllExpts

fname = "scores.txt"
bar_width = 0.35
space_width = 0.2
modelList = ["D3_model_b2AR_v5.json", "b2AR_PKA_v5.g", 
        "D3_model_MAPK_v7.json", "D4_model_EGFR_v13b.g"]

class Args():
    def __init__( self, D_value, target ):
        self.D_value = D_value
        self.target = target,
        self.model = "Models/" + modelList[ (target == "EGFR")*2 + (D_value == "D4") ]
        print( "INITING ARGS, ", D_value, target, self.model )
        self.map = "Maps/{}_map_{}.json".format( D_value, target )
        self.config = "Config/{}_{}_hoss.json".format( D_value, target )
        self.scoreFunc = ""
        self.solver = "lsoda"
        self.exptDir = target + "_Expts"
        self.blocks = []
        self.plot = ""
        self.score = 0
        self.initScore = 0
        self.hidePlot = True
        self.verbose = False


def main():
    # Initialize lists to store extracted data
    targets = []
    optimization_methods = []
    init_scores = []
    optimized_scores = []
    times = []
    d_values = []
    
    # Define the pattern to extract information from each line
    pattern = re.compile(r'Log\d*/log_(D[34])_(\w+)_(COBYLA|SLSQP|BFGS).txt:OPT_(D[34])_\w*_\w*\/opt\.\w*: flat: Init Score (\d+\.\d+), Final = (\d+\.\d+), Time = (\d+\.\d+)s')


    #match = re.search(r'log_(\w+)_b2AR_(\w+)\.txt:OPT_(\w+)_b2AR_(\w+)/opt\.json: flat: Init Score (\d+\.\d+), Final = (\d+\.\d+)')
    
    # Read the file line by line and extract information
    with open( fname, 'r') as file:
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
    
    # Print the DataFrame
    #print(grouped_df)

    fig, ax = plt.subplots( nrows = 2, ncols=1, figsize = (8, 8) )
    plt.rcParams.update({'font.size': 14})
    plotScore( grouped_df, ax[0] )
    plotTime( grouped_df, ax[1] )
    plt.tight_layout()
    plt.show()


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
            #print( initScore )
            #print( "INIT SCORE = ", float(initScore[0] ) )
            #print( "INIT SCORE = ", initScore )
            #print( "###############################################" )
            aa = Args( d_value, target )
            newInitScore = dispAllExpts.innerMain( aa )
            suffix = "json" if d_value == "D3" else "g"

            initScore = initScore.values[0]
            print( "New initScore = ", newInitScore, "     Old = ", initScore )
            #ax.bar(positions[0], initScore, bar_width, align='center', alpha=0.7, 
            ax.bar(positions[0], newInitScore, bar_width, align='center', alpha=0.7, 
                ecolor='black', capsize=5, color=colors['Initial'], label='Initial' if i == 0 and j == 0 else "")
            for k, method in enumerate(unique_methods):
                aa.model = "OPT_{}_{}_{}/OPTI_000.{}".format( 
                        d_value, target, method, suffix )
                newScore = dispAllExpts.innerMain( aa )
                method_subset = subset[subset['Optimization_Method_'] == method]
                ax.bar(positions[k+1], newScore, bar_width,
                #ax.bar(positions[k+1], method_subset['Optimized_Score_mean'], bar_width,
                       align='center', alpha=0.7, ecolor='black', capsize=5, color=colors[method], label=method if i == 0 and j == 0 else "")
    
    # Adding labels and title
    ax.set_xticks(grouped_positions + ((len(unique_targets) - 1) / 2) * (bar_width * len(unique_methods) + space_width))
    #ax.set_xticklabels([f"{d}_{t}" for d, t in zip(unique_d_values, unique_targets)])
    ax.set_xticklabels( xticklabels )
    #ax.set_xlabel('')
    ax.set_ylabel('Optimization score', fontsize = 16)
    #ax.set_yscale( 'log' )
    #ax.set_title('Optimization score')
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "B", fontsize = 22, weight = "bold", transform=ax.transAxes )
    
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
    ax.set_ylabel('Wallclock Time (s)', fontsize = 16)
    ax.set_yscale( 'log' )
    ax.xaxis.set_tick_params(labelsize=14)
    ax.yaxis.set_tick_params(labelsize=14)
    ax.text( -0.10, 1.05, "C", fontsize = 22, weight = "bold", transform=ax.transAxes )
    #ax.set_title('Wallclock time (s)')
    
    # Adding legend
    #ax.legend(loc='upper left', bbox_to_anchor=(1, 1), title='Optimization Method')
    ax.legend(loc='upper left', title='Optimization Method', frameon = False)
    
    # Show the plot
    
    

if __name__ == "__main__":
    main()
