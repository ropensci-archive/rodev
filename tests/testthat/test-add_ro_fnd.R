context("test-add_ro_fnd")

test_that("add_ro_fnd works", {
  d <- testthat::test_path("ok_description")
  fs::dir_copy(d, "testd")
  on.exit(fs::dir_delete("testd"))
  add_ro_fnd("testd")
  expect_equal(format(desc::desc_get_authors("testd")[2]),
               "rOpenSci [fnd] (https://ropensci.org/)" )
})

test_that("add_ro_fnd fails if no Authors@R", {
  d <- testthat::test_path("no_authors_at_R")
  expect_error(add_ro_fnd(d),
               "Your DESCRIPTION needs" )
})
