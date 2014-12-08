yhh <- read.csv(file = "household_power_consumption.txt", sep = ';', 
                colClasses = c(rep("character", 2), rep("numeric", 7) ), na.strings = c("?") )
useful <- grepl('^[12]/2/2007', yhh$Date)
db <- yhh[useful,]
rm(yhh)

db$Time <- strptime(paste(db$Date,db$Time), format = "%d/%m/%Y %H:%M:%S")
db$Date <- as.Date(db$Date, format = "%d/%m/%Y")


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(db$Time, db$Global_active_power,  type="l", ylab = "Global Active Power (kilowatts)")
plot(db$Time, db$Voltage,  type="l", ylab = "Voltage")

plot(db$Time, db$Sub_metering_1,  xlab = "", ylab = "Energy sub metering", type ="n")
points(db$Time, db$Sub_metering_1,  type="l")
points(db$Time, db$Sub_metering_2,  type="l", col = "red")
points(db$Time, db$Sub_metering_3,  type="l", col = "blue")

plot(db$Time, db$Global_reactive_power,  type="l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()


