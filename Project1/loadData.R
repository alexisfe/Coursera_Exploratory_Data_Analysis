loadData <- function(){
  #Used to define data types of Date and Time variables
  setAs("character", "hpcDate", function(from) as.Date(from, "%d/%m/%Y"))
  setAs("character", "hpcTime", function(from) strptime(from, "%H:%M:%S"))
  
  #Download from the web and load into dataframe
  temp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  df = read.table(unz(temp, "household_power_consumption.txt")
                  , colClasses=c('hpcDate', 'hpcTime', rep('numeric', 7))
                  , sep=";"
                  , header=TRUE
                  , na.strings='?')
  
  #Subset data to use the necessary date range
  df <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
  
  unlink(temp)
  return (df)
}