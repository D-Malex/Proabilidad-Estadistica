# IMPORTS & DECLARES
install.packages("languageserver")
install.packages("dplyr")
install.packages("readr")
install.packages("expss")
install.packages(c("ggplot2", "rlang"))
install.packages("corrplot")
install.packages("broom")
library(languageserver)
library(readr)
library(dplyr)
library(expss)
library(ggplot2)
library(rlang)
library(corrplot)
library(broom)

#_______________________________Ejercicio 1_____________________________________________
# Cargar el dataset (base de datos) airquality.
# La base proviene de un estudio sobre la calidad del aire realizado en Nueva York 
# y contiene datos recopilados de mayo a septiembre de 1973. 
# Cada fila representa una observación diaria, y las variables que contiene son 
# principalmente cuantitativas. Se centra en la relación entre las condiciones 
# climáticas y los niveles de contaminación.

# Tabla de variables de la base airquality:
# Variable      Descripción
# ozone         Concentración de ozono en el aire (en partes por billón).
# Solar.R      Radiación solar (en langleys). Representa la cantidad de 
#               radiación solar en la superficie terrestre.
# Wind          Velocidad del viento (en millas por hora, mph).
# Temp          Temperatura diaria máxima (en grados Fahrenheit).
# Month         Mes en que se hizo la observación, codificado como un número 
#               de 5 a 9 (mayo a septiembre).
# Day           Día del mes en que se realizó la observación.

# ✅1.  Identificar el tipo de variable.
# ✅2. Seleccionar las variables continuas. 
# ✅3. Recomendación: eliminar los registros con algún NA.
# ✅4. Realizar una matriz de gráficos de dispersión.
# ✅5. Comentar e interpretar algún gráfico de la matriz donde observe correlación positiva, negativa o débil.
# ✅6. Realizar una matriz de correlación. Comentar e interpretar.
# ✅7. Realizar un modelo de regresión lineal múltiple que permita predecir la concentración de ozono.
# ✅8. Evaluar qué variables predictoras son apropiadas para el modelo. 
# ✅9. Si es necesario, corregir el modelo seleccionando las variables. Interpretar.
# ✅10. Seleccionar valores para las variables predictoras del modelo y predecir la concentración de ozono. Interpretar.
#________________________________________________________________________________

#1.
View(
    aire <- airquality
)

#2.
View(
    aire <- aire %>% select(Ozone, Solar.R, Wind, Temp)
)

#3.
View(
    aire<- na.omit(aire)
)

#4.
View(
    pairs(aire,                                 #base
      col="blue",                               #color de la dispersion
      main = "Matriz de gráficos de dispersión" #título
      )
)

#6.
matriz_cor<-cor(aire)
corrplot(matriz_cor, 
         method = "circle", # Representa las correlaciones con círculos
         type = "full",     # Muestra la matriz completa (ambos lados simétricos)
         title = "Matriz de Correlación",               # Título
         cex.main = 1,                  #Tamaño del título
         tl.col = "black",              # Color de las etiquetas de las variables
         addCoef.col = "black",         # Mostrar los valores numéricos de las correlaciones
         col = colorRampPalette(c("orange", "white", "green"))(200),    # Colores 
         mar = c(0,0,2,0))                                     #Ajuste de márgenes

#7. Si alguna variable tiene un valor p mayor a 0.05, puedes considerar eliminarla y volver a ajustar el modelo. 
modelo<- lm(Ozone ~ Solar.R + Wind + Temp, aire) # === lm(Ozone ~ ., aire)
View(
    tidy(lm(Ozone ~ ., aire)) 
)

#8.9.
round(summary(modelo)$r.square,2)

#10. Prediccion
round(predict(modelo, data.frame(Solar.R = 200, Wind = 10, Temp = 80)),2)