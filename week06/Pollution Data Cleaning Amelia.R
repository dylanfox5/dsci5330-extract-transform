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


### Multiple Imputation
library(Amelia)

res.amelia <- amelia(ozo1, m = 5)  
names(res.amelia$imputations) 
res.amelia$imputations$imp1 # the first imputed data set

compare.density(res.amelia, var = "T12")
overimpute(res.amelia, var = "maxO3")

#######
resamelia <- lapply(res.amelia$imputations, as.data.frame)
# A regression on each imputed dataset
fitamelia<-lapply(resamelia, lm, 
                  formula="maxO3~ T9+T12+T15+Ne9+Ne12+Ne15+Vx9+Vx12+Vx15+maxO3v")  

poolamelia<-pool(as.mira(fitamelia)) 
summary(poolamelia)


ozo2 <- ozo1
reg <- lm(maxO3 ~. , data = ozo2)
while(any(summary(reg)$coeff[-1, 4]>0.05)){
    ozo2 <- ozo2[,!(colnames(ozo2)%in%names(which.max(summary(reg)$coeff[-1, 4])))]
    reg <- lm(maxO3 ~. , data = ozo2)
}


fitamelia<-lapply(resamelia,lm, formula="maxO3~ T12+Ne9+Vx12+maxO3v")
poolamelia<-pool(as.mira(fitamelia))
summary(poolamelia) 
