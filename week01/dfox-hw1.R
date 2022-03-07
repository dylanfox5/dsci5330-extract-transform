### week 1 homework - dfox

## problem 1
for (i in c(1:10)) {
  y <- sqrt(i * 50) + 7
  print(y)
}

## problem 2
apply(mtcars, 2, mean)
apply(mtcars, 2, var)

## problem 3
f128 <- mtcars['Fiat 128',]
apply(f128, 1, sum)

## problem 4
x <- function() {
  vals <- rnorm(20, 0.5, 0.15)
  return((vals - min(vals)) / (max(vals) - min(vals)))
}
x()

## problem 5
a <- c(.45, -.019, -.318, -.929, -1.487, -1.075, 1, -.621, -1.384, 1.869, 
       0.425, -.239, 1.058, .886, -.619, 2.206, -.255, -1.424, -.144, .208)
(a-min(a) / max(a) - min(a))

## problem 6
mpg <- mtcars$mpg
z <- function(m, num) {
  m <- sort(m)
  if (num > length(m)) {
    warning("Ask for less observations")
  } else {
    return(mean(m[0:num]))
  }
}
z(mpg, 5)
z(mpg, 50)

## problem 7
myplt <- function(x,y, ...){
  mylist <- list(...)
  plot(x,y, ...)
  if(any(names(mylist) == "xlab"))
    cat("xlab was supplied as ", mylist$xlab, "\n")
}
myplt(1:5, 1:5, xlab = "The X Axis")
