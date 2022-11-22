
library(rmarkdown)
library(ggplot2)
library(openxlsx)
library(plyr)

sink('../logs/versions.txt')
  print(sessionInfo())
sink()