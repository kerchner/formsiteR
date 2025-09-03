#' Set Formsite Configuration
#'
#' Configure your Formsite API access for the current R session.
#' By default, values are read from environment variables defined in `.Renviron`.
#'
#' @param token Formsite API token. Defaults to Sys.getenv("FORMSITE_API_TOKEN").
#' @param server Formsite server (e.g., "fs1"). Defaults to Sys.getenv("FORMSITE_API_SERVER").
#' @param user_dir Your Formsite user directory. Defaults to Sys.getenv("FORMSITE_API_USERDIR").
#' @param form_dir Default form directory name. Defaults to Sys.getenv("FORMSITE_API_FORMDIR").
#'
#' @examples
#' \dontrun{
#' # Uses values from .Renviron
#' fs_set_config()
#'
#' # Or override explicitly
#' fs_set_config(token = "mytoken", server = "fs2")
#' }
#' @export
fs_set_config <- function(
    token    = Sys.getenv("FORMSITE_API_TOKEN"),
    server   = Sys.getenv("FORMSITE_API_SERVER"),
    user_dir = Sys.getenv("FORMSITE_API_USERDIR"),
    form_dir = Sys.getenv("FORMSITE_API_FORMDIR")
) {
  options(
    formsite.token    = token,
    formsite.server   = server,
    formsite.user_dir = user_dir,
    formsite.form_dir = form_dir
  )
}

# --- Internal helpers (not exported) ---
fs_token   <- function() getOption("formsite.token")
fs_server  <- function() getOption("formsite.server")
fs_userdir <- function() getOption("formsite.user_dir")
fs_formdir <- function() getOption("formsite.form_dir")

fs_baseurl <- function() {
  paste0("https://", fs_server(), ".formsite.com/api/v2/", fs_userdir())
}
