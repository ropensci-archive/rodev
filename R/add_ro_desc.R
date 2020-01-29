#' Add rOpenSci review mention to DESCRIPTION (no longer recommended)
#'
#' No longer recommended!
#'
#' @param path path to package
#'
#' @export
add_ro_desc <- function(path = usethis::proj_get()){
 stop("We no longer recommend adding an rOpenSci review mention to DESCRIPTION.",
      call. = FALSE)
}
