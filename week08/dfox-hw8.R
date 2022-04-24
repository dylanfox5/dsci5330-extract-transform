### week 8 homework - dfox
library(lubridate)
library(tidyverse)
library(xlsx)
library(naniar)

## problem 1
## Duration -- used to display the number of seconds in a time span
## Periods -- used to track the time between two dates
## Intervals -- used to store a period of time

## problem 2
y2015 <- interval(start=ymd(20150101), end=ymd(20151201))
d2015 <- vector(mode="character", length=12)
i <- 1
for (val in d2015) {
  d2015[i] <- wday(int_start(y2015))
  int_start(y2015) <- int_start(y2015) + months(1)
  i <- i+1
}
d2015

y2022 <- interval(start=ymd(20220101), end=ymd(20221201))
d2022 <- vector(mode="character", length=12)
i <- 1
for (val in d2022) {
  d2022[i] <- wday(int_start(y2022))
  int_start(y2022) <- int_start(y2022) + months(1)
  i <- i+1
}
d2022

## problem 3
age <- today() - ymd(19990418)
as.duration(age)

## problem 4
states <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week08/states.csv")
statehood <- read.xlsx("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week08/statehood.xlsx", 1, header=FALSE)
region <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week08/stateregion.csv")
data <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week08/statedata.csv")

df <- states %>%
  select(state.name, state.abb)

region <- pivot_longer(region, -X1, names_to="state.abb", values_to="state.region") %>%
  select(state.abb, state.region)

df <- left_join(df, region, by = "state.abb")
df <- left_join(df, data, by = "state.name")

df <- df %>%
  rename(state = state.name, abbr = state.abb, region = state.region, pop = Population, income = Income, 
         illiteracy = Illiteracy, life_exp = `Life Exp`, murder = Murder, hs_grad = `HS Grad`, frost = Frost, area = Area)

year(statehood$X3) <- statehood$X4
statehood <- statehood %>%
  select(X2, X3) %>%
  rename(state = X2, statehood = X3)

df <- left_join(df, statehood, by = "state")
df

gg_miss_var(df)

# replace income with mean
df$income[is.na(df$income)] <- mean(df$income, na.rm=TRUE)

# replace illiteracy & murder using lm
lm_murder <- lm(murder ~ income + hs_grad, data=df)
murder <- df %>% filter(is.na(df$murder))
df$murder[is.na(df$murder)] <- predict(lm_murder, murder)

lm_ill <- lm(illiteracy ~ hs_grad + murder, data=df)
ill <- df %>% filter(is.na(df$illiteracy))
df$illiteracy[is.na(df$illiteracy)] <- predict(lm_ill, ill)

df$time_since_statehood <- as.duration(today()-df$statehood)