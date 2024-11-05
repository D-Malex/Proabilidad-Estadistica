# INSTALL ALL PACKAGES
install.packages(c("dplyr", "readr", "broom", "MASS", "ggplot2", "corrplot", "qqplotr", "ggpubr", "broom", "expss", "languageserver"))

# IMPORTS
library(dplyr)
library(readr)
library(MASS)
library(ggplot2)
library(qqplotr)
library(corrplot)
library(ggpubr)
library(broom)
library(expss)
library(languageserver)
#------------------------------------------------------------------------------------------

# a)	Cargar la librería MASS de R base.
install.packages("MASS")
library(MASS)

# b)	Cargar el dataset (base de datos) Boston
MASS::Boston
colnames(MASS::Boston)
# La base de datos Boston del paquete MASS contiene información del censo de viviendas en el área de Boston, Massachusetts, recopilada por el Servicio de Estadísticas de Vivienda de EE. UU. en 1978.

# c)
# "crim"  CONTINUA
# "zn"    CONTINUA
# "indus" CONTINUA
# "chas"  DISCRETA DICOTOMICA
# "nox"   CONTINUA
# "rm"          "age"    "dis"     "rad"     "tax"     "ptratio" "black"   "lstat"   "medv"