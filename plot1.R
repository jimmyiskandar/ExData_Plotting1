# load data
data <- read.csv("household_power_consumption.txt", sep=";")

# subset data to get 2/1/2007 and 2/2/2007 only
subdata <- subset(data,Date=='2/1/2007'|Date=='2/2/2007')

# png file
png(file="plot1.png")
hist(as.numeric(subdata$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
