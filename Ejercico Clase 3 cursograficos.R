#Sesion 3 Ejercicio 1
# Crear un grafico de lineas 
#que represente.
install.packages("gapminder")
library(gapminder)
library(dplyr)
library(dslabs)
library(ggplot2)
data("gapminder")
gapminder


#filtrado de datos
years <- 1952:2007
countries <-c("Haiti","Canada","United States","Mexico","France","Niger","Uganda","Spain","Lybia","Hungary","Austria","")
gapminder_filtered <- gapminder %>% 
  filter(year %in% years, country %in% countries)
gapminder_filtered

#Generacion de Graficos
ggplot(gapminder_filtered, aes(x = year))+
  geom_line(aes(y=lifeExp,color = country),alpha = 0.5)+
  facet_wrap(~continent) +
  labs(title = "Comparacion de Esperanzas de Vida",
       x = "Año",
       y = "Esperanza de Vida")+
  theme_classic()

#Ejercicio 2
mexico_data <- gapminder %>% 
  filter(country =="Mexico" & year >= 2000 & year <=2020)
correlation <- cor(mexico_data$pop,mexico_data$gdpPercap*mexico_data)

ggplot(mexico_data, aes(x = pop,y = gdpPercap*pop/1e9 ))+
geom_smooth(method = "lm",color= "red",linetype = "dashed", se = F)+
labs(title= "Relacion entre PIB y Poblacion", x = "Poblacion",y = "PIB")

#Ejercicio 3
data("gapminder") 
gapminder_2010 <- gapminder %>% filter(year == 2010)
 gapminder_2010 %>% ggplot(aes(x=log10(population), y= fertility, color = continent))+
   geom_point(alpha=0.7,size= 2)+
   theme_minimal()+
   theme(legend.position = "right" )+
   scale_color_manual(values = c("#1f78b4","#fa98f4","#fa98f4","#fa98f4","#f78b21"))+
   geom_smooth(method = "lm",color = "black" )
 #  annotate("text",x=7,y=50)
 
 #Ejercicio Final
 #Secuencia de angulo de 0 a 2pi
 theta <- seq(0,2*pi,length.out =1000)
 theta
 r = 1-2*cos(sin(0.5*theta))
 
 df<-data.frame(x=r*cos(theta),y=r*sin(theta))
 
 ggplot(df,aes(x,y))+
 geom_path(color="red",size=2)+
 coord_fixed()
 