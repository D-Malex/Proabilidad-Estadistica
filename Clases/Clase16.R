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
# Regresión lineal múltiple: variables predictoras cualitativas dicotómicas.
# Hasta ahora hemos supuesto que las variables x son cuantitativas continuas. 
# Sin embargo los modelos de regresión lineal permiten combinar variables independientes cuantitativas con cualitativas. 
# Para ello se utilizan las variables conocidas como dummy.

# Si se quiere incluir una variable categórica con sólo 2 categorías (dicotómica), 
# será necesario introducir únicamente una variable dummy que tomará el valor 0 para una de las categorías, 
# que será la de referencia y el 1 en la otra categoría.
datos_personas <- read_csv("./CSV/datos_personas.csv")
datos_personas
head(datos_personas)

# A modo de ejemplo, la siguiente regresión lineal modeliza el peso de una persona en función de su altura y sexo
# Mientras que Altura es una variable continua, Sexo está planteada como una variable cualitativa con 2 categorías, tomando los valores hombre o mujer, entonces para nuestro modelo es necesario incorporar la variable Sexo como una variable dummy tomando el valor 0 para mujer y el 1 para el hombre.
# Hacemos esta transformación con la función mutate() y case_when() del paquete dyplr
datos_personas <- datos_personas %>%
  mutate(Sexo_dummy = case_when(      #la nueva columna o variable se llamará Sexo_dummy
    Sexo == "Hombre" ~ 1,             #cuando Sexo tome el valor hombre se reemplazará por 1
    Sexo == "Mujer" ~ 0               #cuando Sexo tome el valor mujer se reemplazará por 0
  ))

modelo <- lm(Peso ~ Altura + Sexo_dummy, data = datos_personas)
tidy(modelo)

# Entonces el modelo obtenido es:
# Peso=57.4+0.100Altura−1.87SexoDummy
# Este modelo nos dice que el peso aumenta en 0.100 kg por cada centímetro de aumento en la altura y disminuye 1.87 kg si la persona es hombre frente a que sea una mujer (variable de referencia).


# Regresión lineal múltiple: interacción entre variables.
# Además de introducir variables cuantitativas y categóricas a un modelo también se pueden incluir combinaciones de ellas. Estas combinaciones son llamadas interacciones y se incorporan en el caso de que además del efecto lineal que tiene una variable independiente en la dependiente, una variable independiente pueda modular el efecto de otra independiente debido a que interaccionan entre sí.
# Siguiendo el ejemplo anterior vamos a formular un modelo de regresión lineal múltiple donde se estima el peso de una persona a partir de su altura el ancho de su espalda y la interacción de ambas variables.

modelo <- lm(Peso ~ Altura + Ancho + Altura * Ancho + Sexo_dummy, data = datos_personas)
tidy(modelo)