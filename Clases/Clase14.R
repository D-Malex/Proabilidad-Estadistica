# DOWNLOAD
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr", "broom"))
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
#------------------------------------------------------------------------------------------
# Predicción mediante un modelo de regresión simple
#   Elección de variables para un modelo
#   De estos gráficos observamos que las variables mpg y wt tienen una correlación negativa fuerte. 
#   Cuando el peso aumenta, el rendimiento disminuye.
modelo  <- lm(mpg ~ wt, data = mtcars)
resumen <- tidy(modelo)
resumen

# De esta tabla sabemos que la pendiente es −5.35 y la ordenada es 37.3. Ambas estimaciones tienen un muy buen p-value.
# Calculamos el coeficiente de determinación (R^2). Primero, aplicamos summary() a nuestro modelo:
sum_modelo <- summary(modelo)

# Luego, definimos la cantidad R_cuad que será extraída del summary de nuestro modelo.
R_cuad <- sum_modelo$r.squared
R_cuad

# Este valor, indica que aproximadamente el 75% de la variabilidad del rendimiento de combustible se debe al peso del vehículo.
# Cuando wt=0 entonces mpg=37.3 por lo que en este caso, no se tiene una interpretación coherente para este valor. 
# En este caso, la ordenada es necesaria para sustentar el modelo.
# Cuando el peso aumenta en 1lb (mil libras) el rendimiento del auto (en millas por galón) disminuye en  5.34

# Llegados a este punto, vamos a ver cómo utilizar el modelo para predecir el rendimiento.
# Primero definimos un dataframe que se lleve el valor de x (en este caso wt):
valor <- data.frame(wt = 5.345)

# Luego, calculamos la predicción usando la función predict() de R base. A la función le pasamos el modelo y el valor.
prediccion <- predict(modelo, valor)
prediccion

# De esta manera obtenemos la predicción para el valor de y (en este caso mpg). 
# La ventaja del código para la predicción, radica en la practicidad cuando el modelo utiliza más de una variable predictora.
