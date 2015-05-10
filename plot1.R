household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)
household_data$DateTime <- paste(household_data$Date, household_data$Time)
household_data$DateTime <- strptime(household_data$DateTime, "%d/%m/%Y %H:%M:%S")

filtered_data <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot1.png")
hist(filtered_data$Global_active_power, xlab= "Global Active Power (kilowatts)", main = "Global Active Power", col = c("red"))
dev.off()
