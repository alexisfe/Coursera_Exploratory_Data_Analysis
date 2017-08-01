source("loadData.R")

df <- loadData()

png(filename="plot3.png")
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
dev.off()
