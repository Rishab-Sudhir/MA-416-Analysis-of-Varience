myData <- read.csv("Company_Payroll_8_23(1).csv")
e_age <- myData$Age
Mean <- mean(e_age)
Mean
sd <- sd(e_age)
sd

# To subtract a number, such as 5, from every element in "e_age", 
# the line of code below will do this, and also define it as a new vector A:

A <- (e_age - 5)