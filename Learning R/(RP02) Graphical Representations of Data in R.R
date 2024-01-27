mydata <- read.csv("Company_Payroll_8_23(1).csv")

#A one dimension line plot for univariate data

n <- length(mydata$Hourly_Wage)
y <- replicate(n,0)
#replicates 0 n times, so that we can plot a 2 dimensional points on a one dimensional line

plot(mydata$Hourly_Wage, y, main="Hourly Wage", xlab="Hw")

#A box plot for univariate data

boxplot(mydata$Hourly_Wage, horizontal=T, main="box plot of hourly wage",
             xlab="Hourly wage in Dollars",
             col ="springgreen"
        )
#Now lets compare data using various plots

Companydata <- data.frame(mydata$Age, mydata$Hourly_Wage, mydata$Hours_Worked)

boxplot(Companydata, horizontal=T, main="Box plots comparing: Age, Hourly_Wage, Hours_Worked ",
        names=c("age","Hourly Wage","Hours Worked"),
        col=c("springgreen","lightblue","pink")
)

#using box plots with different units, is misleading so we have to normalize the data

# most common ways is to take the z scores of all the values ie create boxplots for the z scores 
# of the data.

Companydata <- data.frame(((mydata$Age -mean(mydata$Age))/sd(mydata$Age)), 
                          ((mydata$Hourly_Wage -mean(mydata$Hourly_Wage))/sd(mydata$Hourly_Wage)), 
                          ((mydata$Hours_Worked -mean(mydata$Hours_Worked))/sd(mydata$Hours_Worked))
                          )

boxplot(Companydata, horizontal=T, main="Box plots comparing: Age, Hourly_Wage, Hours_Worked ",
        names=c("age","Hourly Wage","Hours Worked"),
        col=c("springgreen","lightblue","pink")
)

#Histograms

#First lets create a discrete normally distributed dataset

s<- rnorm(10000, mean = 124, sd = 2.45)

hist(s, breaks = 50, main= "sample histogram", xlab = "X in (cm)", col="orchid")

#Lets now make a barplot for some categorical data

favcolor <- c("green","blue","red")
favcolorfreq <- c(18,29,12)

barplot(favcolorfreq, main="favorite color frequency",
        names=favcolor,
        col=favcolor)

#Pie charts

favcolorpercents <- round((favcolorfreq/sum(favcolorfreq))*100)
names_percents <- paste(favcolor, favcolorpercents, "%") 
#paste basically adds the percent and % to every color in favcolor for labelling
names_percents

pie(favcolorpercents, main="Pie chart of color preference", labels = names_percents,
    col=favcolor)

# Graphical representation for multivariate data
install.packages ("fmsb")
library(fmsb)

pchar <- c("Openness", "Conscientiousness", "Extraversion", "Agreeableness", "Neuroticism")

# Sample on a continuous scale from 0 to 10
person1 <- c(3.2, 8.7, 5.4, 9.3, 2.1)
person2 <- c(8.7, 7.6, 4.3, 9.7, 8.3)

#Radar Charts

persons <- rbind(person1,person2)
persons
#this creates a matrix with 2 rows

#assigning names to each column on the dataset
colnames(persons) <- pchar
persons

# to use a radar chart correctly from the fmsb package you need to assign max and min values
# for each column in the matrix

personswithMinMax <- data.frame(rbind(rep(10,5),rep(0,5), persons))
personswithMinMax

#rbind(rep(10,5),rep(0,5), persons) here we are creating a repeat of 10 for 5 rows and 0 for 5 rows

radarchart(personswithMinMax)
radarchart(personswithMinMax,
           cglty=1, cglcol="gray", 
           # this determins the background lines
           plty=1, pcol=c("steelblue", "orchid"), plwd=1,
           # this is for the lines representing the 
           # the persons, p1wd determines the width
           pfcol=c(rgb(0, 0, 1, 0.1), rgb(0.5, 0, 0.5, 0.1)),
           # this determines the shading inside the lines
           # (red, green, blue, opacity)
           vlcex = 0.7
           # this changes the size of the text
           )



