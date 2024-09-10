# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
install.packages("ggplot2")
library(languageserver)
library(readr)
library(dplyr)
library(expss)
library(ggplot2)


# Lectura de la BD
coffecode <- read_csv("./CSV/coffecode.csv")


# Operaciones Basicas
str(coffecode)
class(coffecode)
colnames(coffecode)
summary(coffecode)
dim(coffecode)
nrow(coffecode)
ncol(coffecode)


# Rename the Base
rename <- coffecode


# EJERCICIO:
#   Rename in spanish
cafecodigo <- coffecode %>% rename(
    Horas_codigo = CodingHours,
    Tazas_cafe_por_dia = CoffeeCupsPerDay,
    Tiempo_cafe = CoffeeTime,
    Codificando_sin_cafe = CodingWithoutCoffee,
    Tipo_cafe = CoffeeType,
    Cafe_resuelve_errores = CoffeeSolveBugs,
    Genero = Gender,
    Pais = Country,
    Rango_edad = AgeRange
)


# VARIABLES CATEGORICAS
#    Una variable categórica es una variable estadística que asigna una característica no numérica o 
#    cualitativa a un objeto o cosa en general.
#    Ejemplos de variables categóricas son el color, el sexo, el grupo sanguíneo, el estado civil, 
#    el tipo de material, la forma de pago o el tipo de cuenta bancaria.


# EJERCICIO:
#   Valores distintos de las variables categoricas
View(cafecodigo %>% distinct(Tiempo_cafe))
View(cafecodigo %>% distinct(Tipo_cafe))
View(cafecodigo %>% distinct(Genero))
View(cafecodigo %>% distinct(Pais))
View(cafecodigo %>% distinct(Rango_edad))


# EJERCICIO:
#   Renombrar las variables en español.
View(cafecodigo %>% mutate(
    Tiempo_cafe = case_when(
        Tiempo_cafe == "Before coding"~"Antes de codificar",
        Tiempo_cafe == "While coding"~"Durante la codificacion",
        Tiempo_cafe == "Before and while coding"~"Antes y durante la codificacion",
        Tiempo_cafe == "In the morning"~"En la mañana", 
        Tiempo_cafe == "All the time"~"Todo el tiempo", 
        Tiempo_cafe == "After coding"~"Luego de codificar", 
        Tiempo_cafe == "No specific time"~"Tiempo sin espesificar"
    ),
    Tipo_cafe = case_when(
        Tipo_cafe == "Caffè latte"~"Latte", 
        Tipo_cafe == "Americano"~"Americano",
        Tipo_cafe == "Nescafe"~"Nescafe",
        Tipo_cafe == "Turkish"~"Turco",
        Tipo_cafe == "American Caffee"~"Americano",
        Tipo_cafe == "Expresso (Short Black)"~"Expresso",
        Tipo_cafe == "NA"~"Na",
        Tipo_cafe == "Double Espresso (Doppio)"~"Duppio"
    ),
    Genero = case_when(
        Genero == "Female"~"Mujer",
        Genero == "Male"~"Hombre"
    ),
    Pais = case_when(
        Pais == "Lebanon"~"Libano"
    ),
    Codificando_sin_cafe = case_when(
        Codificando_sin_cafe == "Yes"~"Si",
        Codificando_sin_cafe == "No"~"No",
        Codificando_sin_cafe == "Sometimes"~"A veces"
    ),
    Cafe_resuelve_errores = case_when(
        Cafe_resuelve_errores == "Yes"~"Si",
        Cafe_resuelve_errores == "No"~"No",
        Cafe_resuelve_errores == "Sometimes"~"A veces"
    ),
    Rango_edad = case_when(
        Rango_edad == "18 to 29"~"18 a 29",
        Rango_edad == "30 to 29"~"30 a 39",
        Rango_edad == "40 to 49"~"40 a 49",
        Rango_edad == "Under 18"~"Menos de 18",
        Rango_edad == "50 to 59"~"50 a 59",
    )
))


# EJERCICIO:
#   Hacer 3 subconjuntos de la original
Casos_exitosos <- cafecodigo %>% dplyr::filter(
    Cafe_resuelve_errores == "Yes"
)

Casos_erroneos <- cafecodigo %>% dplyr::filter(
    Cafe_resuelve_errores == "No"
)

Casos_ambiguos <- cafecodigo %>% dplyr::filter(
    Cafe_resuelve_errores == "Sometimes"
)


# TABLA DE FRECUENCIA
#   Una tabla de frecuencias es una tabla donde los datos estadísticos
#   aparecen organizados según las veces que se repiten en la muestra


