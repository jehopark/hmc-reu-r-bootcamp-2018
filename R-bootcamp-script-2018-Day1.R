## R Bootcamp Day 1
## Jeho Park
## Module 0, Module 1, and Module 2

#Look Ma, R can do Math!  ---------
1+1
2+runif(1,0,1)
2+runif(1,min=0,max=1)
3^2
3*3
sqrt(3*3) # comments
# comments are preceded by hash sign

# Even More Math! -----------
integrand <- function(x) {1/(sqrt(x)*(x+1))} # define the function
integrate(integrand, lower=0, upper=Inf) # integrate the function from 0 to infinity


# Some General Stuff -----------
demo() # display available demos
demo(graphics) # try graphics demo
library() # show available packages on the computer
search() # show loaded packages
?hist # search for the usage of hist function
??histogram # search for package documents containing the word "histogram"

# Workspace of R ------------
a <- 5 # notice a in your Environment window
A <- "text" 
a
A
ls()
print(c(a,A))
print(a,A)

# Vector -----------
# A vector is an array object of the same type data elements.
class(a)
class(A)
B <- c(a,A) # concatenation
print(B)
class(B) # why?

# Matrix -----------
# A matrix is a two-dimensional rectangular object of the same type data elements
mat <- matrix(rnorm(6), nrow = 3, ncol = 2) 
mat # a matrix
dim(mat) # dimension
t(mat) 
summary(mat) 

# List -------------
# A list is an object that can store different types of vectors. 
list1 <- list(name=c("Joseph"), married=T, kids=2)
list1
list1$kids <- list1$kids+1
list1$kids
list2 <- list(numeric_data=a,character_data=A)
list2
all_list <- list(list1, list2)
all_list # a list of lists

# Data Frame ----------
# A data frame is used for storing data tables. It is a list of vectors of equal length. 
n <- c(2, 3, 5) # a vector 
s <- c("aa", "bb", "cc") # a vector
b <- c(TRUE, FALSE, TRUE) # a vector
df <- data.frame(n, s, b) # a data frame
df
mtcars # a built-in (attached) data frame
mtcars$mpg
plot(mtcars$mpg, mtcars$hp) # what to expect?

# Continued
my_df <- data.frame(y1=rnorm(100),y2=rnorm(100), y3=rnorm(100))
head(my_df) # display first few lines of data
names(my_df) # display column names
summary(my_df) # output depends on the data types
plot(my_df)

# Factor ------------
# Factors are a special compoud object used to represent categorical data such as gender, social class, etc.
# Factors have 'levels' attribute. They may be nominal or ordered.
v <- c("a","b","c","c","b")
x <- factor(v) # turn the character vector into a factor object
z <- factor(v, ordered = TRUE) # ordered factor
x
z
table(x)

## Converting between different types --------
integers <- 1:10
as.character(integers)
as.numeric(c('3.7', '4.8'))
indices <- c(1.7, 2.3)
integers[indices] # sometimes R is too generous
integers[0.999999999] # close to 1 but...
df <- as.data.frame(mat)
df

## Getting help online and offline
# no code to run

## The end of module 1
## Wrap-up exercise

## Module 2

# Data Import ----
cpds <- read.csv(file.path('.', 'data', 'cpds.csv'))
head(cpds) # good to look at a few lines
class(cpds) # data.frame

data <- read.table("http://lib.stat.cmu.edu/jcgs/tu", skip=4, header=T)
tail(data)

# Data Import (Cont.) ----
rta <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE)
dim(rta)
rta[1:5, 1:5]
class(rta)
class(rta$time) # what? let's see ?read.table more carefully

rta2 <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE, stringsAsFactors = FALSE)
class(rta2$time)

# Data and Plot Export ----
write.csv(data, file = "temp.csv", row.names = FALSE) 
save.image(file="myenv.RData")

pdf('myplot.pdf', width = 7, height = 7) # call pdf() before calling plot()
x <- rnorm(10); y <- rnorm(10)
plot(x, y)
dev.off()

# Subsetting --------
# Three operators: [, [[, and $
# -------------------
x <- c("a", "b", "c", "c", "d", "a")
x[1]
x[1:4]
x[x > "a"] 
u <- x > "a" # what's u here?
u
x[u] # subsetting using a boolean vector
y <- list(foo=x, bar=x[u]) 
y
y[[1]]
y$bar

# use of subset function
five_gears <- subset(mtcars, gear == 5) # use of subset function for data frames

# Data frame vs matrix ----
m = matrix(1:400000, 2, 200000) # esp. for a large number of columns!
d = as.data.frame(m)
object.size(m) # 1600200 bytes
object.size(d) # 22400568 bytes

# Graphics (base graphics) ----
attach(mtcars) # Attach mtcars to search path
plot(wt, mpg) # notice objects are called by their names, not mtcars$wt
plot(wt, mpg, 
     main = "Regression of MPG on Weight",
     xlab = "Weight", 
     ylab = "MPG")
plot(wt, mpg, ann = FALSE) 


abline(h=25) # a reference line
abline(lm(mpg~wt)) # look at the argument, what's lm?
title(main = "Regression of MPG on Weight", xlab = "Weight", ylab = "MPG")

# Manipulating graphs (base package) ----

par()              # view current settings
orig_par <- par()  # save current settings
par(col.lab="red") # red x and y labels 
plot(wt, mpg)      # create a plot with these new settings 
par(orig_par)      # restore original settings
plot(wt, mpg)
plot(wt, mpg, col.lab="red") # change settings withing plot()

?par # see all the options

## The end of Module 2
## Wrap-up exercise

