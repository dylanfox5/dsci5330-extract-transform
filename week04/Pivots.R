library(tidyverse)

### pivot_longer() replaces gather

relig_income
relig_income %>%
    pivot_longer(!religion, names_to = "income", 
                 values_to = "count")
billboard
billboard %>%
    pivot_longer(
        cols = starts_with("wk"),
        names_to = "week",
        names_prefix = "wk",
        values_to = "rank",
        values_drop_na = TRUE
    )

who
# Multiple variables stored in column names
who %>% pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = c("diagnosis", "gender", "age"),
    names_pattern = "new_?(.*)_(.)(.*)",
    values_to = "count"
)

anscombe
anscombe %>%
    pivot_longer(everything(),
                 names_to = c(".value", "set"),
                 names_pattern = "(.)(.)"
    )

################## pivot_wider() replaces spread
fish_encounters
fish_encounters %>%
    pivot_wider(names_from = station, values_from = seen)

fish_encounters %>%
    pivot_wider(names_from = station, values_from = seen, 
                values_fill = 0)
us_rent_income
us_rent_income %>%
    pivot_wider(names_from = variable, 
                values_from = c(estimate, moe))

##### Unite 
df <- expand_grid(x = c("a", NA), y = c("b", NA))
df
df %>% unite("z", x:y, remove = FALSE)
df %>% unite("z", x:y, na.rm = TRUE, remove = FALSE)

##### Separate is almost the complement of unite
df %>%
    unite("xy", x:y) %>%
    separate(xy, c("x", "y"))
