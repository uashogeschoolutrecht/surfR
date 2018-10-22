## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.width = 5, fig.height = 3)

## ---- root_1, include=FALSE----------------------------------------------
## defines the root of the project for later use
require("rprojroot") || utils::install.packages("rprojroot")
library(rprojroot)
root <- find_root_file(criterion = is_rstudio_project)

vector <- c(1:10, NA, NA, NA,  3, "marc")
vector
missing <- is.na(vector)

typeof(missing)

missing_num <- as.numeric(missing)
missing_num

sum(missing_num)
sum(missing)

sum(is.na(vector))
vector

sum(vector)


## ------------------------------------------------------------------------
# install.packages("tidyverse")
library(tidyverse)

## ---- eval=FALSE---------------------------------------------------------
## ## installing `{affy}` package
## ## try http:// if https:// URLs are not supported
## source("https://bioconductor.org/biocLite.R")
## biocLite("affy")
## 
## ## loading affy package and the vignettes pages of this package
## # library(affy)
## # browseVignettes("affy")

## ---- eval=FALSE---------------------------------------------------------
## #install.packages("dplyr")
## library(dplyr)
## library(ggplot2)
## ??dplyr
## ??ggplot2
## ?mean
## ??mean  # goes to the page with functions related with '.mean.'
## apropos("mean") # search on more options of or alternatives for a certain function

## ---- eval=FALSE---------------------------------------------------------
## example(mean) # to see a worked example
## demo(graphics) # demonstration of R functions

## ---- error=FALSE, message=FALSE, warning=FALSE--------------------------
# ?rnorm
hist(rnorm(100))

seed <- c(1:4)

set.seed(seed)
q <- rnorm(n = 10000, mean = 20, sd = 2)
hist(q)
## no naming
# set.seed(1234)
qq <- rnorm(10000, 20, 2)
all(q == qq)

## ------------------------------------------------------------------------
c(2,8,5) 	# combines its arguments to form a vector
nv_1 <- c(2,8,5) # assignment statement
nv_1 # view the content of the object "nv_1"

## ------------------------------------------------------------------------
nv_2 <- c(8.4,5.6,10.1,13.1,2.5,7.8,15.2,3.8,20.9)
nv_2
class(nv_2)

## ------------------------------------------------------------------------
big_numbers <- rnorm(10, mean = 10000000, sd = 2)
big_numbers %>% formatC(format = "e", digits = 2)

number <- c(1000)
formatC(number, format = "e", digits = 3)

large_number <- c(2.55858868688584848)


round(large_number, digits = 3)


sqrt(large_number * 1000 /200 * 2^6)  



## ------------------------------------------------------------------------
small_numbers <- runif(10, min = 0.001, max = 0.1) %>% print()
small_numbers %>% round(digits = 2)

## ------------------------------------------------------------------------
cv <- c("this is", "an", "example of", "1", "character", "vector", "with length:", "length(cv)")
cv
sum(cv)

length(cv)
class(cv)

## ------------------------------------------------------------------------
int <- as.integer(1:5)
int
length(int)
class(int)

example_int <- c(1.4, 1.6, 7.9)
typeof(example_int)

as.integer(example_int)



## ------------------------------------------------------------------------
lv <- c(TRUE, FALSE, TRUE, TRUE)
lv
class(lv)
## logical vectors can also be converted to numeric vectors
nlv <- as.numeric(lv)
nlv
## note that coercion of a logical to a numeric vector changes the "TRUE" value to 1 and the "FALSE" value to 0

## ------------------------------------------------------------------------
a <- c(1,3,5,7,9)
b <- c(2,4,6,8)

z1 <- a - b
z1


z2 <- b - a
z2
z3 <- a / b
z3

## ------------------------------------------------------------------------
z4 <- sum(a)
z4
z5 <- max(a) - max(b)
z5

## ------------------------------------------------------------------------
numbers_times <- rep(1:4, times = 4) %>% print()
numbers_each <- rep(1:4, each = 4) %>% print()

## ------------------------------------------------------------------------
library(modelr)
x <- rcauchy(100)
hist(x)

## ------------------------------------------------------------------------
seq_range(x, n = 10)
seq_range(x, n = 10, trim = 0.1)
seq_range(x, by = 1, trim = 0.1) 

## ------------------------------------------------------------------------
y <- runif(100)
seq_range(y, n = 10)
seq_range(y, n = 10, pretty = TRUE)
seq_range(y, n = 10, expand = 0.5, pretty = TRUE)

