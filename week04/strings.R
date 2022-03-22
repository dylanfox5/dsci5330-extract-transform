#### Strings  Section 14 of R for Data Science #####
library(tidyverse)

# Regular expressions, or regexps 
# Strings usually contain unstructured or semi-structured data
# regexps are a concise language for describing patterns 

###String functions can be accessed via the str_
x <- c("Sting", "Graceland University", 1895)
str_length(x)

str_c("Sting", "Graceland University", 1895)

#### Subsetting

str_sub(x, 1, 5)
# negative numbers count backwards from end
str_sub(x, -5, -1)
# modify strings (str_to_lower, str_to_upper,str_to_title)

str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1, 1))
x

# Character classes
#   \d: matches any digit.
#   \s: matches any whitespace (e.g. space, tab, newline).
#   [abc]: matches a, b, or c.
#   [^abc]: matches anything except a, b, or c.
# Repetition of charaters
#   ?: 0 or 1
#   +: 1 or more
#   *: 0 or more


x <- "   This is a sentence.  This is another sentence."
str_view_all(x, boundary("word"))

str_split(x, " ")[[1]]
str_split(x, boundary("word"))[[1]]
str_trim(x)
str_replace_all(x, fixed(" "), "")
str_squish(x)
