get_name <- function(md_code){
  name <- stringr::str_extract(md_code, "\\[\\!\\[(.*?)\\]")
  name <- stringr::str_remove(name, "\\[\\!\\[")
  name <- stringr::str_remove(name, "\\]")
  name
}

get_src <- function(md_code){
  src <- stringr::str_extract(md_code, "\\]\\(https(.*?)\\)")
  src <- stringr::str_remove(src, "\\]\\(")
  src <- stringr::str_remove(src, "\\)")
  src
}

get_href <- function(md_code){
  href <- stringr::str_extract(md_code, "#[a-z]*")
  href <- paste0("https://www.repostatus.org/", href)
  href
}

library("magrittr")
# in this script I want to get
# possible badges and their md
# automatically bc they might get updated!
token <- Sys.getenv("GITHUB_GRAPHQL_TOKEN")
ghql_gh_cli <- ghql::GraphqlClient$new(
  url = "https://api.github.com/graphql",
  headers = httr::add_headers(Authorization = paste0("Bearer ", token))
)
ghql_gh_cli$load_schema()


# helped by
# https://stackoverflow.com/questions/44919773/how-do-i-query-the-github-v4-api-for-directory-contents-at-a-certain-tag
# https://stackoverflow.com/questions/44137710/github-graphql-equivalent-of-the-contents-api
# https://stackoverflow.com/questions/31438087/regex-like-search-in-a-json-with-jq

contents_query <- 'query {
  repository(owner:"jantman", name:"repostatus.org") {
object(expression: "master:badges/latest") {
... on Tree{
entries{
name
}
}
}
}
}'
qry <- ghql::Query$new()
qry$query('foobar', contents_query)
badges_files <- ghql_gh_cli$exec(qry$queries$foobar) %>%
  jqr::jq('.data.repository.object.entries[]|select(.name|endswith("_md.txt"))|.name')%>%
  as.character() %>%
  stringr::str_replace_all('\\\"', '')

status <- purrr::map_chr(badges_files, stringr::str_replace, "\\_.*", "")

get_badge_code <- function(status){
  query <- paste0('query {
  repository(name: "repostatus.org", owner: "jantman") {
                  object(expression: "master:badges/latest/', status,'_md.txt") {
                  ... on Blob {
                  text
                  }
                  }
}
}
')
  qry <- ghql::Query$new()
  qry$query('foobar', query)
  md_code <- ghql_gh_cli$exec(qry$queries$foobar) %>%
    jqr::jq('.data.repository.object.text') %>%
    as.character()  %>%
    stringr::str_remove_all('\\\"')%>%
    stringr::str_replace("\\).n", ")") %>%
    stringr::str_replace("â€“", "–") %>%
    stringr::str_replace("http\\:", "https:")

  tibble::tibble(status = status,
                 md_code = md_code,
                 name = get_name(md_code),
                 src = get_src(md_code),
                 href = get_href(md_code))
}

repostatus_badges <- purrr::map_df(status, get_badge_code)




usethis::use_data(repostatus_badges, compress = "gzip",
                  overwrite = TRUE)
