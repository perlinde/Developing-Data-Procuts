#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(grid)
library(ggplot2)
library(png)
library(tidyverse)
library(rmarkdown)
dat <- readRDS("data/shotData.rds")


shinyServer(function(input, output) {
    image <- png::readPNG("www/rink3.png")
    
    output$distPlot <- renderPlot({
      
    ggplot(filter(dat, team %in% input$team & defTeam %in% input$defTeam), aes(x, y)) +
        annotation_custom(rasterGrob(image, width=unit(1, "npc"),
                                     height = unit(1, "npc")), 
                          xmin=-4, xmax=26, ymin=15, ymax=-15)+
        ylim(-17, 17)+ xlim(-5, 26 )+
        stat_density2d(aes(fill = ..level..), alpha = 0.3, geom = "polygon") +
        scale_fill_continuous(low = "grey",high = "red", space = "Lab") +
        #facet_wrap(~ defTeam)+
        theme_bw()+
        theme(panel.grid.major = element_blank(),
              panel.grid.minor = element_blank(),
              axis.ticks.x=element_blank(),
              axis.text.x=element_blank(),
              axis.text.y=element_blank())+
        xlab("")+ylab("")+
        guides(fill=FALSE)
    }, height=900, width=900)
  
})


