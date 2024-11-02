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
# Estimación por intervalo de confianza para la proporcion
insurance <- read_csv("CSV/insurance.csv")
insurance

insurance_continue <- insurance[, c("age", "bmi", "smoker", "charges")]
insurance_continue

# ───────────────────────────────FUMADOR────────────────────────────────────┐
n <- nrow(insurance_continue)                     # Tamaño de la muestra
x <- nrow(insurance_continue
      %>% dplyr::filter(smoker == "yes"))         # Número de éxitos ("yes")
pm <- x / n                                       # Proporción muestral

n_confianza <- 0.95                               # Nivel de confianza
a <- 1 - n_confianza
z_95 <- qnorm(1 - a / 2)                          # Valor crítico Z para el 95% de confianza

se <- sqrt(pm * (1 - pm) / n)                     # Error estándar de la proporción

li <- pm - z_95 * se
ls <- pm + z_95 * se

cat("Intervalo de confianza del 95% para la proporción:", round(li,2)*100, "% a", round(ls,2)*100, "%\n")
# ──────────────────────────────────────────────────────────────────────────┘

# ───────────────────────────────NETFLIX────────────────────────────────────┐
# En una muestra aleatoria de n=500 familias que están suscriptas a 
# plataformas en la Ciudad Autónoma de Buenos Aires, se encuentran que x=340
# están suscriptas a Netflix. Calcular el intervalo de confianza del 95% para 
# la porporción real de familias que están suscriptas a Netflix en CABA.

n    <- 500                                       # Tamaño de la muestra
x    <- 340                                       # Número de éxitos 
pm   <- x / n                                     # Proporción muestral
confianza <- 0.95                                 # Nivel de confianza

a <- 1 - confianza
z_95 <- qnorm(1 - a / 2)                          # Valor crítico Z para el 95% de confianza

se <- sqrt(pm * (1 - pm) / n)                     # Error estándar de la proporción

li <- pm - z_95 * se
ls <- pm + z_95 * se

cat("Intervalo de confianza del 95% para la proporción:", round(li,2)*100, "% a", round(ls,2)*100, "%\n")
# ──────────────────────────────────────────────────────────────────────────┘