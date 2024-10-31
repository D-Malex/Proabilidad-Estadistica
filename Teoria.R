# VARIABLES CONTINUAS 
# Las variables continuas son aquellas que pueden tomar un número infinito de valores dentro de un rango específico. 
# Se caracterizan por poder medirse y dividirse en fracciones, lo que significa que pueden ser representadas en una escala numérica continua.

# DISTRIBUCION NORMAL
# Cuando decimos que un conjunto de datos se distribuye NORMALMENTE, nos referimos a que sigue una distribución normal, 
# también conocida como distribución gaussiana. 
#  Características de la Distribución Normal
# 1. Forma de Campana: La gráfica de la distribución normal tiene forma de campana, simétrica alrededor de la media.
# 2. Media, Mediana y Moda Iguales: En una distribución normal, la media (promedio), la mediana (el valor central) y la moda (el valor más frecuente) 
#    son todos iguales y se encuentran en el centro de la distribución.
# 3. Desviación Estándar: La dispersión de los datos se mide mediante la desviación estándar. Aproximadamente el 68% de los datos se encuentran 
#    dentro de una desviación estándar de la media, el 95% dentro de dos desviaciones estándar y el 99.7% dentro de tres desviaciones estándar.
#    Esto es conocido como la regla empírica o 68-95-99.7.
# 4. Colas: Las colas de la distribución se extienden hacia ambos lados de la media, pero nunca tocan el eje horizontal, lo que implica que hay una probabilidad,
#    aunque muy pequeña, de que ocurran valores extremos.







# UTIL:
# DOWNLOAD
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


# GGPLOT -- https://ggplot2.tidyverse.org/reference/index.html
# aes()  -- Construct aesthetic mappings
ggplot(data = dataset, aes(x = valor_X, y = valor_y))

# geom_qq()
# Grafica en una linea Oblicua con su punta superior en la derecha y 
# su punta inferior en la izquierda, marca puntos de la muestra (sample).
# geom_qq_line
# Hace visible la linea
# geom_hline(yintercept = 8) + geom_vline(xintercept = 0)
# Genera un mapa carteciano pequeño
ggplot(data = dataset, aes(sample = variable)) + 
  geom_qq() + 
  geom_qq_line() +
  geom_hline(yintercept = 8) + 
  geom_vline(xintercept = 0)

# as.numeric()
# Transforma un valor String a numerico
as.numeric("2")

# length()
# Te da el recuento de las columnas de un dataset
length(swiss)

# nrow()
# Te da el recuento de las filas de un dataset
nrow(swiss)

