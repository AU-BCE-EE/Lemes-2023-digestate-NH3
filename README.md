# Lemes-2022-digestate-NH3
Ammonia loss from field-applied digestate measured by wind tunnel.
This repo is for data analysis related to the manuscript.
It contains data files, R scripts, and output.

# Maintainer
Yolanda Maria Lemes Perschke <https://pure.au.dk/portal/en/persons/yolanda-maria-lemes-perschke(fbcac929-5f57-4fcc-9d52-3cdc8cf05566).html>

# Directory structure

## `data`
Data files for producing plots and comparing slurry sources.
Data are stored in Excel (`.xlsx`) with a `ChangeLog` sheet for tracking changes.
Files are read in with `openxlsx::read.xlsx()`.

## `functions`
Functions used in some of the scripts.
From <https://github.com/sashahafner/jumbled/>.

## `logs`
R and R package version logs for reproducibility.

## `output`
Means of response variables or model parameters by treatment or treatment x experiment.

## `output-stats`
Results from statistical analyses as pdf files produced from Rmd files.

## `plots`
Plots for the paper.
See "Links" section below for more information.

## `scripts-4mp`
R scripts for fitting Michaelis-Menten model to 4-methyl phenol vs time measurements.
Run `main.R` for complete analysis.

## `scripts-NH3`
R scripts for analysis of NH3 emission measurements.
Run `main.R` for complete analysis.

## `scripts-OAV`
R scripts for analysis of OAV measurements.
Run `main.R` for complete analysis.

## `scripts-plots`
R scripts for producing plots.
Each `Figure *.R` script runs independently.

# Links to manuscript components
...


...

* `NH3_measurements` Measured cumulative ammonia loss over the complete duration of the emission measurement periods (18 or 30 hours).
* `OAV_2h_measurements` Average?? odor activity value (sum??) over the first two hours after slurry application.
* `SOAV_measurements` Sum (total) odor activity value over the entire measurement periods (18 or 30 hours)???
