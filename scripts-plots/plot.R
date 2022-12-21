# Figure 1
g <- ggplot(dat1.summ, aes(time, flux.mnB, color = treat, fill = treat)) + geom_point() + 
  theme_bw() + 
  facet_wrap(~ experiment) + 
  geom_ribbon(aes (ymax = flux.mnB + flux.sdB, ymin = flux.mnB - flux.sdB, group = treat), alpha = 0.2, color = NA) + 
  ylab(expression(paste(NH[3], '  flux  [% applied TAN  ', h^-1, ']'))) + xlab('Time from slurry application [h]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1") + scale_fill_brewer(palette = 'Set1')
print(g)
ggsave2x('../plots/Figure1', height = 4, width = 7)

# Figure 2
g <- ggplot(dat2, aes(treat, loss.mn, fill = treat)) + geom_bar(stat = 'identity', width = 0.7) +
  theme_bw() + 
  facet_wrap(~ experiment) +
  geom_errorbar(aes(ymax = loss.mn + loss.sd, ymin = loss.mn - loss.sd), position = position_dodge(0.7), width = 0.2) + 
  theme(legend.title = element_blank(), legend.position = 'bottom') + 
  theme(axis.title.x = element_blank()) + 
  ylab('Emission after 160 h [% of applied TAN]') +
  scale_fill_brewer(palette = "Set1")
print(g)
ggsave2x('../plots/Figure2_v2', height = 4, width = 4)

# Figure 3
g <- ggplot(dat3, aes(time, mean, color = treatment, fill = treatment)) + geom_point() + geom_line() +
  theme_bw() + 
  facet_wrap(~ experiment, scales = 'free_x') + 
  geom_ribbon(aes (ymax = mean + sd, ymin = mean - sd, group = treatment), alpha = 0.2, color = NA) + 
  ylab('SOAV') + xlab('Time from slurry application [h]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1") + scale_fill_brewer(palette = 'Set1')
print(g)
ggsave2x('../plots/Figure3', height = 4, width = 7)

# Figure 4
# For Fig 4 see ../scripts-4mp

# Figure supporting material
g <- ggplot(datSS, aes(minutes, NH3, color = tube)) + geom_point() + 
  theme_bw() + 
  ylab(expression(paste(NH[3], '[ppb]'))) + xlab('Time from slurry application [min]') + 
  theme(legend.title = element_blank(), legend.position = 'bottom') +
  scale_color_brewer(palette = "Set1")
print(g)
ggsave2x('../plots/FigureSS', height = 3, width = 4)