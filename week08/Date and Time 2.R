# Date and Time 2
library(lubridate)

# Extracting components
datetime <- ymd_hms("1963-05-14 15:15:06")

year(datetime)
month(datetime)
mday(datetime)
yday(datetime) # day of the year
wday(datetime) # day of the week
hour(datetime)
minute(datetime)
second(datetime)

#### with Labels
month(datetime, label = TRUE)

wday(datetime, label = TRUE, abbr = FALSE)

###############################################################################
# Time spans: duration, periods, and intervals

weeklength <- ymd(20210418)-ymd(20210425)
weeklength
age <- today()-ymd(19630514)
age

#duration commands return values in seconds
as.duration(age)

dseconds(15)
dminutes(10)
dhours(c(12, 24))
ddays(0:5)
dweeks(3)
dyears(1)
2 * dyears(1)
dyears(1) + dweeks(12) + dhours(15)

tomorrow <- today() + ddays(1)
last_year <- today() - dyears(1)
    
one_pm <- ymd_hms("2016-03-12 13:00:00", tz = "America/New_York")   

one_pm
one_pm + days(1)

##### Periods 

seconds(15)
minutes(10)
hours(c(12, 24))
days(7)
months(1:6)
weeks(3)
years(1)
    
10 * (months(6) + days(1))
days(50) + hours(25) + minutes(2)
    
#Addition
    ymd("2016-01-01") + dyears(1)
    ymd("2016-01-01") + years(1)
    

    one_pm + ddays(1)
    one_pm + days(1)

##### Intervals
    years(1) / days(1)
    next_year <- today() + years(1)
    (today() %--% next_year) / ddays(1)

    (today() %--% next_year) %/% days(2)
    
######### Time Zones:  Lubridate uses UTC unless otherwise specified
    Sys.timezone()
    length(OlsonNames())
    head(OlsonNames())
    (x1 <- ymd_hms("2015-06-01 12:00:00", tz = "America/New_York"))
    (x2 <- ymd_hms("2015-06-01 18:00:00", tz = "Europe/Copenhagen"))
    (x3 <- ymd_hms("2015-06-02 04:00:00", tz = "Pacific/Auckland"))
    
    x1 - x2
    x1 - x3
    
    x4 <- c(x1, x2, x3)
    x4
    
    x4a <- with_tz(x4, tzone = "Australia/Lord_Howe")
    x4a
    x4a - x4
# time zones are not all integer offsets
    x4b <- force_tz(x4, tzone = "Australia/Lord_Howe")
    x4b

    x4b - x4
    
days <- c(ymd(20020514), ymd(20030615), ymd(20040715))
p <- data.frame(year = year(days), month = month(days), day = day(days))

af <- ymd_hms("2015-07-01 13:00:00", tz="Africa/Asmara")
z <- ymd_hms("2015-07-01 18:00:00", tz="Zulu")
af - z
z - af
