
<!-- README.md is generated from README.Rmd. Please edit that file -->

# superfundr

<!-- badges: start -->

[![Travis build
Status](https://travis-ci.org/hepplerj/superfunds.svg?branch=master)](https://travis-ci.org/hepplerj/superfunds)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/superfunds)](http://cran.r-project.org/package=superfunds)
[![Coverage
Status](https://img.shields.io/codecov/c/github/hepplerj/superfunds/master.svg)](https://codecov.io/github/hepplerj/superfunds?branch=master)
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
#> # A tibble: 1,566 x 18
#>    cerclis_id name  address county city  state congressional_d… hrs_score 
#>    <chr>      <chr> <chr>   <chr>  <chr> <chr>            <dbl> <date>    
#>  1 ALN000410… 35th… 3500 3… Jeffe… <NA>  Alab…               NA NA        
#>  2 AL6210020… Alab… STATE … Talla… <NA>  Alab…               NA NA        
#>  3 ALD004022… Alab… 570 HI… Shelby <NA>  Alab…               NA NA        
#>  4 ALD981868… Amer… HIGHWA… Henry  <NA>  Alab…               NA NA        
#>  5 AL3210020… Anni… "702 C… Calho… <NA>  Alab…               NA NA        
#>  6 AL0001058… Capi… MADISO… Montg… <NA>  Alab…               NA NA        
#>  7 ALD001221… Ciba… OFF HW… Washi… <NA>  Alab…               NA NA        
#>  8 ALD041906… Inte… 8551 B… Jeffe… <NA>  Alab…               NA NA        
#>  9 ALD031618… Mowb… JCT OF… Butler <NA>  Alab…               NA NA        
#> 10 ALD008188… Olin… OLIN R… Washi… <NA>  Alab…               NA NA        
#> # … with 1,556 more rows, and 10 more variables: reason <chr>,
#> #   proposed <date>, listed <date>, construction_completed <date>,
#> #   partially_deleted <chr>, deleted <chr>, report <chr>, longitude <dbl>,
#> #   latitude <dbl>, details <chr>
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
