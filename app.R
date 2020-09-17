# Define UI for the app that draws a histogram
ui <- fluidPage(
    # App title
    titlePanel("Hello World!"),

      # Sidebar layout with input and output definitions
      sidebarLayout(
             # Sidebar panel for inputs
             sidebarPanel(
          
                      # Input slider for number of bins
                      sliderInput(inputId = "bins", label="Number of bins:", min=5,
                                      max=50, value=30)),
      
              # Main panel for displaying outputs 
              mainPanel(
              # Output: Histogram
                 plotOutput(outputId = "distPlot")
)
)
)

# Define server logic required to draw a histogram
server <- function(input, output){
  
      # Histogram of the old Faithful Geyser data
      # With requested number of bins
      # This expression that generates a histogram is wrapped in a cell
      # to render plot to indicate that:
      # 1. It is "reactive" and therefore should be automatically re-executed
      # when inputs (input$bins) change
      # Its output type is a plot
      output$distPlot <- renderPlot({
      
          x <- faithful$waiting
          bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
            hist (x, breaks = bins, col = "#75AADB", border = "orange",
                  xlab= "Waiting time to next eruption (in mins)", 
                  main= "Histogram of waiting times")
          })
       }

library(shiny)
shinyApp(ui=ui, server = server)