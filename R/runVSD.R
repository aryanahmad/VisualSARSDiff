#' VSD Launch script
#' Launches a shiny app for VSD
#'
#' @return opens a shiny page

runVSD <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "VisualSARSDiff")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
