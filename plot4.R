# load data
data <- read.csv("household_power_consumption.txt", sep=";")

# subset data to get 2/1/2007 and 2/2/2007 only
subdata <- subset(data,Date=='2/1/2007'|Date=='2/2/2007')

# png file
png(file="plot4.png")

# convert to date time
dateTime <- strptime(paste(subdata$Date,subdata$Time),"%m/%d/%Y  %H:%M:%S")

# make sure in chronological order
oi <- order(dateTime)

# to posix time
day <- as.POSIXct(round(dateTime[oi], "hour"))

par(mfcol=c(2,2))

##### plot 1

# plot global active power
plot(dateTime[oi],as.numeric(subdata$Global_active_power[oi]),xaxt="n",type="l",xlab="",ylab="Global Active Power (kilowatts)")

# plot axis
axis.POSIXct(1, day[oi], format="%A")

##### plot 2

# plot sub meterings
plot(dateTime[oi],as.numeric(subdata$Sub_metering_2[oi]),ylim=c(0,28),xaxt="n",type="l",col="red",xlab="",ylab="Energy sub metering")
lines(dateTime[oi],as.numeric(subdata$Sub_metering_1[oi]),col="black")
lines(dateTime[oi],as.numeric(subdata$Sub_metering_3[oi]),col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty=1,col=c("black","red","blue"))

# plot axis
axis.POSIXct(1, day[oi], format="%A")

##### plot 3

# plot voltage
plot(dateTime[oi],as.numeric(subdata$Voltage[oi]),xaxt="n",type="l",xlab="",ylab="Voltage")

# plot axis
axis.POSIXct(1, day[oi], format="%A")

##### plot 4

# plot global reactive power
plot(dateTime[oi],as.numeric(subdata$Global_reactive_power[oi]),xaxt="n",type="l",xlab="",ylab="Global Reactive Power")

# plot axis
axis.POSIXct(1, day[oi], format="%A")

dev.off()
