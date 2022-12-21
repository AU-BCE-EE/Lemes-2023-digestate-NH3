
library(rmarkdown)
library(ggplot2)
library(openxlsx)

sink('../logs/versions.txt')
  print(sessionInfo())
sink()
