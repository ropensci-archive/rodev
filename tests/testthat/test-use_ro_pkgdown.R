test_that("use_ro_pkgdown works", {
  usethis::proj_set(testthat::test_path("description"), force = TRUE)
  use_ro_pkgdown()
  expect_true(file.exists(file.path(usethis::proj_get(),
                                   "_pkgdown.yml")))
  file.remove(file.path(usethis::proj_get(),
                           "_pkgdown.yml"))
  usethis::proj_set(NULL)
})

