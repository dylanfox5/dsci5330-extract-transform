### week 5 homework - dfox

library(tidyverse)
library(caret)
data(scat)

## problem 1
sum(complete.cases(scat))

## problem 2
mean(scat$Diameter, na.rm=TRUE) # 18.55865
var(scat$Diameter, na.rm=TRUE) # 15.07002

scat$Diameter[is.na(scat$Diameter)] <- mean(scat$Diameter, na.rm=TRUE)
mean(scat$Diameter, na.rm=TRUE) # 18.55865
var(scat$Diameter, na.rm=TRUE) # 14.24048

## problem 3
lm <- lm(CN ~ Mass, data=scat) # CN is a proxy for the degree of carnivory which can be related to the mass
summary(lm)

cn <- scat %>% filter(is.na(scat$CN))
scat$CN[is.na(scat$CN)] <- predict(lm, cn)

## problem 4
colSums(is.na(scat)) # Taper (17), TI (17), Mass (1), d13C (2), d15N (2)

# not a lot of valus missing in these columns so i imputed data via the mean (quick and easy)
scat$Mass[is.na(scat$Mass)] <- mean(scat$Mass, na.rm=TRUE)
scat$d13C[is.na(scat$d13C)] <- mean(scat$d13C, na.rm=TRUE)
scat$d15N[is.na(scat$d15N)] <- mean(scat$d15N, na.rm=TRUE)

# more data missing with these columns. used linear regression to maintain relationships
lm_taper <- lm(Taper ~ Length, data=scat)
taper <- scat %>% filter(is.na(scat$Taper))
scat$Taper[is.na(scat$Taper)] <- predict(lm_taper, taper)

lm_ti <- lm(TI ~ Taper, data=scat)
ti <- scat %>% filter(is.na(scat$TI))
scat$TI[is.na(scat$TI)] <- predict(lm_ti, ti)

## problem 5

# Single Imputation
# Pros - Allows us to include all observations in our analysis. 
# Cons - Introduces bias and can skew results.

# Multiple Imputation
# Pros - Accounts for uncertainty and samples variations of missing values
# Cons - If there is high uncertainty in sample variations, the results become biased and skewed.