context("test-use_review_badge.R")

test_that("use_review_badge doesn't fail", {
  skip_on_travis()
  pkg <- scoped_temporary_package()
  expect_output(use_review_badge(24))
})
