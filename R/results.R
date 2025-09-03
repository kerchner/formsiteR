#' Get Form Results
#'
#' Retrieve form results with optional filters.
#'
#' @param limit Number of results per page (default 100)
#' @param page Page number
#' @param after_date, before_date Date filters (yyyy-mm-dd)
#' @param after_id, before_id Result ID filters
#' @param search Named list of search filters
#'
#' @return A list of results
#' @export
get_form_results <- function(limit = 100, page = 1,
                             after_date = NULL, before_date = NULL,
                             after_id = NULL, before_id = NULL,
                             search = list()) {
  query <- list(limit = limit, page = page)
  if (!is.null(after_date)) query$after_date <- after_date
  if (!is.null(before_date)) query$before_date <- before_date
  if (!is.null(after_id)) query$after_id <- after_id
  if (!is.null(before_id)) query$before_id <- before_id
  if (length(search) > 0) query <- c(query, search)

  fs_get(paste0("/forms/", fs_formdir(), "/results"), query)
}
