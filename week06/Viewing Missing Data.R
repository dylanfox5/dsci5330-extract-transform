#install.packages("VIM")
#install.packages("naniar")
#install.packages("missMDA")
#install.packages("Amelia")
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

