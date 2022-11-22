# Load data

NH3 <- read.csv('../data/NH3_measurements.csv', skip = 1)
OAV2 <- read.csv('../data/OAV_2h_measurements.csv', skip = 1)
SOAV <- read.csv('../data/SOAV_measurements.csv', skip = 1)

# merge 
dat <- mergemany(NH3, OAV2, SOAV, by = c('exper', 'treat', 'rep'))
