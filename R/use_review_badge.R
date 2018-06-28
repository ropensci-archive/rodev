#' Use rOpenSci review badge
#'
#' @param onboarding_issue_id Issue number of the onboarding thread of your package
#'
#' @return It will help you add the repostatus.org badge to your README.
#' @export
#'
#' @examples
#' use_review_badge(24)
use_review_badge <- function(onboarding_issue_id){
  md_code <- paste0("[![](https://badges.ropensci.org/",
                       onboarding_issue_id,
                       "_status.svg)](https://github.com/ropensci/onboarding/issues/",
                       onboarding_issue_id,
                       ")")

  # probably not a good way to use usethis
  todo(
    "Add your package onboarding badge by adding the following line to your README:"
  )
  code_block(md_code)
}
