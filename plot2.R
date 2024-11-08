###plot 2

##Setting wd loading data
setwd("H:/Mina dokument_filer/Kurser/R programming")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfile = 'data.zip')
unzip("H:/Mina dokument_filer/Kurser/R programming/data.zip")

INDATA <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ",")
##Filtering dates
# converting string to date 
# filter date and converting string to numeric
pdata <- INDATA[INDATA$Date %in% c("1/2/2007","2/2/2007") ,]

#converting to numeric
Global_active_power <- as.numeric(pdata$Global_active_power)

#merging date and time and setting to time format
DateTime <- strptime(paste(pdata$Date, pdata$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#setting days as x-axis variables
days <- as.POSIXct(c("2007/02/01 00:00", "2007/02/02 00:00", "2007/02/03 00:00"))
day_labels <- c("Thu", "Fri", "Sat")

#creating plot and printing to a png file
png("plot2.png", width=480, height=480)
plot(DateTime, Global_active_power, type = "l", ylab = "Global active Power (kilowatts)", xlab = "", xaxt = "n")
axis(1, at = days, labels = day_labels)

dev.off()