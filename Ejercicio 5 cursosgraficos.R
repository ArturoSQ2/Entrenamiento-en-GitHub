#Arturo Sedano Quirarte
#install.packages("HistData")
library(HistData)

data(Galton)

x <- Galton$child

#Ejercicio 1
#promedio
mean(x)
# 68.08847
#mediana
median(x)

#Ejercicio 2
#desviacion estandar
sd(x)
# 2.517941
mad(x)
#2.9652

#Ejercicio 3
x_with_error <- x
x_with_error[1] <- x_with_error[1]*10
mean(x_with_error)-mean

#Ejercicio 4 
sd(x_with_error)-sd(x)
#68.08847

#Ejercicio 5
median(x_with_error)-median(x)
#0

#Ejercicio 6
mad(x_with_error)-mad(x)
#0

#Ejercicio 7
#Opcion 3, un diagrama de Caja detectaria

#Ejercico 8
error_avg <- function(k, x) {
  # Cambiar el primer valor del vector x a k
  x[1] <- k
  
  # Calcular y devolver el promedio del vector modificado
  return(mean(x))
}

# Definimos un vector de ejemplo
x_ejemplo <- c(1, 2, 3, 4, 5)

# Llamamos a la función con k = 10000 y k = -10000
print(paste("Promedio con k = 10000:", error_avg(10000, x_ejemplo)))
print(paste("Promedio con k = -10000:", error_avg(-10000, x_ejemplo)))



