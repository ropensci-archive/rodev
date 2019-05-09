test_that("use_ro_favicon works", {
  usethis::proj_set(testthat::test_path("description"), force = TRUE)
  use_ro_favicon()
  expect_true(dir.exists(file.path(usethis::proj_get(),
                                   "pkgdown")))
  fs::dir_delete(file.path(usethis::proj_get(),
                           "pkgdown"))
  usethis::proj_set(NULL)
})
