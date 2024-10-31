# DOWNLOAD
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr"))
# Visualización
install.packages(c("ggplot2", "corrplot", "qqplotr", "ggpubr"))
# Modelado y análisis estadístico
install.packages(c("broom", "expss"))
# Interacción con lenguajes
install.packages("languageserver")
# Saco las linternas

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
# 1) Leer el dataset
insurance_ampliada <- read_csv("CSV/insurance_ampliada.csv")
insurance_ampliada

# 2) Determinar las variables continuas
colnombres <- colnames(insurance_ampliada)
colnombres
# Respuesta: edad, IMC, Hijos, prima, Horas_sentado

# 3) Justificar si se distribuyen normalmente
g1 <- ggplot(data = insurance_ampliada, aes(sample = as.numeric(horas_sentado))) + 
        geom_qq() + 
        geom_qq_line() +
        geom_hline(yintercept = 2000) + 
        geom_vline(xintercept = 0) +
        labs(y = "Horas Sentado", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la no normalidad de la variable continua, Horas Sentado, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: insurance_ampliada).")
g1

# 3.b)
g2 <- ggplot(insurance_ampliada, aes(sample = edad)) + 
        geom_qq() + 
        geom_qq_line() +
        labs(y = "Edad", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la no normalidad de la variable continua, Edad, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: insurance_ampliada).")
g2

# 3.c)
g3 <- ggplot(insurance_ampliada, aes(sample = IMC)) +  
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "IMC", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la normalidad de la variable continua, IMC, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: insurance_ampliada).")
g3



#------------------------------------------------------------------------------
# 2) Leer el dataset
growth <- read_csv("CSV/growth.csv")
growth

# 2) Determinar las variables continuas
colnombres <- colnames(growth)
colnombres
# Respuesta: gain

# 3) Justificar si se distribuyen normalmente
g2 <- ggplot(growth, aes(sample = gain)) +
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "gain", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la normalidad de la variable continua, gain, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: growth).")
g2



#------------------------------------------------------------------------------
# 3) Leer el dataset
compensation <- read_csv("CSV/compensation.csv")
compensation

# 2) Determinar las variables continuas
colnombres <- colnames(compensation)
View(compensation)
# Respuesta: Root, Fruit

# 3) Justificar si se distribuyen normalmente
g3 <- ggplot(compensation, aes(sample = Root)) +
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Root", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la normalidad de la variable continua, Root, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: compensation).")
g3

# 3.b)
g3 <- ggplot(compensation, aes(sample = Fruit)) +
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Fruit", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la normalidad de la variable continua, Fruit, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: compensation).")
g3



#------------------------------------------------------------------------------
# 4) Agregando bandas de confianza
g4 <- ggplot(insurance_ampliada, aes(sample = as.numeric(horas_sentado))) + 
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Horas Sentado", 
             title = "Estimacion por intervalo", 
             subtitle = "Se destaca la no normalidad de la variable continua, Horas Sentado, por su dispersion con respecto a la recta.", 
             caption = "(based on data from Dataset: insurance_ampliada).")
g4



#------------------------------------------------------------------------------
# 5) Estimacion puntual para la media
media <- mean(as.numeric(insurance_ampliada$horas_sentado)) # 13226.63
desvio <- sd(as.numeric(insurance_ampliada$horas_sentado))  # 12485.33

# Estimacion por intervalo de confianza para la media
#   Supongamos que la base insurance_ampliada lleva el registro de una población.
#   Vamos a tomar una muestra aleatoria simple de 100 registros.
#   Para este muestreo usamos la función slice_sample de dplyr:
m1 <- insurance_ampliada %>%
    slice_sample(n = 100, replace = F)
m1

# Construimos un intervalo de confianza para la media del 90% con esta muestra:
#   Fijamos el nivel de confianza en un 90%. 
#   Esto significa que necesitamos que de cada 100 veces que tomemos una muestra y 
#   construyamos nuestro intervalo, el valor de media poblacional (verdadero y desconocido) 
#   esté contenido en 90 de ellos.
#   Una vez que tenemos fijada la probalidad que llamamos nivel de confianza, tenemos que 
#   tener en cuenta que esta probablidad deja un 10% en repartidos en las dos colas de la 
#   distribución normal. Entonces, tenemos un 5% en cada cola.
# El intervalo de confianza se calcula como [Li;Ls] donde Li,Ls = x ± z ⋅ s / √n

