library(shiny)
library(ggplot2)
got <- read.table("data/got.csv", header=TRUE, sep=";", dec=",")

renderPrint(got)