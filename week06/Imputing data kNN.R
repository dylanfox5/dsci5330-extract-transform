### Using k-NN to impute data

library(tidyverse)
library(caret)
#install.packages("RANN")
library(RANN)

cars_info <-read.csv("cars_info.csv")
summary(cars_info)

ggplot(cars_info, aes(x = mpg, y = qsec, color = hp)) + 
    geom_point(show.legend = TRUE) +
    labs(x = 'MPG', y='qsec',  title = "Auto MPG",
         color = 'Horsepower') + 
    scale_color_gradient(low = "green", high = "red",
                         na.value = "blue", guide = "legend") +
    theme_minimal()+theme(legend.position="bottom")

preProcValues <- preProcess(cars_info %>% 
                                select(mpg, cyl, disp, wt, qsec, hp),
                            method = c("knnImpute"),
                            k = 10,
                            knnSummary = mean)
impute_cars_info <- predict(preProcValues, cars_info,na.action = na.pass)
impute_cars_info

procNames <- data.frame(col = names(preProcValues$mean), mean = preProcValues$mean, sd = preProcValues$std)
for(i in procNames$col){
    impute_cars_info[i] <- impute_cars_info[i]*preProcValues$std[i]+preProcValues$mean[i] 
}