# EJERCICIO:
#   Hacer una talba de frecuencia
View(cross_cases(cafecodigo, Codificando_sin_cafe, Cafe_resuelve_errores))


# EJERCICIO:
#   Probabilidad de que el cafe resuelva errores en este espacio muestral
View(cafe_resolvio <- cafecodigo %>% dplyr::filter(Cafe_resuelve_errores == "Yes"))

prob_cafe_resuelve <- cafe_resolvio %>% group_by(Cafe_resuelve_errores) %>% 
    summarise(Probabilidad = (n() / nrow(cafecodigo))*100)

prob_cafe_resuelve$Probabilidad


# EJERCICIO:
#   Probabilidad de que el cafe no resuelva errores en este espacio muestral
View(cafe_no_resolvio <- cafecodigo %>% dplyr::filter(Cafe_resuelve_errores == "No"))

prob_cafe_no_resuelve <- cafe_no_resolvio %>% group_by(Cafe_resuelve_errores) %>% 
    summarise(Probabilidad = (n() / nrow(cafecodigo))*100)

prob_cafe_no_resuelve$Probabilidad


# EJERCICIO:
#   Probabilidad de que el cafe tal vez resuelva errores en este espacio muestral
View(cafe_talvez_resolvio <- cafecodigo %>% dplyr::filter(Cafe_resuelve_errores == "Sometimes"))                      # nolint

prob_cafe_talvez_resuelve <- cafe_talvez_resolvio %>% group_by(Cafe_resuelve_errores) %>%                       # nolint
    summarise(Probabilidad = (n() / nrow(cafecodigo))*100)

prob_cafe_talvez_resuelve$Probabilidad


# DISTRIBUCION POISSON:
#    Es una distribucion que describe el numero de eventos que ocurre en un intervalo                      # nolint
#    de tiempo o espacio fijo, cuando estos eventos suceden con una tasa promedio constante                      # nolint
#    y de manera independiente unos de otros.
#    Perfecta para modelar eventos raros o poco frecuentes.


# EJERCICIO:
#   Si 30 cafes hacen que se resulevan los errores, Cual es la probabilidad de que 20 resuelvan.                      # nolint
#   dpois(x lambda)
dpois(20, 30) # => 0.01341115


# DISTRIBUCION BINOMIAL:
#    es una distribucion que describe el numero de exitos en una secuencia de (n)                      # nolint
#    ensayos tiene dos posibles resultados (exito o fracaso), y una probabilidad de exito de (p).                      # nolint
#    Esta distribucion es util para modelar cituaciones donde se repite un experimento binario,                       # nolint
#    un numero fijo de veces.


# EJERCICIO:
#   Probabilidad de que el cafe resuelva errores es del 27%, si 30 personas toman cafe,                      # nolint
#   Cual es la probabilidad de que 20 o 7 resuelvan errores por el cafe.
#   dbinom(x size prob)
dbinom(20, 30, 0.27) # => 5.473641e-06  ~ 00%
dbinom(7, 30, 0.27) #  => 0.1530056     ~ 15%


# GRAFICO DE DENSIDAD
#    Las curvas de densidad vienen en todas las formas y tamaños y nos permiten obtener                       # nolint
#    una comprensión visual rápida de la distribución de valores en un conjunto de datos determinado.                       # nolint
#  · Una curva de densidad nos da una buena idea de la «forma» de una distribución,                       # nolint
#    incluido si una distribución tiene uno o más «picos» de valores frecuentes y si la distribución                      # nolint
#    está sesgada o no hacia la izquierda o hacia la derecha.
#  · Una curva de densidad nos permite ver visualmente dónde se ubican la media y la mediana                      # nolint
#    de una distribución.
#  · Una curva de densidad nos permite ver visualmente qué porcentaje de observaciones en un conjunto                      # nolint
#    de datos se encuentran entre diferentes valores.

# MEDIA
#    Una medida de tendencia central es un valor único que representa el punto central                       # nolint
#    de un conjunto de datos. Este valor también puede denominarse «la ubicación central»                       # nolint
#    de un conjunto de datos.

# MEDIANA
#    La mediana es el valor medio de un conjunto de datos. Puede encontrar la mediana organizando                      # nolint
#    todos los valores individuales en un conjunto de datos de menor a mayor y encontrando el valor medio.                       # nolint
#    Si hay un número impar de valores, la mediana es el valor medio.                         # nolint
#    Si hay un número par de valores, la mediana es el promedio de los dos valores medios.                      # nolint