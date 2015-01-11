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

#Make the first plot
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(plot_data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()