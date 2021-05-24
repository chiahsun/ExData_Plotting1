library(readr)
powerConsumption <- read_delim('./household_power_consumption.zip', delim=';')

library(dplyr)
usedPowerConsumption <- filter(powerConsumption, Date == '1/2/2007' |  Date == '2/2/2007')

library(lubridate)
usedPowerConsumption <- mutate(usedPowerConsumption, datetime = dmy_hms((paste(Date, Time))))

png('./plot4.png')
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")
par(mfrow = c(2, 2), mar=c(4, 4, 2, 1))

# 1
with(usedPowerConsumption, plot(datetime, Global_active_power, type="l", ylab = "Global Active Power", xlab=""))
# 2
with(usedPowerConsumption, plot(datetime, Voltage, type="l", ylab = "Voltage"))
# 3
with(usedPowerConsumption, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(usedPowerConsumption, lines(datetime, Sub_metering_1))
with(usedPowerConsumption, lines(datetime, Sub_metering_2, col="red"))
with(usedPowerConsumption, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", bty="n", lty = c(1, 1, 1), col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# 4
with(usedPowerConsumption, plot(datetime, Global_reactive_power, type="l"))
dev.off()
