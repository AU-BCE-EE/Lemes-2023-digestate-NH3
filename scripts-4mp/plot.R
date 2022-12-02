
pp <- subset(preds, 
             (experiment == 'Experiment 1' & time.end < 19) |
             (experiment == 'Experiment 2' & time.end < 40))
ggplot(dat, aes(time.end, fmp, color = treatment, , group = interaction(tunnel, treatment))) + 
  geom_point() + 
  #geom_line() +
  #geom_line(aes(time.end, fmp.calc), lty = '11') +
  geom_line(data = pp, aes(time.end, fmp.calc), lty = 1) +
  facet_wrap(~ experiment, scales = 'free_x') + 
  theme_bw() + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  labs(y = expression('4-Methylphenol [mg'~m^'-2'*']'), x  = 'Time from slurry application [h]')

ggsave('../plots/Figure4.png', height = 4, width = 7)
