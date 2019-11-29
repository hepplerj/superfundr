suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(tabulizer))
suppressPackageStartupMessages(library(lubridate))

# Location of pdf file
location <- 'https://semspub.epa.gov/work/HQ/201184.pdf'

# Extract the table
out <- extract_tables(location)
superfunds <- do.call(rbind, out[-length(out)])
rm(out)
rm(location)

# table headers get extracted as rows with bad formatting. Dump them.
superfunds <- as.data.frame(superfunds[-1,])

# Column names
headers <- c('region', 'state', 'site_name', 'site_id', 'epa_id', 'address',
             'city', 'zip', 'county', 'ff', 'latitude','longitude','superfunds_date')

# Apply custom column names
names(superfunds) <- headers

superfunds <- superfunds %>%
  # Convert date columns to date objects
  mutate_each(list(~ as.Date(., format='%m/%d/%y')), final_date)
write_csv(superfunds, "data-raw/superfunds.csv")

# After some by-hand cleaning of the data, read back in the changes.
superfunds <- read_csv("data-raw/superfunds_cleaned.csv")
names(superfunds) <- headers

usethis::use_data(superfunds, overwrite = TRUE)
