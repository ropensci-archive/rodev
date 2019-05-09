context("test-add_ro_desc")

test_that("add_ro_desc works", {
  d <- testthat::test_path("ok_description")
  fs::dir_copy(d, "testd")
  on.exit(fs::dir_delete("testd"))
  add_ro_desc("testd")
  expect_match(desc::desc_get_field("Description",
                                    file = "testd/DESCRIPTION"),
               "has been peer-reviewed by rOpenSci" )
})
