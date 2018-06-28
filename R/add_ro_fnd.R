#' Add rOpenSci as funder to DESCRIPTION
#'
#' @param path path to package
#'
#' @export
add_ro_fnd <- function(path = getwd()){
  descr <- desc::desc(file.path(path, "DESCRIPTION"))
  descr$add_author(given = "rOpenSci",
                   role = "fnd",
                   comment = "https://ropensci.org/")
  descr$write("DESCRIPTION")
}
