#Arturo_Sedano_Quirarte
library(dslabs)

data(heights)

x <- heights$height[heights$sex == "Male"]

#Ejercicio 1
proporcion <- mean(x> 69 & x<=72)
# proporcion 0.333743, 

#Ejercicio 2
pnorm(72, mu, sd) - pnorm(69, mu, sd)
#la proporcion se parece 
# a la distribucion normal. 
#pnorm(72, mu, sd) - pnorm(69, mu, sd) = 0.306

#Ejercicio 3
real <- mean(x > 79 & x <= 81)
aprox <-  pnorm(81, mu, sd) - pnorm(79, mu, sd)real/aprox
# la proporcion real es 1.614261 mas grande

#Ejercicio 4 
1-pnorm(7*12,69,3)
#se obtiene un valor de 2.866516e-07
#solo un porcentaje muy bajo de hombres supera esta estatura

#Ejercicio 5
1E9*(1-pnorm(7*12,69,3))
# Aprox 286 personas

#Ejercico 6 
p <- (1-pnorm(7*12,69,3))
n <- round(1E9*p)
10/n
#El 3 porciento de los hombres con altura superior a 7
#estarian inscritos en la NBA

#Ejercico 7
p7 <- (1-pnorm(80,69,3))
n7 <- round(1E9*p7)
150/n7
#Una proporcion del 0.12%

#Ejercicoi 8
#Opicion 3 