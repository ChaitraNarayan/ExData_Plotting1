########### plot3.R   #################

#Reading the data of 1/2/2007 and 2/2/2007
pdata <- read.table("./project1/household_power_consumption.txt",sep = ";",skip=66637,nrows = 2880,na.strings = "?")

#Adding column names to the data subset
colnames(pdata) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Formatting the date
pdata$Date <- as.Date(pdata$Date,"%d/%m/%Y")

#Formatting the time
library(lubridate)
datetime <- paste(pdata$Date,pdata$Time)
timeInS <- as.numeric(seconds(strptime(datetime,format = "%d/%m/%Y %H:%M:%S")))
pdata$Time <- timeInS

#plot 3
with(pdata,plot(Time,Sub_metering_1,ylab = "Energy sub metering",xaxt="n",xlab = "",type = "l"))
lines(pdata$Time,pdata$Sub_metering_2,col="red")
lines(pdata$Time,pdata$Sub_metering_3,col="blue")
axis(side=1,at=c(min(pdata$Time),median(pdata$Time),max(pdata$Time)),labels = c("Thu","Fri","Sat"))
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1,lty = c(1,1,1))
dev.copy(png,file="./project1/plot3.png",width=480,height=480,units="px")
dev.off()
