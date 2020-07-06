
library(ggplot2)
doggos <- read.csv("dogage.csv")

## https://ggplot2.tidyverse.org/reference/

########## My data
DG_plot <- ggplot(doggos, aes(x=all_ages_y, y=human_years)) + geom_line(size=0.5) +
  geom_point() +
  xlab("Dog Age") + ylab("Human Years")
######### Iris data
# iris (more elements)
data(iris)
IrisPlot<-ggplot(iris, aes(Sepal.Length, Petal.Length, colour=Species)) + geom_point() 

### Example
  # ugly plot
mytheme <- theme(panel.background = element_rect(fill = "black", colour = "yellow", size = 4),
                 legend.key = element_rect(fill = "darkgrey", colour = "yellow"),
                 legend.background = (element_rect(colour= "yellow", fill = "blue")))
  print(DG_plot + mytheme)
  print(IrisPlot + mytheme)
    
    
  # theme 2  
mytheme2 <- theme(axis.line = element_line(size = 0.5, color = "black"))
  print(DG_plot + mytheme2)   
    
  # theme 3  
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

  print(DG_plot + mytheme3)
  print(IrisPlot + mytheme3)
