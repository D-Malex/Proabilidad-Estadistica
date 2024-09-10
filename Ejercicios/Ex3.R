#EJ 03.
#      Durante una etapa de fabricación de chips de circuitos integrados, debe aplicarse un recubrimiento. 
#      Si 70% de los chips reciben recubrimiento suficientemente grueso, 
#      hallar las siguientes probabilidades, entre 15 chips:
#       a. Al menos 12 tendrán recubrimientos suficientemente gruesos;
#       b. Cuando mucho 6 tendrán recubrimientos suficientemente gruesos;
#       c. exactamente 10 tendrán recubrimientos suficientemente gruesos.
#---------------------------------------------------------------------------------------------  # nolint

# DATOS
#   Exito. x: Recubrimiento correcto
#   Probablidad. P: 70%
#   Probabilidad' P': 30%
#   Espacio Muestra. S: 15 chips
#---------------------------------------------------------------------------------------------  # nolint


#a. Resultado: 0.2968679 ~ 30%   ✅
# P(X >= 12)
dbinom(12, 15, 0.70) +
dbinom(13, 15, 0.70) +
dbinom(14, 15, 0.70) +
dbinom(15, 15, 0.70)

#b. Resultado: 0.01524253 ~ 1.52 ✅
# P(X <= 6)
dbinom(0, 15, 0.70) +
dbinom(1, 15, 0.70) +
dbinom(2, 15, 0.70) +
dbinom(3, 15, 0.70) +
dbinom(4, 15, 0.70) +
dbinom(5, 15, 0.70) +
dbinom(6, 15, 0.70)

#c. Resultado: 0.2061304 ~ 21%   ✅
dbinom(10, 15, 0.70)
