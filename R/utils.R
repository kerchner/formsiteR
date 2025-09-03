#' @keywords internal
fs_get <- function(endpoint, query = list()) {
  url <- paste0(fs_baseurl(), endpoint)            # <-- use fs_baseurl()
  resp <- httr::GET(
    url,
    httr::add_headers(Authorization = paste("bearer", fs_token())),  # <-- use fs_token()
    query = query
  )

  content_json <- httr::content(resp, as = "text", encoding = "UTF-8")
  parsed <- jsonlite::fromJSON(content_json, flatten = TRUE)

  if (httr::http_error(resp)) {
    stop(sprintf("HTTP %s: %s", httr::status_code(resp), parsed$error$message))
  }
  parsed
}

