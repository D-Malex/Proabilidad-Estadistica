# INSTALL
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")

# IMPORT
library(readr)
library(dplyr)
library(ggplot2)
insurance <- read_csv("insurance.csv")

# DataBase
View(insurance)

# Cuartiles de insurance edad
quantile(insurance$age)

# Cuantiles de inturance edad, 15 y 85
quantile(insurance$age, c(0.15, 0.85))

# Boxplot 
ggplot(data = insurance, aes(x = charges)) + geom_boxplot()

# Rango
max(insurance$age) - min(insurance$age)

# Desvio estandar
sd(insurance$IMC)

# Varianza
sd(insurance$IMC)^2

# Intervalo intercuartilico
IQR(insurance$IMC)

# Distribucion normal
View(ggplot(data = data.frame(x = c(-5, 5)), aes(x = x)) + geom_function(fun = dnorm))

# Distribucion normal con mas de una onda
ggplot(data = data.frame(x=c(-5,5)),aes(x=x))+
  geom_function(fun = dnorm) + # si no se especifican argumentos, se asume mu=0 y sigma=1 
  geom_function(fun = dnorm, args = list(3,0.5))

# Se puede dar color
ggplot(data = data.frame(x=c(-5,5)),aes(x=x))+
  geom_function(fun = dnorm, colour="red") + #especificamos el color
  geom_function(fun = dnorm, args = list(3,0.5),colour="blue") #especificamos el color

ggplot(data = data.frame(x = c(-5, 5)), aes(x = x)) + geom_function(fun = dnorm,
    colour = "red", linewidth = 1.5) + geom_vline(aes(xintercept = 0, color = "Media 1"),
    linetype = "dashed") + geom_function(fun = dnorm, args = list(3, 0.5), colour = "blue",
    linewidth = 1.5) + geom_vline(aes(xintercept = 3, color = "Media 2"), linetype = "dashed") +
    scale_color_manual(name = "Referencias", breaks = c("Media 1", "Media 2"), values = c(`Media 1` = "red",
        `Media 2` = "blue"))

