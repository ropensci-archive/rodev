#' Generate YAML to add rOpenSci as author in pkgdown config
#'
#' @export
use_ro_aut_pkgdown <- function(){

  x <- list(authors = list(
              rOpenSci = list(
              href = "https://ropensci.org",
              html = "<img src='https://github.com/ropensci.png' height=24>"))
  )
  # from https://github.com/r-lib/pkgdown/blob/6ada322cd53794c5cf1af2407bedd76fdde13b26/R/utils.r#L108
  cat(yaml::as.yaml(x), "\n", sep = "")
}
