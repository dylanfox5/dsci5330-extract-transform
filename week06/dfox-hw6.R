### week 6 homework - dfox

library(tidyverse)
library(caret)
library(VIM)
library(FactoMineR)
library(missMDA)
library(naniar)
library(RANN)
library(Amelia)
library(mice)
data(scat)

## problem 1
summary(scat)
gg_miss_var(scat)

res <- summary(aggr(scat, sortVar=TRUE))$combinations
matrixplot(scat, sortby = 2)

# Yes, I would consider the data to be part of the MAR category. By looking at 
# the combinations of missing values, we see that multiple variables are missing
# data at the same time. For example, Taper and TI share a lot instances of missing
# data together. 

## problem 2
preProcValues <- preProcess(scat %>% 
                              select(Species, Site, Age, Length, Diameter),
                            method = c("knnImpute"),
                            k = 10,
                            knnSummary = mean)
impute_scat_info <- predict(preProcValues, scat, na.action = na.pass)
impute_scat_info

procNames <- data.frame(col = names(preProcValues$mean), mean = preProcValues$mean, sd = preProcValues$std)
for (i in procNames$col) {
  impute_scat_info[i] <- impute_scat_info[i]*preProcValues$std[i]+preProcValues$mean[i] 
}
scat <- impute_scat_info

## problem 3
scat1 <- scat %>% 
  select(Age, Number, Length, Diameter, Taper, TI, Mass, d13C, d15N, CN, ropey, segmented, flat, scrape)

res.amelia <- amelia(scat1, m = 5)
names(res.amelia$imputations)
res.amelia$imputations$imp1 # the first imputed data set

compare.density(res.amelia, var = "Taper")
overimpute(res.amelia, var = "Taper")

resamelia <- lapply(res.amelia$imputations, as.data.frame)
fitamelia <- lapply(resamelia, lm, 
                    formula="Taper ~ Age+Number+Length+Diameter+TI+Mass+d13C+d15N+CN+ropey+segmented+flat+scrape")

poolamelia <- pool(as.mira(fitamelia))
summary(poolamelia)

scat2 <- scat1
reg <- lm(Taper ~ ., data = scat2)
while (any(summary(reg)$coeff[-1, 4]>0.05)) {
  scat2 <- scat2[,!(colnames(scat2)%in%names(which.max(summary(reg)$coeff[-1, 4])))]
  reg <- lm(Taper ~ ., data = scat2)
}


fitamelia <- lapply(resamelia, lm, formula="Taper ~ Diameter+TI+Mass")
poolamelia <- pool(as.mira(fitamelia))
summary(poolamelia) 

## problem 4
imp.mice <- mice(scat1, m = 100) # the variability of the parameters is obtained 
lm.mice.out <- with(imp.mice, lm(Taper ~ Age+Number+Length+Diameter+TI+Mass+d13C+d15N+CN+ropey+segmented+flat+scrape))

pool.mice <- pool(lm.mice.out)
summary(pool.mice)

lm.mice.out <- with(imp.mice, lm(Taper ~ Diameter+TI+Mass))
pool.mice <- pool(lm.mice.out)
summary(pool.mice)

## problem 5
library(palmerpenguins)
data(penguins)
penguins

summary(penguins)
gg_miss_var(penguins)

res <- summary(aggr(penguins, sortVar=TRUE))$combinations
matrixplot(scat, sortby = 2)

pens <- penguins[-c(4),]
pens
summary(pens)

# replace bill length & depth with mean
pens$bill_length_mm[is.na(pens$bill_length_mm)] <- mean(pens$bill_length_mm, na.rm=TRUE)
pens$bill_depth_mm[is.na(pens$bill_depth_mm)] <- mean(pens$bill_depth_mm, na.rm=TRUE)

# replace flipper length & body mass with linear regression
lm <- lm(flipper_length_mm ~ bill_length_mm + bill_depth_mm, data=pens)
flength <- pens %>% filter(is.na(pens$flipper_length_mm))
pens$flipper_length_mm[is.na(pens$flipper_length_mm)] <- predict(lm, flength)

lm <- lm(body_mass_g ~ bill_length_mm + bill_depth_mm + flipper_length_mm, data=pens)
mass <- pens %>% filter(is.na(pens$body_mass_g))
pens$body_mass_g[is.na(pens$body_mass_g)] <- predict(lm, mass)

# handling sex value
pens1 <- pens
pens1$sex <- as.factor(pens$sex)
pens1 <- pens1 %>%
  select(sex, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g)

mice <- mice(pens1, m = 100) # the variability of the parameters is obtained 
lm.mice.out <- with(mice, lm(sex ~ bill_length_mm+bill_depth_mm+flipper_length_mm+body_mass_g))

pool.mice <- pool(lm.mice.out)
summary(pool.mice)