source("loadData.R")

df <- loadData()

png(filename="plot1.png")
hist(df$Global_active_power
     , xlab="Global active power (kilowatts)"
     , main="Global Active Power"
     , col="red")
dev.off()
