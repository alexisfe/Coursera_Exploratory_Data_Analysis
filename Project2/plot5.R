#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)

mrg_df <- merge(pm25_df, scct_df, by="SCC")
mrg_bm_df <- subset(mrg_df, fips == "24510" & grepl("Vehicle", SCC.Level.Two))
agg_mv_bm_df <- aggregate(x=mrg_bm_df["Emissions"], by=list(year=mrg_bm_df$year, Source=mrg_bm_df$SCC.Level.Two), FUN="sum", na.rm=TRUE)

png(filename="plot5.png", width=600, height=480)
ggplot(data=agg_mv_bm_df, aes(x=year, y=Emissions, color=Source)) +
  ggtitle("Motor vehicle PM2.5 emissions in Baltimore City") +
  xlab("Year") +
  ylab("PM2.5 emissions (Tons)") +
  geom_smooth(method=loess)
dev.off()