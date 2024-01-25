myData <- read.csv("Company_Payroll_8_23(1).csv")

e_age <- myData$Age
Mean <- mean(e_age)
Mean
sd <- sd(e_age)
sd

# To subtract a number, such as 5, from every element in "e_age", 
# the line of code below will do this, and also define it as a new vector A:

A <- (e_age - 5)

#Let us also assume that after you subtract 5 from each of these elements, 
#you want to element-wise square each of those differences (at the same time) 
#(that is, it squares each of the elements in a vector). 
#Below will do this, and define the results in a new vector B:
  
B <- (e_age - 5)^2

B <- A^2

#Note here that B is a vector. Suppose we want to add all of these elements together, 
#and define the sum as a variable S. Below will do this:
  
S <- sum((e_age - 5)^2)
  
#Two alternative and equivalent ways of doing the same thing using the variable definitions 
#are shown below. If you are new at coding, the following may be more preferable since it 
#allows easier ways of debugging code
  
  S <- sum(A^2)
  S <- sum(B)

#Take each element in "e_age", subtract the arithmetic mean of "e_age" from each 
#element in "e_age", square those differences, then add up all of those values. 
#What is the value of this calculation?
  
  
C <- sum((e_age - Mean)^2)
C
#Vertical box plot
boxplot(e_age)

#boxplot(myData$Age, main='Box Plot of Age (in years)', col='lightgreen')

#boxplot(myData$Age, horizontal=F, main='Box Plot of Age (in years)', col='lightgreen')

#Horizontal box plot
boxplot(myData$Age, horizontal=T, main='Box Plot of Age (in years)', col='lightgreen')

#to construct a histogram of a univariate set of data (say, X), the following line of code 
#will do:
  
hist(e_age)

hist(myData$Hourly_Wage, main='Histogram of Wages', xlab = 'Hourly Wage', col='lightblue')



z_payamt <- (myData$Pay_Amount - mean(myData$Pay_Amount))/sd(myData$Pay_Amount)

#If you haven't already done so, store the ages of all employees in a vector called "e_age",
#then create a new vector "ze_age" that standardizes the vector "e_age" as described in the 
#previous problem.

ze_age <- (e_age - mean(e_age))/sd(e_age)
ze_age
mean(ze_age)
sd(ze_age)

gmean <- function(x){
  exp(mean(log(x)))
}

gmean(abs(ze_age))

