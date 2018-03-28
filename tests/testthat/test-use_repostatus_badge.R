context("test-use_repostatus_badge.R")

test_that("use_repostatus_badge checks whether the status exists", {
  expect_error(use_repostatus_badge("wipp"),
               "repostatus.org")
})

test_that("use_repostatus_badge outputs a message", {
  expect_message(use_repostatus_badge("wip"),
               "Please copy this to your README")
})
