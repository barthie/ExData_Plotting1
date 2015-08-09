# Coursera: Exploratory Data Analysis
# Course Project 1
# plot4.R

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
png(filename = 'plot4.png',height=480, width=480, bg='white')
par(mfrow=(c(2,2)))
with(myData,{
  # top left: same as plot2
  plot(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
                   Global_active_power,
                   type='n',xlab='',
                   ylab='Global Active Power')
  lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
                    Global_active_power)

  # top right :
  plot(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
       Voltage,
       type='n',xlab='datetime',
       ylab='Voltage')
  lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
        Voltage)
  axis(side=2,at=seq(234,246,2))
  
  # bottom left: same as plot3
  plot(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
       Sub_metering_1,
       type='n',xlab='',
       ylab='Energy sub metering')
  lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
        Sub_metering_1)
  lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
        Sub_metering_2, col='red')
  lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
        Sub_metering_3, col='blue')
  axis(side=2,at=seq(0,30,10))
  legend('topright',
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         col=c('black','red','blue'),lwd=2,bty='n')
  
  # top left: same as plot2
  plot(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
       Global_reactive_power,
       type='n',
       xlab='datetime')
  axis(side=2,at=seq(0,0.5,0.1))
  lines(strptime(paste(Date,Time),'%d/%m/%Y %H:%M:%S'),
        Global_reactive_power)
  
}
)
  
dev.off()
