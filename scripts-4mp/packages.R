
library(rmarkdown)
library(ggplot2)
library(openxlsx)
library(data.table)

sink('../logs/versions.txt')
  print(sessionInfo())
sink()
