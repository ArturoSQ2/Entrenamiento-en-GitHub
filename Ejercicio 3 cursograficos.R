#Arturo_Sedano_Quirarte
library(dplyr)
library(ggplot2)
library(dslabs)
data(murders)
data(heights)

#Ejercico 1
NC <- murders %>%
  filter(region == "North Central") %>%
  count()
porcentaje <- 100* NC/count(murders)
#Opcion 3: 25 porciento

#Ejercicio 2
# Creamos una tabla con la cuenta de estados por región
region_counts <- murders %>%
  count(region) %>%
  rename(cantidad = n)

# Graficamos con ggplot2
ggplot(region_counts, aes(x = region, y = cantidad, fill = region)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribución de estados por región",
       x = "Región",
       y = "Número de estados",
       fill = "Región") +
  theme_minimal()

#Ejercicio 3
#Asumiendo que se trata del grafico 9.3.2 
#La opcion seria la opcion 3: 80%

# Solo hombres
male_heights <- heights %>%
  filter(sex == "Male") %>%
  pull(height)

# Calcular percentiles del 0 al 100
percentiles <- quantile(male_heights, probs = seq(0, 1, 0.01)) %>%
  enframe(name = "percentil", value = "altura")

# Convertir 'percentil' a numérico (estaba como carácter)
percentiles <- percentiles %>%
  mutate(
    percentil = as.numeric(percentil),  # Convierte a número
    percentil = percentil * 100          # Ahora sí puedes multiplicar por 100
  )

# Graficar
ggplot(percentiles, aes(x = percentil, y = altura)) +
  geom_line(color = "steelblue") +
  labs(
    title = "Gráfico de Percentiles de Alturas (Hombres)",
    x = "Percentil (%)",
    y = "Altura (pulgadas)",
    caption = "Datos: heights (dslabs)"
  ) +
  theme_minimal() +
  scale_x_continuous(breaks = seq(0, 100, by = 5))

#Ejercicio 4
#Asumiendo que se trata del grafico 9.3.2 
#La opcion seria la opcion 3: 69 pulgadas

data(heights)

# Filtrar alturas de hombres
male_heights <- heights %>%
  filter(sex == "Male") %>%
  pull(height)

# Verificar los datos
print(paste("Total de hombres:", length(male_heights)))
print(paste("Rango de alturas:", round(min(male_heights), 2), "-", round(max(male_heights), 2)))

# Calcular percentiles
percentil_values <- quantile(male_heights, probs = seq(0, 1, 0.01))

percentiles_df <- tibble(
  percentil = seq(0, 1, 0.01),  # Usar directamente las probabilidades
  altura = as.numeric(percentil_values)
)

# Verificar el dataframe
print(head(percentiles_df))
print(paste("Dimensiones del dataframe:", nrow(percentiles_df), "x", ncol(percentiles_df)))

# Crear el gráfico
ggplot(percentiles_df, aes(x = percentil * 100, y = altura)) +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_point(color = "darkblue", size = 0.5, alpha = 0.6) +
  labs(
    title = "Gráfico de Percentiles de Alturas (Hombres)",
    x = "Percentil (%)",
    y = "Altura (pulgadas)",
    caption = "Datos: heights (dslabs)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10)
  ) +
  scale_x_continuous(breaks = seq(0, 100, by = 10)) +
  scale_y_continuous(breaks = seq(60, 80, by = 2))

#Ejercicio 5

murders <- murders %>%
  mutate(murder_rate = (total / population) * 100000)
median_rate <- median(murders$murder_rate)

ggplot(murders, aes(x = murder_rate)) +
  stat_ecdf(geom = "line", color = "steelblue") +
  geom_vline(xintercept = median_rate, color = "red", linetype = "dashed") +
  annotate("text", x = median_rate, y = 0.5, label = "Mediana", color = "red", hjust = -0.1) +
  labs(
    title = "eCDF de las tasas de asesinatos por estado",
    x = "Tasa de asesinatos (por 100,000 habitantes)",
    y = "Proporción acumulativa"
  ) +
  theme_minimal()

# Calcula cuántos estados tienen tasa > 10
num_estados_sobre_10 <- murders %>%
  filter((total / population) * 100000 > 10) %>%
  nrow()
num_estados_sobre_10
#Opcion 1, SOLO UN ESTADO

#Ejercicio6
#Opcion 4, solo cuatro estados tienen tasas encima de 5

#Ejercicio 7 
male_heights <- heights %>%
  filter(sex == "Male")

ggplot(male_heights, aes(x = height, y = ..density..)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "black") +
  labs(
    title = "Histograma de Alturas con curva de densidad",
    x = "Altura (pulgadas)",
    y = "Densidad"
  ) +
  theme_minimal()

clase_filtrada <- heights %>%
  filter(height > 62.5 & height <= 65.5)  %>%
  filter(sex == "Male") 
#Opcion 3: 58

#Ejercico 8
porcentajeE8 <- heights %>%
  summarise(
    proporciónE8 = mean(height < 60),
    porcentajeE8 = proporciónE8 * 100
  )

porcentajeE8$porcentajeE8
#Opcion: 1, 1 porciento


#Ejercicio 9 

# Graficar el density plot
ggplot(murders, aes(x = population / 1e6)) +  # Convertir a millones
  geom_density(fill = "steelblue", color = "black", alpha = 0.7) +
  labs(title = "Density Plot de la Población por Estado en EE.UU.",
       x = "Población (millones)",
       y = "Densidad") +
  theme_minimal()
#Opcion 2 segun el grafico. 
  