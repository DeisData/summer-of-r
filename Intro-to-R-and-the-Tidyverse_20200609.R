#-----------------------------------------------------------------------
##   SUMMER OF R 2020
##   Introduction to R and the Tidyverse

##   Margarita Corral, PhD
##   mcorral@brandeis.edu

##   Claire Pontbriand, PhD
##   cpontbriand@brandeis.edu 
#-------------------------------------------------------------------------

##  WHAT IS R?

##   R is a programming language designed for statistical computing. It is not just
##  a statistics package, it is a language



##   RStudio
##   A free R integrated development environment (ide). It is cleaner and simpler 
##   than the default R GUI

##   Useful features: syntax highlighting and tab for suggested code auto-completion. 
##      it has a  4-pane workspace: 
##          Top left window: it is the R code editor. 
##          Bottom left: interactive console. 
##          Top right window: shows your workspace which includes a list of objects currently in memory, history tab. 
##          Bottom right: shows plots, external packages available on your system, files in your working directory, help files

##   Useful shortcuts: tab (auto-complete function), control+ the up arrow or command + up arrow (auto-complete tool that works only in the interactive console. control + enter or command + enter(executes the selected lines of code)

##------------------------------------------  
##  THINGS TO KEEP IN MIND                -
##------------------------------------------
##  Case sensitive
##  # for comments (Keyboard Shortcuts:Ctrl+Shift+C (windows)	Cmd+Shift+C(Mac) )
##  R Does not care about spaces between commands or arguments
##  Names should start with a letter and should not contain spaces
##  You Can use "." in object names (e.g., "my.data")
##  Use forward slash ("/") in path names, even on Windows

#
##------------------------------------------------
##  WORKING DIRECTORY 
#the folder on your computer in which you are working
##------------------------------------------------
#Current working directory
getwd()
##to change your working directory
setwd("insert the new path here") 
## to see what you have in your working directory
list.files()

##-------------------
##  R as a calculator
##-------------------
3+7
5*5
5^2


##Some expressions return a logical value: TRUE or FALSE

4==5
8>3

##-------------------
##  Creating Objects
##-------------------

##However, it would be more useful if we assigned values to objects. We create an object by
# giving it a name followed by the assignment "<-" operator
# Shortcuts: Alt + - (Windows) or Option + - (Mac)

weight_kg <- 60

weight_lb <- 2.2 * weight_kg


weight_lb # Print the value of weight_lb
weight_kg <- 100 # Overwrites your object. Be careful! no warning is given

rm(weight_lb) # Deletes that object



### Storing many numbers as a vector, #c for combine or concatenate

Myvector1 <- c(1,3,4,5) # c for combine/concatenate
Myvector2 <- c(1:7) 
Myvector3 <- seq (1,6, by=0.5)

Myvector1
Myvector2
Myvector3


##you can also store characters
greeting <- "hello"
greeting
days <- c ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
days
days[3] # to extract element 3. R indexes from 1, not 0. -1 will not get the last value, it excludes that item
days [-1]
days [c(1,3)]


### Zoom Poll: Code to extract Tuesday, Wednesday and Thursday


##Replacing/Adding new elements
greeting [2] <- "How are you?"
greeting

## Zoom Poll: Replace the 3rd element in Myvector2 with a 10




##c assumes that everything in your vector is of the same data type (all # or all characters)
Myvector4<- c(1,2,"hello")
Myvector4

#If we have different types of data we need to use the list function

Mylist <- list (1,3, "hello", TRUE)

Mylist

##-------------------
##  Functions
##-------------------

## A function is a piece of code to carry out a specified task. R has many built-in functions
sum(1,3,5)

mean(Myvector1)

length(Myvector1)

max(Myvector1)

rep ("hi", times=3)

#If we want to learn more about a function we can ask for help
help(mean)
?rep


##-------------------
##  Functions
##-------------------

## We can bring in extra functions by downloading packages. Packages are collections of functions.
## There are thousands of add-on packages available at the CRAN (Comprehensive R Archive Network)
## For instance, we have the tidyverse, an "opinionated collection of R packages designed for data science" - www.tidyverse.org These packages are designed to make data wrangling, analysis, and graphing much simpler and more enjoyable. 

#To install a package we use the function install.packages ("package name"). We only need to install a package once.

install.packages("tidyverse")

#If we want to use the functions in a package, we need to load it in R using the library() function

library(tidyverse) 


##------------------------------
##  USING THE TIDYVERSE PACKAGES
##------------------------------

# Tidyverse packages share a philosophy of data organization, i.e. they all expect tidy data.

# Tidy data is set up so that each row is an observation and each column is a variable.  
  
  

##------------------------------
## Importing Data
##------------------------------



# We're going to be looking at data from the World Happiness Report (https://worldhappiness.report) #We will use the function read_csv () that comes with the Tidyverse

#We are storing the data set as a data frame called world_happines
world_happiness <- read_csv('world_happiness.csv')


# We can use the View function to look at our dataframe

View(world_happiness)

#We can get a general summary for the dataframe using summary()

summary(world_happiness)

#If we just want to see the summary for one column, we can use $ between the name of the data frame and the name of the column
summary(world_happiness$Happiness_score)


#lets work with just one country for now
United_States<-filter(world_happiness,Country == 'United States' )

United_States


## If we want to select specific columns, we can use the  select() function

US_happiness <- select(United_States, Country, Year, Happiness_score) 





#Next week we will learn how to visualize data, here we just show you an example of a graph we could do with this data frame

ggplot(United_States)+geom_point(aes(x=Year, y=Happiness_score))+ylab('Happiness Score')

##Exercise

##Extract happiness levels for 2018 for the United States, Mexico, and Canada



##Useful Resources

# Base R Cheat Sheet: https://rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf
# RStudio Cheatsheets: https://rstudio.com/resources/cheatsheets/



