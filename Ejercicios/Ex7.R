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
# Ejercicio 1
# a) Cargar la librería ggplot2.
install.packages("ggplot2")
library(ggplot2)

#b) Cargar el dataset (base de datos) diamonds.
#    La base de datos diamonds del paquete ggplot2 es un conjunto de datos
#    relacionados con las características de los diamantes y su precio. Contiene 
#    información sobre 53940 diamantes y varias de sus propiedades.
diamantes <- diamonds
diamantes

# c) Identificar el tipo de variable.
colnames(diamantes) 
# "color"     CUALITATIVA ORDINAL
# "cut"       CUALITATIVA ORDINAL
# "clarity"   CUALITATIVA ORDINAL 
# "carat"     CONTINUA
# "depth"     CONTINUA
# "table"     CONTINUA
# "price"     CONTINUA
# "x"         CONTINUA 
# "y"         CONTINUA
# "z"         CONTINUA

# d) Seleccionar las variables continuas.
diamantes <- diamantes %>% select("carat", "depth", "table", "price", "x", "y", "z")
diamantes

# e) Realizar una matriz de gráficos de dispersión
grafico <- pairs(diamantes,                                # base
      col="blue",                             # color de la dispersion
      main = "Matriz de gráficos de dispersión" # título
      )
# f) Comentar e interpretar algún gráfico de la matriz donde observe correlación positiva, negativa o débil.
# POSITIVA: Entre las variables "carat" y "x", a medida que aumenta "x", aumenta "carat".
# NEGATIVA: Se podria decir que entre "depth" y "table", pero muy ligeramente
# DEBIL:    Y podemos elegir a "depth" y "price".

# g) Realizar una matriz de correlación.
diamantes_cor <- cor(diamantes)
matriz <- corrplot(diamantes_cor, 
         method = "circle",                                                   # Representa las correlaciones con círculos
         type = "full",                                                       # Muestra la matriz completa (ambos lados simétricos)
         title = "Matriz de Correlación",                                     # Título
         cex.main = 1,                                                        # Tamaño del título
         tl.col = "black",                                                  # Color de las etiquetas de las variables
         addCoef.col = "black",                                             # Mostrar los valores numéricos de las correlaciones
         col = colorRampPalette(c("red", "white", "blue"))(200),    # Colores 
         mar = c(0,0,2,0))                                                    # Ajuste de márgenes

# h) Comentar e interpretar.
# Vemos como las intersecciones entre "price", "x", "y" y "z", indican una correlación positiva fuerte. 
# Lo que nos muestra, como el precio se ve influido por el tamanio del diamante
# Tambien podemos ver como el peso del diamante "carat", influye en las 4 variables mensionadas anteriormente,
# positiva y significativamente.

#i) Seleccionar 2 pares de variables y proporcionar un modelo de regresión lineal para cada uno.

#carat y price
modelo1     <- lm(carat ~ price, data = diamantes)
res_modelo1 <- tidy(modelo1)
sum_modelo1 <- summary(modelo1)
R_cuad      <- sum_modelo1$r.squared

graf_modelo1 <- ggplot(diamantes, aes(x = carat, y = price)) + # marco de datos
  geom_point(color = "blue") +                               # scatter plot (gráfico de dispersion) 
  geom_smooth(method = "lm", color = "red", se = FALSE) +    # recta del modelo
  labs(title = "Relación entre Altura y Peso",
       subtitle = paste("R² =", round(R_cuad, 3)),             # Muestra R² en el gráfico
       x = "Quilates",
       y = "Precio")  +                                        # etiquetas
  theme_minimal()                                              # estilo del gráfico

graf_modelo1


#x e y
modelo2     <- lm(x ~ y, data = diamantes)
res_modelo2 <- tidy(modelo2)
sum_modelo2 <- summary(modelo2)
R_cuad      <- sum_modelo1$r.squared

graf_modelo2 <- ggplot(diamantes, aes(x = x, y = y)) +         # marco de datos
  geom_point(color = "blue") +                               # scatter plot (gráfico de dispersion) 
  geom_smooth(method = "lm", color = "red", se = FALSE) +    # recta del modelo
  labs(title = "Relación entre Altura y Peso",
       subtitle = paste("R² =", round(R_cuad, 3)),             # Muestra R² en el gráfico
       x = "x",
       y = "y")  +                                             # etiquetas
  theme_minimal()                                              # estilo del gráfico

graf_modelo1

#j) Comentar los modelos obtenidos.

# CONCLUSIONES: Existe una tendencia incipiente en correlacion con lo dicho, a mas quilates, mayor precio
# CONCLUSIONES2: Se ve que cuanto mayor es la longitud, mayor es el ancho del diamante.