#' Browse packaging guidelines
#'
#' @export
read_pkg_guide <- function(){
  utils::browseURL(glue::glue("{gitbook_url()}building.html"))
}


gitbook_url <- function(){
  "https://ropensci.github.io/dev_guide/"
}
