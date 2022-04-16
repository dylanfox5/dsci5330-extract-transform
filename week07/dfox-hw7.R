### week 7 homework - dfox

## problem 1
# "Data Dictionaries are for Sharing" allows for a standardization of documentation
# for common data structures and objects. Users can speak to one another with 
# precise vocabulary and know that there is a mutual understanding for specific terms.
# This reduces the amount of work & documentation between users and increases
# the accuracy & efficiency. 

## problem 2
# a) double
# b) "A permanent, unique number assigned by the Geographic Names Information System (GNIS) 
#     to a geographic feature name for the sole purpose of uniquely identifying that name 
#     application as a record in any information system database, dataset, file, or document"

## problem 3
# a) 	"The EARTH_TARGET_POSITION_VECTOR element indicates the x-, y-, z- components 
#     of the position vector from the Earth to the target, expressed in J2000 coordinates,
#     and corrected for light time, evaluated at the epoch at which the image was taken."
# b) John Ho
# c) km

## problem 4
library(lubridate)
as_date(365 * 6 + 5) # 1976-01-05
as_date(-365 * 7 + 2) # 1963-01-05

## problem 5
ymd("1999-04-18") # 1999-04-18
mdy("April 18th, 1999") # 1999-04-18
dmy("18-Apr-1999") # 1999-04-18
