### week 4 homework - dfox

library(tidyverse)

bb <- read_csv("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week04/BedBath2.csv")
bb

# add the appropriate column names 
bb1 <- bb %>%
  add_column("PropId" = "", "Bed" = "", "Bath" = "", "State" = "", "Size" = "")

# create functions that will store the appropriate variable value in a vector
# using the apply statement, we can create a vector to be used later 
getIds <- function(row) {
  id <- str_split(row, "\t")[[1]][1]
}
ids <- apply(bb1, 1, getIds)

getBeds <- function(row) {
  bed <- str_split(row, "\t")[[1]][2]
}
beds <- apply(bb1, 1, getBeds)

getBaths <- function(row) {
  bath <- str_split(row, "\t")[[1]][3]
}
baths <- apply(bb1, 1, getBaths)

getStates <- function(row) {
  state <- str_split(row, "\t")[[1]][4]
}
states <- apply(bb1, 1, getStates)

getSizes <- function(row) {
  size <- str_split(row, "\t")[[1]][5]
}
sizes <- apply(bb1, 1, getSizes)

# simply mutate the tibble and set each column with the corresponding vector
bb_f <- bb1 %>%
  mutate(PropId = ids, Bed = beds, Bath = baths, State = states, Size = sizes) %>%
  select(PropId, Bed, Bath, State, Size)
