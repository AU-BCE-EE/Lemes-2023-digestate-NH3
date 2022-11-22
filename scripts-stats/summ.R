# Generate summary

summ1 <- aggregate2(dat, c('e.rel', 'e.cum'), c('exper', 'treat'), FUN = list(mean = mean, s = sd, n = length))
summ2 <- aggregate2(dat, c('e.rel', 'e.cum'), 'treat', FUN = list(mean = mean, s = sd, n = length))
