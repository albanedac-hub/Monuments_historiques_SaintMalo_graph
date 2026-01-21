library(ggplot2)
library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)

#lire le fichier de données
table <- read.csv("data/saint_malo_dates_MH.csv")

#lancer le code ggplotly qui lit les données et les place au bon endroit
ggplotly(
  ggplot(table,
         aes(x = factor(annee),
             y = nombre,
             fill = type,
             text = paste0(
    "Année : ", annee, "<br>",
    "Type : ", type, "<br>",
    "Nombre : ", nombre
  ))) +

#ces données sont ensuite lues sous forme de graphe en barres
  geom_bar(stat = "identity", position = "dodge") +
  
#ajouter les titres et couleurs
  labs(x = "Année",
       y = "Nombre",
       title = "Nombre de monuments historiques classés et inscrits à Saint-Malo")+
  scale_fill_manual(values = c("steelblue", "orange")) +
  theme_minimal(),
  tooltip = "text")
