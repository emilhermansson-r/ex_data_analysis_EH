##Checking that computer can handle dataset
Memory_GB <- ((2075259*1) + (2075259*8)) / (1024^3) 
RAM_Comp <- 8
Can_handle <- Memory_GB < RAM_Comp
Can_handle

##plot 1:

##Setting wd loading data
setwd("H:/Mina dokument_filer/Kurser/R programming")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" , destfile = 'data.zip')
unzip("H:/Mina dokument_filer/Kurser/R programming/data.zip")

INDATA <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ",")
##Filtering dates
# filter date and converting string to numeric
pdata <- INDATA[INDATA$Date %in% c("1/2/2007","2/2/2007") ,]
Global_active_power <- as.numeric(pdata$Global_active_power)

##Creating plots
png("plot1.png", width=480, height=480)
hist((Global_active_power), col = "red", main = "Global active power", xlab = "Global active power (kilowats)", ylab = "Frequency")
dev.off()