rm(list = ls())

dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source('../scripts/packages.R')

time.exp1 <- c(seq(1, 15.43, by = 0.2), seq(1, 15.43, by = 0.2), seq(1, 15.43, by = 0.2))
time.exp2 <- seq(1, 35.82, by = 0.2)

E1.CC.CM <- (12.0 * time.exp1) / (time.exp1 + 3.0)
E1.D.CM <- (31.8 * time.exp1) / (time.exp1 + 4.4)
E1.U.CM <- (36.1 * time.exp1) / (time.exp1 + 5)
E1.all <- c((12.0 * time.exp1) / (time.exp1 + 3.0), (31.8 * time.exp1) / (time.exp1 + 4.4), (36.1 * time.exp1) / (time.exp1 + 5))

E2.CC.CM <- (19.91 * time.exp2) / (time.exp2 + 1.3)
E2.D.CM <- (49.7 * time.exp2) / (time.exp2 + 1.9)
E2.U.CM <- (80.6 * time.exp2) / (time.exp2 + 2.7)
E2.all <- c((19.91 * time.exp2) / (time.exp2 + 1.3), (49.7 * time.exp2) / (time.exp2 + 1.9), (80.6 * time.exp2) / (time.exp2 + 2.7))

df1 <- data.frame(time.exp1, E1.CC.CM, E1.D.CM, E1.U.CM)
df1 <- data.frame(time.exp1, E1.all)
df1$treatment <- c(rep('CC-CM', nrow(df1)/3), rep('D-CM', nrow(df1)/3), rep('U-CM', nrow(df1)/3))

df2 <- data.frame(time.exp2, E2.CC.CM, E2.D.CM, E2.U.CM)
df2 <- data.frame(time.exp2, E2.all)
df2$treatment <- c(rep('CC-CM', nrow(df2)/3), rep('D-CM', nrow(df2)/3), rep('U-CM', nrow(df2)/3))

names(df1) <- c('time', 'num', 'treatment')
names(df2) <- c('time', 'num', 'treatment')

df1$experiment <- 'Experiment 1'
df2$experiment <- 'Experiment 2'

dfA <- rbind(df1, df2)

dat <- read.xlsx('../data/Figure 4 data.xlsx', fill = TRUE)

g <- ggplot(dat, aes(time, mean, color = treatment, fill = treatment)) + geom_point() + 
  theme_bw() + 
  geom_line(data = dfA, aes(time, num)) +
  facet_wrap(~ experiment, scales = 'free_x') + 
  geom_ribbon(aes (ymax = mean + sd, ymin = mean - sd, group = treatment), alpha = 0.2, color = NA) + 
  ylab(expression(paste('4-Methylphenol [mg  ', m^-2, ']'))) + xlab('Time from slurry application [h]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1") + scale_fill_brewer(palette = 'Set1')
print(g)
ggsave('../plots/Figure4.png', height = 4, width = 7)
