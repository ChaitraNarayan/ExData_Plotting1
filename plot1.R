########### plot1.R   #################

pdata <- read.table("./project1/household_power_consumption.txt",sep = ";",skip=66637,nrows = 2880,na.strings = "?")
colnames(pdata) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powerDataSubset$Date <- as.Date(pdata$Date,"%d/%m/%Y")
library(lubridate)
datetime <- paste(pdata$Date,pdata$Time)
timeInS <- as.numeric(seconds(strptime(datetime,format = "%d/%m/%Y %H:%M:%S")))
pdata$Time <- timeInS

hist(pdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="./project1/plot1.png",width=480,height=480,units="px")
dev.off()