context("test-collaboration_templates")


test_that("use_ro_github adds and Rbuildignores files", {
  pkg <- scoped_temporary_package()
  capture_output(use_ro_github())
  expect_true(file_exists(proj_path(".github/CONTRIBUTING.md")))
  expect_true(file_exists(proj_path(".github/pull_request_template.md")))
  expect_true(file_exists(proj_path(".github/issue_template.md")))
  expect_true(is_build_ignored("^\\.github$"))

})
