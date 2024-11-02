# Trabajo práctico N° 3: variables aleatorias y distribuciones
# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
library(languageserver)
library(readr)
library(dplyr)
library(expss)

#1) Abrir las bases insurance, growth y compensation.
insurance <- read_csv("./CSV/insurance.csv")
growth <- read_csv("./CSV/growth.csv")
compensation <- read_csv("./CSV/compensation.csv")

#2) Clasificar todas las variables en categórica y numérica, 
# numérica aleatoria continua y numérica aleatoria discreta.

# Para insurance:

# 3) Realizar un histograma para la variable hijos.
View(
    ggplot(data = res, mapping = aes(x = media_muestral)) + geom_histogram(aes(y = children),
    colour = 1, fill = "lightblue") + geom_density(lwd = 1, colour = 4)
)

# 4) Realizar un gráfico de densidad para cada una de las 
#variables: edad, IMC y prima.
# 5) idem 4) con fill por cada una de las variables categóricas: genero,
#fumador y región.
# 6) Calcular las medidas de tendencia central para edad, IMC y prima.
# 7) Calcular los cuartiles para edad, IMC y prima.
# 8) Calcular las medidas de variabilidad rango, IQR, desvío estadar y 
#varianza para edad, IMC y prima..


# Para growth:

# 9) Realizar un gráfico de densidad para la 
#variable: gain.
# 10) idem 9) con fill por cada una de las variables categóricas: supplement,
#y diet.
# 11) Calcular las medidas de tendencia central para gain.
# 12) Calcular los cuartiles para gain.
# 13) Calcular las medidas de variabilidad rango, IQR, desvío estadar y varianza
#para gain.

# Para compensation:

# 14) Realizar un gráfico de densidad para cada una de las 
#variables: Root y Fruit.
# 15) idem 9) con fill por cada una de las variables categóricas: Grazing
# 16) Calcular las medidas de tendencia central para Root y Fruit.
# 17) Calcular los cuartiles para Root y Fruit.
# 18) Calcular las medidas de variabilidad rango, IQR, desvío estadar y varianza
#para Root y Fruit.






