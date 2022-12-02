# Analysis of wind tunnel measurements of 4-methyl pheno from digestate etc.

rm(list = ls())

source('packages.R')
source('functions.R')
source('load.R')
source('clean.R')
source('fit_MM.R')
render('4mp_analysis.Rmd', output_dir = '../output-stats')
source('summ.R')
source('export.R')
source('plot.R')

