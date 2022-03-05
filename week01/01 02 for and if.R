##### Control Functions for and if

############################### for loop #####################
# for (i in values) { 
#     do this and that
#}

j <- c(1:10)
for (i in j){
    q <- 10*i +i
    print(q)
}

##### Many loops in R are not necessary
q <- 10*j+j
q

# but the apply family is already here: apply(), lapply(), sapply() and tapply()

# For those avid bird watchers
count <- matrix(c(3,2,4, 6,5, 1, 8, 6, 1), ncol=3)
colnames(count) <- c('sparrow', 'dove', 'crow')
print(count)
apply(count, 2, max)
apply(count, 1, sum)



######### Conditional if Statments ###############

hours <- 120
pph <- 40

ifelse(hours < 100, netp <- hours*pph, netp<- hours*pph*0.9)

##################################################################
priceCalc <- function(hours, pph){
    netp <- hours*pph
    if(hours > 100) netp <- netp*0.9
    round(netp)
}

priceCalc(110, 40)


priceCalc <- function(hours, pph, public=TRUE){
    netp <- hours*pph
    if(hours > 100) netp <- netp*0.9
    if(public) {
        tot.price <- netp*1.06
    } else{
        tot.price <- netp*1.12
    }
    round(tot.price)
}

priceCalc(110, 40, FALSE)

