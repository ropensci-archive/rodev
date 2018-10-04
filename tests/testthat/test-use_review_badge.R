context("test-use_review_badge.R")

test_that("use_review_badge doesn't fail", {
  skip_on_travis()
  expect_output(use_review_badge(24))
})
