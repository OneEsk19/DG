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
                
                sidebarLayout(
                  sidebarPanel(
                    selectInput("x", label = "Select your dog's age", choices = doggos$indexall),
                    actionButton("calc", "Calculate"),
                    tags$br(),
                    tags$br(),
                    span(textOutput("result"), style="color:#E95420; font-size:18px; font-weight:bold"),
                    tags$br(),
                    "The inspiration for this calculator came after reading an article in The Guardian in which they state:",
                    tags$a(href="https://www.theguardian.com/lifeandstyle/2020/jul/02/every-human-year-not-equivalent-to-seven-dog-years-scientists-find", "Every dog year not equivalent to seven human years, scientists find."),
                    tags$br(),
                    tags$br(),
                    "As a science loving dog owner I thought it was of vital importance to provide the most accurate dog-years-to-human-years
conversion calculator based on the very latest (2019)",
                    tags$a(href="https://www.biorxiv.org/content/10.1101/829192v2", "scientific research."),
                  ),
                  
                  mainPanel(
                    mainPanel(
                      h3("Calculate your dog's human age"),
                      plotOutput(outputId = "plot"),
                      "As you can see from this graph,",
                      " a dog's childhood is very short-lived. This rapid development reflects thier wild ancestor: wolves. ", 
                      "Like all wild animals, wolves had to struggle to survive and needed to adapt quickly to new situations.",
                      tags$br(),
                      "It's also intersting to note that with proper care, dogs, like humans, can live relatively long lives.",
                      "The oldest ever dog lived to 30 which is about 85 in human-equivalent years.",
                      
                    )
                  )
                )
)

server <- function(input, output, session) {
  observeEvent(input$calc,{
    var1 <- doggos[ which(doggos$indexall==input$x), ]
    var2 <- var1$human_years
    output$result <- renderText(paste("Your dog is", var2, "human years old!"))
    output$plot <- renderPlot({
      ggplot(doggos, aes(x=all_ages_y, y=human_years)) + geom_line(size=0.5) +
        geom_point(aes(x=var1$all_ages_y, y=var1$human_years), colour="red", size=4) +
        ggtitle("How Dogs Age") + xlab("Dog Age") + ylab("Human Years") + mytheme3
      
      
    })
  } 
  )
}
shinyApp(ui, server)