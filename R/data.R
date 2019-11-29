#' A dataset of United States Superfund sites.
#'
#' A dataset containing locations and information of Superfund sites established by
#' the Environmental Protection Agency.
#'
#' @format A data frame with 1332 rows and 13 variables:
#' \describe{
#'   \item{region}{The EPA region where the site resides.}
#'   \item{state}{The state of the site.}
#'   \item{site_name}{Name of the site.}
#'   \item{site_id}{Unique site ID.}
#'   \item{epa_id}{Unique EPA ID.}
#'   \item{address}{Address of the site.}
#'   \item{city}{The city or nearest city of the site.}
#'   \item{zip}{The zip code of the site.}
#'   \item{county}{County the site is within.}
#'   \item{ff}{Notation of N (no) or Y (yes).}
#'   \item{latitude}{The latitude of the site.}
#'   \item{longitude}{The longitude of the site.}
#'   \item{final_date}{The date the site was listed.}
#'   ...
#' }
#' @source \url{https://www.epa.gov/superfund/search-superfund-sites-where-you-live}
"superfundr"
