#### Factors

x <-c("First", "Second", "Third", "Fourth")
y <-c("1st", "2nd", "3rd", "4th")
sort(x)
sort(y)
p_levels <- c("First", "Second", "Third", "Fourth")

x1 <- factor(x, levels = p_levels)
x1 

z <-c("First", "Second", "Third", "Forth")
z1 <- factor(z, levels = p_levels)
z1
