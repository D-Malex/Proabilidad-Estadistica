# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
library(languageserver)
library(readr)
library(dplyr)
library(expss)

View(jiquad_a<- qchisq(p=1-0.900, df=5))
# Estimacion del desvio estandar poblacional (Signma)
# desvio estandar muestral (ese)s
# Varianza poblacional: desvio al cuadrado
# ????

# Para calcular la VARIANZA podemos calcular el s2(s cuadrado) por medio de la funcion 'var()' que nos devuelve la varianza de un vector de datos.


#__________________________________________________________________________
# Los siguientes son los pesos en decagramos de 10 paquetes de semillas de pasto distribuidas por la empresa Amanecer:
muestra <- c(46.4, 46.1, 45.8, 47.0, 46.1, 45.9, 45.8, 46.9, 45.2, 46.0)
# Proporcionar un intervalo de confianza del 95% para la viarianza de todos los pesos de este tipo de paquetes de semillas de pasto distribuidas por la empresa. La probabildiad se distribuye normal.

#DATOS
porcentaje = 0.95
alpha   <- (1-porcentaje) 
muestra <- c(46.4, 46.1, 45.8, 47.0, 46.1, 45.9, 45.8, 46.9, 45.2, 46.0)

#VALORES
n  = length(muestra)
s2 = var(muestra)
x2 = (n-1)

# RESPUESTA
qchisq(alpha,x2,lower.tail=F)
qchisq(alpha,x2,lower.tail=T)
qchisq(porcentaje,x2,lower.tail=T)

qchisq(0.05,9,lower.tail=F)
qchisq(0.05,9,lower.tail=T)
qchisq(0.95,9,lower.tail=T)
