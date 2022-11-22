# Generate summary

summ1 <- aggregate2(dat, c('e.rel', 'e.cum', 'oav', 'soav'), c('exper', 'treat'), FUN = list(mean = mean, s = sd, n = length))
summ2 <- aggregate2(dat, c('e.rel', 'e.cum', 'oav', 'soav'), 'treat', FUN = list(mean = mean, s = sd, n = length))
