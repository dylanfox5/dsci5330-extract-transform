####################### Acquiring Data ######################

### Manual insertion of data into a data frame
elements <- data.frame()
elements <-edit(elements)
print(elements)

### Reading from the Clipboard in Windows

readClipboard()
df <- read.table(file="clipboard", sep="\t", header=TRUE)
df

# Copying a table from a website 

#### read.table on a *.csv file that may or may not be a *.csv file

read.table("Address.csv", header= TRUE, sep=",", quote="", comment.char = "",
           stringsAsFactors = FALSE)
read.table("Address.csv", header= FALSE, sep=",", quote="", comment.char = "",
           stringsAsFactors = FALSE, nrows=1)
count.fields("addresses.csv", sep=",", quote="", comment.char = "")

read.table("addresses.csv", header= FALSE, sep= ",", quote= "", comment.char = "",
           stringsAsFactors = FALSE, nrows=1, skip=2)
(add<- read.table("addresses.csv", header= TRUE, sep= ",", quote= "", comment = "",
                  stringsAsFactors = FALSE, fill=TRUE))

(addscan <- scan("addresses.csv", what="", sep="\n", quote="", comment.char = ""))
commas <-gregexpr(",", addscan)
length.5 <- lengths(commas) ==5
comma.be.gone <- sapply (commas[length.5], function (x) x[3])
substring(addscan[length.5], comma.be.gone, comma.be.gone) <-";"
addscan

### Directly from EXCEL

library(gdata)
library(xlsx)
el <- read.xlsx("elements.xlsx", 2, header=FALSE)
el

# package xlm2
library(rvest)
webpage <- read_html("https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html")
webpage
results <- webpage %>% html_nodes(".short-desc")
results
first_result <- results[1]
first_result %>% html_nodes("strong")


### JSON
library(jsonlite)
btc <- jsonlite::fromJSON("https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=1d&limit=365")
plot(btc, type="l")

library(rjson)
library(RJSONIO) 

Forest <-fromJSON("https://data.cityofnewyork.us/api/views/7yc5-fec2/rows.json?accessType=DOWNLOAD")
class(Forest)
df <-data.frame(Forset = unlist(Forest))
str(df)

library(httr)
url <-paste0("https://api.census.gov/data/timeseries/", "intltrade/exports/enduse")
cens <- GET (url, query= list( get= "E_ENDUSE,E_ENDUSE_LDESC,ALL_VAL_YR", 
                               YEAR = "2016", MONTH="04"))
do.call (rbind, content(cens)) [1:4,]

########################
readLines("addresses.csv", n=1)
con <- file("addresses.csv", open="r")
readLines(con, n=2)
