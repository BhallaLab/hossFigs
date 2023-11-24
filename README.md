# hossFigs

Figures for the paper on HOSS: Hierarchical Optimization for Systems Simulations


# About

The HOSS project is a framework for building data-driven pipelines for large 
systems optimizations, so that it is clear how the data led to the choice of
parameters for the model. HOSS also introduces new optimization methodology
for this class of problems. This paper describes how HOSS works.
HOSS is at [https://github.com/upibhalla/HOSS](https://github.com/upibhalla/HOSS)

# LICENSE
This file and the files in this repository are licensed under GPL v3 or later

# Version

Current version of paper figs is 0.0
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


