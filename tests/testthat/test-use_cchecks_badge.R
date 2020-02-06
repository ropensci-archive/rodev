context("test-use_cchecks_badge.R")

test_that("use_cchecks_badge doesn't fail", {
  usethis::proj_set(force = TRUE)
  expect_message(use_cchecks_badge())
  usethis::proj_set(NULL)
})
