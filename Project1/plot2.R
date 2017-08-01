source("loadData.R")

df <- loadData()

png(filename="plot2.png")
plot(df$Time, df$Global_active_power
     , xlab=""
     , ylab="Global Active Power (kilowatts)"
     , type="l")
dev.off()
