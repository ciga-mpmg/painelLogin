#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
create_app_ui_auth <- function(request, ui, prod = FALSE) {

  function(request){
    pass <- aecomLogin:::validate_session(request, prod = prod)

    if(prod){
      replace_js <- 'location.replace("https://painel.ciga-mpmg.com.br");'
    } else {
      replace_js <- 'location.replace("https://painel-homolog.ciga-mpmg.com.br");'
    }
    
    if(pass == "true"){
      ui()
    } else {
      shiny::tags$script(shiny::HTML(replace_js))
    }
  }

}
