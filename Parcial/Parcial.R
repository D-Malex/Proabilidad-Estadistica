# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
library(languageserver)
library(readr)
library(dplyr)
library(expss)


# CONSIGNA:
# 1) Seleccionar los registros de los consumidores de más de tres tasas de café por día. Llamar a este conjunto alto
# 2) Realizar una tabla de frecuencia de la variable coffe_type de la base alto.
# 3) Seleccionar a la mujer (o las mujeres) que más tasas de café toma por día.
# 4) Identificar los valores distintos que toma la variable AgeRange y recodificar en español, por ejemplo 18 to 29= 18-29.
# 5) Un arquero acierta en el blanco con 0.55 de probabilidad. Calcular la probabilidad de que al tirar una serie de 6 veces acierte:
# a) 3 veces. b) Todas las veces. c) Ninguna.


# Lectura de la BD
coffecode <- read_csv("./CSV/coffee_Seba_Mallo.csv")

# 1)
View(
  alto <- coffecode %>% dplyr::filter(CoffeeCupsPerDay > 3)
)

# 2)
View(
  cross_cases(alto, CoffeeType)
)

# 3)
View(
  alto %>% dplyr::filter(Gender == "Female")
)

# 4)
View(coffecode %>% distinct(AgeRange))
View(
  coffecode %>% mutate(AgeRange = case_when(
    AgeRange == "18 to 29"~"18-29",
    AgeRange == "30 to 39"~"30-39",
    AgeRange == "40 to 49"~"40-49",
    AgeRange == "Under 18"~"<18",
    AgeRange == "50 to 59"~"50-59",
  ))
)

# 5) Probabilidad exito: 0.55, Intentos: 6, exitos: 3, 6 y 0
#       dbinom(x size prob)
tres_aciertos <- round(dbinom(3, 6, 0.55) * 100) # => 0.3032184 ~ 30%
seis_aciertos <- round(dbinom(6, 6, 0.55) * 100) # => 0.02768064 ~ 3%
cero_aciertos <- round(dbinom(0, 6, 0.55) * 100) # => 0.008303766 ~ 1%