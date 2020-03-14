library(data.table)
library(dplyr)
library(tidyr)
library(lubridate)
epcdata<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, na.strings = "?",)
febdata<-subset(epcdata, Date %in% c("1/2/2007", "2/2/2007"))
# Plot 1
png("plot1.png", width=480, height=480)
hist(febdata$Global_active_power,  xlab="Global Active Power (kilowatts)", ylab="Frequency",main = "Global Active Power", col="red")
dev.off()


