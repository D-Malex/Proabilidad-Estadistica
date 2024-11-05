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
# Segundo Parcial Probabilidad Aplicada
# 1) Analizar si las variables continuas del dataset iris se distribuyen normalmente. Justificar.
# 2) Estimar puntualmente la media y el desvío de la variable Petal.Width. Explicar qué reprsentan.
# 3) Construir un intervalo de confianza de nivel de 90% para la media de la variable Sepal.Width. Interpretar. 
# 4) Realizar un análisis de regresión lineal completo (modelo, bondad del modelo y alguna predicción) para la situación Sepal.Length en funcion de otras variables disponibles en la base

# RESPUESTAS:
# 1) 
iris
colnames(iris) 

# "Sepal.Length"        CONTINUA
g1 <- ggplot(data = iris, aes(sample = Sepal.Length)) + 
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Sepal.Length", 
             title = "Longitud del sepalo", 
             subtitle = "Se destaca la normalidad de la variable continua, Sepal.Length, por su dispersion con respecto a la recta, y su contencion dentro de las bandas de confianza.", 
             caption = "(based on data from Dataset: iris).")

# "Sepal.Width"         CONTINUA
g2 <- ggplot(data = iris, aes(sample = Sepal.Width)) + 
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Sepal.Width", 
             title = "Ancho del petalo", 
             subtitle = "Se destaca la normalidad de la variable continua, Sepal.Width, por su dispersion con respecto a la recta, y su contencion dentro de las bandas de confianza.", 
             caption = "(based on data from Dataset: iris).")

# "Petal.Length"        CONTINUA
g3 <- ggplot(data = iris, aes(sample = Petal.Length)) + 
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Petal.Length", 
             title = "Longitud del petalo", 
             subtitle = "Se destaca la no normalidad de la variable continua, Petal.Length, por su dispersion con respecto a la recta, y su no contencion dentro de las bandas de confianza.", 
             caption = "(based on data from Dataset: iris).")

# "Petal.Width"         CONTINUA
g4 <- ggplot(data = iris, aes(sample = Petal.Width)) + 
        geom_qq_band(color = "red",
                     fill = "green", 
                     alpha = 0.3, 
                     linetype = "dashed", 
                     linewidth = 1) + 
        stat_qq_line() +
        stat_qq_point(color = "blue", shape = 21, alpha = 0.4) +
        labs(y = "Petal.Width", 
             title = "Ancho del petalo", 
             subtitle = "Se destaca la no normalidad de la variable continua, Petal.Width, por su dispersion con respecto a la recta, y su no contencion dentro de las bandas de confianza.", 
             caption = "(based on data from Dataset: iris).")

# "Species"             CATEGORICA NOMINAL
# No se puede realizar un grafico para corroborar la normalidad de la variable, dado que no es CONTINUA. 



# 2) Estimar puntualmente la media y el desvío de la variable Petal.Width. Explicar qué reprsentan.
mean(iris$Petal.Width)  #1.199333
sd(iris$Petal.Width)    #0.7622377

# Basicamente decimos que el promedio de la Longitud del pétalo en Centímetros (cm), es de 1.199333 cm.
# y que este promeido puede variar en 0.7622377 cm.
cat("Basicamente decimos que el promedio de la Longitud del pétalo en Centímetros (cm), es de", mean(iris$Petal.Width), "cm.")
cat("y que este promeido puede variar en",  sd(iris$Petal.Width), "cm.")



# 3) Construir un intervalo de confianza de nivel de 90% para la media de la variable Sepal.Width. Interpretar. 
n        <- length(iris$Sepal.Width)        # Tamaño de la muestra
mean     <- mean(iris$Sepal.Width)          # Media muestral
s        <- sd(iris$Sepal.Width)            # Desvío estandár
z_90     <- 0.90                            # Nivel de confianza

se       <- s / sqrt(n)                     # Error estandár  
t        <- qt(1 - (1-z_90) / 2, n - 1)     # Valor critico de t

li <- mean - t * se
ls <- mean + t * se
cat("Intervalo de confianza para el Ancho del sépalo es de:", li, "a", ls, "cm.\n")



