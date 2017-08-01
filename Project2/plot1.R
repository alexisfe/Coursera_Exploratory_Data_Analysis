#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

agg_pmt25_df <- aggregate(x=pm25_df$Emissions, by=list(year=pm25_df$year), FUN="sum", na.rm=TRUE)

png(filename="plot1.png")
barplot(height=agg_pmt25_df$x
        , names.arg=agg_pmt25_df$year 
        , main="PM2.5 emissions in the US"
        , xlab="Year"
        , ylab="PM2.5 emissions (Tons)")
dev.off()