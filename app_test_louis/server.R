library(shiny)
library(tidyverse)

got <- read.table("data/got.csv", header=TRUE, sep=";", dec=",")

function(output, input){
  
  output$courbe <- renderTable({
    got%>%
      filter(season==input$saison)
  })
}
    