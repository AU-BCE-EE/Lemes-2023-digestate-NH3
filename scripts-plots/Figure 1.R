rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('packages.R')

dat <- read.xlsx('../data/Figure 1 data.xlsx', fill = TRUE)

dat.summ <- ddply(dat, c('experiment', 'treat', 'time'), summarise, flux.mn = mean(flux), flux.sd = sd(flux))

# adding application rate, g NH4-N m-2 (from Table 1)
dat.summ$app.rate <- dat.summ$treat
dat.summ$app.rate <- mapvalues(dat.summ$app.rate, from = 'CC-CM', to = 6.5)
dat.summ$app.rate <- mapvalues(dat.summ$app.rate, from = 'D-CM', to = 13)
dat.summ$app.rate <- mapvalues(dat.summ$app.rate, from = 'U-CM', to = 10)
dat.summ$app.rate <- as.numeric(dat.summ$app.rate)

# converting from mg-NH3 m-2 h-1 to % TAN h-1
dat.summ$flux.mnB <- dat.summ$flux.mn / 1000 * 14.006/17.031 / dat.summ$app.rate * 100
dat.summ$flux.sdB <- dat.summ$flux.sd / 1000 * 14.006/17.031 / dat.summ$app.rate * 100

dat.summ$treat <- mapvalues(dat.summ$treat, from = 'CC-CM', to = 'D-CM-CC')

dat.summ$treat <- factor(dat.summ$treat, levels = c('U-CM', 'D-CM', 'D-CM-CC'))
dat.summ$experiment <- factor(dat.summ$experiment)

g <- ggplot(dat.summ, aes(time, flux.mnB, color = treat, fill = treat)) + geom_point() + 
  theme_bw() + 
  facet_wrap(~ experiment) + 
  geom_ribbon(aes (ymax = flux.mnB + flux.sdB, ymin = flux.mnB - flux.sdB, group = treat), alpha = 0.2, color = NA) + 
  ylab(expression(paste(NH[3], '  flux  [% applied TAN  ', h^-1, ']'))) + xlab('Time from slurry application [h]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1") + scale_fill_brewer(palette = 'Set1')
print(g)
ggsave('../plots/Figure1.png', height = 4, width = 7)


