#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

bm_pm25_df <- subset(pm25_df, pm25_df$fips == "24510")
agg_bm_pm25_df <- aggregate(x=bm_pm25_df$Emissions, by=list(year=bm_pm25_df$year), FUN="sum", na.rm=TRUE)

png(filename="plot2.png")
barplot(height=agg_bm_pm25_df$x
        , names.arg=agg_bm_pm25_df$year
        , main="PM2.5 emissions in Baltimore City"
        , xlab="Year"
        , ylab="PM2.5 emissions (Tons)")
dev.off()