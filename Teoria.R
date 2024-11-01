┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│						 	 VARIABLES 							  │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘
DCC NO CD
	Discretas
	Cualitativas  Nominales-Ordinales
	Cuantitativas Continuas-Discretas



# VARIABLES CONTINUAS 
# Las variables continuas son aquellas que pueden tomar un número infinito de valores dentro de un rango específico. 
# Se caracterizan por poder medirse y dividirse en fracciones, lo que significa que pueden ser representadas en una escala numérica continua.
Las variables continuas son aquellas que pueden tomar un número infinito de valores dentro de un intervalo en la escala de medición. Un ejemplo típico es la altura de una persona, la cual puede ser 170.5 cm, 170.56 cm, etc., es decir, tienen una precisión que puede refinarse indefinidamente.

# VARIABLE DISCRETA
Solo pueden tomar un conjunto finito o contable de valores. Por ejemplo, el número de hijos en una familia o el resultado de lanzar un dado.

# Variables cualitativas (categóricas)
Representan cualidades o categorías y no tienen un orden numérico.
	Nominales: No tienen un orden inherente (p. ej., colores de ojos: azul, verde,
	marrón).
	Ordinales: Tienen un orden inherente, pero las diferencias entre valores no son
	medibles (p. ej., clasificación de nivel de satisfacción: baja, media, alta).

# Variables cuantitativas:
Representan cantidades y se pueden dividir en:
Continuas (explicadas anteriormente).
Discretas (mencionadas anteriormente).

Discretas: Se pueden tomar solo un número limitado de valores.
Continuas: Se pueden tomar cualquier valor dentro de un intervalo dado.	
--------------------------------------------------------------------------------------




┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│						 DISTRIBUCION NORMAL 							  │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘

Cuando se dice que una variable se distribuye normalmente, significa que sigue una distribución normal o distribución de Gauss, la cual es una distribución de probabilidad continua en forma de campana simétrica. 

1. Tiene una media, una mediana y una moda que coinciden en el mismo punto central.
mean(variable)	median(variable)	DescTools::Mode(variable)
2. La forma de la campana es simétrica respecto a la media.
3. La mayoría de los valores se concentran alrededor de la media, y la probabilidad de valores extremos disminuye a medida que se alejan de la media.

VISUALIZACIÓN DE GRAFICA
Histograma: Te permite observar la forma de la distribución.
Gráfico Q-Q (Quantile-Quantile): Compara los cuantiles de la muestra con los cuantiles de una distribución normal. Si los puntos caen aproximadamente sobre la línea recta, la variable se distribuye normalmente.

hist(variable, main="Histograma de la variable", xlab="Valores", ylab="Frecuencia")
qqnorm(variable)
qqline(variable, col="red")
--------------------------------------------------------------------------------------




┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│						 ESTIMACION PUNTUAL 							  │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘
Una estimación puntual es un único valor numérico que se utiliza como una aproximación del valor real de un parámetro desconocido de una población. Por ejemplo, si quieres estimar la media poblacional (μ), el promedio de una muestra es una estimación puntual de dicha media.

La estimación puntual es útil porque:
Simplifica la representación de un parámetro poblacional al usar un solo número.
Es el punto de partida para construir intervalos de confianza y realizar pruebas de hipótesis, lo cual ayuda a obtener un entendimiento más profundo de la población a partir de los datos de la muestra.
Proporciona una herramienta rápida y fácil para tener una idea general de un parámetro sin necesidad de procesos más complejos.

Estimacion puntual de la media: mean(variable)  Calcula la media muestral

Supongamos que tienes una muestra de datos que representa los pesos de una población y quieres estimar la media poblacional. Utilizas la función mean() en R para obtener la estimación puntual de la media:
pesos <- c(70, 68, 72, 75, 69)
mean(pesos)  # Devuelve la estimación puntual de la media

Ejemplo 1: Estimación puntual de la proporción
Supongamos que realizas una encuesta en la que 200 personas responden si les gusta un nuevo producto (sí o no). Si 150 personas respondieron "sí", puedes calcular la estimación puntual de la proporción de personas que prefieren el producto.
respuestas <- c(rep("sí", 150), rep("no", 50))
prop <- mean(respuestas == "sí")
prop  # Resultado: 0.75
--------------------------------------------------------------------------------------




┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│						 DESVIACION ESTANDAR 							  │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘
La desviación estándar es una medida de dispersión que indica cuánto se desvían los valores de un conjunto de datos respecto a su media. Es una de las métricas más importantes en estadística para describir la variabilidad o dispersión de los datos.

