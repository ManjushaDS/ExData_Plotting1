# read data into R
files <- file("./household_power_consumption.txt")
hpc <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE) ,sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")

# Plot 3

# open device
if(!file.exists("plots")) dir.create("plots")
png(filename = "./plots/plot3.png", width = 480, height = 480, units="px")

# convert data and time to specific format
hpc$Date <- as.Date(hpc$Date, format = '%d/%m/%Y')
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time))

# plot figure
plot(hpc$DateTime, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
# close device
dev.off()