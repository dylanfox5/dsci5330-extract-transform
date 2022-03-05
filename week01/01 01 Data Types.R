#### R Objects
# Logical (True, False)
v <- TRUE
class(v)

# Numeric 12.3, 8, 999

v <- 18.6
class(v)

v <- 9
class(v)

# Integer 2L,100L 0L

v <- 2L
class(v)

# Complex 6 + 3i

v <- 2+7i
class(v)

# Character "a"  "19.2" "True"

v<- "a"
class(v)

v<- "19.2"
class(v)

v<- "TRUE"
class(v)

# Raw  "Hello" is stored as 48 65 6c 6c 6f
v <- charToRaw("Hello")
class(v)

###### Creating a vector

vn <- c(1, 2.2, 0.1)
class(vn)

vn <- c(1, "TRUE", 0.1)
class(vn)

vn <- c(1, 6+3i, 0.1)
class(vn)

#### Create a List

list1 <- list(c(1,2,3), "John", 32.1, cos)
list1


### Create a Matrix

M <- matrix(c("d", "c", "e", "n", "h", "t"), nrow=2, ncol=3, byrow=TRUE)
M

### Create an Array

a <- array(c("red", "blue"), dim = c(3,3,2))
a

#### Factors
apples <- c("green", "red", "yellow", "yellow", "green", "red")
factor_apples <- factor(apples)
factor_apples
nlevels(factor_apples)

#### Data Frames

BMI <- data.frame(
    gender = c("Male", "Male", "Female"),
    height = c(142, 253, 165),
    weight = c(81, 96, 78),
    age = c(42, 29, 65))
    
BMI
    

#### Converting Data Types

directions <- c("North", "South", "East", "West")
directions.factor <- factor(directions)    
directions.factor    

as.character(directions.factor)
as.numeric(directions.factor)

numbers <- factor(c(9, 11, 6, 6, 9))
str(numbers)

as.character(numbers)
as.numeric(numbers)
as.numeric(as.character(numbers))
