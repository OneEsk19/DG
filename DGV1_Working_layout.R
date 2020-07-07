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
                ## sidebar stuff
                sidebarLayout(
                  sidebarPanel(
                    numericInput("x", label = "Enter your dog's age(years)", value = 10, min = 0.2,
                                 max = 30),
                    actionButton("calc", "Calculate"),
                    
                    textOutput("result"),
                    tags$br(),
                    "This calculator is based on recent research detailed in 2019 in ",
                    tags$a(href="https://www.biorxiv.org/content/10.1101/829192v2", "this paper."),
                    tags$br(),
                    "For a more friendly synopsis of the reasearch read",
                    tags$a(href="www.theguardian.com/lifeandstyle/2020/jul/02/every-human-year-not-equivalent-to-seven-dog-years-scientists-find", "this article in The Guardian"),
                  ),
                  
                  mainPanel(
                    mainPanel(
                      h3("How Dogs Age"),
                     
                      "As you can see from this",
                      tags$a(href="https://www.youtube.com/watch?v=sIlNIVXpIns", "graph"),
                      ", a dog's childhood is very rapid, which reflects thier wolf ancestry;, 
                      in that wild animals have to adapt very quickly in order to survive.",
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
        xlab("Dog Age") + ylab("Human Years") + mytheme3
      
    })
  } 
  )
}
shinyApp(ui, server)