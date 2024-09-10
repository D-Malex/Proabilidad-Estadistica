# Installa todo
install.packages("readr")
install.packages("dplyr")
install.packages("scale")

# Descargo paquetes
available.packages("readr")
available.packages("dplyr")
available.packages("scale")

# Importo librerias
library('readr')
library('dplyr')
library('scale')
insurance <- read_csv("insurance.csv")

# Renombro los campos al español
View(
  insurance <- 
  insurance %>% 
  rename(
    Edad = age, 
    Genero = sex, 
    Hijos = children, 
    Fumador = smoker, 
    IMC = bmi,
    Region = region, 
    Prima = charges
  )
)

# Cambio los valores internos de genero
View(
  insurance <- insurance %>% 
  mutate(
    Genero = case_when(
      Genero == "female"~"Femenino",
      Genero == "male"~"Masculino"
      )
    )
)

# Cambio los valores internos de region 
View(
  insurance <- insurance %>%
  mutate(
    Region = case_when(
      Region == "southwest"~"SurOeste",
      Region == "southeast"~"surEste",
      Region == "northwest"~"norOeste",
      Region == "northeast"~"notEste"
      )
    )
)

# Elimino el campo fumador 
View(
  insurance <- insurance %>%
  mutate(fumador = NULL)
)

# Agrupo todos los elementos por region y los sumo
View(
  Fre_abs <- insurance %>%
  group_by(Region) %>% 
  summarise(frec_abs = n())
)

# Agrupo todos los elementos por region 
View(
  Fre_rel <- insurance %>%
  group_by(Region) %>% 
  summarise(frecuenciaRelativa = n() / nrow(insurance))
)

# Agrupo todos los elementos por region 
View(
  Fre_por <- insurance %>%
  group_by(Region) %>% 
  summarise(frecuenciaPorcentual = (n() / nrow(insurance))*100)
)

# Agrupo todos los elementos por region 
View(
  Fre_por2 <- Fre_rel %>% 
  mutate(Fre_por = percent(frecuenciaRelativa))
)