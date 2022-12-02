# Sort out time problem
# Fix names

# Time in file seems to be *start* of each interval, but 4_methyl. . . is *cumulative* emission value
dat <- dat[, time.end := time + (time[3] - time[2]), by = .(experiment, treatment, tunnel)]

dat$fmp <- dat$`4_`
