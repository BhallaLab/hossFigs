# hossFigs

Code to generate data for and to plot figures for the paper 
"Hierarchical optimization of biochemical networks"

by Viswan, Tribut, Gasparyan, Radulescu and Bhalla.

It is on bioRxiv at doi: 
[https://doi.org/10.1101/2024.08.06.606818](https://doi.org/10.1101/2024.08.06.606818)

while it goes through the review process.


# About

The HOSS project is a framework for building data-driven pipelines for large 
systems optimizations, so that it is clear how the data led to the choice of
parameters for the model. HOSS also introduces new optimization methodology
for this class of problems. This paper describes how HOSS works.
HOSS is at [https://github.com/upibhalla/HOSS](https://github.com/upibhalla/HOSS)

# LICENSE
This file and the files in this repository are licensed under GPL v3 or later

# Version

Current version of paper figs is 1.0
Current release of HOSS is 2.0

# Install

To install and run these scripts you will typically need to have the following
packages installed:

Python3
Scipy
MOOSE
HillTau
FindSim
HOSS

To install MOOSE and HillTau you will need the C++ build environment as well
as pybind11.

=============================================================================

# File organization:

This repository is organized by figure number. There are subdirectories named
according to Fig<n>\_<description>
where *n* is the figure number.
The mapping to the figure numbering in the paper is as follows:

| Paper Figure number | Sub-directory | Generate figure | Plot Figure |
|---|---|---|---|
| 3 | Fig1\_example\_expts | None | fig1.py |
| 5 | Fig3\_Expt\_param\_stats | None | plotFig3.py |
| 7 | Fig4\_flat | run\_opt.csh | plotFig4.py |
| 8 | Fig5\_hoss | run\_opt.csh | plotFig5.py |
| 9 | Fig6\_initScram | run\_opt.csh | plotFig6.py |
| 10 | Fig7\_hossMC | run\_opt.csh | plotFig7.py |

For Figure 7 and 8 the figure generation runs on 1 to 16 cores and can be 
completed in a couple of hours on a laptop.
For Figure 9 and 10 the figure generation code runs on ~100 cores on a
shared-memory server and may take a few hours.

The figure plotting code runs in a few seconds on a laptop.

There are also several subdirectories containing common files used by several
of the figures.

## AllConfig:
	All the HOSS configuration files used for different pipeline in the
	paper.

## b2AR\_Expts:
	Experiment files in FindSim.json format, applicable to the b2AR
	optimization.

## EGFR\_Expts:
	Experiment files in FindSim.json format, applicable to the EGFR
	optimization.

## Models
	Starting model files in HillTau (JSON) format, and .g and .sbml
	formats for ODE models.

## Maps
	Map files used by FindSim and HOSS to map between experiment 
	naming of entities, and the naming used in the models.


