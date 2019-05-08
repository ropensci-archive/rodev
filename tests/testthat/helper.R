
# from https://github.com/r-lib/usethis/blob/1e3c6a66e8b2d2790ee6d7e6d5651c52fb61abfc/tests/testthat/helper.R#L1

## attempt to activate a project, which is nice during development
try(usethis::proj_set("."))

## putting `pattern` in the package or project name is part of our strategy for
## suspending the nested project check during testing
pattern <- "aaa"

scoped_temporary_package <- function(dir = fs::file_temp(pattern = pattern),
                                     env = parent.frame(),
                                     rstudio = FALSE) {
  scoped_temporary_thing(dir, env, rstudio, "package")
}

scoped_temporary_project <- function(dir = fs::file_temp(pattern = pattern),
                                     env = parent.frame(),
                                     rstudio = FALSE) {
  scoped_temporary_thing(dir, env, rstudio, "project")
}

scoped_temporary_thing <- function(dir = fs::file_temp(pattern = pattern),
                                   env = parent.frame(),
                                   rstudio = FALSE,
                                   thing = c("package", "project")) {
  thing <- match.arg(thing)
  if (fs::dir_exists(dir)) {
    stop_glue("Target {code('dir')} {value(dir)} already exists.")
  }

  old_project <- proj_get_()
  ## Can't schedule a deferred project reset if calling this from the R
  ## console, which is useful when developing tests
  if (identical(env, globalenv())) {
    done("Switching to a temporary project!")
    if (!is.null(old_project)) {
      todo(
        "Restore current project with: ",
        "{code('usethis::proj_set(\"', old_project, '\")')}"
      )
    }
  } else {
    withr::defer(usethis::proj_set(old_project, force = TRUE), envir = env)
    withr::defer(fs::dir_delete(dir), envir = env)
  }

  withr::local_options(list(usethis.quiet = TRUE))
  switch(
    thing,
    package = usethis::create_package(dir, rstudio = rstudio, open = FALSE),
    project = usethis::create_project(dir, rstudio = rstudio, open = FALSE)
  )
  invisible(dir)
}

proj <- new.env(parent = emptyenv())

proj_get_ <- function() proj$cur

expect_error_free <- function(...) {
  expect_error(..., regexp = NA)
}


is_build_ignored <- function(pattern, ..., base_path = proj_get()) {
  lines <- readLines(path(base_path, ".Rbuildignore"), warn = FALSE)
  length(grep(pattern, x = lines, fixed = TRUE, ...)) > 0
}

