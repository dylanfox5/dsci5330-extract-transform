library(tidyverse)
bb1 <- read_csv("BedBath1.csv")
bb1
arrange(bb1, X6)
bb1A <- filter(bb1, Bed == "house and land")
bb1A2 <- bb1A %>%
        select(SerText, Bath, SqFt, State, X6) %>%
        rename(Bed = Bath, Bath=SqFt, SqFt=State, State=X6)

bb1B <- filter(bb1, Bed != "house and land")
bb1B2<- select(bb1B, SerText, Bed, Bath, SqFt, State)
bb1D <- bind_rows(bb1A2, bb1B2)
bb1D


bath<-as.numeric(sub(" 1/2", ".5", bb1D$Bath))
bb1E <- bind_cols(bb1D, bath)
bb1E <- rename(bb1E, bath = ...6)

bb1New <- select(bb1E, SerText, Bed, bath, SqFt, State)
View(bb1New)

bb1New$ID <- regmatches(bb1New$SerText, regexpr("[APH][[:digit:]]{6}",
                                                bb1New$SerText))
bb1New
sqft <- regmatches(bb1New$SqFt, regexpr("([[:digit:]]+)", bb1New$SqFt))
sqft

bb1New <- bind_cols(bb1New, as.numeric(sqft))
bb1New
bb1New <- rename(bb1New, sqft = ...7)
bb1New$Bed <- as.integer(bb1New$Bed)
bb1working <- select(bb1New, ID, Bed, bath, sqft, State)
bb1working


