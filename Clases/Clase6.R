# DECLARACIONES
install.packages("readr")
install.packages("dplyr")

# DECLARACIONES
library(readr)
library(dplyr)

# Ejercicio 0
View(
    datos <- (
        27, 16, 18, 26, 18, 28, 25, 20, 24, 26, 
        10,  8, 14, 16, 18,  8, 12, 14,  9,  7, 
        16, 18, 12, 15,  9, 13, 17, 20, 21, 19, 
        26, 24, 17, 23, 25, 22, 16, 15, 18, 23
    )
)

# ¿Cual es la puntuacion media? => 17,825
# ¿Cual es el desvio? => 5,856


# Ejercicio1
# La concentracion promedio de zinc que se obtiene en una muetstra de mediciones en 36 sitios 
# diferentes de un rio es de 2.6 gramos por mililitro.
# Calcualr los intervalos de confianza del 95% y del 99% para la concentracion media del zinc en 
# el  rio.
# Suponer que la desviacion estandar de la poblacion es de 0.3 gramos por militro.
tamanio_muestra = 36
promedio_muestra = 2.6
desviacion = 0.3
z_95 <- qnorm(0.95)
z_99 <- qnorm(0.99)

Li_95 <- promedio_muestra - z_95 * (desviacion/sqrt(tamanio_muestra))
Ls_95 <- promedio_muestra + z_95 * (desviacion/sqrt(tamanio_muestra))
#  [2.517757, 2.682243]

Li_99 <- promedio_muestra - z_99 * (desviacion/sqrt(tamanio_muestra))
Ls_99 <- promedio_muestra + z_99 * (desviacion/sqrt(tamanio_muestra))
# [2.483683, 2.716317]


# Ejercio2
# Una empresa dematerial electrico fabrica lamparitas que teinen una duracion distribuida de
# forma aproximada normal, con una desviacion estandar de 40 horas. Si una muestra de 
# 45 lamparaitas tien e una duracion promedio de 780 horas, calcule un intervalo de confianza 
# del 96% para la media de poblacio de todas las lamparitas producidas por la empresa.
tamanio_muestra = n = 45
promedio_muestra = 780 
desviacion = s = 40
intervalo_confianza = z_96 <- qnorm(0.96)

Li_96 <- promedio_muestra - z_96 * (desviacion/sqrt(tamanio_muestra))
Ls_96 <- promedio_muestra + z_96 * (desviacion/sqrt(tamanio_muestra))
print(paste("[",Li_96, ",", Ls_96,"]"))
#  [769.560925166448, 790.439074833552]


# Ejercicio3
# Las estaturas de una muestra aleatoria de 50 estudiantes dle INSPT  tiene una media de 174.5
# centimetros y una desviacion estandar de 6.9 centimetros.
#
# a) Construir un intervalo de confianza del 98% para la estatura media de todos los estudiantes
# del INSPT.
#
# b) ¿Que podemos afirmart con una confianza del 98% acerca del posible tamaño de nuestro error, 
# si estimamos que la estatura media de todos los estudiantes del INSPT eds de 174.5 centimetros?
tamanio_muestra = n = 50
promedio_muestra = x = 174.5 
desviacion = s = 6.9
intervalo_confianza = z_98 <- qnorm(0.98)

# A
Li_98 <- promedio_muestra - z_98 * (desviacion/sqrt(tamanio_muestra))
Ls_98 <- promedio_muestra + z_98 * (desviacion/sqrt(tamanio_muestra))
print(paste("[",Li_98, ",", Ls_98,"]"))
#  [172.495936701444, 176.504063298556]


# Ejercicio4



# Ejercicio5
n=500
x=340

qchisq(, 0, T, F)
pchisq()