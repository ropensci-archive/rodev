# From https://github.com/r-lib/usethis/blob/b459a9f1875bfb8eeee2e9d2941dcb7203d6478e/R/helpers.R#L90
view_url <- function(..., open = interactive()) {
  url <- paste(..., sep = "/")
  if (open) {
    done("Opening URL {url}")
    utils::browseURL(url)
  } else {
    todo("Open URL {url}")
  }
  invisible(url)
}
