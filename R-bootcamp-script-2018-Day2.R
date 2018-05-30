## Graphics (base graphics)
# =============================
attach(mtcars) # Attach mtcars to search path
plot(wt, mpg) # notice objects are called by their names, not mtcars$wt
plot(wt, mpg, 
     main = "Regression of MPG on Weight",
     xlab = "Weight", 
     ylab = "MPG")
plot(wt, mpg, ann = FALSE) 

# Changing/adding the details afterwards
abline(h=25) # a reference line
abline(lm(mpg~wt)) # look at the argument, lm = linear model
title(main = "Regression of MPG on Weight", xlab = "Weight", ylab = "MPG")

## Manipulating graphs (base package)
# =============================
par()              # view current settings
orig_par <- par()  # save current settings
par(col.lab="red") # red x and y labels 
plot(wt, mpg)      # create a plot with these new settings 
par(orig_par)      # restore original settings
plot(wt, mpg)
plot(wt, mpg, col.lab="red") # change settings within plot()
?par # see all the options

## ggplot2 graphics
# =============================
library(ggplot2) # load ggplot2
p <- qplot(wt, mpg) # quick plot (backward compatibility)
p 
p + geom_smooth(method = "lm", se = TRUE) # lm, se (standard error) 

# ggplot2 comes with themes, for example, 
p + theme_bw() # white background and black grid lines

## Using ggplot function
ggp <- ggplot(mtcars, aes(wt, mpg)) + geom_point() 
ggp 
ggp + labs(x = "Weight", y = "MPG", title = "Regression of MPG on Weight")

## Wrap-up exercise (15-20 min)
# ============================

## Managing R Project
# =========================
save.image("r-bootcamp.Rdata") # save workspace  
rm(list=ls()) # remove all objects
load("r-bootcamp.Rdata") # bring the workspace back
save.image() # by default it saves workspace to .Rdata 

# R working directory
curr_wd <- getwd() # returns absolute path to the working directory
setwd("data") # change working directory to data folder
setwd(file.path('~', 'Desktop'))
# R Packages
require("datasets") # load/attach datasets
ls('package:datasets') 
airmiles # airmiles object in datasets package
airmiles <- 0 # Oops! overwritten?
airmiles # global namespace
datasets::airmiles # package namespace
rm(airmiles) # removes user defined object airmiles

## An Example (Messy Data)
preg <- read.csv("./data2/preg.csv", stringsAsFactors = FALSE)
preg

# transposed data
read.csv("./data2/preg2.csv", stringsAsFactors = FALSE)
## An Example (Tidy Data)
# ====================
library(tidyr)
library(dplyr)
preg2 <- preg %>% 
  gather(treatment, n, treatmenta:treatmentb) %>%
  mutate(treatment = gsub("treatment", "", treatment)) %>%
  arrange(name, treatment)
preg2

## Data Wrangling with dplyr: verbs
# ==================
head(msleep)
names(msleep)

## Data wrangling examples
# ===================
sleepData <- select(msleep, name, sleep_total)
head(sleepData)

#### Filtering rows with `filter()`:
longsleep <- filter(msleep, sleep_total >= 16) # simple filtering
head(longsleep)
filter(msleep, sleep_total >= 16, bodywt >= 1) # filtering with more than one conditions (AND).

## Pipe operator: %>%
#  ==================
head(select(msleep, name, sleep_total)) # nesting functions

msleep %>%
  select(name, sleep_total) %>%
  head



## Module 5: Programming (scripting) in R
## User-defined Functions
# ===================

mult_fun <- function(a = 1, b = 1) {
  return(a*b)
}

mult_fun  # show the function's code
mult_fun(2,3) # function call
mult_fun() # would this be an error?

# A function returns the last value operated
x <- 10; y <- 20
x + y
`+`(x, y)

## Loops
## For loops
# ==================
for(i in 1:10) {
  print(i)
}

## While loops
i <- 0
while(i < 5) {
  i <- i + 1 
  print(i)
}

## Vectorization
# ====================

########## a bad loop, with 'growing' data
set.seed(42);
m=1000; n=1000;
mymat <- replicate(m, rnorm(n)) # create matrix of normal random numbers
system.time(
  for (i in 1:m) {
    for (j in 1:n) {
      mymat[i,j] <- mymat[i,j] + 10*sin(0.75*pi)
    }
  }
)

#### vectorized version
set.seed(42);
m=1000; n=1000;
mymat1 <- replicate(m, rnorm(n))
system.time(
  mymat1 <- mymat1 + 10*sin(0.75*pi)
)

## If-else statement
# ====================


## Debugging R Code
# ===================

# eof
  