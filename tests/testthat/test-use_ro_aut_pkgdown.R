test_that("use_ro_aut_pkgdown works", {
  usethis::proj_set(testthat::test_path("description"), force = TRUE)
  testthat::expect_output(use_ro_aut_pkgdown(),
                          "authors")
  usethis::proj_set(NULL)
})
