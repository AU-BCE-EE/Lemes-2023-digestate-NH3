rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('../scripts/packages.R')

dat <- read.xlsx('../data//Figure 2 data.xlsx', fill = TRUE)
dat$experiment <- as.factor(dat$experiment)
dat$treat <- as.factor(dat$treat)

# adding application rate, g NH4-N m-2 (from Table 1)
dat$app.rate <- dat$treat
dat$app.rate <- mapvalues(dat$app.rate, from = 'D-CM-CC', to = 6.5)
dat$app.rate <- mapvalues(dat$app.rate, from = 'D-CM', to = 13)
dat$app.rate <- mapvalues(dat$app.rate, from = 'U-CM', to = 10)
dat$app.rate <- as.numeric(as.character(dat$app.rate))

dat$loss.mn <- (dat$mean) / dat$app.rate * 100 
dat$loss.sd <- (dat$sd) / dat$app.rate * 100 

g <- ggplot(dat, aes(treat, loss.mn, fill = treat)) + geom_bar(stat = 'identity', width = 0.7) +
  theme_bw() + 
  facet_wrap(~ experiment) +
  geom_errorbar(aes(ymax = loss.mn + loss.sd, ymin = loss.mn - loss.sd), position = position_dodge(0.7), width = 0.2) + 
  theme(legend.title = element_blank(), legend.position = 'bottom') + 
  theme(axis.title.x = element_blank()) + 
  ylab('Emission after 160 h [% of applied TAN]') +
  scale_fill_brewer(palette = "Set1")
print(g)
ggsave('../plots/Figure2_v2.png', height = 4, width = 4)
