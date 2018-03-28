use_repostatus_badge <- function(status){
  # inspired by https://github.com/r-lib/usethis/blob/master/R/badge.R
  # so probably needs proper credit!
  if(!status %in% repostatus_badges$status){
    stop("The status you input is not a proper repostatus.org status at least when this package version was released. Please have a look at repostatus_badges") # nolint
  }

  md_code <- repostatus_badges$md_code[repostatus_badges$status == status]
  message("Please copy this to your README:\n", md_code)
}

