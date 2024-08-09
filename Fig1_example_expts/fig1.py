import findSim
import matplotlib.pyplot as plt

def main():
    plt.figure( figsize = (4.8, 11), facecolor = "white" )

    # Barchart
    ax = plt.subplot( 3, 1, 1 )
    ax.text( -0.20, 1.05, "D", fontsize = 22, weight = "bold", 
            transform=ax.transAxes )
    findSim.innerMain( "../EGFR_Expts/Mukhin2003_Fig9B.json", 
            modelFile = "../Models/D3_model_EGFR_v8.json", 
            mapFile = "../Maps/D3_map_EGFR.json",
            bigFont = True, labelPos = "upper left", deferPlot = True )
    plt.title("")

    # Dose-resp
    ax = plt.subplot( 3, 1, 2 )
    ax.text( -0.20, 1.05, "E", fontsize = 22, weight = "bold", 
            transform=ax.transAxes )
    findSim.innerMain( "../EGFR_Expts/CapuaniF2015_Fig1C.json", 
            modelFile = "../Models/D3_model_EGFR_v8.json", 
            mapFile = "../Maps/D3_map_EGFR.json",
            bigFont = True, labelPos = "lower right", deferPlot = True )
    ax.set_xlabel( "EGF (nM)" )
    plt.title("")

    # Timeseries
    ax = plt.subplot( 3, 1, 3 )
    ax.text( -0.20, 1.05, "F", fontsize = 22, weight = "bold", 
            transform=ax.transAxes )
    findSim.innerMain( "../EGFR_Expts/Shah2003_Fig1B_pkScale.json", 
            modelFile = "../Models/D3_model_EGFR_v8.json", 
            mapFile = "../Maps/D3_map_EGFR.json",
            bigFont = True, labelPos = "upper left", deferPlot = True )
    plt.title("")

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()
