#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(ggplot2)

mrg_df <- merge(pm25_df, scct_df, by="SCC")
mrg_coal_df <- subset(mrg_df, grepl("Coal", EI.Sector)) 
agg_coal_df <- aggregate(x=mrg_coal_df["Emissions"], by=list(year=mrg_coal_df$year, Sector=mrg_coal_df$EI.Sector), FUN="sum", na.rm=TRUE)

png(filename="plot4.png", width=600, height=480)
ggplot(data=agg_coal_df, aes(x=year, y=Emissions, color=Sector)) +
  ggtitle("PM2.5 emissions in the US for coal combustion-related sources") +
  xlab("Year") +
  ylab("PM2.5 Emissions (Tons)") +
  geom_smooth(method=loess)
dev.off()
