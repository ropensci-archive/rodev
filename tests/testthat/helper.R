# from desc
# https://github.com/r-lib/desc/blob/4f60833fdb6d1aae4cbf09b7eb293c5fa0770e5c/tests/testthat/helper.R#L2
temp_desc <- function(file = "D2") {
  tmp <- tempdir(check = TRUE)
  file.copy(file, file.path(tmp, "DESCRIPTION"))
  file.path(tmp, "DESCRIPTION")
}

# from usethis
is_build_ignored <- function(pattern, ..., base_path = usethis::proj_get()) {
  lines <- readLines(file.path(base_path, ".Rbuildignore"), warn = FALSE)
  length(grep(pattern, x = lines, fixed = TRUE, ...)) > 0
}

