### week 2 homework - dfox

library(tidyverse)

## problem 1
df <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week03/DataSetHurricanes.csv")
cat4AndAbove <- filter(df, WindMPH >= 130)
cat4AndAbove

## problem 2
cat4 <- filter(df, WindMPH >= 130 & WindMPH <= 156)
cat4

## problem 3
by_sex <- group_by(df, Sex)
summarize(by_sex, ave_cost = mean(DamageMillions, na.rm=TRUE))

## problem 4
by_year <- group_by(df, Year)
filter(count(by_year), n > 4)

## problem 5
df2 <- mutate(df, dmgMi=DamageMillions/WindMPH, deathsPerMi=Deaths/WindMPH)
df2

## problem 6
arrange(df2, desc(dmgMi)) # Katrina, Sandy, Andrew
arrange(df2, desc(deathsPerMi)) # Katrina, Audrey, Diane

## problem 7
cars <- as_tibble(mtcars)
cars2 <- cars %>%
  select(wt, disp, hp, mpg, cyl) %>%
  mutate(v1=wt/hp) %>%
  group_by(cyl) %>%
  filter(v1 == max(v1))
cars2

## problem 8
A <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week03/A.csv")
B <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week03/B.csv")
B <- rename(B, V1 = X1)

left_join(A, B, by = "V1")

## problem 9
full_join(A, B, by="V1")
