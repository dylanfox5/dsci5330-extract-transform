#### The Joins
library(tidyverse)
a1 <- c("A", "B", "C", "D")
a2 <- c(1, 2, 3, 4)
b1 <- c("A", "B", "D", "Z")
b2 <- c("TRUE", "TRUE", "FALSE", "FALSE")

A <- tibble(a1, a2)
B <- tibble(b1, b2)

colnames(A) <- c("x1", "x2")
colnames(B) <- c("x1", "x3")

left_join(A, B, by = "x1")  # joins by matching rows from B to A
right_join(A, B, by = "x1") # joins by matching rows from A to B
inner_join(A, B, by="x1") # joins data retaining only rows in both A and B
full_join(A, B, by="x1") # joins data retataing all rows in A and B

semi_join(A, B, by = "x1") #joins all rows in A that have a match in B
anti_join(A, B, by = "x1") #goins all rows in A that do not have match in B
