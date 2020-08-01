fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
# Checking if archieve already exists.
filename <- "household_power_consumption.zip"
if (!file.exists(filename)){
  fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
  download.file(fileURL, filename, method="curl")
  
}
# Checking if folder exists
if (!file.exists("household_power_consumption")) { 
  unzip(filename) 
}
data <-read.csv(file="household_power_consumption.txt",header = TRUE,sep=";")
data_sub <- subset(data,Date %in% c("1/2/2007","2/2/2007"))
data_sub$Date <- as.Date(data_sub$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(data_sub$Date),data_sub$Time)
data_sub$Datetime <- as.POSIXct(datetime)
with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
