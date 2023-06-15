#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
create_app_ui_auth <- function(request, ui) {

  function(request){
    pass <- aecomLogin:::validate_session(request)

    if(pass == "true"){
      ui()
    } else {
      shiny::tags$script(shiny::HTML('location.replace("https://painel-homolog.ciga-mpmg.com.br");'))
    }
  }

}
