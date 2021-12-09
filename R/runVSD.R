#' VSD Launch script
#' Launches a shiny app for VSD
#'
#' @return opens a shiny page
#' @references
#' Dean Attali. (2015, December 7). Building shiny apps - an interactive tutorial. Dean Attali. Retrieved December 9, 2021, from https://deanattali.com/blog/building-shiny-apps-tutorial/#:~:text=You%20can%20also%20create%20a,R%20%2B%20server.
runVSD <- function() {
  appDir <- system.file("shiny-scripts",
                        package = "VisualSARSDiff")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}
