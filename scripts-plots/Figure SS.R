
rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('../scripts/packages.R')

dat <- read.xlsx('../data/Figure SS data.xlsx', fill = TRUE)
names(dat) <- c('time', 'timeA', 'NH3', 'tube')
dat$minutes <- c(1:nrow(dat)) / 60

g <- ggplot(dat, aes(minutes, NH3, color = tube)) + geom_point() + 
  theme_bw() + 
  ylab(expression(paste(NH[3], '[ppb]'))) + xlab('Time from slurry application [min]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1")
print(g)
ggsave('../plots/FigureSS.png', height = 3, width = 4)



