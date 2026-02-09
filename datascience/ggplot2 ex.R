library(tidyverse)
library(ggplot2)
#Import des données
got <- read.table("datascience/got.csv", header=TRUE, sep=";", dec=",")
#view(got)

got %>%
  mutate(episode_num = as.numeric(str_extract(episode, "(?<=E)[0-9]+")))%>% #pour recupérer uniquement le numéro de l'épisode
  select(season, episode_num, viewers, rating) ->gotr
gotr

gotr %>%
  ggplot+
  aes(x = episode_num, y = rating, color=season, group = season) +
  geom_line()+
  geom_point()+
  #facet_grid(row=vars(season))+
  scale_y_continuous(limits= c(4,10), breaks = 0:10 )+
  scale_x_continuous(breaks = gotr$episode_num, labels= paste0("E", gotr$episode_num))+
  xlab("Numéro d'épisode")+
  ylab("Notes")+
  ggtitle("Les notes des épisodes de Game of Thrones")+
  coord_fixed(ratio = 1/1)

gotr %>%
  drop_na%>%
  ggplot+
  aes(x = episode_num, y = viewers, color=season, group = season) +
  geom_line()+
  geom_point()+
  scale_y_continuous(labels = function(x) x / 1000000)+
  #facet_grid(row=vars(season))+
  scale_x_continuous(breaks = gotr$episode_num, labels= paste0("E", gotr$episode_num))+
  xlab("Numéro d'épisode")+
  ylab("Nombre de spectateur (en milion)")+
  ggtitle("Le nombre de spectateur de Game of Thrones par épisode et par saison")
  #coord_fixed(ratio = 1/1)

gotr %>%
  ggplot+
  aes(x = season, y = viewers) +
  geom_col()+
  scale_y_continuous()+
  scale_y_continuous(labels = function(x) x / 1000000)+
  xlab("Season") +
  ylab("Nombre de spectateur (en milion)")
  ggtitle("Le nombre de spectateur de Game of Thrones par saison")
  
gotr %>%
  drop_na%>%
    ggplot+
    aes(x = viewers, y = rating, color=season) +
    geom_point()+
    geom_smooth(method = "lm", size=0.5)+
    scale_y_continuous(breaks = 1:10, limits = c(1,10))+
  scale_x_continuous(labels = function(x) x / 1000000) +
  xlab("Nombre de spectateur (millions)") +
  ylab("Notes")+
  ggtitle("Corrélation entre la note et le nombre de spectateur")
 
