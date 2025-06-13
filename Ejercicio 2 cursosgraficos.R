#Arturo Sedano Quirarte
#install.packages("r2country")
#install.packages("gapminder")
#install.packages("ggplot2")

library(ggplot2)
library(dslabs)
library(r2country)
library(gapminder)
library(dplyr)
data(r2country)

#Ejercicio 1
male <- c(175,158,165,162,174,184,139,168,157,142,152,177)
female <- c(145,148,145,132,178,167,142,162,171)
length(male)
length(female)

#Ejercicio 2
percentile <-c(0.1, 0.3, 0.7,0.9)
female_percentiles <- quantile(female,percentile)
male_percentiles <- quantile(male,percentile)

df <- data.frame(female = female_percentiles, male = male_percentiles)

#Ejercicio 3
# El pais con mayor tamaño de poblacion estaria en Asia (opcion 3)

#Ejercicio 4 
#Opcion 1, Africa

#Ejercicio 5 
#10 millones

#Ejercicio 6 
#Opcion 1 0.75
#Dado que no se muestra el diagrama me di a la tarea de investigar y hacer el mio
pais = c("Alemania", "Francia", "Italia", "España", "Polonia", "Rumania", 
         "Países Bajos", "Bélgica", "Grecia", "República Checa", "Portugal", 
         "Hungría", "Suecia", "Austria", "Bulgaria", "Dinamarca", "Finlandia",
         "Eslovaquia", "Noruega", "Irlanda", "Croacia", "Bosnia y Herzegovina",
         "Albania", "Lituania", "Eslovenia", "Letonia", "Estonia", "Chipre",
         "Luxemburgo", "Malta", "Islandia", "Montenegro", "Macedonia del Norte",
         "Moldova", "Serbia", "Suiza", "Ucrania", "Reino Unido", "Bielorrusia"),

poblacion_millones = c(83.2, 67.8, 59.1, 47.4, 38.0, 19.1, 17.4, 11.5, 
                       10.7, 10.7, 10.3, 9.7, 10.4, 9.0, 6.9, 5.8, 5.5,
                       5.4, 5.4, 5.0, 3.9, 3.3, 2.8, 2.8, 2.1, 1.9, 1.3,
                       0.9, 0.6, 0.5, 0.4, 0.6, 2.1, 2.6, 6.8, 8.7, 44.0, 
                       67.0, 9.4)
boxplot(poblacion_millones)
