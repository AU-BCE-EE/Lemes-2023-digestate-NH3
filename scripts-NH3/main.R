# Analysis of wind tunnel measurements of NH3 loss and odor from digestate etc.

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
render('NH3_analysis.Rmd', output_dir = '../output-stats')
source('summ.R')
source('export.R')
