library(readr)
powerConsumption <- read_delim('./household_power_consumption.zip', delim=';')

library(dplyr)
usedPowerConsumption <- filter(powerConsumption, Date == '1/2/2007' |  Date == '2/2/2007')

library(lubridate)
usedPowerConsumption <- mutate(usedPowerConsumption, datetime = dmy_hms((paste(Date, Time))))

png('./plot3.png')
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")
with(usedPowerConsumption, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(usedPowerConsumption, lines(datetime, Sub_metering_1))
with(usedPowerConsumption, lines(datetime, Sub_metering_2, col="red"))
with(usedPowerConsumption, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = c(1, 1, 1), col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()