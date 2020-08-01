
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

data_subset<- subset(data, Date %in%  c("1/2/2007","2/2/2007") )
data_subset$Date <- as.Date(data_subset$Date,format="%d/%m/%Y")
#hist(data_subset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
data_subset$Date
#hist(data_subset$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
data_subset$Global_active_power <- as.numeric (as.character(data_subset$Global_active_power))
hist(data_subset$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
png("plot1.png", width=480, height=480)
dev.off()


