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


#------------------------------------------------------------------------------
# Elaboración de un Modelo de Regresión Lineal
# Para ello utilizaremos las funciones lm() de R Base y la función tidy() del paquete broom. 
# Utilizaremos los datos de la base altura_peso.csv que cargaremos previamente.

# La estructura de la función lm() es:
# lm(y~x,data)
# y : variable explicada (dependiente, output).
# x : variable explicativa (independiente, predictora).
# data : dataset empleado.


alturapeso <- read_csv("CSV/altura_peso.csv")
alturapeso

modelo_caso_1 <- lm(Peso ~ Altura, data = alturapeso)
# (Intercept)       Altura  
#    32.2140       0.6784

res_mod_1 <- tidy(modelo_caso_1)
#  term        estimate  std.error  statistic  p.value
# (Intercept)    32.2      8.89      3.62      4.63e- 4
# Altura         0.678    0.0525     12.9      7.22e-23

# Interpretacion del modelo
# std.error (Errores estándar): Proporcionan información sobre la precisión de las estimaciones.
# statistic (Estadístico t): Es el valor del estadísitico t utilizado en la estimación de los parametros intercepto y slope
# p.value (valores p): Es la probabilidad asociada a cada estadístico t utilizado. Un valor de p<0.05 se considera altamente significativo, lo que proporciona una muy buena estimación.

# Determinación del coeficiente de correlación en R
# Para hallar el coeficiente de correlación R2 en R utilizaremos la función summary() de R Base.
# Primero, aplicamos summary() a nuestro modelo:
sum_mod_1 <- summary(modelo_caso_1)
R_cuad_1 <- sum_mod_1$r.squared
R_cuad_1

# Representación gráfica de los datos, la recta de RL (modelo) y el R2
graf_mod_1 <- ggplot(alturapeso, aes(x = Altura, y = Peso)) + # marco de datos
  geom_point(color = "blue") +                               # scatter plot (gráfico de dispersion) 
  geom_smooth(method = "lm", color = "red", se = FALSE) +    # recta del modelo
  labs(title = "Relación entre Altura y Peso",
       subtitle = paste("R² =", round(R_cuad_1, 3)),           # Muestra R² en el gráfico
       x = "Altura (cm)",
       y = "Peso (lb)")  +                                     # etiquetas
  theme_minimal()                                              # estilo del gráfico

graf_mod_1