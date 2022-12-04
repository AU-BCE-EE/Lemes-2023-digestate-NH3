rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('packages.R')

dat <- read.xlsx('../data/Figure 3 data.xlsx', fill = TRUE)

dat$treatment <- mapvalues(dat$treatment, from = 'CC-CM', to = 'D-CM-CC')

dat$treatment <- factor(dat$treatment, levels = c('U-CM', 'D-CM', 'D-CM-CC'))
dat$experiment <- factor(dat$experiment)

g <- ggplot(dat, aes(time, mean, color = treatment, fill = treatment)) + geom_point() + geom_line() +
  theme_bw() + 
  facet_wrap(~ experiment, scales = 'free_x') + 
  geom_ribbon(aes (ymax = mean + sd, ymin = mean - sd, group = treatment), alpha = 0.2, color = NA) + 
  ylab('SOAV') + xlab('Time from slurry application [h]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1") + scale_fill_brewer(palette = 'Set1')
print(g)
ggsave('../plots/Figure3.png', height = 4, width = 7)
