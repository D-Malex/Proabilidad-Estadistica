#EJ 04.
#      Una cooperativa agrícola afirma que 90% de las sandías embarcadas están maduras y listas   # nolint
#      para comerse. Encuentre las probabilidades de que entre 18 sandías embarcadas:             # nolint
#      a. las 18 estén maduras y listas para comerse.
#      b. Al menos 16 están maduras y listas para comerse.
#      c. Cuando mucho 14 están maduras y listas para comerse.
#---------------------------------------------------------------------------------------------    # nolint

# DATOS
#   Exito. x: Sandias listas
#   Probablidad. P: 90% Listas
#   Probabilidad' P': 10% No listas
#   Espacio Muestra. S: 18 Sandias embarcadas
#---------------------------------------------------------------------------------------------    # nolint


# a. Resultado: 0.1500946 ~ 15%   ✅
# Justificacion:
dbinom(18, 18, 0.90)

# b. Resultado: 0.733796 ~ 73%    ✅
# Justificacion: P(X >= 16)
dbinom(16, 18, 0.90) +
dbinom(17, 18, 0.90) +
dbinom(18, 18, 0.90)

# b. Resultado: 0.09819684 ~ 9.8% ✅
# Justificacion: P( <= 14)
dbinom(0, 18, 0.90) +
dbinom(1, 18, 0.90) +
dbinom(2, 18, 0.90) +
dbinom(3, 18, 0.90) +
dbinom(4, 18, 0.90) +
dbinom(5, 18, 0.90) +
dbinom(6, 18, 0.90) +
dbinom(7, 18, 0.90) +
dbinom(8, 18, 0.90) +
dbinom(9, 18, 0.90) +
dbinom(10, 18, 0.90) +
dbinom(11, 18, 0.90) +
dbinom(12, 18, 0.90) +
dbinom(13, 18, 0.90) +
dbinom(14, 18, 0.90)