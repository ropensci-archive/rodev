context("test-add_ro_desc")

test_that("add_ro_desc works", {
  d <- temp_desc()
  on.exit(unlink(d))
  add_ro_desc(fs::path_dir(d))
  expect_match(desc::desc_get_field("Description",
                                    file = d),
               "has been peer-reviewed by rOpenSci" )
})
