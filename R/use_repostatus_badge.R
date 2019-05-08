#' Use repostatus.org Badge
#'
#' @param status current status of the project, cf and details.
#'
#' @details Possible statuses are \code{rodev::repostatus_badges$status},
#' \itemize{
#' \item abandoned
#' \item active
#' \item concept
#' \item inactive
#' \item moved
#' \item suspended
#' \item unsupported
#' \item wip
#' }
#' For more details refer to \url{repostatus.org}.
#'
#' @return It will help you add the repostatus.org badge to your README.
#' @export
#'
#' @examples
#' \dontrun{
#' use_repostatus_badge("wip")
#' }
use_repostatus_badge <- function(status){
  # inspired by https://github.com/r-lib/usethis/blob/master/R/badge.R
  # so probably needs proper credit!
  if(!status %in% rodev::repostatus_badges$status){
    stop("The status you input is not a proper repostatus.org status at least when this package version was released. Please have a look at repostatus_badges") # nolint
  }

  badge_df <- rodev::repostatus_badges[rodev::repostatus_badges$status == status,]
  usethis::use_badge(badge_df$name,
                     href = badge_df$href,
                     src = badge_df$src)
}

