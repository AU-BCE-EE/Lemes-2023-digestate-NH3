# Export results

# Export summary after rounding and sorting
summ1 <- rounddf(summ1, 3, func = signif)
summ2 <- rounddf(summ2, 3, func = signif)

write.csv(summ1, '../output/summary1.csv', row.names = FALSE)
write.csv(summ2, '../output/summary2.csv', row.names = FALSE)
