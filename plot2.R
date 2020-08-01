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

## Plot 2
with(data_sub, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
