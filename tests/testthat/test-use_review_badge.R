context("test-use_review_badge.R")

test_that("use_review_badge doesn't fail", {
  usethis::proj_set(force = TRUE)
  expect_message(use_review_badge(24))
  usethis::proj_set(NULL)
})
