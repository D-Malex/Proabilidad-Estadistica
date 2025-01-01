# INSTALL LIBRARYS
install.packages("readr")
install.packages("dplyr")

# CALL LIBRARYS
library(readr)
library(dplyr)

# READ DB
insurance <- read_csv("./CSV/insurance.csv")

# Tabla de edad
edad1 <- insurance$age
edad2 <- insurance %>% select(edad=age)

# Rango de edad
max1 <- max(insurance$age)
min1 <- min(insurance$age)
range <- max1 - min1

max2 <- insurance %>% select(age) %>% summarise(maximo = max(age))

# Desvio estandar de edad
desvio <- sd(insurance$age)
varianza <- desvio^2
varianza <- var(insurance$age)

# Intervalo intercuartilico
intervalo_inter <- IQR(insurance$age)
media_edad <- mean(insurance$age)
