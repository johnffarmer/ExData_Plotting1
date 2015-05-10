household_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",stringsAsFactors=FALSE)
household_data$DateTime <- paste(household_data$Date, household_data$Time)
household_data$DateTime <- strptime(household_data$DateTime, "%d/%m/%Y %H:%M:%S")

filtered_data <- household_data[household_data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot3.png")
plot(filtered_data$DateTime, filtered_data$Sub_metering_1 , type = "l", xlab = "", ylab = "Energy sub metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, col = "blue")
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'), bty='y', cex=.75)
dev.off()
