# Teoria

## 1. Tipos de Variables

### Variables Continuas

- **Definición**: Pueden tomar cualquier valor dentro de un intervalo específico.
- **Ejemplo**: Altura de una persona (170.5 cm, 170.56 cm).

### Variables Discretas

- **Definición**: Solo pueden tomar un conjunto finito o contable de valores.
- **Ejemplo**: Número de hijos en una familia.

### Variables Cualitativas (Categóricas)

- **Definición**: Representan cualidades o categorías y no tienen un orden numérico.
  - **Nominales**: Sin orden inherente.
    - **Ejemplo**: Colores de ojos (azul, verde, marrón).
  - **Ordinales**: Con orden inherente, pero sin diferencias medibles.
    - **Ejemplo**: Clasificación de satisfacción (baja, media, alta).

### Variables Cuantitativas

- **Definición**: Representan cantidades y se dividen en:
  - **Continuas**: Como se explicó anteriormente.
  - **Discretas**: Como se mencionó anteriormente.

---

## 2. Distribución Normal

- **Definición**: Una variable se distribuye normalmente si sigue una distribución de probabilidad continua en forma de campana simétrica.

### Características

1. **Media, Mediana y Moda**: Coinciden en el mismo punto central, (mean, median, mode).
2. **Simetría**: La forma de la campana es simétrica respecto a la media.
3. **Concentración de Valores**: La mayoría de los valores se concentran alrededor de la media; la probabilidad de valores extremos disminuye al alejarse de la media.

### Visualización

- **Histograma**: Permite observar la forma de la distribución.
- **Gráfico Q-Q (Quantile-Quantile)**: Compara los cuantiles de la muestra con los cuantiles de una distribución normal.

```R
hist(variable, main="Histograma de la variable", xlab="Valores", ylab="Frecuencia")
qqnorm(variable)
qqline(variable, col="red")
```

---

## 3. Estimación Puntual

- **Definición**: Un único valor numérico que se utiliza como aproximación del valor real de un parámetro desconocido de una población.

### Ejemplo

- Estimación puntual de la media:

```R
pesos <- c(70, 68, 72, 75, 69)
mean(pesos)  # Devuelve la estimación puntual de la media
```

- Estimación puntual de la proporción:

```R
respuestas <- c(rep("sí", 150), rep("no", 50))
prop <- mean(respuestas == "sí")
prop  # Resultado: 0.75
```

---

## 4. Desviación Estándar

- **Definición**: Medida de dispersión que indica cuánto se desvían los valores de un conjunto de datos respecto a su media.

### Importancia

- Proporciona información sobre la variabilidad de los datos.

```R
sd(variable)
```

---

## 5. Estimación por Intervalo de Confianza (Probabilidad)

- **Definición**: Un rango de valores que se utiliza para estimar un parámetro poblacional (como la media) a partir de una muestra.

### Cálculo

```R
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
```

### Interpretación

- Un intervalo de confianza del 95% significa que, si se repitiera el muestreo muchas veces, aproximadamente el 95% de esos intervalos contendrían la verdadera media poblacional.

---

## 6. Estimación por Intervalo de Confianza (Proporcion)

- **Definicion**: La Estimación por intervalo de confianza para la proporción es un método estadístico utilizado para estimar el rango de valores dentro del cual es probable que se encuentre la verdadera proporción de una población, basándose en los datos obtenidos de una muestra. Es una herramienta fundamental en inferencia estadística, ya que proporciona una manera de expresar la incertidumbre de la estimación.

### ¿Qué es la proporción?

La proporción es una medida que representa la fracción de elementos en una población o muestra que cumplen una determinada condición. Por ejemplo, si en una encuesta 140 de 200 personas respondieron "sí" a una pregunta, la proporción muestral sería

```
𝑝 = 140 / 200 = 0.7 (o el 70%)
```

### ¿Para qué sirve?

Medir la precisión de la estimación: En lugar de dar solo un valor puntual (como la proporción muestral), el intervalo proporciona un rango, lo que refleja la incertidumbre inherente a la inferencia basada en muestras.
Tomar decisiones informadas: Al conocer el intervalo, se puede determinar si una proporción poblacional puede diferir significativamente de un valor específico (por ejemplo, si es probable que la proporción de personas que aprueban una medida supere el 50%).
Comparar proporciones: Ayuda a comparar proporciones entre diferentes grupos o muestras y evaluar si la diferencia observada es significativa.

### Ejemplo

Si calculas un intervalo de confianza del `95%` para una proporción y obtienes que es de `[0.65, 0.75]`, puedes decir con un `95%` de confianza que la verdadera proporción de la población está entre `65%` y `75%`. Esto no significa que la proporción esté definitivamente en ese intervalo, sino que si se repitiera el proceso de muestreo muchas veces, aproximadamente el `95%` de los intervalos construidos de esta manera contendrían la proporción real.

## 7. La distribución Chi (o Ji) Cuadrado

