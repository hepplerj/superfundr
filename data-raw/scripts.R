library(tidyverse)
superfunds <- read_csv('data-raw/superfund_sites.csv')

# To be handled better by read_csv once spreadsheet is cleaned up
superfunds$proposed <- gsub("–","",superfunds$proposed)
superfunds$listed <- gsub("–","",superfunds$listed)
superfunds$construction_completed <- gsub("–","",superfunds$construction_completed)
superfunds$partially_deleted <- gsub("–","",superfunds$partially_deleted)
superfunds$deleted <- gsub("–","",superfunds$deleted)

# Fix up dates
superfunds[,8:12] <- lapply(superfunds[,8:12], function(x) mdy(x))

devtools::use_data(superfunds)
