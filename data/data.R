#' A dataset of United States Superfund sites.
#'
#' A dataset containing locations and information of Superfund sites established by
#' the Environmental Protection Agency.
#'
#' @format A data frame with 1566 rows and 18 variables:
#' \describe{
#'   \item{cerclis_id}{The unique CERCLIS ID for each site.}
#'   \item{name}{Name of the site.}
#'   \item{address}{Address of the site.}
#'   \item{county}{County the site is within.}
#'   \item{city}{The city or nearest city of the site.}
#'   \item{state}{The state of the site.}
#'   \item{congressional_district}{The Congressional district the site lies within.}
#'   \item{hrs_score}{The Hazard Ranking System Score of the site.}
#'   \item{reason}{The reason for the site's existence.}
#'   \item{proposed}{The date the site was proposed for listing.}
#'   \item{listed}{The date the site was listed.}
#'   \item{construction_completed}{The date construction for remediation was completed.}
#'   \item{partially_deleted}{The date the site was nearly completed.}
#'   \item{deleted}{The date the site was considered remediated.}
#'   \item{report}{}
#'   \item{longitude}{The longitude of the site.}
#'   \item{latitude}{The latitude of the site.}
#'   \item{details}{URL to the official EPA report.}
#'   ...
#' }
#' @source \url{https://www.epa.gov/superfund/search-superfund-sites-where-you-live}
"superfundr"
