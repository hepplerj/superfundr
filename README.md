
<!-- README.md is generated from README.Rmd. Please edit that file -->

# superfundr

<!-- badges: start -->

[![Travis build
Status](https://travis-ci.org/hepplerj/superfunds.svg?branch=master)](https://travis-ci.org/hepplerj/superfunds)
<!-- badges: end -->

The `superfundr` package contains data on U.S. Superfund sites
established by the Environmental Protection Agency.

Data is processed with the `tabulizer` package using the [most recent
available PDF](https://www.epa.gov/superfund/superfund-data-and-reports)
from the EPA.

## Installation

`superfundr` is a data package containing a dataset of Superfund sites
in the United States. The best way to install it is through `devtools`.

### Install direct from GitHub

You can install the beta version of superfundr from
[GitHub](https://github.com/hepplerj/superfundr) with:

``` r
devtools::install_github("hepplerj/superfundr")
```

## Loading the data

The package works best with the [tidyverse](http://tidyverse.org/)
libraries and the [simple
features](https://r-spatial.github.io/sf/index.html) package for
mapping.

``` r
library(tidyverse)
#> ── Attaching packages ────────────────────────────────────────────── tidyverse 1.2.1 ──
#> ✔ ggplot2 3.2.0     ✔ purrr   0.3.3
#> ✔ tibble  2.1.3     ✔ dplyr   0.8.1
#> ✔ tidyr   0.8.3     ✔ stringr 1.4.0
#> ✔ readr   1.3.1     ✔ forcats 0.4.0
#> ── Conflicts ───────────────────────────────────────────────── tidyverse_conflicts() ──
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
#> # A tibble: 1,332 x 13
#>    region state site_name site_id epa_id address city    zip county ff   
#>     <dbl> <chr> <chr>       <dbl> <chr>  <chr>   <chr> <dbl> <chr>  <chr>
#>  1      1 CT    BARKHAMS…  100255 CTD98… ROUTE … BARK…  6063 LITCH… N    
#>  2      1 CT    BEACON H…  100180 CTD07… BLACKB… BEAC…  6403 NEW H… N    
#>  3      1 CT    DURHAM M…  100108 CTD00… MAIN ST DURH…  6422 MIDDL… N    
#>  4      1 CT    GALLUP'S…  100201 CTD10… ROUTE … PLAI…  6374 WINDH… N    
#>  5      1 CT    KELLOGG-…  100252 CTD98… NORWAL… NORW…  6856 FAIRF… N    
#>  6      1 CT    LAUREL P…  100232 CTD98… HUNTER… NAUG…  6770 NEW H… N    
#>  7      1 CT    LINEMAST…  100041 CTD00… 29 PLA… WOOD…  6281 WINDH… N    
#>  8      1 CT    NEW LOND…  100261 CTD98… ROUTE … NEW …  6349 NEW L… Y    
#>  9      1 CT    PRECISIO…  100156 CTD05… 1050 H… VERN…  6066 TOLLA… N    
#> 10      1 CT    RAYMARK …  100094 CTD00… 75 EAS… STRA…  6614 FAIRF… N    
#> # … with 1,322 more rows, and 3 more variables: latitude <dbl>,
#> #   longitude <dbl>, superfunds_date <date>
```

## Contributing

We are an open source project. Want to help contribute? Open up an
[issue](https://github.com/superfundr/resources/issues). Or, contribute
your ideas, resources, and teaching material\! To get started, take a
look at [CONTRIBUTING.md](CONTRIBUTING.md).

## Code of Conduct

`superfundr` is committed to creating and supporting an inclusive
community of practice. Please see our [Code of
Conduct](CODE_OF_CONDUCT.md).

# Project Lead

Jason Heppler, PhD / University of Nebraska / t: @jaheppler g: @hepplerj
