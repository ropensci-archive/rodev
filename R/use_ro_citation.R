#' Create CITATION file
#'
#' @export
#'
use_ro_citation <- function(){
  desc <- desc::desc()
  usethis::use_template("CITATION", package = "rodev",
                        save_as = file.path("inst", "CITATION"))
}