# x      : media muestral.
# z      : es el cuantil de la distribución normal correspondiente al nivel de confianza fijado previamente por el analista.
# s      : desvio muestral.
# n      : tamaño muestral.
# s / √n : se la denomina Error estándar

x <- mean(as.numeric(m1$horas_sentado)) # 12890.90
z <- 0.95                               
s <- sd(as.numeric(m1$horas_sentado))   # 11806
n <- nrow(m1)                           # 100
z_90 <- qnorm(0.95)                     # 1.644854

L_i <- x - z_90 * (s/sqrt(n))           # 10948.38
L_s <- x + z_90 * (s/sqrt(n))           # 14832.2




#------------------------------------------------------------------------------
# Calculamos la media poblacional (y el desvío) para poder verificar que cae en el 
# intervalo de confianza construido
mu <- mean(as.numeric(insurance_ampliada$horas_sentado))    # 13226.63
sigma <- sd(as.numeric(insurance_ampliada$horas_sentado))   # 12485.33


# Número de muestras y tamaño de cada muestra
num_muestras <- 100
n <- 10

# Inicializamos un dataframe vacío para almacenar los resultados
resultados <- data.frame(Muestra = 1:num_muestras, 
                         Limite_Inferior = numeric(num_muestras),
                         Limite_Superior = numeric(num_muestras), 
                         Medias_muestrales = numeric(num_muestras))

# Fijamos el Nivel de confianza (por ejemplo, 90%)
confianza <- 0.9

# Realizamos el proceso de muestreo y cálculo del intervalo de confianza para
# cada muestra
for (i in 1:num_muestras) {
    # Tomamos una muestra aleatoria de tamaño 'tamano_muestra' n de la variable
    muestra <- sample(as.numeric(insurance_ampliada$horas_sentado), size = n)

    # Calculamos la media y el desvío de la muestra
    x <- mean(muestra)
    s <- sd(muestra)

    # Valor crítico para la distribución normal estándar
    z <- qnorm(1 - (1 - confianza)/2)

    # Calculamos el error estándar de la media
    error_estandar_media <- s/sqrt(n)

    # Calculamos el intervalo de confianza
    limite_inferior <- x - z * error_estandar_media
    limite_superior <- x + z * error_estandar_media

    # Almacenamos los resultados en el dataframe
    resultados[i, ] <- c(i, limite_inferior, limite_superior, x)
}

# Creamos una función para verificar si la media poblacional está contenida en
# el intervalo

verificar_inclusion <- function(row) {
    if (row["Limite_Inferior"] <= mu && row["Limite_Superior"] >= mu) {
        return("si")
    } else {
        return("no")
    }
}

# esta función inspeccionará cada fila (row) de nuestro dataframe 'resultados'.
# Y agregaremos a nuestro dataframe una columna 'Inclusion' al dataframe
# resultados.
resultados$Inclusion <- apply(resultados, 1, verificar_inclusion)

tabla <- resultados %>%
    dplyr::group_by(Inclusion) %>%
    dplyr::summarise(cantidad = n())

g10 <- ggplot(resultados, aes(x = (Limite_Superior + Limite_Inferior)/2, y = Muestra, color = Inclusion)) + 
          geom_segment(aes(xend = Limite_Inferior, yend = Muestra), linetype = "solid", linewidth = 0.5) + 
          geom_segment(aes(xend = Limite_Superior, yend = Muestra), linetype = "solid", linewidth = 0.5) + 
          geom_point(aes(x = Medias_muestrales, y = Muestra), color = "blue", size = 2) + 
          geom_vline(xintercept = mu, linetype = "dashed",color = "purple") + 
          scale_color_manual(values = c(si = "green", no = "red")) + 
          labs(title = "Intervalos de Confianza de nivel 90%", x = "Medias", y = "Muestra") +
          theme_minimal() + 
          theme(legend.position = "top")
g10