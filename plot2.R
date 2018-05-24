## Line plot for Global Active Power.

source("data_load.R")
Sys.setlocale("LC_ALL", "en_CA.utf8")

power$date_time <- ymd_hms(paste(power$Date, power$Time))

png("plot2.png", width = 480, height = 480)
plot(power$date_time, power$Global_active_power,
     type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()
