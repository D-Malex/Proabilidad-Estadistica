#EJ 01.
#      Una semilla tiene una probabilidad de germinación del 83%. Si se siembran 12 semillas: # nolint # nolint: line_length_linter.
#       a. La probabilidad de que germinen todas las semillas.
#       b. La probabilidad de que no germinen todas las semillas.
#       c. La probabilidad de que germinen 10 semillas.
#       d. La probabilidad de que no germinen 10 semillas.
#       e. La probabilidad de que germinen a lo sumo 10 semillas.
#       f. La probabilidad de que no germinen a lo sumo 10 semillas.
#       g. La probabilidad de que germinen menos de 7 semillas.
#       h. La probabilidad de que no germinen menos de 7 semillas.
#--------------------------------------------------------------------------------------------- # nolint

# DATOS
#   Exito. x: Germinacion
#   Probablidad. P: 83% 
#   Probabilidad' P': 17%
#   Espacio Muestra. S: 12 Semillas
#---------------------------------------------------------------------------------------------  # nolint

#a. Resultado: 0.10689 ~ 10% ✅
dbinom(12, 12, 0.83)

#b. Resultado: 5.826222e-10 ✅
dbinom(12, 12, 0.17)

#c. Resultado: 0.295953 ~ 30% ✅
dbinom(10, 12, 0.83)

#d. Resultado: 9.1662e-07 ✅
dbinom(10, 12, 0.17)

#e. Resultado: 0.6303924 ~ 63% ✅
dbinom(0, 12, 0.83) +
dbinom(1, 12, 0.83) +
dbinom(2, 12, 0.83) +
dbinom(3, 12, 0.83) +
dbinom(4, 12, 0.83) +
dbinom(5, 12, 0.83) +
dbinom(6, 12, 0.83) +
dbinom(7, 12, 0.83) +
dbinom(8, 12, 0.83) +
dbinom(9, 12, 0.83) +
dbinom(10, 12, 0.83)

#f. Resultado: 1 = 100% ✅
dbinom(0, 12, 0.17) +
dbinom(1, 12, 0.17) +
dbinom(2, 12, 0.17) +
dbinom(3, 12, 0.17) +
dbinom(4, 12, 0.17) +
dbinom(5, 12, 0.17) +
dbinom(6, 12, 0.17) +
dbinom(7, 12, 0.17) +
dbinom(8, 12, 0.17) +
dbinom(9, 12, 0.17) +
dbinom(10, 12, 0.17)

#g. Resultado: 0.008751673 ✅
dbinom(0, 12, 0.83) +
dbinom(1, 12, 0.83) +
dbinom(2, 12, 0.83) +
dbinom(3, 12, 0.83) +
dbinom(4, 12, 0.83) +
dbinom(5, 12, 0.83) +
dbinom(6, 12, 0.83)

#h. Resultado: 0.9985401 ~ 99% ✅
dbinom(0, 12, 0.17) +
dbinom(1, 12, 0.17) +
dbinom(2, 12, 0.17) +
dbinom(3, 12, 0.17) +
dbinom(4, 12, 0.17) +
dbinom(5, 12, 0.17) +
dbinom(6, 12, 0.17)