## ------------------------------------------------------------------------
x <- c(8, 5, 10, 13, 2, 7, 15, 3, 20, 8)
x # create vector with 10 variables
length(x)
mode(x) # information on data mode (numeric, character, logic)


## ------------------------------------------------------------------------
x
x[3] ## creating a subset by indexing:
x[c(3, 4, 7)] # apply a simple function

mean(x[c(2,5)]) # example of a function

## ------------------------------------------------------------------------
i <- 5
x[c(i, i+2)] # (i = 5 & i = 7), i-th element
x[-2] # all but the ith (second) element
x[3:5] # element 3 to 5
x[x > 9] # all greater than some value

## ------------------------------------------------------------------------
set.seed(1234)
h <- rnorm(n = 1000, mean =  0, sd = 2)
plot(h)
h
max(h)
min(h)


hist(h[larger_than_0 <- h > 0 | h < -5], main = "title", xlab = "units",
     ylab = "units")






## ------------------------------------------------------------------------
ind <- h < 0
h[ind] %>% plot()

## ------------------------------------------------------------------------
hist(h, breaks = 20)

## ---- fig.align='center', fig.height=4, fig.width=8----------------------
index <- h > -4 & h < 4
par(mfrow = c(1,2))
hist(h, breaks = 20)
hist(h[index], breaks = 20)

## ------------------------------------------------------------------------
pp <- c(x, 0, x)
pp 
sum(c(pp, c(1:5), c(1,2, c(1:10)))) # sum of elements in the 'concatenated' vector

## ------------------------------------------------------------------------
c <- c(1:7,9,11) # dependent variable (response)
d <- c(1:9) # independent variable (terms)

## ------------------------------------------------------------------------
m1 <- lm(c ~ d)
m1$coefficients

## ------------------------------------------------------------------------
summary(m1)

## ------------------------------------------------------------------------
plot(d, c, ylim=c(0,13))

## ------------------------------------------------------------------------
plot(d, c, ylim=c(0,13), abline(m1), 
     main = "Regression Example",
     xlab = "Terms", ylab = "Response")  #abline plots the correlation model in the graph

## ------------------------------------------------------------------------
tbl_df <- tibble(x = d, y = c)

## ---- results='hold'-----------------------------------------------------
ggplot(data = tbl_df, aes(x = x, y = y)) +
  geom_point(colour = "darkred", size = 3) +
  geom_smooth(method = "glm", se = TRUE, formula = y ~ x, colour =         "darkblue") +
  ggtitle("Regression Example") + xlab("Terms") + ylab("Response")

## ---- echo=FALSE, results='hold'-----------------------------------------
source(file.path(root, "code", "panel_ggplot2_base_combined.R"))

## ---- eval=FALSE---------------------------------------------------------
## w <- c("1", "2")
## u <- c("a", "b", "c")
## z6 <- w-y
## z7 <- u+w

## ------------------------------------------------------------------------
w <- c("1", "2")
u <- c("a", "b", "c")
z8 <- paste(u,w, sep = "_")
z8 ## because w is shorter than u, it get's recycled over u

## ---- eval = FALSE-------------------------------------------------------
## rm(list=ls())
## root <- find_root_file(criterion = is_rstudio_project)
## ## Note: never use this in code that is meant for others!!!

## ------------------------------------------------------------------------
lst <-list(first_names = c(male = "Fred", female = "Mary"), no.children = 3, child_ages=c(4,7,9),
child_names = c("Suzy", "Marvin", "Jane"), address = c("Pandmonium Alley 114, Chaosville"),
marital_status = TRUE)
length(lst) # number of elements in the list
head(lst, 2)

## ------------------------------------------------------------------------
lst[[1]] # 1st element of List
lst[[3]][2] # second item of third element
names(lst) # named elements in this list
lst$child_names # pull "named" elements from a list using `$` operator

## ------------------------------------------------------------------------
str(lst) # display structure of lst

## ------------------------------------------------------------------------
lst$child_ages[3] 
lst[[6]][2] # returns the value of the second element for your variable

## ------------------------------------------------------------------------
purrr::map(lst, is.na)

## ------------------------------------------------------------------------
people_df <- data.frame(age=c(24, 27, 19, 34),      
                       sex=c("F","F","M", "M"), 
                       weight=c(64, 55, 80, 70),
                       names = c("Christa", "Suzan", 
                                 "Matt", "John"))
head(people_df)

