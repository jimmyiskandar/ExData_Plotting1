# load data
data <- read.csv("household_power_consumption.txt", sep=";")

# subset data to get 2/1/2007 and 2/2/2007 only
subdata <- subset(data,Date=='2/1/2007'|Date=='2/2/2007')

# png file
png(file="plot2.png")

# convert to date time
dateTime <- strptime(paste(subdata$Date,subdata$Time),"%m/%d/%Y  %H:%M:%S")

# make sure in chronological order
oi <- order(dateTime)

# to posix time
day <- as.POSIXct(round(dateTime[oi], "hour"))

# plot global active power
plot(dateTime[oi],as.numeric(subdata$Global_active_power[oi]),xaxt="n",type="l",xlab="",ylab="Global Active Power (kilowatts)")

# plot axis
axis.POSIXct(1, day[oi], format="%A")

dev.off()

