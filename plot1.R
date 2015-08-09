# Coursera: Exploratory Data Analysis
# Course Project 1
# plot1.R

# load sqldf library
library(sqldf)

# selectively load only the data needed for the analysis
# selecting on Feb 1-2, 2007
mySql<-"select * from file where Date='1/2/2007' or Date='2/2/2007'"
myFile="../ExploratoryDataAnalysis/household_power_consumption.txt"
myData<-read.csv.sql(myFile,mySql,header=TRUE,sep=';')
# close connection to the source file
closeAllConnections()

# plot will be output to a png file with dimensions of
# 480x480 as instructed in the assignment
png(filename = 'plot1.png',height=480, width=480, bg='white')

with(myData,hist(Global_active_power,col='Red',xaxt='n',yaxt='n',
     ,xlab='Global Active Power (kilowatts)',xlim=c(0,6),
     ,ylim=c(0,1200),
      main='Global Active Power'))
axis(side=1,at=seq(0,6,2))
axis(side=2,at=seq(0,1200,200))
axis(side=2,at=seq(0,1200,400))

dev.off()