## ------------------------------------------------------------------------
people_tbl <- tibble::tibble(age=c(24, 27, 19, 34),      
                       sex=c("F","F","M", "M"), 
                       weight=c(64, 55, 80, 70),
                       names = c("Christa", "Suzan", 
                                 "Matt", "John"))
people_tbl

## ------------------------------------------------------------------------
summary(people_df)
table(people_df)

head(people_df) 			# gives the content of the data frame
names(people_df) 
str(people_df)

people_df$age # gives the content of the variable "age" from the data frame ""


## ------------------------------------------------------------------------
people_df$age[1] 	# first element of this vector
people_df[,2] 	# content of 2nd variable (column) which is a character vector -> factor
people_df[1,] 	# content of the 1st row
# multiple indices
people_df[2:3, c(1,3)] # remember to use c


## ------------------------------------------------------------------------
library(tidyverse)
path_to_gender_age_data <- file.path(root, "data", "gender.txt")
gender_age <- read_delim(path_to_gender_age_data,
                         delim = "/")

## ------------------------------------------------------------------------
# getting the first few rows 
head(gender_age)
# getting information on the variable, the dimensions
str(gender_age)
# selecting a variable
gender_age$gender
gender_age$age
gender_age[1:6,2]

## ------------------------------------------------------------------------
library(readr)
skin <- read_csv(paste0(root, "/data/skincolumns.csv")) 
str(skin)

## ------------------------------------------------------------------------
head(skin)	 # content of the data frame
dim(skin)
attributes(skin)
summary(skin)
## ?read_csv 	 # help on the function

## ------------------------------------------------------------------------
mean(skin$`Genotype A`)
mean(skin$`Genotype B`)

# to remove the NA
skin_noNA <- na.omit(skin)
mean(skin_noNA$`Genotype B`)

## ------------------------------------------------------------------------
set.seed(6000) # set it at the same number, then we will all produce the same output
gender<-c(sample(c(1,2), size=1000, replace=TRUE))
smoke<-c(sample(c(1,2), size=1000, replace=TRUE))
age<-c(sample(c(1,2,3), size=1000, replace=TRUE))
weight<-round(rnorm(1000, mean=65, sd=10),1)
smoking <- data.frame(cbind(gender, smoke, age, weight))

## ------------------------------------------------------------------------
head(smoking, 5)
smoking[1:5,]

## ------------------------------------------------------------------------
# replace numbers by characters
smoking$genderf=factor(smoking$gender, labels=c("female","male"))
table(smoking$genderf,smoking$gender)
smoking$smokef=factor(smoking$smoke, labels=c("Y","N"))
table(smoking$smokef,smoking$smoke)
smoking$agecf=factor(smoking$age, labels=c("A: <15","B: 15-30","C: >30"))
table(smoking$agecf,smoking$age)
summary(smoking)


## ------------------------------------------------------------------------
library(tidyverse)
names(smoking)
smoking_male <- smoking %>% filter(genderf == "male")
smoking_age_gender <- smoking %>% select(genderf, agecf)


## ------------------------------------------------------------------------
library(tidyverse)
names(smoking)
# create a logical index
smoking_male_index <- smoking[, "genderf"] == "male" 
smoking_male <- smoking[smoking_male_index, ]
# slecting only age and gender
smoking_age_gender <- smoking_male[, c(1,3)]

## ------------------------------------------------------------------------
library(dplyr)
set.seed(12345)    
zzz <- sqrt(mean(x <- rnorm(10000, mean = 34, sd = 2))) +
sqrt(mean(y <- rnorm(10000, mean = 23, sd = 4)))
zzz

## ------------------------------------------------------------------------
set.seed(12345)
qqq <- rnorm(10000, mean = 34, sd = 2) %>% 
  mean() %>% 
  sqrt() + rnorm(10000, mean = 23, sd = 4) %>% 
  mean() %>% 
  sqrt()
qqq

zzz == qqq

## ------------------------------------------------------------------------
## it is handy to have the names of the dataset variables at hand when writing pipes

names(smoking)
str(smoking)

## ------------------------------------------------------------------------
smoking_weight <- smoking %>% select(genderf, smokef, weight, agecf) %>%
  group_by(genderf, smokef, agecf) %>% summarise(mean_weight = mean(weight)) %>%
  arrange(desc(mean_weight))

head(smoking_weight)

## ------------------------------------------------------------------------
knitr::purl("hands_ons/part1_intro_to_rstudio_and_r.Rmd", output = "../hands_ons")

