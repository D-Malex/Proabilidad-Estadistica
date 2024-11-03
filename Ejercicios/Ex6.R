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
# Ejercicio 1:
alturapeso <- read_csv("CSV/altura_peso.csv")

modelo_caso_1 <- lm(Peso ~ Altura, data = alturapeso)

res_mod_1 <- tidy(modelo_caso_1)

sum_mod_1 <- summary(modelo_caso_1)

R_cuad_1 <- sum_mod_1$r.squared

graf_mod_1 <- ggplot(alturapeso, aes(x = Altura, y = Peso)) + # marco de datos
  geom_point(color = "blue") +                               # scatter plot (gráfico de dispersion) 
  geom_smooth(method = "lm", color = "red", se = FALSE) +    # recta del modelo
  labs(title = "Relación entre Altura y Peso",
       subtitle = paste("R² =", round(R_cuad_1, 3)),           # Muestra R² en el gráfico
       x = "Altura (cm)",
       y = "Peso (lb)")  +                                     # etiquetas
  theme_minimal()                                              # estilo del gráfico



# Ejercicio 2:
# a. Hallar los coeficientes de correlación para los modelos del ejercicio 1.
# b. Realizar un gráfico de dispersión, que incluya la recta del modelo y el valor de R2 para cada modelo del ejercicio 1. 

#a. Cálculo del coeficiente de correlación (𝑅)
# El coeficiente de correlación es una medida que refleja el grado de relación lineal entre dos variables y se puede obtener en R mediante la función cor():
cat("El coeficiente de correlacion para los modelos del ejercicio 1 es del", round(cor(alturapeso$Altura, alturapeso$Peso)*100),"%")

#b. Cálculo del modelo de regresión lineal (RL)
# El modelo de RL se ajusta mediante lm() en R. Para obtener los coeficientes de regresión y el coeficiente de determinación 𝑅^2, se utiliza:
modelo_caso_1 <- lm(Peso ~ Altura, data = alturapeso)
sum_mod_1 <- summary(modelo_caso_1)
R_cuad_1 <- sum_mod_1$r.squared

# El valor de 𝑅^2 indica cuánto de la variabilidad de la variable dependiente (Peso) es explicada por la variable independiente (Altura). En el ejemplo proporcionado, 𝑅^2 =0.6297598 significa que aproximadamente el 63% de la variabilidad en Peso es explicada por Altura.
graf_mod_1 <- ggplot(alturapeso, aes(x = Altura, y = Peso)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Relación entre Altura y Peso",
       subtitle = paste("R² =", round(R_cuad_1, 3)),
       x = "Altura (cm)",
       y = "Peso (lb)") +
  theme_minimal()

graf_mod_1


# Ejercicio 3:
# Determinar un modelo de regresión lineal (gráfico y coeficiente de correlación incluido) para cada para de variables que considere apropiadas de la base insurance.