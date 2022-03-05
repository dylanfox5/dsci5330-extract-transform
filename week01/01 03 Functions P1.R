##### a simple script #####

x <- c(0.485, 1.271, 0.831)
percent <- x*100
roundpercent <- round(percent, digits=1)
result <- paste(roundpercent, "%", sep="")
print(result)


orgPercent <- function(x){
    percent <- x*100
    roundpercent <- round(percent, digits=1)
    result <- paste(roundpercent, "%", sep="")
    return(result)
}
orgPercent(x)
y <- c(0.112, 0.013, 0.829)
orgPercent(y)

newpercent <- orgPercent(y)
print(newpercent)
class(newpercent)
