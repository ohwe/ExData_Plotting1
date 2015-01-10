dataset <- read.csv(file = "household_power_consumption.txt", sep = ';', 
                colClasses = c(rep("character", 2), rep("numeric", 7) ), na.strings = c("?") )
db <- subset(dataset, Date == '1/2/2007' | Date == '2/2/2007')
## useful <- grepl('^[12]/2/2007', yhh$Date)
## db <- yhh[useful,]
rm(dataset)

db$Time <- strptime(paste(db$Date,db$Time), format = "%d/%m/%Y %H:%M:%S")
db$Date <- as.Date(db$Date, format = "%d/%m/%Y")


png("plot1.png", width=480, height=480)
hist(db$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global active power", col = "red")
dev.off()


