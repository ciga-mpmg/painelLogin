validate_session <- function(req,
                             auth_url = "https://us-central1-aecom-371410.cloudfunctions.net/",
                             validation_endpoint) {
  if (!is.na(req$HEADERS["cookie"])) {
    par <- parseCookies(req$HEADERS["cookie"])

    final <- try(
      httr::GET(paste0(auth_url, validation_endpoint, par$painel_ciga_token)) |> httr::content("text"),
      "Token invalido"
    )
  } else {
    final <- "Token invalido"
  }

  if (final == "Token invalido") {
    par <- "false"
  } else {
    par <- "true"
  }

  return(par)
}
