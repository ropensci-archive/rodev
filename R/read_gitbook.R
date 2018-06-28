#' Browse packaging guidelines
#'
#' @export
#'
#' @examples
#' read_pkg_guide()
read_pkg_guide <- function(){
  view_url(glue::glue("{gitbook_url()}building.html"))
}


gitbook_url <- function(){
  "https://ropensci.github.io/dev_guide/"
}
