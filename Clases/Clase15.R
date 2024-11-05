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
# Análisis de regresión lineal múltiple
# En este capítulo veremos cómo gestionar un análisis de regresión lineal considerando una variable respuesta y múltiples variables predictoras.
autos <- mtcars

# Regresión lineal múltiple: variables predictoras cuantitativas continuas
# Como deseamos correlacionar variables con el método de regresión lineal, sólo estudiaremos las variables continuas (no discretas). Entonces hacemos un select() de las variables de interés.
autos <- autos %>%
    select(mpg, disp, hp, drat, wt, qsec)

# Ejemplo 1: el caso de mpg explicada por múltiples variables
modelo <- lm(mpg ~ disp + hp + drat + wt + qsec, autos)
tidy(modelo)

# Del resumen podemos observar que los p-values para cada variable predictora no son buenos (p−value>0.05) a excepción de wt que coincide con nuestro modelo de regresion linal simple (de una variable)


#----
# Ejemplo 2: el caso de Fertility explicada por múltiples variables
suizos <- swiss
modelo <- lm(Fertility ~ ., suizos)  #con ~. usamos todas las variables
tidy(modelo)

# En este caso, observamos que los p-values para cada parámetro estimado son muy buenos (p−value<0.05) a excepción de la variable Examination.
# Por lo tanto, excluímos esta variable de nuestro modelo. Detallamos las variables que queremos.
modelo_nuevo <- lm(Fertility ~ Agriculture + Education + Catholic + Infant.Mortality, suizos)  #con ~. usamos todas las variables
tidy(modelo_nuevo)

# Este modelo explica la fecundidad en una región suiza a partir de:
# El porcentaje de fuerza laboral masculina en agricultura en la región.
# El porcentaje de hombres en la región que han recibido educación secundaria.
# El porcentaje de católicos en la región.
# Porcentaje de nacidos vivos que viven menos de un año en la región.
R_cuad <- summary(modelo_nuevo)$r.squared
R_cuad


#----
# Ejemplo 3: predicción mediante un modelo de regresión múltiple.
# Es análogo al modelo de regresión simple. Primero definimos un dataframe que se lleve todos los valores de las variables predictoras:
valores <- data.frame(Agriculture = 17, Education = 12, Catholic = 9.96, Infant.Mortality = 22.2)
valores

# Luego, calculamos la predicción usando la función predict() de R base. A la función le pasamos el modelo y los valores.
prediccion <- predict(modelo_nuevo, valores)
prediccion

# De esta manera, Fertility=72.89274 cuando Agriculture=17.0, Education=12, Catholic=9.96 e Infant.Mortality=22.2 significa que hay unos 73 nacimientos vivos por cada 1000 mujeres entre las edades de 15 a 49 años, en la región suiza en la que el porcentaje de hombres que trabajan en el campo es de 17%, el 12% tiene estudios secundarios, el 10% es católico y el porcentaje de nacidos vivos que viven menos de un año es 22.2% (mortalidad infantil).
