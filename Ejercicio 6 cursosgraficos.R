#Arturo_Sedano_Quirarte
library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)

#Arturo_Sedano_Quirarte
#Ejercicio 1
p <- murders %>% ggplot()
class(p)
#p es un "ggplot"

#Arturo_Sedano_Quirarte
#Ejercicio 2
p <- ggplot(murders)
#Opcion 1, no pasa nada

#Arturo_Sedano_Quirarte
#Ejercicio 3
p <- ggplot(heights)
#Opcion 1, no pasa nada

#Arturo_Sedano_Quirarte
#Ejercicio 4
names(murders)
#Opcion 2, total_murders and populataion_size

#Arturo_Sedano_Quirarte
#Ejercicio 5
murders %>% ggplot(aes(x = population , y = total )) +
geom_point()

#Arturo_Sedano_Quirarte
#Ejercicio 6
murders %>% ggplot(aes(x = total, y = population )) +
  geom_point()


#Arturo_Sedano_Quirarte
#Ejercicio 7
#Opción 1: Necesitamos mapear un carácter 
#a cada punto a través del argumento label 
#en aes.

#Arturo_Sedano_Quirarte
#Ejercicio 8
murders %>%
  ggplot(aes(population, total, label = abb)) +  # abb podría ser la abreviatura del estado
  geom_point() +
  geom_label()

#Arturo_Sedano_Quirarte
#Ejercicio 9
#Opcion 3 Usando un argumento color en ggplot

#Arturo_Sedano_Quirarte
#Ejercicio 10
murders %>%
  ggplot(aes(population, total, label = abb)) +  # abb podría ser la abreviatura del estado
  geom_point() +
  geom_label(color = "blue")

#Arturo_Sedano_Quirarte
#Ejercicio 11
#Opción 2: Mapeando los colores a través del argumento color de aes porque cada etiqueta necesita un color diferente.
murders %>%
  ggplot(aes(population, total, color = region, label = abb)) +  
  geom_point() +
  geom_label(show.legend = FALSE)



#Arturo_Sedano_Quirarte
#Ejercicio 12
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

p + scale_x_log10()
#Arturo_Sedano_Quirarte
#Ejercicio 13
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

p + scale_x_log10() + scale_y_log10()

#Arturo_Sedano_Quirarte
#Ejercicio 14
p <- murders %>% ggplot(aes(population, total, label = abb, color = region)) +
  geom_label()

p + scale_x_log10() + scale_y_log10()+ ggtitle("Gun Murder Data")

#Arturo_Sedano_Quirarte
#Ejercicio 15
#Opcion 3: heights

#Arturo_Sedano_Quirarte
#Ejercicio 16
library(dplyr)
library(ggplot2)
library(dslabs)
data(heights)

#Arturo_Sedano_Quirarte
#Ejercicio 17
p <- heights %>% ggplot(aes(x = height))+
  geom_histogram()
p

#Arturo_Sedano_Quirarte
#Ejercicio 18
p <- heights %>% ggplot(aes(x = height))+
  geom_histogram(binwidth = 1)
p

#Arturo_Sedano_Quirarte
#Ejercicio 19
p <-heights %>% ggplot(aes(height)) +
  geom_density()
p

#Arturo_Sedano_Quirarte
#Ejercicio 20
p <- heights %>%
  ggplot(aes(x = height, group = sex)) +
  geom_density()  #}
p

#Arturo_Sedano_Quirarte
#Ejercicio 21
p <- heights %>%
  ggplot(aes(x = height, group = sex, fill = sex)) +
  geom_density()  # alpha controla la transparencia
p

#Arturo_Sedano_Quirarte
#Ejercicio 21
p <- heights %>%
  ggplot(aes(x = height, group = sex, fill = sex)) +
  geom_density(alpha = 0.2)  # alpha controla la transparencia
p