use_repostatus_badge <- function(status){
  # inspired by https://github.com/r-lib/usethis/blob/master/R/badge.R
  # so probably needs proper credit!
  if(!status %in% repostatus_badges$status){
    stop("The status you input is not a proper repostatus.org status at least when this package version was released. Please have a look at repostatus_badges") # nolint
  }

  md_code <- repostatus_badges$md_code[repostatus_badges$status == status]
  # probably not a good way to use usethis
  usethis:::todo(
    "Add a ",
    status,
    " repostatus.org badge by adding the following line to your README:"
  )
  usethis:::code_block(md_code)
}

