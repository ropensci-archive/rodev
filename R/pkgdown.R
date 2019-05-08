#' Use rOpenSci template pkgdown config file
#'
#' @export
#'
use_ro_pkgdown <- function(){
  usethis::use_template(template = "_pkgdown.yml",
                        save_as = "_pkgdown.yml",
                        package = "rodev")
}

#' Use rOpenSci favicon for pkgdown
#'
#' @details This will create a pkgdown folder with the favicon files.
#'
#' @export
#'
use_ro_favicon <- function(){
  fs::dir_copy(system.file("pkgdown", package = "rodev"),
               file.path(usethis::proj_get(),
                         "pkgdown"))
}
