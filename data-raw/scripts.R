suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(readxl))
suppressPackageStartupMessages(library(tabulizer))

superfunds <- readxl::read_xlsx("data-raw/201186.xlsx", skip = 1)
headers <- c('site_name', 'epa_id', 'city', 'county', 'state', 'zipcode', 'region',
             'npl_status', 'superfund_agreement', 'federal_facility', 'op_unit_no',
             'seq_id','decision_type','completion_date', 'fiscal_year',
             'media', 'contaminant')
names(superfunds) <- headers

superfunds <- superfunds %>%
  mutate_at(c(7,11, 12), as.numeric) %>%
  mutate(fiscal_year = as.Date(fiscal_year, format = "%Y")) %>%
  mutate(fiscal_year = lubridate::year(fiscal_year))

# Extract lat/lon from PDF tables
# -------------------------------

# Location of pdf file
location <- 'https://semspub.epa.gov/work/HQ/201184.pdf'

# Extract the table
out <- extract_tables(location)
superfunds_match <- do.call(rbind, out[-length(out)])
rm(out)
rm(location)

# Table headers get extracted as rows with bad formatting. Dump them.
superfunds_match <- as.data.frame(superfunds_match[-1,])

# Column names
headers_match <- c('region', 'state', 'site_name', 'site_id', 'epa_id', 'address',
             'city', 'zip', 'county', 'ff', 'latitude','longitude','final_date')

# Apply custom column names.
names(superfunds_match) <- headers_match

# Match EPA ID from superfunds and superfunds_match to join lat/long
# coordinates and addresses. Convert lat/lon from factor to numeric.
superfunds_latlon <- superfunds_match %>%
  select(epa_id, address, latitude, longitude) %>%
  mutate_at(c("latitude","longitude"), list(~ as.numeric(levels(.))[.]))

superfunds <- left_join(superfunds, superfunds_latlon, by = "epa_id")
rm(superfunds_latlon)
rm(superfunds_match)

# Convert text to title case
superfunds <- superfunds %>%
  mutate(site_name = stringr::str_to_title(site_name)) %>%
  mutate(city = stringr::str_to_title(city)) %>%
  mutate(county = stringr::str_to_title(county)) %>%
  mutate(address = stringr::str_to_title(address)) %>%
  mutate(contaminant = stringr::str_to_title(contaminant))

# Write data
usethis::use_data(superfunds, overwrite = TRUE)
