context("test-collaboration_templates")


test_that("use_ro_github adds and Rbuildignores files", {
  usethis::proj_set(testthat::test_path("description"), force = TRUE)
  use_ro_github()
  expect_true(file.exists(usethis::proj_path(".github/CONTRIBUTING.md")))
  expect_true(file.exists(usethis::proj_path(".github/pull_request_template.md")))
  expect_true(file.exists(usethis::proj_path(".github/issue_template.md")))
  expect_true(is_build_ignored("^\\.github$"))
  file.remove(usethis::proj_path(".github/CONTRIBUTING.md"))
  file.remove(usethis::proj_path(".github/pull_request_template.md"))
  file.remove(usethis::proj_path(".github/issue_template.md"))
  usethis::proj_set(NULL)

})
