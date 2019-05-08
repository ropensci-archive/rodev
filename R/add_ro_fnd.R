#' Add rOpenSci as funder to DESCRIPTION
#'
#' @param path path to package
#'
#' @export
add_ro_fnd <- function(path = usethis::proj_get()){
  desc::desc_add_author(file = file.path(path, "DESCRIPTION"),
                        given = "rOpenSci",
                       role = "fnd",
                       comment = "https://ropensci.org/")
}
