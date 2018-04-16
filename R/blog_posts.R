#' Create a RStudio project with a blog post template
#'
#' @param slug Slug describing the blog post, e.g
#' "thanking-reviewers-in-metadata". Use hyphens, not space.
#' @param type Either 'Rmd' or 'md'
#'
#' @return It opens a new project.
#' @export
#'
#' @examples
create_post_project <- function(slug, type = "Rmd"){
  dir.create(file.path(getwd(), slug))
  dir.create(file.path(getwd(), slug, "images"))

  file.copy(system.file(file.path("templates",
                                  "post.Rproj"),
                        package = "rodev"),
            file.path(getwd(), paste0(slug,".Rproj")))

  if(!type %in% c("Rmd", "md")){
    stop("type has to be either 'Rmd' or 'md'")
  }

  if(type == "Rmd"){
    template <- "post_template.Rmd"
  }else{
    template <- "post_template.md"
  }

  post_template_path <- system.file(file.path("templates",
                                         template),
                               package = "rodev")


  post_template <- readLines(post_template_path)
  post_template[2] <- paste("slug:", slug)

  post_path <- file.path(getwd(), slug, "post.Rmd")
  writeLines(post_template, post_path)

  if(type == "Rmd"){
    rmarkdown::render(post_path)
  }

  readme_template <- system.file("templates/post_readme.md",
                               package = "rodev")
  file.copy(readme_template, file.path(getwd(), slug, "README.md"))

  if(rstudioapi::isAvailable()){
    rstudioapi::openProject(file.path(getwd(), slug))
  }else{
    message(paste("Project files created in"),
            file.path(getwd(), slug))
  }
}
