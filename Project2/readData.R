readData <- function() {
  data_link = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  pm25_file_name = "summarySCC_PM25.rds"
  scct_file_name = "Source_Classification_Code.rds"
  downloads_path = "data.zip"
  
  #temp <- tempfile()
  download.file(data_link, downloads_path)
  pm25_df <- readRDS(unzip(downloads_path, pm25_file_name))
  scct_df <- readRDS(unzip(downloads_path, scct_file_name))
  # unlink(temp)
}