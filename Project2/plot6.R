#Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

mrg_df <- merge(pm25_df, scct_df, by="SCC")
mrg_bm_cal_df <- subset(mrg_df, fips %in% c("24510", "06037") & grepl("Vehicle", SCC.Level.Two))
agg_mv_bm_cal_df <- aggregate(x=mrg_bm_cal_df["Emissions"], by=list(year=mrg_bm_cal_df$year, fips=mrg_bm_cal_df$fips, Source=mrg_bm_cal_df$SCC.Level.Two), FUN="sum", na.rm=TRUE)

city_names <- list(
  '06037'="Los Angeles County",
  '24510'="Baltimore City"
)

png(filename="plot6.png", width=800, height=480)
ggplot(data=agg_mv_bm_cal_df, aes(x=year, y=Emissions, color=Source)) +
  ggtitle("Motor vehicle PM2.5 emissions in Baltimore City vs Los Angeles County") +
  xlab("Year") +
  ylab("PM2.5 emissions (Tons)") +
  geom_smooth(method=loess) +
  facet_grid(.~ fips, labeller = function(variable,value){
    return(city_names[value])
  })
dev.off()