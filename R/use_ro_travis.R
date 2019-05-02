#' Setup Travis à la rOpenSci
#'
#' Setup Travis with checks on 3 R versions
#'
#' @export
use_ro_travis <- function(){
  usethis::use_travis()
  usethis::use_template(".travis.yml", package = "rodev")
}
