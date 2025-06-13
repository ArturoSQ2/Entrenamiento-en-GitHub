library(ggplot2)
datos <- data.frame(Edad =c(17,26,26,39,31,33,25,34,40,24,55,44,44,43,29))

#histograma
ggplot(datos, aes(x = Edad)) +
  geom_histogram(binwidth = 10, fill = "lightblue",color= "blue",alpha = 0.7) +
  labs(title = "Histograma para Edades",x="Edad(años)",y="Frecuencia") +
  theme_bw()

#Suavizado
ggplot(datos, c) +
  geom_density( fill = "lightblue",alpha = 0.7)+
  labs(title = "Histograma para Edades",x="Edad(años)",y="Densidad") +
  theme_bw()

#Histograma + Suavizado
ggplot(datos, aes(x = Edad)) +
  geom_histogram(aes(y=..density..),binwidth = 10, fill = "lightblue",color= "blue",alpha = 0.7)+
  geom_density( color = "red",alpha = 0.7, size =2)+
  labs(title = "Histograma y su respectivo suavizado",x="Edad(años)",y="Densidad")+
  theme_bw()


