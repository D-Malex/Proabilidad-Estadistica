# Variables Estadísticas


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

1. **Media, Mediana y Moda**: Coinciden en el mismo punto central.
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

---

## 5. Estimación por Intervalo de Confianza

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

```

Siente libre de modificar cualquier parte según tus necesidades. ¡Espero que te sea útil para tu estudio!
```
