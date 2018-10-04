#' Add rOpenSci review mention to DESCRIPTION
#'
#' @param path path to package
#'
#' @export
add_ro_desc <- function(path = getwd()){
  file <- file.path(path, "DESCRIPTION")
  version <- desc::desc_get_version(file = file)
  description <- desc::desc_get_field("Description",
                                      file = file)
  new_description <- glue::glue("{description}\n   This package has been peer-reviewed by rOpenSci (v. {version}).")
  desc::desc_set(Description = new_description,
                 file = file)
}
