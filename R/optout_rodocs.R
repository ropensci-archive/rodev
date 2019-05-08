#' Opt out of rOpenSci docs website building
#'
#' @details Run this function if you do not want your
#' package to get a website built and deployed at \code{docs.ropensci.org/pkg_name}.
#'
#' @param path path to package
#'
#' @return It creates an empty .norodocs file,
#' nothing else has to be done.
#' @export
#'
optout_rodocs <- function(path = getwd()){
  file.create(".norodocs")
}
