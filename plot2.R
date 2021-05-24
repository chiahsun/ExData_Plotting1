library(readr)
powerConsumption <- read_delim('./household_power_consumption.zip', delim=';')

library(dplyr)
usedPowerConsumption <- filter(powerConsumption, Date == '1/2/2007' |  Date == '2/2/2007')

library(lubridate)
usedPowerConsumption <- mutate(usedPowerConsumption, datetime = dmy_hms((paste(Date, Time))))

png('./plot2.png')
Sys.setlocale(category = "LC_ALL", locale = "en_US.UTF-8")
with(usedPowerConsumption, plot(datetime, Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=""))
dev.off()