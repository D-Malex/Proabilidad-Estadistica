# IMPORTS & DECLARES            
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr"))
# Visualización
install.packages(c("ggplot2", "corrplot", "qqplotr", "ggpubr"))
# Modelado y análisis estadístico
install.packages(c("broom", "expss"))
# Interacción con lenguajes
install.packages("languageserver")

library(dplyr)
library(readr)
library(ggplot2)
library(corrplot)
library(qqplotr)
library(ggpubr)
library(broom)
library(expss)
library(languageserver) 


# 1. 
# Utilizar el dataset Faithful de R base y analizar si las variables continuas se distribuyen normalmente. Justificar.


#---@ VARIABLES CONTINUAS @---#
# Las variables continuas son aquellas que pueden tomar un número infinito de valores dentro de un # rango específico. Se caracterizan por poder medirse y dividirse en fracciones, lo que significa # que pueden ser representadas en una escala numérica continua.
#---@                     @---#


#---@ DISTRIBUCIN NORMAL  @---#
# Cuando decimos que un conjunto de datos se distribuye normalmente, nos referimos a que sigue una # distribución normal, también conocida como distribución gaussiana. Esta es una de las 
# distribuciones más importantes en estadística

# Características de la Distribución Normal
# 
# 1. Forma de Campana: La gráfica de la distribución normal tiene forma de campana,
#    simétrica alrededor de la media.
#
# 2. Media, Mediana y Moda Iguales: En una distribución normal, la media (promedio),
#    la mediana (el valor central) y la moda (el valor más frecuente) son todos iguales
#    y se encuentran en el centro de la distribución.
#
# 3. Desviación Estándar: La dispersión de los datos se mide mediante la desviación estándar.
#    Aproximadamente el 68% de los datos se encuentran dentro de una desviación estándar de la media,   
#    el 95% dentro de dos desviaciones estándar y el 99.7% dentro de tres desviaciones estándar.
#    Esto es conocido como la regla empírica o 68-95-99.7.
#
# 4. Colas: Las colas de la distribución se extienden hacia ambos lados de la media,
#    pero nunca tocan el eje horizontal, lo que implica que hay una probabilidad, aunque muy
#    pequeña, de que ocurran valores extremos.
#---@                     @---#


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
    labs(title = "Distribución de Erupciones de Old Faithful con Curva Normal",
       x = "Duración de Erupciones (minutos)",
       y = "Densidad")

erup_isNormal

erup_isNormal <- ggplot(data = faithful, aes(x = eruptions)) + geom_function(fun = dnorm)
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

ggplot(volcan, aes(sample = volcan$eruptions)) + geom_qq() + geom_qq_line() 

ggplot(volcan, aes(sample = volcan$eruptions)) +
  geom_qq_band(color = "red", fill = "green", alpha = 0.3, linetype = "dashed", linewidth = 1) +
  stat_qq_line() +
  stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
  labs(title = "Q-Q Plot de Erupciones del Volcán Old Faithful")



ggplot(volcan, aes(sample = volcan$waiting)) + geom_qq() + geom_qq_line() 

ggplot(volcan, aes(sample = volcan$waiting)) + geom_qq_band(color = "red",
    fill = "green", alpha = 0.3, linetype = "dashed", linewidth = 1) + stat_qq_line() +
    stat_qq_point(color = "blue", shape = 21, alpha = 0.4)

