#' Use rOpenSci template pkgdown config file
#'
#' @export
#'
use_ro_pkgdown <- function(){
  usethis::use_template(template = "_pkgdown.yml",
                        save_as = "_pkgdown.yml",
                        package = "rodev")
}
