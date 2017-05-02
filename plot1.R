########### plot1.R   #################

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

# Plot 1
hist(pdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="./project1/plot1.png",width=480,height=480,units="px")
dev.off()
