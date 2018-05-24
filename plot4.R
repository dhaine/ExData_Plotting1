## Panel plot.

source("data_load.R")
Sys.setlocale("LC_ALL", "en_CA.utf8")

power$date_time <- ymd_hms(paste(power$Date, power$Time))

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(power$date_time, power$Global_active_power,
     type = "l", ylab = "Global Active Power",
     xlab = "")

plot(power$date_time, power$Voltage,
     type = "l", xlab = "datetime",
     ylab = "Voltage")

plot(power$date_time, power$Sub_metering_1,
     type = "n", xlab = "", ylab = "Energy sub metering")
lines(power$date_time, power$Sub_metering_1, col = "black")
lines(power$date_time, power$Sub_metering_2, col = "red")
lines(power$date_time, power$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1),
       bty = "n")

plot(power$date_time, power$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
