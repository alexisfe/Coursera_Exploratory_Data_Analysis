source("loadData.R")

df <- loadData()

png(filename="plot4.png")

par(mfrow = c(2, 2))
plot(df$Time, df$Global_active_power
     , xlab=""
     , ylab="Global Active Power (kilowatts)"
     , type="l")

plot(df$Time, df$Voltage
     , xlab="datetime"
     , ylab="Voltage"
     , type="l")

plot(df$Time, df$Sub_metering_1
     , xlab=""
     , ylab="Energy sub metering"
     , type="l")
lines(df$Time, df$Sub_metering_2, col="red")
lines(df$Time, df$Sub_metering_3, col="blue")
legend("topright"
       , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , col=c("black", "red", "blue")
       , lty=c(1, 1, 1)
       , cex=0.6)

plot(df$Time, df$Global_reactive_power
     , xlab="datetime"
     , ylab="Global_reactive_power"
     , type="l")
dev.off()
