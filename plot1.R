library(dplyr) # include dplyr for filter function


household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)
household_data$DateTime <- paste(household_data$Date, household_data$Time)
household_data$DateTime <- as.Date(household_data$DateTime, format = "%d/%m/%Y %H:%M:%S")
filtered_data <- filter(household_data , DateTime >= as.Date("2007-02-01 00:00:00"), DateTime <= as.Date("2007-02-02 00:00:00"))

png("plot1.png")
hist(filtered_data$Global_active_power, xlab= "Global Active Power (kilowatts)", main = "Global Active Power", col = c("red"))
dev.off()
