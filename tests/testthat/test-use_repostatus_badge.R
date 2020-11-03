context("test-use_repostatus_badge.R")

test_that("use_repostatus_badge checks whether the status exists", {
  expect_error(use_repostatus_badge("wipp"),
               "not a proper repostatus.org status",
               fixed = TRUE)
  expect_error(use_repostatus_badge(),
               "provide a repostatus.org status",
               fixed = TRUE)
})

test_that("use_repostatus_badge doesn't fail", {
  usethis::proj_set(force = TRUE)
  expect_message(use_repostatus_badge("suspended"))
  usethis::proj_set(NULL)
})
