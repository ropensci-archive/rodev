context("test-use_review_badge.R")

test_that("use_review_badge doesn't fail", {
  expect_output(use_review_badge(24))
})
