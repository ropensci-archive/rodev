context("test-add_ro_desc")

test_that("add_ro_desc works", {
  dir.create("testd")
  d <- desc::desc()
  d$write(file = file.path("testd", "DESCRIPTION"))
  on.exit(fs::dir_delete("testd"))
  add_ro_desc("testd")
  expect_match(desc::desc_get_field("Description",
                                    file = "testd/DESCRIPTION"),
               "has been peer-reviewed by rOpenSci" )
})