```R
dchisq(x, df, ncp=0, log = F)	                        # Devuelve resultados de la función de densidad.
pchisq(q, df, ncp=0, lower.tail = T, log.p = F)	        # Devuelve resultados de la función de distribución acumulada.
qchisq(p, df, ncp=0, lower.tail = T, log.p = F)	        # Devuelve resultados de los cuantiles de la ji-Cuadrada.
rchisq(n, df, ncp=0)	                                # Devuelve un vector de valores de la ji-Cuadrada aleatorios.
```
### Los argumentos que podemos pasar a las funciones expuestas en la anterior tabla, son:
- `x`,`q` : Vector de cuantiles.
- `p` : Vector de probabilidades.
- `n` : Números de observaciones.
- `df` : Grados de libertad.
- `lower.tail` : Parámetro booleano, si es TRUE (por defecto), las probabilidades son P[X ≤ x], de lo contrario, P [X > x].

#### Ejercicios.
¿Cuál es el valor que tiene la ji-cuadrado con un área de cola de 0.900 y 5 grados de libertad?

P(χ^2 < x) = 0.999 con 20 grados de libertad.
P(χ^2 ≥ 18.49) con 30 grados de libertad.

## 8. La regresión lineal 
La regresión lineal es una técnica estadística utilizada para modelar la relación entre dos variables cuantitativas: una variable dependiente (también llamada variable respuesta o output) y una variable independiente (o predictora). El objetivo es predecir el valor de la variable dependiente en función de la variable independiente.

En un modelo de regresión lineal simple, se busca ajustar una línea recta a un conjunto de datos, donde la ecuación general de esa línea es:
  `y=β0+β1x+ϵ`

- `y` : Es la variable dependiente u output(respuesta), es decir, el valor que queremos predecir (ejemplo: peso, calificaciones).
- `x` : Es la variable independiente o predictora, el valor que usamos para hacer la predicción (ejemplo: altura, horas de estudio).
- `β0` : Es el intercepto o constante, que representa el valor de y cuando x=0 (corte de la recta con el eje y)
- `β1` : Es el coeficiente de pendiente o slope, que indica el cambio en y por cada unidad de cambio en x (representa la inclinación de la recta).
- `ϵ` : Es el error o término residual, que capta la variabilidad en y que no se puede explicar por x.

# 9. Elaboración de un Modelo de Regresión Lineal

Para ello utilizaremos las funciones `lm()` de **R Base** y la función `tidy()` del paquete **broom**. Utilizaremos los datos de la base `altura_peso.csv` que cargaremos previamente.

## Estructura de la función `lm()`

```r
lm(y ~ x, data)
```

- **`y`**: variable explicada (dependiente, output).
- **`x`**: variable explicativa (independiente, predictora).
- **`data`**: dataset empleado.

### Ejemplo aplicado

En nuestro caso:

```r
modelo_caso_1 <- lm(Peso ~ Altura, data = altura_peso)
```

Ahora, vamos a pedir un resumen del modelo, usando la función `tidy()`:

```r
res_mod_1 <- tidy(modelo_caso_1)
res_mod_1
```

### Salida esperada

```r
## # A tibble: 2 x 5
##   term        estimate std.error statistic  p.value
##   <chr>          <dbl>     <dbl>     <dbl>    <dbl>
## 1 (Intercept)   32.2      8.89        3.62 4.63e- 4
## 2 Altura         0.678    0.0525     12.9  7.22e-23
```


Este código y su salida muestran cómo construir y resumir un modelo de regresión lineal simple en R utilizando datos de `altura_peso.csv`.

# 10. ¿Cual es el grado de relación lineal entre dos variables?
Esto se infiere de la correlación. La correlación es una medida estadística que indica el grado en que dos variables están relacionadas.

El coeficiente de correlación, comúnmente representado como R puede variar entre -1 y 1:

- `R=1` : Indica una correlación positiva perfecta (a medida que una variable aumenta, la otra también lo hace).
- `R=−1` : Indica una correlación negativa perfecta (a medida que una variable aumenta, la otra disminuye).
- `R=0` : Indica que no hay correlación lineal entre las variables

## Coeficiente de Determinación R2
El coeficiente de determinación, es una medida que se utiliza para evaluar la calidad del ajuste del modelo de regresión. Se interpreta como el porcentaje de la variabilidad de la variable dependiente que se puede explicar por la variable independiente en el modelo.

### Interpretación de R2
- R2 = 0.75 indica que el 75% de la variabilidad en la variable dependiente se puede explicar por la variable independiente. Esto sugiere un buen ajuste del modelo.
- R2 = 0.25 indica que solo el 25% de la variabilidad se explica, lo que sugiere que el modelo no ajusta bien los datos.
---
---

## Recursos Útiles	

### Instalación de Paquetes en R

```R
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
```

### Importación de Librerías

```R
library(dplyr)
library(readr)
library(ggplot2)
library(qqplotr)
library(corrplot)
library(ggpubr)
library(broom)
library(expss)
library(languageserver)
```

### Ejemplo de Gráfico con ggplot2

```R
# Crear un gráfico Q-Q
ggplot(data = dataset, aes(sample = variable)) + 
  geom_qq() + 
  geom_qq_line() +
  geom_hline(yintercept = 8) + 
  geom_vline(xintercept = 0)
```

### Funciones Útiles

- `as.numeric()`: Transforma un valor string a numérico.
- `length()`: Te da el recuento de las columnas de un dataset.
- `nrow()`: Te da el recuento de las filas de un dataset.
