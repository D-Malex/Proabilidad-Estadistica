# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
library(languageserver)
library(readr)
library(dplyr)
library(expss)


# Probabilidad con campana gauciana
print(
    pnorm(q = 0, mean = 0, sd = 1, lower.tail = TRUE)
)

# Otro ejemplo
print(round(
        pnorm(q = 1.78, mean = 0, sd = 1, lower.tail = TRUE),2
    )*100
)

# Agarra 10 valores aleatorios
    # Tamaño de muestra: N=10
    # Muestra: Resultado
print(
    muestra <- rnorm(10, 0, 1)
)

#
print(muestra <- data.frame(muestra))

# Ordenado
print(muestra <- muestra %>% arrange(muestra))

#
print(
    data <- muestra %>% mutate("Probabilidad" = pnorm(muestra,0,1))
)



print(
    muestra1 <- data.frame(uno = rnorm(10,0,1))
)
print(
    muestra1 <- muestra1 %>% mutate(Prob = pnorm(muestra1$uno,0,1))
)
class(muestra1$uno)
