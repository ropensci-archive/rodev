# Use issue template
use_issue_template <- function(){
  fs::dir_create(".github")
  usethis::use_template(template = "issue_template.md",
                        save_as = file.path(".github", "issue_template.md"),
                        package = "rodev")

}

# Use pull request template
use_pull_request_template <- function(){
  fs::dir_create(".github")
  usethis::use_template(template = "pull_request_template.md",
                        save_as = file.path(".github", "pull_request_template.md"),
                        package = "rodev")

}

# Use CONTRIBUTING template
use_contributing_template <- function(package_name){
  fs::dir_create(".github")
  usethis::use_template(template = "CONTRIBUTING.md",
                        save_as = file.path(".github", "CONTRIBUTING.md"),
                        package = "rodev",
                        data = list(package = package_name))

}

#' @title Add templates in .github
#' @param package_name Package name
#'
#' @export
use_ro_github <- function(package_name){
  use_issue_template()
  use_pull_request_template()
  use_contributing_template(package_name = package_name)
  usethis::use_build_ignore(".github")
}
