library(data.table)
library(dplyr)
library(tidyr)
library(lubridate)
epcdata<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, na.strings = "?",)
febdata<-subset(epcdata, Date %in% c("1/2/2007", "2/2/2007"))
str(febdata)
febdata$Date<- as.Date(febdata$Date, format="%d/%m/%Y")
head(febdata$Date)
DateTime <- paste(as.Date(febdata$Date),febdata$Time)
febdata$DateTime<-as.POSIXct(DateTime)
head(febdata$DateTime)
str(febdata)

##plot4

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(1,1,2,1))
with(febdata, plot(Global_active_power ~ DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
with(febdata, plot(Voltage~DateTime, type="l",ylab="Voltage", xlab="DateTime"))
with(febdata, plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab=""))
with(febdata, lines(Sub_metering_2~DateTime,col="red"))
with(febdata, lines(Sub_metering_3~DateTime,col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(febdata,plot(Global_reactive_power~DateTime, type="l",ylab="Global Rective Power (kilowatts)",xlab="DateTime"))

dev.off()
