#' Prepare an rOpenSci submission
#'
#' @details Workflow
#' * `prepare_submission()`: Create a Markdown file for rOpenSci submission, and pre-fills it.
#' * Edit the ropensci-submission.md file, put it under version control if desired.
#' * `post_submission()`: Post the issue.
#'
#' @param pkg Path to the package source
#'
#' @rdname submission
#' @export
#'
prepare_submission <- function(pkg = usethis::proj_get()) {

  # get GitHub username
  githubusername <- whoami::gh_username()

  # get repo URL
  urls <- desc::desc_get_urls(file.path(pkg, "DESCRIPTION"))
  repolink <- urls[urltools::domain(urls) %in% source_code_domains()][1]

  # get DESCRIPTION
  description <- glue::glue_collapse(readLines(file.path(pkg, "DESCRIPTION")),
                                     sep = "\n")

  usethis::use_template(
    "submission_template.md",
    save_as = file.path(
      pkg,
      "inst",
      "ropensci-submission.md"),
    data = list(
      githubusername = githubusername,
      repolink = repolink,
      description = description
    ),
    open = TRUE,
    ignore = TRUE,
    package = "rodev"
    )
}

# from codemetar
source_code_domains <- function() {
  c("github.com","www.github.com", "gitlab.com",
    "r-forge.r-project.org", "bitbucket.org")
}

#' @param pkg Path to the package source
#'
#' @rdname submission
#' @export
#'
post_submission <- function(pkg = usethis::proj_get()) {
  pkgname <- desc::desc_get_field("Package",
                                  file = file.path(pkg, "DESCRIPTION"))

  # we could actually add the questions (my package contains blabla) here

  usethis::ui_nope("Are you ready to submit ropensci-submission.md?")

  ref <- projmgr::create_repo_ref("maelle", "test")

  submission <- projmgr::post_issue(ref = ref,
                      title = glue::glue("Submission: {pkgname}"),
                      body = glue::glue_collapse(readLines(file.path(pkg, "inst", "ropensci-submission.md")),
                                                 sep = "\n"))

  projmgr::browse_issues(ref, number = submission)
}
