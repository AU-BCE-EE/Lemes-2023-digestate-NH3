
# Fit MM model to each wind tunnel
lmods <- dat[, .(mm = coef(nls(fmp ~ SSmicmen(time.end, mm, km)))[1], 
                 km = coef(nls(fmp ~ SSmicmen(time.end, mm, km)))[2]), 
             by = .(experiment, treatment, tunnel)]

# Add calculated values to data frame
dat <- merge(dat, lmods, by = c('experiment', 'treatment', 'tunnel'))
dat$fmp.calc <- dat$mm * dat$time.end / (dat$time.end + dat$km)

# Create calculated result df with higher time resolution
preds <- dfcombos(lmods, data.frame(time.end = 0:40))
preds$fmp.calc <- preds$mm * preds$time.end / (preds$time.end + preds$km)


