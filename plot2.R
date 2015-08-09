# Coursera: Exploratory Data Analysis
# Course Project 1
# plot2.R

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
png(filename = 'plot2.png',height=480, width=480, bg='white')

with(myData,plot(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
     Global_active_power,
     type='n',xlab='',
     ylab='Global Active Power (kilowatts)'))

with(myData,lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
     Global_active_power))

dev.off()

