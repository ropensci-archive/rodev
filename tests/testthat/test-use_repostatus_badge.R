context("test-use_repostatus_badge.R")

test_that("use_repostatus_badge checks whether the status exists", {
  expect_error(use_repostatus_badge("wipp"),
               "repostatus.org")
})

test_that("use_repostatus_badge doesn't fail", {
  skip_on_travis()
  pkg <- scoped_temporary_package()
  expect_output(use_repostatus_badge("suspended"))
})
