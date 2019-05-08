test_that("use_ro_favicon works", {
  use_ro_favicon()
  usethis::proj_set(force = TRUE)
  expect_true(dir.exists(file.path(usethis::proj_get(),
                                   "pkgdown")))
  fs::dir_delete(file.path(usethis::proj_get(),
                           "pkgdown"))
  usethis::proj_set(NULL)
})
