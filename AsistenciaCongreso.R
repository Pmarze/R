####################################################################################################
####################################### Librerías a utilizar #######################################

#install.packages("readxl")
#install.packages("dplyr")
#install.packages("writexl")
library("writexl")      # Expotar archivos de excel
library("readxl")       # Importar archivos de excel
library("dplyr")        # Manejo de Data frames

####################################################################################################
########################################## Importar datos ##########################################

dia<-read_excel("Asistencia.xlsx")

# Marca temporal es un dato no útil
borrar <- c("Marca temporal")
dia <- dia[ , !(names(dia) %in% borrar)]

# Lista de palabras clave
Palabras<-c("QUBITS","SISMO","HIGGS","SERIES","PANDGT","BLAZAR","FERMI","ASTROECFM","PROTO","NEUT",
            "AJEDREZ","BINARIO","EXPSOL","EPIDEM","POSTER","RADIO","CLUST","SISM","GEOD","TRAF",
            "REDSHIFT","ASTRO","HASEMAN","MEDIDA","FORO")

####################################################################################################
######################################## Limpieza de datos #########################################

# Leer palabras clave de la lista y sustituir por un número
for (a in 1:25) {
  dia$`Palabra clave`<-sub(Palabras[a],a,dia$`Palabra clave`,perl=T)  
}

# Todo caracter que no sea un número será eliminado bajo la suposición que hay como máximo
# 10 caracteres erróneos
for(i in 1:10) {
  dia$`Palabra clave`<-sub("[^0-9]","",dia$`Palabra clave`,perl=T)
}

# Se regresa cada valor a la palabra clave correspondiente
for (c in 25:1) {
  dia$`Palabra clave`<-sub(c,Palabras[c],dia$`Palabra clave`,perl=T)  
}

####################################################################################################
######################################## Análisis de datos #########################################

# Para eliminar repetidos es necesario que cada columna contenga factores
dia$`Palabra clave`<-as.factor(dia$"Palabra clave")
dia$Nombre<-as.factor(dia$Nombre)
dia$`Dirección de correo electrónico`<-as.factor(dia$`Dirección de correo electrónico`)
dia$Institución<-as.factor(dia$Institución)

# Tabla SIMPlificada
diaSIMP<-dia[!duplicated(dia), ]
# Ordenados alfabéticamente por el correo electrónico
diaSIMP<- diaSIMP[with(diaSIMP, order(diaSIMP$`Dirección de correo electrónico`)), ]

b<-as.data.frame(table(diaSIMP$`Dirección de correo electrónico`))
c<-b[b$Freq > 15, ]
####################################################################################################
############################################ Resultados ############################################

write_xlsx(c,"Asistencia_Aceptados.xlsx")
write_xlsx(diaSIMP,"Asistencia_Limpia.xlsx")

####################################################################################################
###################################### Limpieza de variables #######################################

rm(borrar)
rm(a)
rm(i)

####################################################################################################