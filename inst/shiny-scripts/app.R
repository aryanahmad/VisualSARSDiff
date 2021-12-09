library(shiny)

ui <- fluidPage(
  navbarPage("VisualSARSDiff",
        tabPanel("P-P Interactions",
            titlePanel("Protein-Protein Interaction Graph"),
            sidebarLayout(sidebarPanel(
                          textInput("protein", "Type a protein you would like to see", "P0DTC2"),
                          ),
                        mainPanel(plotOutput("InteractionPlot")))
        ),
        tabPanel("P-P Comparisons",
                 titlePanel("Protein-Protein Interactions Graph"),
                 sidebarLayout(sidebarPanel(
                   radioButtons("proteinCompare1", "Choose the first Protein to Compare",
                                c("P0DTC2", "G1PXH7"), selected = "P0DTC2"
                   ),
                   radioButtons("proteinCompare2", "Choose the second Protein to Compare",
                                c("P0DTC2", "G1PXH7"), selected = "G1PXH7"
                   ),
                 ),
                 mainPanel(plotOutput("InteractionPlotVenn")))
        )
))

server <- function(input, output){
  output$InteractionPlot <- renderPlot({
    createProteinInteractionGraph(input$protein)
  })

  output$InteractionPlotVenn <- renderPlot({
    compareProteinInteractions(input$proteinCompare1, input$proteinCompare2)
  })
}

shiny::shinyApp(ui=ui, server=server)
