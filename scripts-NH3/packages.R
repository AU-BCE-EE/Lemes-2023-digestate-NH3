
library(rmarkdown)
library(ggplot2)

sink('../logs/versions.txt')
  print(sessionInfo())
sink()
