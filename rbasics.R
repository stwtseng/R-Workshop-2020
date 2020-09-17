# R code is run line by line
# '#' symbol denotes comments and are not run
# You can be creative with # symbols to delineate code segments

###############################################
##### Running Code Directly from R Script #####
###############################################

# Code is run and output appears in the console
# You can run code as you type into script
# Hotkey: Command + Enter OR Ctrl + Enter

print("hello world") # Runs the print function. Output appears in console.

################################
##### Basics of R Language #####
################################

# R is an object-oriented programming language
# Manipulate and analyze "objects" in R's current "environment" using "functions"

# Functions take the general form of: function(argument1, argument2, ...)
sum(1, 2, 3, 4)

# Assign values to objects with <- 
x <- 1

# Call objects 
x # Outputs x
print(x) # Prints object x

x <- c(1, 2, 3, 4, 5, 6) # Assigning new values to existing objects replaces the values
y <- c(1, 2, 3, 4, 5, 6)

matrix <- matrix(c(x, y), 6, 2) # Be wary of naming objects the same name as a function
matrix

dat <- data.frame(matrix)
dat

############################
##### Other Handy Tips #####
############################

# Use ? symbol to get help
?matrix
?matrix()
?lm()

# Clear the console with Ctrl + L

# Clear the environment with the broom or the following command
rm(list = ls())