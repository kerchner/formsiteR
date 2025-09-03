#' List Forms
#'
#' Returns all forms available to the user.
#' @return A data frame of forms
#' @export
list_forms <- function() {
  fs_get("/forms")
}

#' Get Form Details
#'
#' Returns details for a specific form.
#' @return A list with form details
#' @export
get_form <- function() {
  fs_get(paste0("/forms/", form_dir))
}

#' Get Form Items
#'
#' Returns all items (questions/fields) in the form.
#' @return A data frame of items
#' @export
get_form_items <- function() {
  fs_get(paste0("/forms/", form_dir, "/items"))
}
