####### The Tidyverse
library(tidyverse)

# readr
storms <- read_csv("DataSetHurricanes.csv")

cityX <- read_csv("CityX.csv")
cityX
View(cityX)


######################### Using Verbs #############################
#Filter Verb

carset <- as_tibble(mtcars)
filter(carset, cyl==4)
filter(carset, cyl==4, vs ==0)

#### Wrapping
(newcars <- filter(carset, cyl==4))
newcars

#Comparisons and cautions
sqrt(2)^2 ==2
2-sqrt(2)^2
near(sqrt(2)^2, 2, tol=1e-18)


##Logical helpers

filter(carset, cyl==4 | cyl==8)
filter(carset, mpg > 20 & mpg < 25)
filter(carset, cyl %in% c(4,8))


#
#### Missing Values
df <- tibble(x=c(1, NA, 52))
filter(df, x>1)
filter(df, is.na(x)| x>1)
is.na(df)


### arrange verb
arrange(carset, cyl, mpg)
df <- tibble(x = c(5, 2, NA))
arrange(df, x)
arrange(df, desc(x))

### select verb
select(carset, mpg, disp)
select(carset, -(mpg:disp))
select(carset, mpg, wt, everything())

### Mutate Verb....always good to save as a different file

carset2 <- select(carset, mpg, cyl, wt, disp, hp)
carset2 <- mutate(carset2, eff = mpg/hp)
carset2

carset2 <- mutate(carset2, load = wt/cyl, perp = eff/load)
carset2


### Summarize verb

summarize(carset2, ave_eff = mean(eff, na.rm=TRUE))

by_cyl <- group_by(carset2, cyl)
summarize(by_cyl, ave_mpg = mean(mpg, na.rm=TRUE))



#### piping and grouping together verbs
economy <- carset %>%
        filter(mpg>20) %>%
        group_by(cyl) %>%
        summarize(count=n(), ave_mpg = mean(mpg), max(wt))

economy



###############################################################################
# If you would like to follow the exercises in Chapter 5 of R for Data Science, 
# run the following lines to access the data flights

#install.packages("nycflights13")
#library(nycflights13)
#flights
#View(flights)
