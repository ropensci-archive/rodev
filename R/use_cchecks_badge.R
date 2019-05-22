#' Use CRAN checks badge
#'
#' @return It will help you add the CRAN checks badge to your README.
#' @export
#'
#' @examples
#' \dontrun{
#' use_cchecks_badge()
#' }
use_cchecks_badge <- function(){

  package_name <- desc::desc_get_field("Package",
                                       file = usethis::proj_get())

  src <- glue::glue("https://cranchecks.info/badges/summary/{package_name}")
  badge_name <- "CRAN checks"
  href <- glue::glue("https://cran.r-project.org/web/checks/check_results_{package_name}.html")

  usethis::use_badge(badge_name, href, src)
}
