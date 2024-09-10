#### Repaso para el parcial segunda parte####

# PARTE 1: Binomial y Poisson

#1) En un concierto, se desmayan en promedio 15 personas.
# ¿Cuál es la probabilidad de que se desmayen 18 personas
# si X= número de personas que se desmayan en el concierto
#sigue una distribución de Poisson?
# x = exitos deseados
# lambda = promedio
# dpois(x lambda)
# resultado = 0.07061296 ~ 7%
dpois(18, 15)

#2) La probabilidad de que un determinado medicamento
# presente una reacción negativa al ser administrado
# a un paciente en tratamiento es de 0.15.
# Si se le ha suministrado este medicamento ha 10
# personas, calcule la probabilidad de que haya
# reacción negativa en:

# a) tres personas.             - 0.1298337 ~ 13%
dbinom(3, 10, 0.15)

# b) en ninguna persona.        - 0.1968744 ~ 20%
dbinom(0, 10, 0.15)

# c) en más de 7 personas.      - 8.665133e-06
dbinom(8, 10, 0.15) +
dbinom(9, 10, 0.15) +
dbinom(10, 10, 0.15)

# PARTE 2: Gráficos de densidad y percentiles

#3) Leer la base compensation
compensation <- read_csv("CSV/compensation.csv")

#4) Luego de la lectura realizar un grafico de densidad
# para cada variable continua.
ggplot(data = compensation, aes(x = Fruit)) + geom_density()
ggplot(data = compensation, aes(x = Root)) + geom_density()

#5) Para la variable Root, realizar un gráfico de densidad
# filtrando por la variable categórica Grazing. 
# Analizar brevemente lo que observa del gráfico.
Root_grazed <- compensation %>%
dplyr::filter(Grazing == "Grazed")

ggplot(data = Root_grazed, aes(x = Root)) + geom_density()

#6) Para la varible Fruit, realizar un gráfico de densidad
# agregando una linea vertical para el valor medio de la 
# variable Fruit.
# Analizar brevemente lo que observa del gráfico.
ggplot(data = compensation, aes(x = Fruit)) + geom_density() +
    geom_vline(aes(xintercept = mean(Fruit)))

#7) Leer la base Growth.
growth <- read_csv("CSV/growth.csv")

#8) Indicar cuáles son variables categóricas y
# cuáles son variables continuas.
#Supplement/diet es categorica
#gain es continua

#9) Para la variable gain, determinar los cuartiles.
# Analizar brevemente dichos valores.
quantile(growth$gain)
#      0%      25%      50%      75%     100% 
#15.78175 19.27829 21.24808 23.62980 29.02916
# Para tal cuartil tal promedio de peso ganado, el 100% ganó aproximadamente 30 km
#mientras que el el 25% gano aproximadamente un 19%

#10) Calcular el percentil 14 y el 28.
# Analizar brevemente dichos valores.
quantile(growth$gain, c(0.14, 0.28))
#     14%      28% 
#18.03251 19.39067
#