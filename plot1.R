library(readr)
powerConsumption <- read_delim('./household_power_consumption.zip', delim=';')

library(dplyr)
usedPowerConsumption <- filter(powerConsumption, Date == '1/2/2007' |  Date == '2/2/2007')

library(lubridate)
usedPowerConsumption <- mutate(usedPowerConsumption, datetime = dmy_hms((paste(Date, Time))))

png('./plot1.png')
hist(usedPowerConsumption$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()