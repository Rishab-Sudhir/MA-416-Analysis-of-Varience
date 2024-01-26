myData <- read.csv("Company_Payroll_8_23(1).csv")

#MO2 Tasks

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

#Creating a function that calculates the geometric mean of some data
gmean <- function(x){
  exp(mean(log(x)))
}

gmean(abs(ze_age))

# MO3 Tasks

mean(myData$Hourly_Wage)
sd(myData$Hourly_Wage)


#On occassion, we may need to have more precision on the number of decimal places 
#for our answers. If R-studio does not produce enough digits that you desire, 
#run the following line of code before your calculations and it will help you 
#out (the number 15 is just an example number):

options(digits = 12)
gmean(myData$Hourly_Wage)

#When you want to compare values/vectors to numbers, the logical operators >, <, >=, <=, == 
#(equal to), and != (not equal to) can be used.

#If you want to extract a subset of a vector that satisfies some particular critieria,
#the which function together with logical comparisons can be used. For example,
#suppose you want to create a vector of all hourly wages for all individuals that worked at 
#least 20 hours in the given week. The below line of code will do this:

wage_fulltime <- myData$Hourly_Wage[which(myData$Hours_Worked >= 20)]

mean(wage_fulltime)

wage_fulltime <- myData$Hourly_Wage[which(myData$Hours_Worked < 25)]

sd(wage_fulltime)

wage_fulltime <- myData$Hourly_Wage[which(myData$Hours_Worked > 30)]

var(wage_fulltime)

#Defining a vector such as "X <- (mydata$Hours_Worked > 30)" 
#(parentheses not required, but recommended) will return a logical/binary vector of  
#0's (false) and 1's (true), where 0 corresponds to "does not match this criteria" 
#and 1 corresponds to "does match this criteria".

#You can count the number of people that satisfy some criteria via:
  
#sum(mydata$Hours_Worked > 30)

#and you can easily calculate the proportion of a vector that satisfies some criteria via:
  
#mean(mydata$Hours_Worked > 30)

sum(mydata$Hourly_Wage > 20)

mean(mydata$Hours_Worked <= 25)

mean(mydata$Job_Rank == 'Associate')

mean(mydata$Efficiency_Factor_Obs > mean(mydata$Efficiency_Factor_Obs))

#To calculate the sample covariance between two numerical vectors A and B, the 
#following will do:
  
#cov(A, B)

#To calculate the correlation coefficient between two numerical vectors A and B, 
#the following will do:
  
#cor(A, B)

cov(mydata$Prior_Experience,mydata$Efficiency_Factor_Obs)

cor(mydata$Prior_Experience,mydata$Hourly_Wage)

cor(mydata$Age,mydata$Hours_Worked)


plot(myData$Age, myData$Hours_Worked, main="Hours Worked v. Age", 
     pch=16, cex=0.5, col='blue', xlab='Age', ylab='Hours Worked')

#Sometimes it is necessary to import librarys into your R-studio environment, 
#especially if such libraries contain complex algorithms, functions, 
#and structures that are difficult to manually code 
#(although being able to manually code them does come with its own set of advantanges).

#To bring a library into R-studio, it comes in two phases: installing the package,
#and importing the library.

#One library that contains several good alternatives to the R-studio
#base function plot(...) is the library "ggplot2".

if(!require(ggplot2)) install.packages(ggplot2)
library(ggplot2)

#The library "ggplot2" alternative to the base plot(...) function is ggplot(...).

#This plotting function works a bit differently than plot(...). 
#The function plot(...) requires your X in the first input, 
#and your Y in the second input of the function.

#ggplot(...) will take a data frame as its first input 
#(which "mydata" is already defined as). Since data frames usually 
#contain multiple columns, ggplot(...) needs to know which columns to 
#pull from for the X and Y components of the graph.

#the following lines of R code will produce a blank ggplot object with mydata$Age on the 
#horizontal axis and mydata$Hours_Worked on the vertical axis
ggplot(myData, aes(Age, Hours_Worked))


#In continuation of the previous problem, you should note that no points have 
#been generated on your ggplot object; that's because you haven't added them (literally).

#To add features to your ggplot object, you can follow the ggplot(...) 
#function with a plus sign, and any additional features for which you 
#desire to add to the object, each seperated with another plus sign 
#(if there is more than one).

#This will add blue points to your ggplot object.

ggplot(myData, aes(Age, Hours_Worked))+geom_point(color='blue')

#ggplot(...) objects are very versatile in their ability to generate visually aesthetic 
#graphs; but its not just about making your graphs pretty, but it can allow you to analyze 
#data in sophisticated ways as well. Pattern recognition with coding can help analyze
#multivariate data.

#Using your original ggplot(...) object with Age on the horizontal axis and Hours Worked 
#on the vertical axis, which one of the following lines of R code will generate points on 
#the ggplot object with a color scheme with respect to the employees hourly wage?

ggplot(myData, aes(Age, Hours_Worked))+geom_point(aes(color=Hourly_Wage))

                                                  