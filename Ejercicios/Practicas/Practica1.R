# INSTALL
install.packages("readr")
install.packages("dplyr")
install.packages("")

# IMPORT
library(readr)
library(dplyr)
library()

# PRACTICA

#   Instala un paquete
install.packages("readr")

#   Llama un paquete
library(readr)

#   Te lista todos los paquetes que podes usar
available.packages()

#   Nos dice el tipo de dato de un elemento
class('a')

#   Creamos un vector
x <- c(1,2,3,3,5,7,8,1,9,0,10, 3)

#   Tamaño de un vector
length(x)

#   Obtener un elemento
x[length(x)]

#   Conocer el lugar que ocupa el elemento 3
which(x==3)