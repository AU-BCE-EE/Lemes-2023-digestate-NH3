# Analysis of wind tunnel measurements of NH3 loss and odor from digestate etc.

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
render('analysis.Rmd', output_dir = '../stats')
source('summ.R')
source('export.R')
