context("test-add_ro_fnd")

test_that("add_ro_fnd works", {
  d <- temp_desc()
  on.exit(unlink(d))
  add_ro_fnd(fs::path_dir(d))
  expect_equal(format(desc::desc_get_authors(d)[5]),
               "rOpenSci [fnd] (https://ropensci.org/)" )
})
