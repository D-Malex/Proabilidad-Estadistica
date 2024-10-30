# IMPORTS & DECLARES
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr"))
# Visualización
install.packages(c("ggplot2", "corrplot", "qqplotr", "ggpubr"))
# Modelado y análisis estadístico
install.packages(c("broom", "expss"))
# Interacción con lenguajes
install.packages("languageserver")
# Saco las linternas
remove.packages("lintr")

library(dplyr)
library(readr)
library(ggplot2)
library(qqplotr)
library(corrplot)
library(ggpubr)
library(broom)
library(expss)
library(languageserver)


#---------------------------------------------------------------------------------------------------------------------------------------------------------------
# 1. Utilizar el dataset Faithful de R base y analizar si las variables continuas se distribuyen normalmente. Justificar.


#----------------------------------------------CAMAPANA--------------------------------------------------------------------------
# Generar una variable continua que sigue una distribución normal
n <- length(faithful)                                           # Número de observaciones
media <- mean(faithful$eruptions)                               # Media de la distribución
desviacion_estandar <- sd(faithful$eruptions)                   # Desviación estándar de la distribución
datos <- rnorm(n, mean = media, sd = desviacion_estandar)       # Generamos los datos
df <- data.frame(valores = datos)                               # Crear un data frame para la visualización
ggplot(df, aes(x = valores)) +                                  # Graficar la distribución normal
  geom_density(fill = "blue", alpha = 0.5, size = 1) +
  labs(title = "Histograma de Erupciones con Curva de Densidad", x = "Duración de las Erupciones", y = "Densidad") +

n <- length(faithful)                                           # Número de observaciones
media <- mean(faithful$waiting)                                 # Media de la distribución
desviacion_estandar <- sd(faithful$waiting)                     # Desviación estándar de la distribución
datos <- rnorm(n, mean = media, sd = desviacion_estandar)       # Generamos los datos
df <- data.frame(valores = datos)                               # Crear un data frame para la visualización
ggplot(df, aes(x = valores)) +                                  # Graficar la distribución normal
  geom_density(fill = "blue", alpha = 0.5, size = 1) +
  labs(title = "Histograma de Tiempos con Curva de Densidad", x = "Intervalos entre erupciones", y = "Densidad") +

# JUSTIFICACION:
# Forma de Campana: Si el histograma y la curva de densidad muestran una forma de campana y son simétricos alrededor de la media,
# esto sugiere que la variable eruptions o waiting puede seguir una distribución normal.
#-------------------------------------------------------------------------------------------------------------------------------


View(volcan <- faithful)
# Calcular la media y la desviación estándar de las erupciones
mu <- mean(volcan$eruptions)
sigma <- sd(volcan$eruptions)
# Crear un rango de valores para la campana de Gauss
x_values <- seq(min(volcan$eruptions), max(volcan$eruptions), length.out = 100)
# Calcular la densidad de la distribución normal
y_values <- dnorm(x_values, mean = mu, sd = sigma)
# Crear el gráfico
erup_isNormal <- ggplot(data = faithful, aes(x = eruptions)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "lightgray", alpha = 0.5) +
  geom_density(color = "blue") +
  labs(
    title = "Distribución de Erupciones de Old Faithful con Curva Normal",
    x = "Duración de Erupciones (minutos)",
    y = "Densidad"
  )

erup_isNormal

erup_isNormal <- ggplot(data = faithful, aes(x = eruptions)) +
  geom_function(fun = dnorm)
erup_isNormal
# La función que estás utilizando, geom_function(fun = dnorm),
# solo traza la curva de densidad de una distribución normal
# sobre el gráfico de los datos. Sin embargo, por sí sola,
# no determina si la variable continua es normal.
#
# Histograma: Un histograma (como el que has creado) con
# la curva normal superpuesta te permite ver visualmente
# si la distribución de los datos se asemeja a una
# distribución normal.
#
# Q-Q Plot: Un gráfico de cuantiles (Q-Q plot) compara
# los cuantiles de tus datos con los cuantiles de una
# distribución normal. Si los puntos se alinean aproximadamente
# en una línea recta, los datos son normales.

ggplot(volcan, aes(sample = volcan$eruptions)) +
  geom_qq() +
  geom_qq_line()

ggplot(volcan, aes(sample = volcan$eruptions)) +
  geom_qq_band(color = "red", fill = "green", alpha = 0.3, linetype = "dashed", linewidth = 1) +
  stat_qq_line() +
  stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
  labs(title = "Q-Q Plot de Erupciones del Volcán Old Faithful")



ggplot(volcan, aes(sample = volcan$waiting)) +
  geom_qq() +
  geom_qq_line()

ggplot(volcan, aes(sample = volcan$waiting)) +
  geom_qq_band(
    color = "red",
    fill = "green", alpha = 0.3, linetype = "dashed", linewidth = 1
  ) +
  stat_qq_line() +
  stat_qq_point(color = "blue", shape = 21, alpha = 0.4)
