

# from usethis
is_build_ignored <- function(pattern, ..., base_path = usethis::proj_get()) {
  lines <- readLines(file.path(base_path, ".Rbuildignore"), warn = FALSE)
  length(grep(pattern, x = lines, fixed = TRUE, ...)) > 0
}

