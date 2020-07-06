#######THIS WORKS!

#### https://towardsdatascience.com/get-started-with-examples-of-reactivity-in-in-shiny-apps-db409079dd11

library(shiny)
library(ggplot2)
doggos <- read.csv("dogage.csv")

ui <- fluidPage(
  titlePanel("If your dog was human, how old would they be?"),
  ## sidebar stuff
  sidebarLayout(
    sidebarPanel(
      numericInput("x", label = "Enter your dog's age(years)", value = 10, min = 0.2,
                   max = 30),
      actionButton("calc", "Calculate"),
      
      textOutput("result"),
    ),
    
    mainPanel(
      mainPanel(
        h3("How Dogs Age"),
        "This calculator is based on research detailed in ",
        tags$a(href="https://www.biorxiv.org/content/10.1101/829192v2", "this paper"),
        "originally found via",
        tags$a(href="www.theguardian.com/lifeandstyle/2020/jul/02/every-human-year-not-equivalent-to-seven-dog-years-scientists-find", "This article in The Guardian"),
        "Then blabh blah balh about the lovely graph",
        plotOutput(outputId = "plot")
      )
    )
  )
)

server <- function(input, output, session) {
  observeEvent(input$calc,{
    age <- as.numeric(input$x)
    calc <- 16*(log(age)) + 31
    calc <- round(calc, digits = 1)
    output$result <- renderPrint(paste("Your dog is", calc, "human years old!"))
    #
    output$plot <- renderPlot({
      ggplot(doggos, aes(x=all_ages_y, y=human_years)) + geom_line(size=0.5) +
        xlab("Dog Age") + ylab("Human Years")
      
    })
  } 
  )
}
shinyApp(ui, server)