# INSTALL
# ¿Cómo podemos tener idea de si una variable se distribuye normalmente?
install.packages(c("languageserver", "readr", "dplyr", "ggplot2", "ggpp", "ggdist"))

# IMPORT
lapply(c("languageserver", "readr", "dplyr", "ggplot2", "ggpp", "ggdist"), library, character.only = TRUE)
insurance <- read_csv("CSV/insurance_ampliada.csv")

# EJERCICIOS
View(
  g1 <- ggplot(insurance, aes(sample = horas_sentado)) +
    geom_qq() +
    geom_qq_line() +
    geom_hline(yintercept = 8) +
    geom_vline(xintercept = 0)
)

g2 <- ggplot(insurance, aes(sample = edad)) +
  geom_qq() +
  geom_qq_line()

g3 <- ggplot(insurance, aes(sample = IMC)) +
  geom_qq() +
  geom_qq_line()

g4 <- ggplot(insurance, aes(sample = prima)) +
  geom_qq() +
  geom_qq_line()

growth <- read_csv("CSV/growth.csv")
g5 <- ggplot(growth, aes(sample = gain)) +
  geom_qq() +
  geom_qq_line()

compensation <- read_csv("CSV/compensation.csv")
g6 <- ggplot(compensation, aes(sample = Root)) +
  geom_qq() +
  geom_qq_line()

g7 <- ggplot(compensation, aes(sample = Fruit)) +
  geom_qq() +
  geom_qq_line()



# Esto nos permite graficar bandas de confianza para ver aun mas claramente la dispercion de puntos
g8 <- ggplot(insurance, aes(sample = horas_sentado)) +
  geom_qq_band(color = "red", fill = "green", alpha = 0.3, linetype = "dashed", linewidth = 1) +
  stat_qq_line() +
  stat_qq_point(color = "blue", shape = 21, alpha = 0.4)

mean(insurance$horas_sentado) # NA
sd(insurance$horas_sentado) # 12485.33

# Estimación por intervalos de confianza para la media
# x : media muestral.
# z : es el cuantil de la distribución normal correspondiente al nivel de confianza fijado previamente por el analista.
# s : desvio muestral.
# n : tamaño de la muestra.
# A la cantidad s/√n se la denomina Error estándar

# Para este ejemplo utilizaremos los siguientes valores:
m1 <- insurance %>% slice_sample(n = 100, replace = F)
n <- 100
x <- mean(as.numeric(m1$horas_sentado)) # 16607.56
s <- sd(m1$horas_sentado) # 13987.62
z_90 <- qnorm(0.95) # 1.644854
# Fijamos el nivel de confianza en un 90%.
# Esto significa que necesitamos que de cada 100 veces que tomemos una muestra y construyamos nuestro intervalo,
# el valor de media poblacional (verdadero y desconocido) esté contenido en 90 de ellos.
# Una vez que tenemos fijada la probalidad que llamamos nivel de confianza, tenemos que tener en cuenta que esta probablidad deja un 10%
# en repartidos en las dos colas de la distribución normal. Entonces, tenemos un 5% en cada cola, tal como muestra el siguiente gráfico.

# Con todos estos datos, ya podemos calcular los límites de nuestro intervalo:
L_i <- x - z_90 * (s / sqrt(n)) # 14306.8
L_s <- x + z_90 * (s / sqrt(n)) # 18908.32

# Calculamos la media poblacional (y el desvío) para poder verificar que cae en el intervalo de confianza construido
mu <- mean(as.numeric(insurance$horas_sentado)) # 13226.63
sigma <- sd(as.numeric(insurance$horas_sentado)) # 12485.33




# Ahora la idea será repetir esto muchas veces. Tenemos que crear una simulacion aleatoria
# Número de muestras y tamaño de cada muestra
num_muestras <- 100
n <- 10

# Inicializamos un dataframe vacío para almacenar los resultados
resultados <- data.frame(
  Muestra = 1:num_muestras, Limite_Inferior = numeric(num_muestras),
  Limite_Superior = numeric(num_muestras), Medias_muestrales = numeric(num_muestras)
)

# Fijamos el Nivel de confianza (por ejemplo, 90%)
confianza <- 0.9

# Realizamos el proceso de muestreo y cálculo del intervalo de confianza para
# cada muestra
for (i in 1:num_muestras) {
  # Tomamos una muestra aleatoria de tamaño 'tamano_muestra' n de la variable
  muestra <- sample(insurance_ampliada$horas_sentado, size = n)

  # Calculamos la media y el desvío de la muestra
  x <- mean(muestra)
  s <- sd(muestra)

  # Valor crítico para la distribución normal estándar
  z <- qnorm(1 - (1 - confianza) / 2)

  # Calculamos el error estándar de la media
  error_estandar_media <- s / sqrt(n)

  # Calculamos el intervalo de confianza
  limite_inferior <- x - z * error_estandar_media
  limite_superior <- x + z * error_estandar_media

  # Almacenamos los resultados en el dataframe
  resultados[i, ] <- c(i, limite_inferior, limite_superior, x)
}
