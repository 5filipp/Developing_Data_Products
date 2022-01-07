library(shiny)
data <- read.csv("houses.csv")

# Defining UI
ui <- fluidPage(
  
  # App title
  titlePanel("Houses Pricing. Melbourne 2018. DDP project. Filipp Trubin. Jan 06 2022"),
  
  # Sidebar layout 
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  

  output$distPlot <- renderPlot({
    
    x    <- data$Price
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "black",
         xlab = "Price (in K)",
         las=1,
         main = "Pricing chart depends on Land Area")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
