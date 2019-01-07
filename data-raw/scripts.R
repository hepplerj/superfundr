suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(lubridate))
superfunds <- read_csv('data-raw/superfund_sites.csv')

# Clean up dates
# To be handled better by read_csv once spreadsheet is cleaned up
superfunds$proposed <- gsub("–","",superfunds$proposed)
superfunds$listed <- gsub("–","",superfunds$listed)
superfunds$construction_completed <- gsub("–","",superfunds$construction_completed)
superfunds$partially_deleted <- gsub("–","",superfunds$partially_deleted)
superfunds$deleted <- gsub("–","",superfunds$deleted)
superfunds[,8:12] <- lapply(superfunds[,8:12], function(x) mdy(x))

# Clean up empty data
superfunds$report <- gsub("–","",superfunds$report)
superfunds$reason <- gsub("\\s*\\[[^\\)]+\\]","",superfunds$reason)
superfunds$latitude <- gsub("–","",superfunds$latitude)
superfunds$latitude <- gsub("\\s*\\[[^\\)]+\\]","",superfunds$latitude)
superfunds$longitude <- gsub("–","",superfunds$longitude)
superfunds$longitude <- gsub("\\s*\\[[^\\)]+\\]","",superfunds$longitude)

# Fix coordinates
superfunds$longitude <- as.numeric(superfunds$longitude)
superfunds$latitude <- as.numeric(superfunds$latitude)

devtools::use_data(superfunds, overwrite = TRUE)
