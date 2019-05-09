#' Add rOpenSci as funder to DESCRIPTION
#'
#' @param path path to package
#'
#' @export
add_ro_fnd <- function(path = usethis::proj_get()){

  if (methods::is(try(desc::desc_get_authors(file.path(path,
                                              "DESCRIPTION")),
             silent = TRUE),
         "try-error")) {
    stop("Your DESCRIPTION needs to use the Authors@R field.",
         call. = FALSE)
  }

  desc::desc_add_author(file = file.path(path, "DESCRIPTION"),
                        given = "rOpenSci",
                       role = "fnd",
                       comment = "https://ropensci.org/")
}
