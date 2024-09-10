# INSTALL LIBRARYS
install.packages("ggplot2")
install.packages("readr")

# CALL LIBRARYS
library(ggplot2)
library(readr)

# READ DB
insurance <- read_csv("03-Insurance.csv")

# Grafico del Indice de Masa Corporal
grafica_BMI <- ggplot(data=insurance, aes(x=bmi))+geom_density(color="red")
grafica_BMI

# Grafico de la edad
grafica_age <- ggplot(data=insurance, aes(x=age))+geom_density(color="purple")
grafica_age

# Grafico por sexo
grafica_bmi_sexo <- ggplot(data=insurance, aes(x=bmi, colour=sex))+geom_density()
grafica_bmi_sexo

# Grafico de por region
grafica_bmi_region <- ggplot(data=insurance, aes(x=bmi, colour=region))+geom_density()
grafica_bmi_region

# Promedio 
grafica_BMI_Promedio <- ggplot(data=insurance, aes(x=bmi))+
    geom_density(color="orange")+
    geom_vline(aes(xintercept=mean(bmi)))       #¿Podes hacer que muestre el valor del mean (promeido)?
grafica_BMI_Promedio

# Ejemplos explicativos
quantile(insurance$age)
quantile(insurance$age, c(0.15, 0.85))
ggplot(data=insurance, aes(y=charges))+geom_boxplot()



# Requirement Activities
# TP --> Unidad 2
# Mediana   Distribulle 50 / 50      -->     Percentil 50
# Moda      La que se repite mas.
# Media     EL promedio.