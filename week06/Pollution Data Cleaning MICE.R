# install.packages("VIM")
# install.packages("naniar")
#install.packages("missMDA")
# install.packages("Amelia")
#install.packages("mice")
#install.packages("missForest")
#install.packages("FactoMineR")
library(tidyverse)


ozo <-read.table("Airquality.csv", header=TRUE, sep=",", row.names = 1)
View(ozo)
ozo1 <- ozo[, 1:11]
summary(ozo1)
WindDirection <- ozo[, 12]
library(VIM)
library(FactoMineR)
library(missMDA)
library(naniar)

gg_miss_var(ozo1)
res <- summary(aggr(ozo1, sortVar=TRUE))$combinations
matrixplot(ozo1, sortby = 2)
marginplot(ozo1[,c("T9","maxO3")])



### Multiple Imputation

library(mice)
imp.mice <- mice(ozo1, m = 100, defaultMethod = "norm.boot") # the variability of the parameters is obtained 
lm.mice.out <- with(imp.mice, lm(maxO3 ~ T9+T12+T15+Ne9+Ne12+Ne15+Vx9+Vx12+Vx15+maxO3v))

pool.mice <- pool(lm.mice.out)
summary(pool.mice)

lm.mice.out <- with(imp.mice, lm(maxO3 ~ T12+Ne9+Vx12+maxO3v))
pool.mice <- pool(lm.mice.out)
summary(pool.mice)


