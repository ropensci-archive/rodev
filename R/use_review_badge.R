#' Use rOpenSci review badge
#'
#' @param onboarding_issue_id Issue number of the onboarding thread of your package
#'
#' @return It will help you add the rOpenSci review badge to your README.
#' @export
#'
#' @examples
#' \dontrun{
#' use_review_badge(24)
#' }
use_review_badge <- function(onboarding_issue_id){

  src <- glue::glue("https://badges.ropensci.org/{onboarding_issue_id}_status.svg")
  badge_name <- "peer-review"
  href <- glue::glue("https://github.com/ropensci/software-review/issues/{onboarding_issue_id}")

  usethis::use_badge(badge_name, href, src)
}
