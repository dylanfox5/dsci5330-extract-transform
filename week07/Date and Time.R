### Date and Times

library(tidyverse)
library(lubridate)
library(nycflights13)

### Date #############
today()
now()

ymd("2017-01-31")
mdy("January 31st, 2017")
dmy("31-Jan-2017")

ymd(20170131)

##### Date and Time ##############
ymd_hms("2017-01-31 20:11:59")
mdy_hm("01/31/2017 08:01")
ymd(20170131, tz = "UTC")


View(flights)
flights %>%
    select(year, month, day, hour, minute)

flights %>%
    select(year, month, day, hour, minute) %>%
    mutate(departure = make_datetime(year, month, day, hour, minute))

as_datetime(today())
as_date(now())

### Unix Epoch 1970 -01 -01 
as_datetime(60 * 60 * 10)
as_date(365 * 10 + 2)
