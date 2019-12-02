
<!-- README.md is generated from README.Rmd. Please edit that file -->

# superfundr

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/hepplerj/superfundr.svg?branch=master)](https://travis-ci.org/hepplerj/superfundr)
[![MIT
license](https://img.shields.io/github/license/mashape/apistatus.svg)](http://choosealicense.com/licenses/mit/)
[![Jason
Heppler](https://img.shields.io/badge/ORCiD-0000--0003--4158--6186-green.svg)](https://orcid.org/0000-0003-4158-6186)
<!-- badges: end -->

The `superfundr` package contains data on U.S. Superfund sites
established by the Environmental Protection Agency.

The data is processed with a combination of the `tabulizer` package and
various `tidyverse` methods using the [most recent available PDF and
Excel data](https://www.epa.gov/superfund/superfund-data-and-reports)
from the Environmental Protection Agency.

## Installation

`superfundr` is a data package containing a dataset of Superfund sites
in the United States. The best way to install it is through `devtools`.
You can install superfundr from
[GitHub](https://github.com/hepplerj/superfundr) with:

``` r
library(devtools)
devtools::install_github("hepplerj/superfundr")
```

## Loading the data

The package works best with the [tidyverse](http://tidyverse.org/)
libraries and the [simple
features](https://r-spatial.github.io/sf/index.html) package for
mapping.

``` r
library(tidyverse)
#> ── Attaching packages ──────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.2.0     ✔ purrr   0.3.3
#> ✔ tibble  2.1.3     ✔ dplyr   0.8.1
#> ✔ tidyr   0.8.3     ✔ stringr 1.4.0
#> ✔ readr   1.3.1     ✔ forcats 0.4.0
#> ── Conflicts ─────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
```

Load the data:

``` r
library(superfundr)
```

Look at it:

``` r
superfunds
#> # A tibble: 66,386 x 20
#>    site_name epa_id city  county state zipcode region npl_status
#>    <chr>     <chr>  <chr> <chr>  <chr> <chr>    <dbl> <chr>     
#>  1 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  2 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  3 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  4 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  5 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  6 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  7 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  8 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#>  9 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#> 10 ATLAS TA… MAD00… FAIR… BRIST… MA    02719        1 Currently…
#> # … with 66,376 more rows, and 12 more variables:
#> #   superfund_agreement <chr>, federal_facility <chr>, op_unit_no <dbl>,
#> #   seq_id <dbl>, decision_type <chr>, completion_date <dttm>,
#> #   fiscal_year <dbl>, media <chr>, contaminant <chr>, address <fct>,
#> #   latitude <dbl>, longitude <dbl>
```

## Usage

The data is structured just as it comes from the Environmental
Protection Agency, which lists out each contaminant at each site.
`superfundr` adds additional information from the EPA’s basic
spreadsheet, including latitude and longitude coordinates and addresses,
and converts data as necessary (title case for text, dates as date
objects, etc).

The data can be used in a variety of ways. You can count the total
number of contaminants across all sites.

``` r
superfunds %>% 
  group_by(contaminant) %>% 
  tally(sort = TRUE)
#> # A tibble: 663 x 2
#>    contaminant           n
#>    <chr>             <int>
#>  1 ARSENIC            2667
#>  2 LEAD               2531
#>  3 TRICHLOROETHENE    2049
#>  4 BENZENE            1659
#>  5 TETRACHLOROETHENE  1645
#>  6 CHROMIUM           1589
#>  7 CADMIUM            1538
#>  8 ZINC               1380
#>  9 MANGANESE          1288
#> 10 TOLUENE            1268
#> # … with 653 more rows
```

You can count the number of active, inactive, and deleted sites.

``` r
superfunds %>% 
  distinct(site_name, .keep_all = TRUE) %>% 
  group_by(npl_status) %>% 
  tally(sort = TRUE)
#> # A tibble: 7 x 2
#>   npl_status                     n
#>   <chr>                      <int>
#> 1 Currently on the Final NPL  1141
#> 2 Deleted from the Final NPL   362
#> 3 Not on the NPL                32
#> 4 Proposed for NPL               3
#> 5 Removed from Proposed NPL      2
#> 6 Site is Part of NPL Site       2
#> 7 <NA>                           1
```

You can also map the locations of sites using Leaflet, which may also
lend itself to further spatial analysis using Census or demographic
information.

    library(leaflet)
    library(superfundr)
    
    leaflet(data = superfunds %>% distinct(site_name, .keep_all = T)) %>% 
      addProviderTiles("CartoDB.Positron") %>% 
      addCircleMarkers(radius = 3, stroke = FALSE, fillOpacity = 0.5)

## Contributing

This is an open source project and is open to contributions. There are
several ways to get involved:

  - Open an [issue](https://github.com/superfundr/resources/issues). If
    you’re running into problems with executing code, consider using the
    [reprex](https://github.com/tidyverse/reprex) package to create a
    reproducible example.
  - Contribute your ideas, resources, and teaching material. Further
    examples on how to work with or use the dataset is always welcome.
  - Contributing documentation: Clarifying and expanding on the
    documentation is always appreciated. `superfundr` uses roxygen2,
    which provides documentation at the top of any function definition.
    Please submit improvements as a pull request.
  - Contributing code: If you see something that needs improving, data
    that seems incorrect, or want to include further data enhancements
    and you’d like to make the changes, contributed code is most
    welcome.

To get started, take a look at [CONTRIBUTING.md](CONTRIBUTING.md).

## Code of Conduct

`superfundr` is committed to creating and supporting an inclusive
community of practice. Please see our [Code of
Conduct](CODE_OF_CONDUCT.md).

# Project Lead

Jason Heppler, PhD / University of Nebraska / t: @jaheppler g:
@hepplerj  
<https://jasonheppler.org>
