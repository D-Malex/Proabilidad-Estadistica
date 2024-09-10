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

# PARTE 1: Análisis exploratorio

#1) Leer la base compensation
compensation <- read_csv("CSV/compensation.csv")
growth <- read_csv("CSV/growth.csv")

#2) Hacer un primer análisis exploratorio utilizando todas las funciones vistas.
# Este análisis debe incluir, tamaño o dimension de la base, tipos de variables,
# nombres de variables, resumen de las variables, etc. Identificar si las 
#variables son categóricas o numéricas.
str(compensation)
class(compensation)
colnames(compensation)
summary(compensation)
dim(compensation)
nrow(compensation)
ncol(compensation)

# Sobre el dataset compensation (compensación)
#El conjunto de datos de compensación es sobre la producción de fruta (fruit) 
#en una cierta región y el diámetro inicial de la raíz (root) en condiciones de 
#pastoreo (grazing) o sin pastoreo (ungrazing).


# PARTE 2: Preparación de datos
#3) Cambiar (a elección) el nombre de la base compensation.
compensacion <- compensation

#4) Renombrar las variables en español.
compensacion <-
    compensacion %>%
    rename(
        Raiz = Root,
        Fruta = Fruit,
        Pasto = Grazing
    )

#5) Mostrar qué valores distintos toman todas las variables categóricas.
View(
    compensacion %>%
    distinct(Pasto)
)

#6) Con la información obtenida en 5) recodificar las variables categóricas en 
#español.
compensacion <- compensacion %>% 
    mutate(
        Pasto = case_when(
            Pasto == "Ungrazed"~"Sin Pasto",
            Pasto == "Grazed"~"Con Pasto"
            )
    )



# PARTE 3: Subconjuntos de datos

#7) Hacer un subconjunto de registros de aquellos en los que los crecimientos
#se desarrollaron en suelos con pastoreo.
composicion_conPasto <- compensacion %>%
dplyr::filter(Pasto == "Con Pasto")

#8) Hacer un subconjunto de registros de aquellos en los que los crecimientos
#se desarrollaron en suelos sin pastoreo.
composicion_sinPasto <- compensacion %>%
dplyr::filter(Pasto == "Sin Pasto")

#9) Hacer un subconjunto extrayendo únicamente la columna que lleva
#las mediciones de la masa de los frutos.
composicion_masaFrutos <- compensacion %>%
dplyr::select(Fruta)

#10) Obtener los registros de árboles cuyo fruto tiene
#más de 100gr.
composicion_fruta100 <- composicion_masaFrutos %>%
dplyr::filter(Fruta >= 100)

# PARTE 4: Primer análisis de datos tablas de frecuencias

#11) Para esta base de datos, ¿tiene sentido plantearse tablas de frecuencia?
# Comente.
# No tiene sentido aplicar tablas de frecuencia porque no hay variabls para comparar
# simplemente poseemos datos numericos y con una variable categorica que indica
# una pequeña espesificacion de los datos antes dados.
#Util solo si os interesa saber cuantos hay pasto y cuantos sin pasto
cross_cases(composicion, Pasto)

#12) Leer, hacer un primer análisis exploratorio y preparar la base GROWTH (PARTE 1)
# La base GROWTH contiene la GANANCIA (gain) de peso en las vacas de un cierto establo. 
# Esta ganancia se midió a expensas de cuatro complementos alimenticios 
#(suplementos) y tres cereales diferentes.
str(growth)
class(growth)
colnames(growth)
summary(growth)
dim(growth)
nrow(growth)
ncol(growth)

ganancia <- growth

ganancia <-
    ganancia %>%
    rename(
        Suplemento = supplement,
        Dieta = diet,
        Peso_ganado = gain
    )

ganancia <- ganancia %>% 
    mutate(
        Dieta = case_when(
            Dieta == "barley"~"cebada",
            Dieta == "oats"~"avena",
            Dieta == "wheat"~"trigo"
            )
    )
#SUPLEMENTOS (supplement): "agrimore", "control", "supergain", "supersupp".
#CEREALES (diet): "barley" (cebada), "oats" (avena), "wheat" (trigo).

#NOTA: Si lo desea, puede preparar los datos a gusto (PARTE 2).

#13) Realizar la tabla de frecuencias para los SUPLEMENTOS.
cross_cases(ganancia, Suplemento)

#14) Realizar la tabla de frecuencia para los CEREALES.
cross_cases(ganancia, Dieta)