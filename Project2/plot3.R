#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable
#, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

bm_pm25_df <- subset(pm25_df, pm25_df$fips == "24510")
agg2_bm_pm25_df <- aggregate(x=bm_pm25_df["Emissions"], by=list(year=bm_pm25_df$year, type=bm_pm25_df$type), FUN="sum", na.rm=TRUE)

png(filename="plot3.png")
ggplot(data=agg2_bm_pm25_df, aes(x=year, y=Emissions, color=type)) +
  ggtitle("PM2.5 emissions by type in Baltimore City") +
  xlab("Year") +
  ylab("PM2.5 emissions (Tons)") +
  geom_smooth(method=loess)
dev.off()