Medir la dispersión: Proporciona información sobre la variabilidad de los datos. Es útil para entender si los datos están muy concentrados o dispersos.
--------------------------------------------------------------------------------------




┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│					ESTIMACION POR INTERVALO DE CONFIANZA 				  │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘
La estimación por intervalos de confianza para la media es un método estadístico utilizado para estimar un rango de valores dentro del cual se espera que se encuentre la media de una población, basándose en una muestra extraída de esa población. Este enfoque proporciona no solo un valor puntual (la media de la muestra) sino también un intervalo que refleja la incertidumbre asociada a esa estimación.

Incertidumbre en la estimación: La estimación por intervalos de confianza ayuda a cuantificar la incertidumbre inherente a las estimaciones basadas en muestras.
Toma de decisiones: Los intervalos de confianza son útiles en la investigación y la toma de decisiones, ya que permiten a los investigadores entender el rango de valores plausibles para la media poblacional.
Comparaciones: Facilita la comparación entre diferentes grupos o tratamientos al observar si sus intervalos de confianza se superponen.

Si conoces la desviación estándar de la población (𝜎), puedes calcular el intervalo de confianza utilizando la distribución normal. Aquí está el procedimiento:

# Datos de ejemplo
data <- c(98, 102, 95, 100, 105, 97, 104, 99, 101, 100) # Tu muestra
n <- length(data)             # Tamaño de la muestra
mean_sample <- mean(data)     # Media de la muestra
s <- sd(data)                 # Desviación estándar de la muestra
confidence_level <- 0.95       # Nivel de confianza

# Error estándar
se <- s / sqrt(n)

# Valor crítico t
alpha <- 1 - confidence_level
t_critical <- qt(1 - alpha / 2, df = n - 1)

# Intervalo de confianza
lower_bound <- mean_sample - t_critical * se
upper_bound <- mean_sample + t_critical * se

cat("Intervalo de confianza:", lower_bound, "a", upper_bound, "\n")


Después de ejecutar el código, obtendrás el intervalo de confianza para la media de tu muestra, lo que te permitirá conocer el rango en el que se espera que se encuentre la media poblacional con el nivel de confianza especificado.

Nivel de confianza: Es la proporción de intervalos de confianza que, si se calcularan de manera repetida a partir de diferentes muestras del mismo tamaño y de la misma población, incluirían la verdadera media de la población. Se expresa comúnmente como un porcentaje, como 90%, 95% o 99%.
Por ejemplo, si calculas un intervalo de confianza del 95% para la media de una población, puedes interpretar esto como que, si repitieras el proceso de muestreo y cálculo de intervalos muchas veces, aproximadamente el 95% de esos intervalos contendrían la verdadera media poblacional.

Muestra: La muestra es un subconjunto de la población que se utiliza para estimar características de esa población. La calidad de la muestra, como su tamaño y representatividad, afecta la precisión del intervalo de confianza, pero el nivel de confianza se centra en el proceso estadístico y su consistencia a largo plazo, más que en la confiabilidad de una única muestra.
--------------------------------------------------------------------------------------




┌─────────────────────────────────────────────────────────────────────────────────────────────────┐
│						 		RECURSOS 							  │
└─────────────────────────────────────────────────────────────────────────────────────────────────┘
# UTIL:
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
remove.packages("lintr")

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


# GGPLOT -- https://ggplot2.tidyverse.org/reference/index.html
# aes()  -- Construct aesthetic mappings
ggplot(data = dataset, aes(x = valor_X, y = valor_y))

# geom_qq()
# Grafica en una linea Oblicua con su punta superior en la derecha y 
# su punta inferior en la izquierda, marca puntos de la muestra (sample).
# geom_qq_line
# Hace visible la linea
# geom_hline(yintercept = 8) + geom_vline(xintercept = 0)
# Genera un mapa carteciano pequeño
ggplot(data = dataset, aes(sample = variable)) + 
  geom_qq() + 
  geom_qq_line() +
  geom_hline(yintercept = 8) + 
  geom_vline(xintercept = 0)

# as.numeric()
# Transforma un valor String a numerico
as.numeric("2")

# length()
# Te da el recuento de las columnas de un dataset
length(swiss)

# nrow()
# Te da el recuento de las filas de un dataset
nrow(swiss)
--------------------------------------------------------------------------------------


