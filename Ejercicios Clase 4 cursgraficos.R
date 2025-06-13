#Crear un grafico de barras
# Demostracion 1 

library(ggplot2)
library(dslabs)
data("mtcars")
mtcars
head(mtcars)

mtcars_filtrado <- mtcars[complete.cases(mtcars$mpg),]
# Crear gráfico de barras
grafico <- ggplot(mtcars_filtrado, aes(x = rownames(mtcars_filtrado), y = mpg, fill = factor(cyl))) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  geom_hline(yintercept = 10, linetype = "dashed", color = "red") +
  labs(
    title = "Millas por Galón por Automóvil",
    x = "Automóvil",
    y = "Millas por Galón (MPG)",
    fill = "Cilindros"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+ # Rotar etiquetas para evitar solapamiento
  geom_text(aes(label = mpg),vjust=-0.5,color="black",size=3)
  theme_minimal()+
  theme(axis.text.x = element_text(angle=45,hjust=1))
# Imprimir gráfico
print(grafico)

#Segundo Ejercicio de la Clase
#library(dslabs)
#data("mtcars")
library(ggplot2)

# Filtrar datos (por si hay NA)
mtcars_filtrado <- mtcars[complete.cases(mtcars$mpg), ]

# Añadir nombres de fila como columna
mtcars_filtrado$modelo <- rownames(mtcars_filtrado)

# Reordenar los modelos por valor descendente de mpg
mtcars_filtrado$modelo <- with(mtcars_filtrado, reorder(modelo, -mpg))

# Crear gráfico con ordenamiento correcto
grafico2 <- ggplot(mtcars_filtrado, aes(x = modelo, y = mpg, fill = factor(cyl))) +
  geom_bar(stat = "identity", position = "dodge", color = "black") +
  labs(
    title = "Millas por Galón por Automóvil",
    x = "Automóvil",
    y = "Millas por Galón (MPG)",
    fill = "Cilindros"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_bw() +
 coord_flip()  # Opcional: mejora la lectura del nombre de los autos

print(grafico2)

#Ejercicio 3
ggplot(mtcars, aes(x= reorder(rownames(mtcars_filtrado),-mpg),y=mpg,fill = factor(cyl)))+
  geom_bar(stat = "identity",position = "dodge",color = "black")+
  geom_text(aes(label = mpg),vjust=-1.5,color="white",size = 3)+
  labs(title = "Grafico",
       x = "modelo",
       y = "Millas por galon",
       fill= "cilindros")+
  theme_minimal() +
  theme(axis.text.x = element_text(angle=4,hjust=1),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_blank(),
      axis.line = element_line(color="black"),
      legend.position = "bottom",
      legend.title = element_text(size=10,face="bold"),
      legend.text = element_text(size=8,color = "black")
  )+
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme_bw() +
  coord_flip()  # Opcional: mejora la lectura del nombre de los autos
      
 #Demostracion Final 
library(gridExtra)
library(ggplot2)
library(dslabs)
library(dplyr)
data("iris")
iris
plot_sepals <- iris %>%
  ggplot(aes(x=Species,y = Sepal.Length, fill = Species))+
  geom_bar(stat= "identity", position = "dodge",alpha =0.7)+
  labs(title = "Comparacion de Longitud", x= "Especie",y= "Longitud de Sepalos")+
  theme_minimal()

plot_sepals

plot_petals <- iris %>% 
  ggplot(aes(x = Species,y = Petal.Length, color=Species))+
  geom_jitter(alpha= 0.5)+
  labs(title = "Distribucion de longitud de petalos por especie", x="especie", y="Longitud de petalos")+
    theme_minimal()

plot_petals

grid.arrange(plot_sepals,plot_petals,ncol=1)