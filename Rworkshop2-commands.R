############################################
# R Workshop for Intermediate Users
# by Jeho Park, Harvey Mudd College
############################################

# Data Import
# ==============================
cpds <- read.csv(file.path('.', 'data', 'cpds.csv'))
head(cpds) # good to look at a few lines
class(cpds) # data.frame

# Data import from **the Internet**
data <- read.table(file="http://scicomp.hmc.edu/data/R/normtemp.txt", header=T)
tail(data)

# read.table caution
rta <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE)
dim(rta)
rta[1:5, 1:5]
class(rta)
class(rta$time) # what? let's see ?read.table more carefully

rta2 <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE, stringsAsFactors = FALSE)
class(rta2$time)

# Data Export
#=============================

write.csv(data, file = "temp.csv", row.names = FALSE) 
save.image(file="myenv.RData") 
# Q: How to load them back later?
# try ?load

# Subsseting
#=========================
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

subset(mtcars, gear == 5) # use of subset function for data frames

# Graphics (base graphics)
#=============================
attach(mtcars) # Attach mtcars to search path
plot(wt, mpg) # notice objects are called by their names, not mtcars$wt
plot(wt, mpg, 
     main = "Regression of MPG on Weight",
     xlab = "Weight", 
     ylab = "MPG")
plot(wt, mpg, ann = FALSE) #annotation!

# chaging/editing plots
abline(h=25) # a reference line
abline(lm(mpg~wt)) # look at the argument, what's lm?
title(main = "Regression of MPG on Weight", xlab = "Weight", ylab = "MPG")

# Manipulating graphs (base package)
#=============================
par()              # view current settings
orig_par <- par(no.readonly = TRUE)  # save current settings execpt r.o. attributes
par(col.lab="red") # red x and y labels 
plot(wt, mpg)      # create a plot with these new settings 
par(orig_par)      # restore original settings
plot(wt, mpg)
plot(wt, mpg, col.lab="red") # change settings within plot()

?par # see all the options

# R Programming
#===================

mult_fun <- function(a = 1, b = 1) {
  return(a*b)
}

mult_fun  # show the function's code
mult_fun(2,3) # function call
mult_fun() # would this be an error?

x <- 10; y <- 20
x + y
`+`(x, y)

# Loops
#==================
for(i in 1:10) {
  print(i)
}

i <- 0
while(i < 5) {
  i <- i + 1 
  print(i)
}

# If-else statement
#====================
# if (condition1) {
#  # do this when condition1 == TRUE
#} else if (condition2) {
#  # do this when condition2 == TRUE
#} else {
#  # else do this
#}

# Vectorization
#====================
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

# Good Coding Style Practices
#======================
# see the slides

# Exercise 
# Write an R function that will take an input vector 
# and set any negative values in the vector to zero.
# Name it nonneg_vec

# try 
nonneg_vec(c(3, 5, -1, 2, -4)) # error? why?

# then try this
source("nonneg_vec.R")
# and then this again
nonneg_vec(c(3, 5, -1, 2, -4)) 

# Thank you!
