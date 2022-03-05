#### Functions in R #####

tdat <- c(1,10,9,5,9,10,15,3,9)

myvec <- function(mydat){
    return(mydat)
}
myvec(tdat)

myvec <- function(mydat){
    unq <- unique(mydat)
    return(unq)
}
myvec(tdat)


myvec <- function(mydat){
    totv <- mean(mydat)
    return(totv)
}
myvec(tdat)

################# sqrt(x) + y
fnt <- function(x, y) {
    return(sqrt(x)+y)
}

fnt(9)


fnt <- function(x, y=2) {
    if (x<0){
        warning("Negative values of x not allowed")
        return(NA)
    }
    return(sqrt(x)+y)
}
fnt(9)

#### Ellipsis

myplt <- function(x,y, ...){
    mylist <- list(...)
    plot(x,y, ...)
    if(any(names(mylist) == "xlab"))
        cat("xlab was supplied as ", mylist$xlab, "\n")
}
myplt(1:5, 1:5, xlab = "X vs Y")

set.seed(1000)
a <- rnorm(10)
b <- rnorm(10)
c <- rnorm(10)
d <- rnorm(10)

df <- data.frame(a,b,c,d)
df$a <- (df$a -min(df$a))/(max(df$a)-min(df$a))


rescale1 <- function(x){
    rng <- range(x, na.rm=TRUE)
    (x-rng[1])/(rng[2]-rng[1])
}
rescale1(c(0,5,10))
rescale1(df$b)
range(c(0,5,10))

############# Local and Globall Variables
new <- function (a=5){
    a <- a+1
    cat ("a is now", a, "\n")
    return(a)
}
a <- 11
new(a)
a
b <- new(11)
b


