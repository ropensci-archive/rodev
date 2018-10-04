#' Add rOpenSci as funder to DESCRIPTION
#'
#' @param path path to package
#'
#' @export
add_ro_fnd <- function(path = getwd()){
  desc::desc_add_author(file = file.path(path, "DESCRIPTION"),
                        given = "rOpenSci",
                       role = "fnd",
                       comment = "https://ropensci.org/")
}
