#' Add rOpenSci docs URL to DESCRIPTION
#'
#' @export
use_docs_link <- function(){
  desc <- desc::desc(usethis::proj_get())
  package <- desc$get_field("Package")
  URLs <- desc$get_urls()

  URLs <- c(URLs, paste0("https://docs.ropensci.org/",
                         package, "/"))

  URLs <- URLs[!grepl("ropensci\\.github\\.io", URLs)]

  desc$set_urls(URLs)
  desc$write()
}
