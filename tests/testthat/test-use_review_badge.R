context("test-use_review_badge.R")

test_that("use_review_badge doesn't fail", {
  pkg <- scoped_temporary_package()
  expect_output(use_review_badge(24))
})
