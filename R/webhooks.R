#' List Webhooks
#' @return A list of webhooks
#' @export
list_webhooks <- function() {
  fs_get(paste0("/forms/", form_dir, "/webhooks"))
}

#' Create Webhook
#'
#' @param event Event type (default "result_completed")
#' @param url Webhook endpoint URL
#' @param handshake_key Optional key for validation
#' @return The created webhook object
#' @export
create_webhook <- function(event = "result_completed",
                           url,
                           handshake_key = NULL) {
  body <- list(webhook = list(event = event, url = url))
  if (!is.null(handshake_key)) body$webhook$handshake_key <- handshake_key
  
  resp <- httr::POST(
    paste0(base_url, "/forms/", form_dir, "/webhooks"),
    httr::add_headers(Authorization = paste("bearer", api_token)),
    body = jsonlite::toJSON(body, auto_unbox = TRUE),
    encode = "json"
  )
  parsed <- jsonlite::fromJSON(httr::content(resp, as = "text", encoding = "UTF-8"),
                               flatten = TRUE)
  if (httr::http_error(resp)) {
    stop(sprintf("HTTP %s: %s", httr::status_code(resp), parsed$error$message))
  }
  return(parsed)
}

#' Delete Webhook
#'
#' @param url Webhook endpoint URL to delete
#' @return API response
#' @export
delete_webhook <- function(url) {
  resp <- httr::DELETE(
    paste0(base_url, "/forms/", form_dir, "/webhooks"),
    httr::add_headers(Authorization = paste("bearer", api_token)),
    body = jsonlite::toJSON(list(url = url), auto_unbox = TRUE),
    encode = "json"
  )
  httr::content(resp, as = "text", encoding = "UTF-8")
}
