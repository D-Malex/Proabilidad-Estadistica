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

# ───────────────────────────────asdasdf────────────────────────────────────┐

# ──────────────────────────────────────────────────────────────────────────┘