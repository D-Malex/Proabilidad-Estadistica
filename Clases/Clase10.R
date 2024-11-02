# DOWNLOAD
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr"))
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


#------------------------------------------------------------------------------
# Estimación por intervalo de confianza para la media
insurance <- read_csv("CSV/insurance.csv")
insurance

insurance_continue <- insurance[, c("age", "bmi", "charges")]
insurance_continue

# ──────────────────────────────EDAD────────────────────────────────────┐ 
n        <- nrow(insurance_continue)      # Tamaño de la muestra
mean_age <- round(mean(insurance$age))      # Media muestral
s        <- sd(insurance$age)               # Desvío estandár
z_95     <- 0.95                            # Nivel de confianza

se       <- s / sqrt(n)                     # Error estandár
a        <- 1-z_95                          # Valor critico de t  
t        <- qt(1 - a / 2, n - 1)

li <- mean_age - t * se
ls <- mean_age + t * se
cat("Intervalo de confianza:", round(li), "a", round(ls), " años.\n")
# ─────────────────────────────────────────────────────────────────────┘


# ──────────────────────────────BMI────────────────────────────────────┐ 
n        <- nrow(insurance_continue)      # Tamaño de la muestra
mean_BMI <- round(mean(insurance$bmi))      # Media muestral
s        <- sd(insurance$bmi)               # Desvío estandár
z_95     <- 0.95                            # Nivel de confianza

se       <- s / sqrt(n)                     # Error estandár
a        <- 1-z_95                          # Valor critico de t  
t        <- qt(1 - a / 2, n - 1)

li <- mean_BMI - t * se
ls <- mean_BMI + t * se
cat("Intervalo de confianza:", round(li,2), "a", round(ls,2), " índice de masa.\n")
# ─────────────────────────────────────────────────────────────────────┘


# ──────────────────────────────CHARGES────────────────────────────────────┐ 
n        <- nrow(insurance_continue)         # Tamaño de la muestra
mean_charges <- round(mean(insurance$charges)) # Media muestral
s        <- sd(insurance$charges)              # Desvío estandár
z_95     <- 0.95                               # Nivel de confianza

se       <- s / sqrt(n)                        # Error estandár
a        <- 1-z_95                             # Valor critico de t  
t        <- qt(1 - a / 2, n - 1)

li <- mean_charges - t * se
ls <- mean_charges + t * se
cat("Intervalo de confianza:", li, "a", ls, " carga.\n")
# ─────────────────────────────────────────────────────────────────────────┘
