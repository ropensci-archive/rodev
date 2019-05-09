test_that("optout_rodocs works", {
  usethis::proj_set(force = TRUE)
  optout_rodocs()
  on.exit(file.remove(".norodocs"))
  expect_true(file.exists(".norodocs"))
  usethis::proj_set(NULL)
})
