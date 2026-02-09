library(shiny)
library(tidyverse)

got <- read.table("data/got.csv", header=TRUE, sep=";", dec=",")

function(output, input){
  
  output$courbe <- renderPlot({
    got %>%
      mutate(episode_num = as.numeric(str_extract(episode, "(?<=E)[0-9]+")))%>% #pour recupérer uniquement le numéro de l'épisode
      select(season, episode_num, viewers, rating)%>%
      filter(season==input$saison)%>%
    
      ggplot+
      aes(x = episode_num, y = rating) +
      geom_line()+
      geom_point()+
      scale_y_continuous(limits= c(4,10), breaks = 0:10 )+
      scale_x_continuous(breaks = got$episode_num, labels= paste0("E", got$episode_num))+
      xlab("Numéro d'épisode")+
      ylab("Notes")+
      ggtitle(paste0("Les notes des épisodes de Game of Thrones de la ", as.character(input$saison)))+
      coord_fixed(ratio = 1/1)
  })
}

    