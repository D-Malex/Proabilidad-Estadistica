# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
install.packages(c("ggplot2", "rlang"))
library(languageserver)
library(readr)
library(dplyr)
library(expss)
library(ggplot2)
library(rlang)

View(jiquad_a<- qchisq(p=1-0.900, df=5))
# Estimacion del desvio estandar poblacional (Signma)
# desvio estandar muestral (ese)s
# Varianza poblacional: desvio al cuadrado
# ????

# Para calcular la VARIANZA podemos calcular el s2(s cuadrado) por medio de la funcion 'var()' que nos devuelve la varianza de un vector de datos.


#EJERCICIO2_______________________________________________________________
# Los siguientes son los pesos en decagramos de 10 paquetes de semillas de pasto distribuidas por la empresa Amanecer:
muestra <- c(46.4, 46.1, 45.8, 47.0, 46.1, 45.9, 45.8, 46.9, 45.2, 46.0)
# Proporcionar un intervalo de confianza del 95% para la viarianza de todos los pesos de este tipo de paquetes de semillas de pasto distribuidas por la empresa. La probabildiad se distribuye normal.

#DATOS
porcentaje = 0.95
alpha   <- (1-porcentaje) #0.05 
alfa_s2 <- (alpha/2)      #0.025 --alfa sobre 2
muestra <- c(46.4, 46.1, 45.8, 47.0, 46.1, 45.9, 45.8, 46.9, 45.2, 46.0)

#VALORES
n  = length(muestra)#10
x2 = (n-1)          #9          --grados de libertad
s2 = var(muestra)   #0.2862222  --varianza

# RESPUESTA --Chi
qchisq(alpha,x2,lower.tail=F)     #16.91898
qchisq(alpha,x2,lower.tail=T)     #3.325113
qchisq(porcentaje,x2,lower.tail=T)#16.91898

qchisq(0.05,9,lower.tail=F)#16.91898
qchisq(0.05,9,lower.tail=T)#3.325113
qchisq(0.95,9,lower.tail=T)#16.91898
qchisq(0.95,9,lower.tail=F)#3.325113

#Para calcular la chi para el limite superior:
chi<- qchisq(alfa_s2,x2,lower.tail=T)      #2.7
chi<- qchisq((1-alfa_s2),x2,lower.tail=F)  #2.7

ls = ((x2*s2)/chi)                         #((9*0.28)/2.7) 
#0.95

#Para calcular la chi para el limite inferior:
chi<- qchisq((1-alfa_s2),9,lower.tail=T)#19.02277
li = ((x2*s2)/chi)                         #((9*0.28)/19) 
#0.13


#EJERCICIO3___________________________________________________________
baseautos<- cars;

# Crear el gráfico de dispersión
tryCatch({
  ggplot(cars, aes(x = speed, y = dist)) + geom_point()
}, error = function(e) {
  print("Error en la creación del gráfico:")
  print(e)
  # Ver más detalles del error
  print("A continuacion detalles del error:")
  print(rlang::last_trace())
})

#  Unas variables son normales cuanto mas se acercan a la linea que se grafique

# Estimasr por intervalos de confianza la media.
speed=cars$speed;
media_muestra<- mean(speed)                     #15.4
desviacion_estandar <- sd(speed)                #5.287644
 n<- length(speed)                              #50
nc <- 0.95    
 z<- qnorm(nc)                                  #1.644854
li<- media_muestra - z * (desviacion_estandar/sqrt(n))
ls<- media_muestra + z * (desviacion_estandar/sqrt(n))
print(cat("Intervalo de confianza del 95%: [", li, ", ", ls, "]\n"))
# Intervalo de confianza del 95%: [ 14.17 ,  16.63 ]


dist=cars$dist;
media_muestra<- mean(dist)                     #15.4
desviacion_estandar <- sd(dist)                #5.287644
 n<- length(dist)                              #50
nc <- 0.95    
 z<- qnorm(nc)                                 #1.644854
li<- media_muestra - z * (desviacion_estandar/sqrt(n))
ls<- media_muestra + z * (desviacion_estandar/sqrt(n))
print(cat("Intervalo de confianza del 95%: [", li, ", ", ls, "]\n"))
# Intervalo de confianza del 95%: [ 36.98559 ,  48.97441 ]


