### week 2 homework - dfox

## problem 1

## Pros
## - Data is more accessible, thus easier to acquire data that can lead to groundbreaking advancements
## - Large corporations may find it harder to profit off the collection of data

## Cons
## - Personal data becomes more exposed
## - Becomes hard to maintain clean data

## I'm leaning towards opposing the idea of open data...I think there are use cases when open data 
## should definintely be used. It does help drive advancement. But I am weary of data being
## pubicly open for all to see. As an individual, I've always felt that the collection of data
## from large applications (social media) is what it is -- others in society feel very strongly
## about opposing this. I think total open data could end wrongly for society. This is a very
## interesting and complex topic.

## problem 2

## ASCII is character encoding that modern code language are based in. It represents text in 
## devices. UTF-8 is variable with character encoding that's used for electronic communication.
## A large difference between the two encoding is that ASCII is larger (128 bits), while UTF-8
## is 8 bits. 

## problem 3
df <- read.table(pipe("pbpaste"), sep="\t", header=TRUE)
df

## problem 4
library(jsonlite)
comets <- jsonlite::fromJSON("https://data.nasa.gov/api/views/b67r-rgxc/rows.json?accessType=DOWNLOAD")
comets

## problem 5
library(gdata)
library(xlsx)
el <- read.xlsx("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week02/Exdata.xlsx", 1, header=TRUE)
el[39,]

## problem 6
el <- read.xlsx("/Users/dylanfox/OneDrive - Graceland University/Graduate Work/dsci5330-extract_transform/week02/Exdata.xlsx", 2, header=FALSE)
el[39,]

## problem 7
install.packages('tidyverse')
