# INSTALL
install.packages("readr")
install.packages("dplyr")

# IMPORT
library(readr)
library(dplyr)
insurance <- read_csv("insurance.csv")

# PRACTICA
# Nos muestra un grafico con la cant de mujeres y homres
View(
  insurance %>%
    group_by(sex) %>%
    summarise(cantidad = n())
)

# Muestra agrupado el recuento agrupado por sexo y region
View(
  insurance %>%
    group_by(sex, region) %>%
    summarise(cantidad = n())
)

# El anterior y un promedio de masa muscular
View(
  insurance %>%
    group_by(sex, region) %>%
    summarise(promedio_bmi = mean(bmi))
)

# Agrego dplyr::select para no entrar en conflicto con otra función llamada select de otro paquete # nolint # nolint: indentation_linter.
View(
  insurance %>%
    dplyr::select(sex, age, smoker)
)

# 
View(
  insurance %>%
    group_by(sex, region) %>%
    summarise(promedio_bmi = mean(bmi))
)

View(
  insurance %>%
    filter(region != "southwest")
)

# Distribucion de Bernulli
# Esta distribución es la más sencilla: se refiere a la probabilidad de ocurrencia
# de un evento dicotómico (éxito o fracaso) en un único ensayo
# En R se puede utilizar la función dbinom(x, n, prob) donde:
#   x: número de éxitos que se desea tener
#   n: número de ensayos
#   prob: probabilidad de éxito en cada ensayo.
dbinom(0, 15, 0.28)
