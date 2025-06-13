#Arturo_Sedano_Quirarte
# Preliminares
# Cargar librerías
library(dslabs)
library(dplyr)
library(ggplot2)
data(gapminder)
head(gapminder)

#Arturo_Sedano_Quirarte
#Ejercicio 1
# Filtrar solo datos de África en el año 2012
gapminder_africa_2012 <- gapminder %>%
  filter(continent == "Africa" & year == 2012)
# Creacion del Grafico 
# Gráfico de dispersión
ggplot(data = gapminder_africa_2012, aes(x = fertility, y = life_expectancy)) +
  geom_point() +
  labs(
    title = "Esperanza de Vida vs. Fertilidad en África (2012)",
    x = "Tasa de Fertilidad (hijos por mujer)",
    y = "Esperanza de Vida (años)"
  )

#Arturo_Sedano_Quirarte
#Ejercicio 2
# Filtrar solo datos de África en el año 2012
gapminder_africa_2012 <- gapminder %>%
  filter(continent == "Africa" & year == 2012)
# Creacion del Grafico 
# Gráfico de dispersión
ggplot(data = gapminder_africa_2012, aes(x = fertility, y = life_expectancy, color= region)) +
  geom_point() +
  labs(
    title = "Esperanza de Vida vs. Fertilidad en África (2012)",
    x = "Tasa de Fertilidad (hijos por mujer)",
    y = "Esperanza de Vida (años)"
  )

#Arturo_Sedano_Quirarte
#Ejercicio 3
# Filtrar solo datos de África en el año 2012
gapminder_africa_2012 <- gapminder %>%
  filter(continent == "Africa" & year == 2012)
# Creacion del Grafico 
# Gráfico de dispersión
ggplot(data = gapminder_africa_2012, aes(x = fertility, y = life_expectancy, color= region)) +
  geom_point() +
  labs(
    title = "Esperanza de Vida vs. Fertilidad en África (2012)",
    x = "Tasa de Fertilidad (hijos por mujer)",
    y = "Esperanza de Vida (años)"
  )
# Filtrar solo datos de África en el año 2012
df <- gapminder %>%
  filter(continent == "Africa" & year == 2012 & fertility <= 3  & life_expectancy >=70 )%>%
  select(country, region)
print(df)

#Arturo_Sedano_Quirarte
#Ejercicio 4
tab <- gapminder %>%
  filter(country %in% c("United States","Vietnam" & year %in% 1960:2010))
print(tab)


#Arturo_Sedano_Quirarte
#Ejercicio 5

# Definir los países y años que queremos filtrar
paises <- c("Vietnam", "United States")
años <- 1960:2010

# Filtrar los datos y guardarlos en 'tab'
tab <- gapminder %>%
  filter(country %in% paises & year %in% años )

# Mostrar los primeros resultados
head(tab)
ggplot(tab, aes(x = year, y = life_expectancy, color = country)) +
  geom_line() +
  labs(
    title = "Esperanza de Vida en Vietnam vs. Estados Unidos (1960–2010)",
    x = "Año",
    y = "Esperanza de Vida",
    color = "País"
  ) +
  theme_bw()


#Arturo_Sedano_Quirarte
#Ejercicio 6

# Definir los países y años que queremos filtrar
pais <- c("Cambodia")
años <- 1960:2010

# Filtrar los datos y guardarlos en 'tab'
tab <- gapminder %>%
  filter(country %in% pais & year %in% años )

# Mostrar los primeros resultados
head(tab)
ggplot(tab, aes(x = year, y = life_expectancy, color = country)) +
  geom_line() +
  labs(
    title = "Esperanza de Vida en Camboya (1960–2010)",
    x = "Año",
    y = "Esperanza de Vida",
    color = "País"
  ) +
  theme_bw()


#Ejercicio 7
daydollars <- gapminder %>%
  filter(continent == "Africa" & year == 2010) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))
print(daydollars)

#Ejercicio 8 
ggplot(data = daydollars,aes(x=dollars_per_day))+
        geom_density()+
        scale_x_continuous(trans = "log2")+
        theme_minimal()

#Ejercicio 9 
daydollars <- gapminder %>%
  filter(continent == "Africa", year == c(1970,2010)) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))

ggplot(data = daydollars,aes(x=dollars_per_day))+
    geom_density()+
    scale_x_continuous(trans = "log2")+
    labs( title = "Densidad de ingresos en paises africanos",
          subtitle = "Años 1970 y 2010",
          y = "Densidad",
          x = "Dolar por dia")+
    facet_grid(year~.)+
    theme_minimal()

#Ejercicio 10 
daydollars <- gapminder %>%
  filter(continent == "Africa", year == c(1970,2010)) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))

ggplot(data = daydollars,aes(x=dollars_per_day, fill = region ))+
  geom_density(position = "stack")+
  scale_x_continuous(trans = "log2")+
  labs( title = "Densidad de ingresos en paises africanos",
        subtitle = "Años 1970 y 2010",
        y = "Densidad",
        x = "Dolar por dia")+
  facet_grid(year~.)+
  theme_minimal()

#Ejercicio 11
gapminder_Africa_2010 <- gapminder %>%
  filter(continent == "Africa" & year == 2010) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))

ggplot(data = gapminder_Africa_2010,aes(x=infant_mortality, y= dollars_per_day, color=region))+
geom_point()

#Ejercicio 12
gapminder_Africa_2010 <- gapminder %>%
  filter(continent == "Africa" & year == 2010) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))

ggplot(data = gapminder_Africa_2010,aes(x=infant_mortality, y= dollars_per_day, color=region))+
  geom_point()+scale_x_continuous(trans = "log2")

#Ejercicio 13
gapminder_Africa_2010 <- gapminder %>%
  filter(continent == "Africa" & year == 2010) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))

ggplot(data = gapminder_Africa_2010,aes(x=infant_mortality, y= dollars_per_day, color=region,label = country))+
  geom_point()+
  scale_x_continuous(trans = "log2")+
  geom_text(nudge_y = 0.2, check_overlap = TRUE)

#Ejercicio 14
gapminder_Africa_2010 <- gapminder %>%
  filter(continent == "Africa" & year %in% c(1970, 2010)) %>%
  mutate(dollars_per_day = gdp/population/365 ) %>%
  filter(!is.na(dollars_per_day))

ggplot(data = gapminder_Africa_2010,aes(x=infant_mortality, y= dollars_per_day, color=region,label = country))+
  geom_point()+
  scale_x_continuous(trans = "log2")+
  geom_text(nudge_y = 0.2, check_overlap = TRUE)+
  facet_grid(year~.)+
  labs(y= "Dollar per day", x= "Infant Mortality")
