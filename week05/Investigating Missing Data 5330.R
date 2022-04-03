####### Investigating Missing Data  ###########
# Code requires these packages: 

library(caret)
library(tidyverse)
library(naniar)
library(visdat)
# install.packages("BiocManager")
#BiocManager::install("ComplexHeatmap")
library(ComplexHeatmap)

theme_set(theme_bw())

data(scat)
str(scat)
sum(is.na(scat))

convert_missing <- function(x) ifelse(is.na(x), 0, 1)
scat_missing <- apply(scat, 2, convert_missing)
Heatmap(
    scat_missing, 
    name = "Missing", #title of legend
    column_title = "Predictors", row_title = "Samples",
    col = c("black","lightgrey"),
    show_heatmap_legend = FALSE,
    row_names_gp = gpar(fontsize = 0) # Text size for row names
)

gg_miss_upset(scat, nsets = 7) 

# Scatter Plot

scat_flat <- 
    scat %>%
    mutate(flat = ifelse(flat == 1, "yes", "no"))

ggplot(scat_flat, aes(col = flat)) + 
    geom_point(aes(x = Diameter, y = Mass), alpha = .5) + 
    geom_rug(data = scat_flat[is.na(scat_flat$Mass),], 
             aes(x = Diameter), 
             sides = "b", 
             lwd = 1)+ 
    geom_rug(data = scat_flat[is.na(scat_flat$Diameter),], 
             aes(y = Mass), 
             sides = "l", 
             lwd = 1) + 
    theme(legend.position = "top")
##########################################################
str(scat)
anyNA(scat)
sum(is.na(scat))
scatC <- complete.cases(scat)
sum(scatC)
str(scatC)
scat$Taper
mean(scat$Taper, na.rm=TRUE)
var(scat$Taper, na.rm=TRUE)

df1 <- scat
df1$Taper[is.na(df1$Taper)] <- mean(scat$Taper, na.rm=TRUE)
is.na(df1$Taper)
mean(df1$Taper, na.rm=TRUE)
var(df1$Taper, na.rm=TRUE)
## Linear Regression
fit1 <- lm(d13C ~ Length + Number + Age, data=df1)
summary(fit1)

a<- df1 %>% filter(is.na(df1$d13C))

predict(fit1, data.frame(Length = c(a$Length[1], a$Length[2]), 
                         Number= c(a$Number[1], a$Number[2]),
                         Age = c(a$Age[1], a$Age[2])) )

confint(fit1, level=0.95)
