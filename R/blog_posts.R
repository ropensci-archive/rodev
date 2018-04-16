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

  readme_template <- readLines(system.file("templates/post_readme.md",
                               package = "rodev"))
  if(type == "Rmd"){
    readme_template[3] <- "See [the blog post source here](post.Rmd) and its rendered version [here](post.md)." # nolint
  } else{
    readme_template[3] <- "See the blog post [here](post.md)"
  }


  writeLines(readme_template, file.path(getwd(), slug, "README.md"))

  if(rstudioapi::isAvailable()){
    rstudioapi::openProject(file.path(getwd(), slug))
  }else{
    message(paste("Project files created in"),
            file.path(getwd(), slug))
  }
}


#' Prepare fork
#'
#' Based on project with post.md and images in images/,
#' forks the website repo, put the post content in the right place,
#' the images in the right place and correct the path to them in the
#' post.
#'
#' @param post_project_path Path to the project where the post is.
#' @param gh_username GitHub username.
#'
#' @details This relies on your having a GitHub PAT.
#'
#' @return
#' @export
#'
#' @examples
prepare_fork <- function(post_project_path, gh_username = "maelle"){
  # if fork exist update it
  gh::gh("POST /repos/:owner/:repo/forks",
         owner = "ropensci",
         repo = "roweb2")

  # put post in right folder
  # with name deduced from date and slug
  post_project_path="C:/Users/Maelle/Documents/yay"
  post_path <- file.path(post_project_path, "post.md")
  post_yaml <- yaml::read_yaml(post_path)
  slug <- post_yaml$slug
  date <- post_yaml$date
  file_name <- paste0(date, "-", slug, ".md")

  # replace image links
  post <- readLines(post_path)
  post <- stringr::str_replace_all(post,
                                   "images\\/",
                                   paste0("/img/blog-images/",
                                          date, "-", slug,
                                          "/"))

  temp_post_path <- tempfile()
  writeLines(post, temp_post_path)

  # raw post
  post_content <- readBin(temp_post_path, "raw",
                          file.info(temp_post_path)[1, "size"])

  gh::gh("PUT /repos/:owner/:repo/contents/:path",
         owner = gh_username, repo = "roweb2",
         content = post_content,
         path = paste0("content/blog/", file_name),
         message = "add post")

  # copy images
  images <- dir(file.path(post_project_path, "images"),
                full.names = TRUE)
  lapply(images, post_image,
         post_project_path = post_project_path,
         gh_username = gh_username,
         date = date, slug = slug)
}


post_image <- function(image_path, post_project_path,
                       gh_username, date, slug){
  filename <- gsub(".*\\/", "", image_path)

  image_content<- readBin(image_path, "raw",
                           file.info(image_path)[1, "size"])

  gh::gh("PUT /repos/:owner/:repo/contents/:path",
         owner = gh_username, repo = "roweb2",
         content = image_content,
         path = paste0("themes/ropensci/static/img/blog-images/",
                       date, "-", slug,
                       "/", filename),
         message = "add image")
}
