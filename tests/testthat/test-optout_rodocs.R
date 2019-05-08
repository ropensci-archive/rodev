test_that("optout_rodocs works", {
  optout_rodocs()
  on.exit(file.remove(".norodocs"))
  expect_true(file.exists(".norodocs"))
})
