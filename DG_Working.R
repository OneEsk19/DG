#### https://towardsdatascience.com/get-started-with-examples-of-reactivity-in-in-shiny-apps-db409079dd11
library(shiny)
library(shinythemes)
library(ggplot2)

mytheme3 <- theme(legend.text = element_text(face = "italic",colour="steelblue4",
                                             family = "Helvetica", size = rel(1)), 
                  axis.title = element_text(colour="steelblue4",family = "Helvetica",
                                            size = rel(1.5)), 
                  axis.text = element_text(family = "Helvetica",colour = "steelblue1",
                                           size = rel(1.5)), 
                  axis.line = element_line(size = 1,colour = "black"), 
                  axis.ticks = element_line(colour="grey",size = rel(1.4)),
                  panel.grid.major = element_line(colour="grey",size = rel(0.5)), 
                  panel.grid.minor = element_blank(), 
                  panel.background = element_rect(fill = "whitesmoke"), 
                  legend.key = element_rect(fill = "whitesmoke"), 
                  legend.title = element_text(colour = "steelblue",size = rel(1.5),
                                              family = "Helvetica"), 
                  plot.title = element_text(colour = "steelblue4", face = "bold",
                                            size = rel(1.7),family = "Helvetica"))


doggos <- read.csv("dogage.csv")

ui <- fluidPage(theme = shinytheme("united"),
  
  h1("If your dog was human, how old would they be?"),
  
  # creating a style
  # h1(id="big-heading", "If your dog was human, how old would they be?"),
  # tags$style(HTML("#big-heading{color: red;}")),
  
  
  # Original
  # titlePanel("If your dog was human, how old would they be?"),
  
  ## sidebar stuff
  sidebarLayout(
    sidebarPanel(
      selectInput("x", label = "Enter your dog's age", choices = doggos$indexall),
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
  # observeEvent(input$calc,{
  #   age <- as.numeric(input$x)
  #   calc <- 16*(log(age)) + 31
  #   calc <- round(calc, digits = 1)
  #   output$result <- renderPrint(paste("Your dog is", calc, "human years old!"))
    #
    observeEvent(input$subs,{
      subs <- doggs$dog_age_y[[ ,input$x]]
      output$result <- renderPrint(paste("Your dog is", subs, "human years old!"))
      
    output$plot <- renderPlot({
      ggplot(doggos, aes(x=all_ages_y, y=human_years)) + geom_line(size=0.5) +
       ## geom_point(data = input$x)
        xlab("Dog Age") + ylab("Human Years") + mytheme3
      
    })
  } 
  )
}
shinyApp(ui, server)