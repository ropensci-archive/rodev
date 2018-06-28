#' Use rOpenSci footer
#'
#' @export
#'
#' @examples
#' use_ro_footer()
use_ro_footer <- function(){
  usethis::use_badge(badge_name = "rOpenSci footer",
                     src = "http://ropensci.org/public_images/github_footer.png",
                     href = "https://ropensci.org")
}
