rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('packages.R')
source('../functions/ggsave2x.R')
source('load.R')
source('clean.R')
source('plot.R')
