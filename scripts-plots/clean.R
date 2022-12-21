# Figure 1
dat1.summ <- ddply(dat1, c('experiment', 'treat', 'time'), summarise, flux.mn = mean(flux), flux.sd = sd(flux))

# adding application rate, g NH4-N m-2 (from Table 1)
dat1.summ$app.rate <- dat1.summ$treat
dat1.summ$app.rate <- mapvalues(dat1.summ$app.rate, from = 'CC-CM', to = 6.5)
dat1.summ$app.rate <- mapvalues(dat1.summ$app.rate, from = 'D-CM', to = 13)
dat1.summ$app.rate <- mapvalues(dat1.summ$app.rate, from = 'U-CM', to = 10)
dat1.summ$app.rate <- as.numeric(dat1.summ$app.rate)

# converting from mg-NH3 m-2 h-1 to % TAN h-1
dat1.summ$flux.mnB <- dat1.summ$flux.mn / 1000 * 14.006/17.031 / dat1.summ$app.rate * 100
dat1.summ$flux.sdB <- dat1.summ$flux.sd / 1000 * 14.006/17.031 / dat1.summ$app.rate * 100

dat1.summ$treat <- mapvalues(dat1.summ$treat, from = 'CC-CM', to = 'D-CM-CC')

dat1.summ$treat <- factor(dat1.summ$treat, levels = c('U-CM', 'D-CM', 'D-CM-CC'))
dat1.summ$experiment <- factor(dat1.summ$experiment)

# Figure 2
dat2$experiment <- as.factor(dat2$experiment)
dat2$treat <- as.factor(dat2$treat)

# adding application rate, g NH4-N m-2 (from Table 1)
dat2$app.rate <- dat2$treat
dat2$app.rate <- mapvalues(dat2$app.rate, from = 'CC-CM', to = 6.5)
dat2$app.rate <- mapvalues(dat2$app.rate, from = 'D-CM', to = 13)
dat2$app.rate <- mapvalues(dat2$app.rate, from = 'U-CM', to = 10)
dat2$app.rate <- as.numeric(as.character(dat2$app.rate))

dat2$loss.mn <- (dat2$mean) / dat2$app.rate * 100 
dat2$loss.sd <- (dat2$sd) / dat2$app.rate * 100 

dat2$treat <- mapvalues(dat2$treat, from = 'CC-CM', to = 'D-CM-CC')

dat2$treat <- factor(dat2$treat, levels = c('U-CM', 'D-CM', 'D-CM-CC'))
dat2$experiment <- factor(dat2$experiment)

# Figure 3
dat3$treatment <- mapvalues(dat3$treatment, from = 'CC-CM', to = 'D-CM-CC')

dat3$treatment <- factor(dat3$treatment, levels = c('U-CM', 'D-CM', 'D-CM-CC'))
dat3$experiment <- factor(dat3$experiment)

# Figure supporting materials
names(datSS) <- c('time', 'timeA', 'NH3', 'tube')
datSS$minutes <- c(1:nrow(datSS)) / 60