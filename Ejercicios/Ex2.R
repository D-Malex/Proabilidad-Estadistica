#EJ 02.
#      El error humano se da como la razón del 75% de todos los accidentes de la planta.        # nolint
#      Usando la distribución binomial determinar la probabilidad de que el error humano se     # nolint
#      dará como la razón para dos de los siguientes 4 accidentes.
#---------------------------------------------------------------------------------------------  # nolint

# DATOS
#   Exito. x: Accidente Humano
#   Probablidad. P: 75%
#   Probabilidad' P': 25%
#   Espacio Muestra. S: 4 Accidentes
#---------------------------------------------------------------------------------------------  # nolint

# Resultado: 0.2109375 ~ 21% ✅
dbinom(2, 4, 0.75)