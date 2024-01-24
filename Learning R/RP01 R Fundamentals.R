myData <- read.csv("Company_Payroll_8_23(1).csv")
print(myData)

dataFrame1 <- data.frame(myData)
#preferred container for manipulating data

#get all the columns
names(dataFrame1)

#get all the first names
dataFrame1$First_Name

#get the dimensions of data
dData <- dim(dataFrame1)

mD <- dData[1] #No of rows
nD <- dData[2] #No of Columns

row1 <- myData[1, 1:nD]
row1
row7 <- myData[7, 1:nD]
row7
col2 <- myData[1:mD, 2]
col2

#Columns are associated to classes, so there are better ways of organizing

colAge <- myData[["Age"]]
# same as 
colAge2 <- myData$Age
colAge2

# orders the Age as per the the indices
AgeOrderedIndicies <- order(myData$Age)
AgeOrderedIndicies 

# Creating a new data frame which has the ages ordered as per the indices

dataFrame2 <- data.frame(Name = myData$First_Name[AgeOrderedIndicies],
                         Age = myData$Age[AgeOrderedIndicies])

dataFrame2

# Count the number of ages greater than 27

sum(myData$Age > 27)

# True/False values

myData$Age > 27

# As a percentage

sum(myData$Age > 27)/length(myData$Age)

# percentage of individuals between a certain age range

sum((myData$Age > 27) & (myData$Age <= 34))/length(myData$Age)

# Arithmatic Mean

Amean <- mean(myData$Age)
Amean

# Geometric Mean

Gmean <- exp(mean(log(myData$Age)))
Gmean

# median

med <- median(myData$Age)
med

# Range

range <- max(myData$Age) - min(myData$Age)
range

# Standard Deviation

sd <- sd(myData$Age)
sd

# Creating a frame to store all this information

frametitles <- c("AMean", "GMean", "Median", "Range", "Stdev") 
framevalues <- c(Amean, Gmean, med, range, sd)

# In order to control the number of decimals we need to format the frame
# default set nsmall to the number of decimal places you want to round to 
# This is a roundabout way, you can also do it while creating the frame

#format(round(framevalues, 3), nsmall = 3) 

dataFrame3 <- data.frame(Metric = frametitles,
                         MetricValues = round(framevalues,3))
dataFrame3
