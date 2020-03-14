library(data.table)
library(dplyr)
library(tidyr)
library(lubridate)
epcdata<-read.table("household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE, na.strings = "?",)
febdata<-subset(epcdata, Date %in% c("1/2/2007", "2/2/2007")) # subsetting for dates
str(febdata)
febdata$Date<- as.Date(febdata$Date, format="%d/%m/%Y") # converting "Date" as.Date
head(febdata$Date)
DateTime <- paste(as.Date(febdata$Date),febdata$Time) # merging date and Time
febdata$DateTime<-as.POSIXct(DateTime) # converting "DateTime" as.POSIXct 
head(febdata$DateTime)
str(febdata)

## PLot2
png("plot2.png", width=480, height=480)
with(febdata, plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()









