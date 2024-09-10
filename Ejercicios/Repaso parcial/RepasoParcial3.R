# PASADO EN LIMPIO
# LIBRERIAS A UTILIZAR:
install.packages("dplyr")
install.packages("ggplot")
library("dplyr") # Funciones generales para datasets
library("ggplot") # Funciones para graficar

# Leer una base de datos
baseDeDatos <- read.csv("nombreBaseDeDatos.csv")

# Obtener dimension de la base
dimBaseDeDatos <- dim(baseDeDatos)

# Si queremos la media de un objeto
mediaObjeto <- baseDeDatos %>% summarise(media = mean(Objeto))

# Para alterar los nombres y renombrar las columnas
baseDeDatos <- rename(baseDeDatos, NuevoNombre = ViejoNombre, NuevoNombre2 = ViejoNombre2)

# Recodificar las variables categóricas
# En este caso los registros que tengan por valor "Viejo valor" en la Columna1, van a pasar a tener por valor "Nuevo valor"
baseDeDatos <- baseDeDatos %>%mutate(Columna1 = case_when(Columna1 == "Viejo valor" ~ "Nuevo valor",))

# Para realizar subconjuntos podemos filtrar 
# En este caso vamos a hacer un subconjunto con los registros que tengan por valor "Nuevo valor" en la Columna1
primerSubconjunto <- filter(baseDeDatos, Columna1 == "Nuevo valor")

# En este caso vamos a tener un subconjunto solo con la columna "Columna1"
subcojuntoUnaColumna <- select(baseDeDatos, Columna1)

# Para calcular la frecuencia de una columna podemos hacer lo siguiente
# Esta linea nos va a devolver la cantidad de veces que se repitió cada valor de la columna "Columna1" formando el primer paso de la tabla de frecuencias
tablaDeFrecuencias <- baseDeDatos %>% group_by(Columna1) %>% summarise(Frecuencia = n())

# para calcular el resto de frecuencias debemos seguir los siguientes calculos:

tablaDeFrecuencias <- baseDeDatos %>% group_by(Columna1) %>% summarise(Frecuencia = n()) # Nos da la frecuencia Absoluta
                                  %>% mutate(          # Agregamos el mutate para agregar más columnas a la tabla
                                      FrecuenciaRelativa = Frecuencia / sum(Frecuencia) #La frecuencia relativa es la Frecuencia de ese valor sobre el total
                                      FrecuenciaPorcentual = FrecuenciaRelativa * 100 # La frecuencia porcentual es la frecuencia relativa pero en porcentaje
                                      FrecuenciaAcumulada = cumsum(Frecuencia) # La frecuencia acumulada es la suma de la frecuencia más las anteriores
                                      FrecuenciaAcumuladaRelativa = cumsum(FrecuenciaRelativa) #La frecuencia acumulada puede ser sobre la relativa o la absoluta
                                  )

# La distribución de poisson nos sirve para casos de conteo donde no tenemos un tope o cota superior
# Está dada por el número de casos con éxito que se desea tener y el promedio de casos con éxito
# Para calcular la distribucion de poison vamos a utilizar la siguiente funcion
probabilidadPoisson <- dpois(casosExito, promedio)

# La distribución de Bernoulli es un experimento que se ejecuta N veces, una independiente de las otras y con la misma probabilidad P, sobre una cantidad X.
# Responde a la siguiente linea:
dbinom( numeroExitosDeseados, numeroDeEnsayos, probabilidadDeExitoEnCadaEnsayo )

# Ejemplo: el 70% de los alumnos aprueban el primer parcial, hay 20 alumnos. Cual es la probabilidad de que aprueben 15?
dbinom(15, 20, 0.70)

# Caso gráficos:
# El caso de un gráfico de densidad para una variable continua se determina por la siguiente funcion:
# Data nos pide la base de datos y la X nos pide la variable que querramos medir su densidad para poner en el eje respectivo
densidad_01 <- ggplot(data = baseDeDatos, aes(x = variableContinua)) + geom_density()
print(densidad_01)
#Muy importante imprimirlo después porque sino no se va a ver

# Esta función responde al gráfico de densidad de una variable continua filtrando por variables categóricas
# Data nos pide la base de datos, la X nos pide la variable que querramos medir, fill es el filtro y colour colorea segun la variableCategórica que hayamos puesto en el filtro
densidad_02 <- ggplot(data = baseDeDatos, aes(x = variableContinua, colour = variableCategorica, fill = variableCategorica)) + geom_density(alpha = 0.1)
print(densidad_02)

# La siguiente función responde al gráfico de densidad con una linea en el medio que indica la media
# Data nos pide la base, x la variableContinua, luego se agrega el color y en geom_vline se agrega la linea vertical donde en el eje de las X agregamos una intercepción en la media de la variable continua
densidad_03 <- ggplot(data = baseDeDatos, aes(x = variableContinua)) + geom_density(color = "blue") + geom_vline(aes(xintercept = mean(variableContinua)), linetype = "dashed")
print(densidad_03)

# Cuantiles:
# Para los cuantiles tenemos la siguiente función, muy cómoda:
# Esta función nos deja el 25% de los registros por debajo de un valor, el 50% de los registros por debajo de otro valor, el 75% y el 100% también 
quantile(baseDeDatos$variableContinua)

# Para ser más específicos y calcular un percentil exacto podemos pasarle otro paramentro con la C
  # Donde va a calcular y dejar el 15%, 20%, 80% y 85% por debajo de cierto valor
quantile(baseDeDatos$variableContinua, c(0.15, 0.20, 0.80, 0.85))

# Ejemplo
quantile(growth$Ganancia, c(0.14, 0.28))
# El 14% de vacas ganó por lo menos 18.03 kilos y el 28% de las vacas por lo menos unos 19.39 kilos. Siendo así que al duplicar el porcentaje, 
# aumentó apenas un kilo y unos gramos