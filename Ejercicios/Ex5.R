# DOWNLOAD
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr"))
# Visualización
install.packages(c("ggplot2", "corrplot", "qqplotr", "ggpubr"))
# Modelado y análisis estadístico
install.packages(c("broom", "expss"))
# Interacción con lenguajes
install.packages("languageserver")

# IMPORTS
library(dplyr)
library(readr)
library(ggplot2)
library(qqplotr)
library(corrplot)
library(ggpubr)
library(broom)
library(expss)
library(languageserver)


#------------------------------------------------------------------------------
# Ejercicio 1
# ¿Cuál es la puntuación media?   Rta: 17,825
# ¿Cuál es el desvío?             Rta: 5,856
mean(c(27, 16, 18, 26, 18, 28, 25, 20, 24, 26, 
       10, 8, 14, 16, 18, 8, 12, 14, 9, 7, 
       16, 18, 12, 15, 9, 13, 17, 20, 21, 19, 
       26, 24, 17, 23, 25, 22, 16, 15, 18, 23))

sd(c(27, 16, 18, 26, 18, 28, 25, 20, 24, 26, 
       10, 8, 14, 16, 18, 8, 12, 14, 9, 7, 
       16, 18, 12, 15, 9, 13, 17, 20, 21, 19, 
       26, 24, 17, 23, 25, 22, 16, 15, 18, 23))



# Ejercicio 2
# La concentración promedio de zinc que se obtiene en una muestra de 
# mediciones en 36 sitios diferentes de un río es de 2.6 gramos por mililitro. 
# Calcular los intervalos de confianza del 95% y del 99% para la concentración 
# media del zinc en el río. Suponer que la desviación estándar de la población 
# es de 0.3 gramos por mililitro.

n         <- 36
promedio  <- 2.6
z_95      <- 0.95
s         <- 0.3
se        <- s / sqrt(n)                     # Error estandár
t         <- qt(1 - (1-z_95) / 2, n - 1)

li <- promedio - t * se
ls <- promedio + t * se
cat("2a. Intervalo de confianza para el 95%:", round(li,2), "a", round(ls,2), "gramos por milimetro.\n")

n         <- 36
promedio  <- 2.6
z_99      <- 0.99
s         <- 0.3
se        <- s / sqrt(n)                     # Error estandár
t         <- qt(1 - (1-z_99) / 2, n - 1)

li <- promedio - t * se
ls <- promedio + t * se
cat("2b. Intervalo de confianza para el 99%:", round(li,2), "a", round(ls,2), "gramos por milimetro.\n")



# Ejercicio 3
# Una empresa de material eléctrico fabrica lamparitas que tienen una duración 
# distribuida de forma aproxiamda normal, con una desviación estándar de 40
# horas. Si una muestra de 45 lamparitas tiene una duración promedio de 780 
# horas, calcule un intervalo de confianza del 96% para la media de la población 
# de todas las lamparitas producidas por la empresa.

n         <- 45  # lamparitas
promedio  <- 780 # horas
s         <- 40
z_96      <- 0.96
se        <- s / sqrt(n)                     # Error estandár
t         <- qt(1 - (1-z_96) / 2, n - 1)

li <- promedio - t * se
ls <- promedio + t * se
cat("3. Intervalo de confianza para el 96%:", round(li,2), "a", round(ls,2), "hs.\n")



# Ejercicio 4
# Las estaturas de una muestra aleatoria de 50 estudiantes del INSPT tienen 
# una media de 174.5 centímetros y una desviación estándar de 6.9 
# centímetros.
# a) Construir un intervalo de confianza del 98% para la estatura media de 
# todos los estudiantes del INSPT.
# b) ¿Qué podemos afirmar con una confianza del 98% acerca del posible 
# tamaño de nuestro error, si estimamos que la estatura media de todos 
# los estudiantes del INSPT es de 174.5 centímetros?

n        <- 50    #estudiantes
promedio <- 174.5 #cm
s        <- 6.9   #cm
z_98     <- 0.98
se       <- s / sqrt(n)                     # Error estandár
t        <- qt(1 - (1-z_98) / 2, n - 1)

li <- promedio - t * se
ls <- promedio + t * se
cat("4a. Intervalo de confianza para el 98%:", round(li,2), "a", round(ls,2), "cm.\n")

# b. Interpretación
cat("4b. Con una confianza del 98%, podemos afirmar que el posible error en la estimación de la estatura media es de", round(t * se, 2), "cm.\n")