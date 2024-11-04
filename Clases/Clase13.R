# DOWNLOAD
# Manipulación y análisis de datos
install.packages(c("dplyr", "readr", "broom"))
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
#------------------------------------------------------------------------------------------
# Análisis de regresión lineal: varias variables simultáneas
autos <- mtcars

# Como deseamos correlacionar variables con el método de regresión lineal, sólo estudiaremos las variables continuas. 
# Entonces hacemos un select() de las variables de interés.
autos <- autos %>%
    select(mpg, disp, hp, drat, wt, qsec)

# Matriz de gráficos de dispersión
# Una vez actualizada nuestra base con las variables de interés, realizaremos todas las combinaciones de variables en una matriz de gráficas de dispersion. 
# Para ello, utilizaremos la función pairs() de R base.
pairs(autos,                                    #base
      col="blue",                             #color de la dispersion
      main = "Matriz de gráficos de dispersión" #título
      )

# Interpretación de la matriz gráfica de dispersión
# Gráficos de dispersión
# Cada gráfico muestra la relación entre un par de variables. Por ejemplo, el gráfico en la intersección de la fila mpg (Millas por Galón) y la columna hp (Caballos de Fuerza) muestra cómo el consumo de combustible se relaciona con la potencia del motor.
# La forma de la nube de puntos sugiere el tipo de relación. Si hay una relación lineal, cuadrática u otra relación entre las variables.
# Si los puntos tienden a alinearse en una dirección (ascendente o descendente), es probable que haya una relación lineal.

# Relaciones Positivas
# Si los puntos en un gráfico de dispersión muestran una tendencia ascendente, es decir, cuando una variable aumenta, la otra también tiende a aumentar, esto indica una correlación positiva.
# Ejemplo: Si los gráficos entre wt (peso) y disp (desplazamiento) muestran una tendencia ascendente, esto indica que los automóviles con mayor peso tienden a tener motores de mayor desplazamiento.

# Relaciones Negativas
# Si los puntos en un gráfico de dispersión muestran una tendencia descendente, es decir, cuando una variable aumenta, la otra disminuye, esto indica una correlación negativa.
# Ejemplo: A mayor peso (wt), menor es la eficiencia en términos de millas por galón (mpg). Una nube descendente en esta celda indicaría esta relación.

# Relaciones Débiles
# Si los puntos están dispersos sin una tendencia clara (ni ascendente ni descendente), indica que hay una correlación débil entre esas dos variables.

# Matriz de correlación (corplot)
# Una utilidad de la matriz de dispersión es que nos da indicios para seleccionar los pares de variables que pueden relacionarse linealmente. Pero, ¿qué tan buena es nuestra primera selección? Necesitamos más que un indicio. Vamos a calcular los coeficientes de correlación r para cada par de variables combinadas y la dispondremos en una matriz.
# Para ello, utilizaremos la función cor() y corrplot() del paquete corrplot
# En primer lugar, creamos la matriz de correlación en el objeto matriz_cor
matriz_cor <- cor(autos)
corrplot(matriz_cor, 
         method = "circle",                                                   # Representa las correlaciones con círculos
         type = "full",                                                       # Muestra la matriz completa (ambos lados simétricos)
         title = "Matriz de Correlación",                                     # Título
         cex.main = 1,                                                        # Tamaño del título
         tl.col = "black",                                                  # Color de las etiquetas de las variables
         addCoef.col = "black",                                             # Mostrar los valores numéricos de las correlaciones
         col = colorRampPalette(c("orange", "white", "green"))(200),    # Colores 
         mar = c(0,0,2,0))                                                    # Ajuste de márgenes

# Valores de Correlación
# La matriz muestra coeficientes de correlación que van desde -1 hasta 1.
# Valores cercanos a 1: Indican una correlación positiva fuerte. Esto significa que a medida que una variable aumenta, la otra también tiende a aumentar.
# Valores cercanos a -1: Indican una correlación negativa fuerte. Esto significa que a medida que una variable aumenta, la otra tiende a disminuir.
# Valores cercanos a 0: Indican que no hay una correlación lineal significativa entre las variables.