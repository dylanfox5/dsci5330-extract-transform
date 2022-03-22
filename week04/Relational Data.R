##### Relational Data Section 13 in R for Data Science
#  Collectively, multiple tables of data are called relational data
# the relations, not just the individual datasets, are important.

# Keys
# Primary key uniquely identifies an observation in its own table.

# Foreign key uniquely identifies an observation in another table.
library(tidyverse)
library(nycflights13)
airlines
planes
planes %>% 
    count(tailnum) %>% 
    filter (n >1)
sum(is.na(planes$tailnum))