#  4) Realizar un análisis de regresión lineal completo (modelo, bondad del modelo y alguna predicción) para la situación Sepal.Length en funcion de otras variables disponibles en la base
modelo1     <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = iris)
res_modelo1 <- tidy(modelo1)

res_modelo1
#   term         estimate std.error statistic   p.value
#   <chr>           <dbl>     <dbl>     <dbl>     <dbl>
# 1 (Intercept)     1.86     0.251      7.40   9.85e-12
# 2 Sepal.Width     0.651    0.0666     9.77   1.20e-17
# 3 Petal.Length    0.709    0.0567     12.5   7.66e-25
# 4 Petal.Width    -0.556    0.128     -4.36   2.41e- 5 

# CONCLUCIONES:
# Como vemos se cumple la condicion p < 0.05 lo que nos indica con todas lasvariables que se trata de una muy buena estimación.
# Tambien vemos como el largo del sepalo se ve influido por 0.651 cm, por cada cm de Ancho.
# Que el largo del petalo influye, positivamente en largo del sepalo, 0.709 cm, mientrasa que el ancho del petalo negativamente, -0.556 cm. El tamaño general del petalo influye en un 0.153 cm, al Largo del Sepalo.

# Veamos que tan fiable es este modelo: 
sum_modelo1 <- summary(modelo1)
Rcuad1 <- sum_modelo1$r.squared
cat("El coeficiente de correlación en R es de:", round(Rcuad1, 2)*100, "%")

#
pairs(iris%>%select("Sepal.Length","Sepal.Width","Petal.Length", "Petal.Width"),  # base
      col="blue",                                                                 # color de la dispersion
      main = "Matriz de gráficos de dispersión"                                   # título
      )

matriz_cor <- cor(iris%>%select("Sepal.Length","Sepal.Width","Petal.Length", "Petal.Width"))
corrplot(matriz_cor, 
         method = "circle",     # Representa las correlaciones con círculos
         type = "full",         # Muestra la matriz completa (ambos lados simétricos)
         title = "Matriz de Correlación", # Título
         cex.main = 1,          #Tamaño del título
         tl.col = "black",      # Color de las etiquetas de las variables
         addCoef.col = "black", # Mostrar los valores numéricos de las correlaciones
         col = colorRampPalette(c("red", "white", "green"))(200),# Colores 
         mar = c(0,0,2,0))      #Ajuste de márgenes

# Vemos como en las intersecciones entre Petal.Width y Petal.Length hay una correlación positiva muy fuerte. Lo que indica que ambas variables son proporcionales.
# Tambien como el largo del Sepalo tiene una correlacion positiva con largo del petalo. De la misma forma el ancho del petalo con el largo del sepalo.
# Pero tambien una incipiente correlacion negativa entre el largo del petalo y el ancho del sepalo. A medida que una aumenta la otra se ve en decremento.
# Una debilidad entre el ancho del sepalo y el largo del sepaalo. Es decir que casi no se ven influidas entre si. 


# PREDICCCION
# Petal.Width X Petal.Length
modelo2 <- lm(Petal.Width ~ Petal.Length, data = iris)
resumen <- tidy(modelo2)

resumen
#   term         estimate std.error statistic  p.value
#   <chr>           <dbl>     <dbl>     <dbl>    <dbl>
# 1 (Intercept)    -0.363   0.0398      -9.13 4.70e-16
# 2 Petal.Length    0.416   0.00958     43.4  4.68e-86

# La pendiente es 0.416 y la oo -0.363 Ambas estimaciones tienen un muy buen p-value.
# Calculamos el coeficiente de determinación (R^2).
sum_modelo2 <- summary(modelo2)
Rcuad2      <- sum_modelo2$r.squared
Rcuad2
cat("Este valor, indica que aproximadamente el", round(Rcuad2, 2)*100, "% de la variabilidad del ancho del petalo es influido por le largo del petalo.")

valor      <- data.frame(Petal.Length = 0.416)
prediccion <- predict(modelo2, valor)
prediccion