#' Setup Travis à la rOpenSci
#'
#' Setup Travis with checks on 3 R versions
#'
#' @param browse (passed to \code{usethis::use_travis()}).
#' Open a browser window to enable automatic builds for the
#'   package.
#' @param ext (passed to \code{usethis::use_travis()}).
#'  which Travis website to use. default to "org"for
#'   https://travis-ci.org. Change to "com" for https://travis-ci.com.
#'
#' @export
use_ro_travis <- function(browse = interactive(), ext = c("org", "com")){
  usethis::use_travis(browse = browse, ext = ext)
  usethis::use_template("travis.yml",
                        save_as = ".travis.yml",
                        package = "rodev")
}
