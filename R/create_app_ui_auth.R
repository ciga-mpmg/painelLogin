#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
create_app_ui_auth <- function(request, ui, url, validation_endpoint) {
  function(request) {
    pass <- aecomLogin:::validate_session(
      request,
      validation_endpoint = validation_endpoint
    )

    if (pass == "true") {
      ui()
    } else {
      shiny::tags$script(shiny::HTML(url))
    }
  }
}
