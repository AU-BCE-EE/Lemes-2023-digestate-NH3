# Summary for table

parsumm <- aggregate2(as.data.frame(lmods), c('mm', 'km'), by = c('treatment', 'experiment'), FUN = list(mean = mean, sd = sd))
parsumm <- rounddf(parsumm, 2)
