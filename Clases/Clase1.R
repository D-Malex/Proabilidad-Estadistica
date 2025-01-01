# DECLARACIONES
install.packages("readr")
install.packages("dplyr")

# DECLARACIONES
library(readr)
library(dplyr)
insurance <- read_csv("./CSV/insurance.csv")

# Variable insurance con todos los elementos del .csv y operaciones simples
View(insurance)
colnames(insurance)
ncol(insurance)
nrow(insurance)
dim(insurance)

# Algunas operaciones de la libreria dplyr
class(insurance)
head(insurance, 5)

# Nos proporciona un resumen con algunas caracteristicas
summary(insurance)
str(insurance)

#----------------------------------------------------------#
#Minimo promeido y maximo
View(
    ejemplo_1 <- 
    insurance %>% 
    summarise(min(bmi), mean(bmi), max(charges))
)

# Consulta SELECT campos 
View(
    subconjunto_1 <- 
    insurance %>% 
    dplyr::select(sex, age, smoker)
)

# Utilizando el filter
View(
    subconjunto_2 <- 
    insurance %>% 
    dplyr::filter(sex == "male")
)

View(
    subconjunto_2 <- 
    insurance %>% 
    dplyr::filter(sex == "female")
)

View(
    subconjunto_2 <- 
    insurance %>% 
    dplyr::filter(smoker == "yes")
)

View(
    subconjunto_3 <- 
    insurance %>% 
    dplyr::filter(region == "southwest", sex == "male")
)

View(
    subconjunto_4 <-
    insurance %>% 
    dplyr::filter(age >= 30 & age <= 60)
)