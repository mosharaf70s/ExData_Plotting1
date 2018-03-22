
# R Coding standards:
# 1. use a text editor
# 2. use indentation (4 spaces; 8 spaces)
# 3. limit the width of the code (80 columns)
# 4. limit the length of individual functions
##---------------------------------------------------

hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$dt <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc_sub <- subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(hpc_sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", breaks = 13, ylim = c(0,1200), xlim = c(0, 6))


plot(hpc_sub$dt, hpc_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(hpc_sub$dt, hpc_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

points(hpc_sub$dt, hpc_sub$Sub_metering_2, type = "l", col = "red")

points(hpc_sub$dt, hpc_sub$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))