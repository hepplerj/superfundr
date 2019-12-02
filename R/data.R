#' A tidy dataset of United States Superfund sites.
#'
#' A tidy dataset containing locations and information of Superfund sites established by
#' the Environmental Protection Agency. Contaminant of concern data from Superfund decision
#' documents issued in fiscal years 1982-2017. Includes sites 1) final or deleted on the
#' National Priorities List (NPL); and 2) sites with a Superfund Alternative Approach (SAA)
#' Agreement in place. The only sites included that are 1) not on the NPL; 2) proposed for NPL;
#' or 3) removed from proposed NPL, are those with an SAA Agreement in place.
#'
#' @format A data frame with 66386 rows and 20 variables:
#' \describe{
#'   \item{site_name}{Name of the site.}
#'   \item{epa_id}{Unique EPA ID.}
#'   \item{city}{The city or nearest city of the site.}
#'   \item{county}{County the site is within.}
#'   \item{state}{The state of the site.}
#'   \item{zipcode}{The zip code of the site.}
#'   \item{region}{The EPA region where the site resides.}
#'   \item{npl_status}{NPL status of the site.}
#'   \item{superfund_agreement}{Whether a site has an Alternative Approach Agreement. Notation of N (no) or Y (yes).}
#'   \item{federal_facility}{Whether a site is on federal property. Notation of N (no) or Y (yes).}
#'   \item{op_unit_no}{An OU addressing the geographic areas of a site, specific site problems, or areas where a specific action is required. See EPA documentation for more information.}
#'   \item{seq_id}{Cost org field/financial activity sequence number.}
#'   \item{decision_type}{Explanation of the record.}
#'   \item{completion_date}{The date the site was listed.}
#'   \item{fiscal_year}{The fiscal year the site falls under.}
#'   \item{media}{Medium affected by contaminants at a site. Types of media include: Soil, Solid Waste, Sediment, Groundwater, Surface Water, Sediment, Sludge, Leachate, and Residuals.}
#'   \item{contaminant}{An individual contaminant located at a specific site.}
#'   \item{address}{Address of the site.}
#'   \item{latitude}{The latitude of the site.}
#'   \item{longitude}{The longitude of the site.}
#'   ...
#' }
#' @source \url{https://www.epa.gov/superfund/search-superfund-sites-where-you-live}
#' @examples
#' head(superfunds)
"superfunds"
