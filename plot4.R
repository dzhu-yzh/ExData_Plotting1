#Load the data
data_file <- "household_power_consumption.txt"
raw_data <- read.table(data_file, header = TRUE, sep = ";", na.strings = "?")

#Convert date and time
raw_data$Time <- strptime(paste(raw_data$Date, raw_data$Time), '%d/%m/%Y %H:%M:%S')
raw_data$Date <- as.Date(raw_data$Date, '%d/%m/%Y')

#subsetting the data
start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')
plot_data <- subset(raw_data, Date >= start_date & Date <= end_date)

#Make the plot
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(plot_data, plot(Time, Global_active_power, type = "l", 
                     xlab = "", ylab = "Global Active Power (kilowatts)"))
with(plot_data, plot(Time, Voltage, type = "l", 
                     xlab = "datetime", ylab = "Voltage"))
with(plot_data, plot(plot_data$Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering"))
with(plot_data, lines(plot_data$Time, Sub_metering_2, col = "red"))
with(plot_data, lines(plot_data$Time, Sub_metering_3, col = "blue"))
legend("topright", pch = 1, col = c("black", "red", "blue"), lty = 1, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(plot_data, plot(plot_data$Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()