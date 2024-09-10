# INSTALL
install.packages("readr")
install.packages("dplyr")
install.packages("expss")

# DECLARACIONES
library(readr)
library(dplyr)
library(expss)
insurance <- read_csv("insurance.csv")

# PRACTICA

#   Definicion de probabilidad --  P(A) = Favorables / Total
View(
    genero <- 
    insurance %>%
    select(sex)
)

#   Contar cantidad de hombres y mujeres
View(
    can_mujeres_hombres <- 
    genero %>%
    group_by(sex) %>%
    summarise(cant = n())
)

#   ¿Cuál es la probabilidad de seleccionar una mujer al azar?
View(
    can_mujeres_hombres %>%
    mutate(cant / nrow(insurance))
)

#   Supongamos que deseamos construir una tabla de contingencia por género y por región de la base insurance.
View(
    TC01 <- 
    cross_cases(insurance, sex, region)
)

#   Incorporar el total marginal por filas. 
View(
    TC02 <-
    TC01 %>%
    mutate(Total = rowSums(TC01[, 2:5]))
)

#   Get first register
View(
    head(insurance, 1)
)

#   Otra forma de tener un breve resumen de una tabla
View(
    glimpse(insurance)
)

# DPLYR
#   Seleccionar	
select(insurance, sex)

#   Filtrar por condicion
filter(insurance, sex=="female")

#   Elimina ciertos registro que cumplan con la condicion
arrange(insurance, smoker=="no")

#   Agrupar por condicion
group_by()

#   Resumir por estadísticos
summarise()

#   Mutar o transformar
mutate()

#   Renombrar 
rename()

#   Si queres agrupar por sex o lo que sea 
View(
    insurance %>%
    group_by(sex) %>%
    summarice()
)

#   Si deseamos ver los datos reordenados en función del agrupamiento previo, utilizamos la función arrange():
View(
    insurance %>%
    arrange(sex)
)
