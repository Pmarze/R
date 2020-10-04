####################################################################################################
####################################### Librerías a utilizar #######################################

#install.packages("readxl")
#install.packages("dplyr")
library("writexl")      # Expotar archivos de excel
library("readxl")       # Importar archivos de excel
library("dplyr")        # Manejo de Data frames

####################################################################################################
########################################## Importar datos ##########################################

dia<-read_excel("Asistencia5.xlsx")
# Marca temporal es un dato no útil
borrar <- c("Marca temporal")
dia <- dia[ , !(names(dia) %in% borrar)]
rm(borrar)
# Lista de palabras clave
Palabras<-c("REDSHIFT","ASTRO","HASEMAN","MEDIDA","FORO")
Palabra5<-c("REDSHIFT","ASTROECFM","HASEMAN","MEDIDA","FORO")
for (a in 1:5) {
  dia$`Palabra clave`<-sub(Palabras[a],a,dia$`Palabra clave`,perl=T)  
}
for(i in 1:10) {
  dia$`Palabra clave`<-sub("[^0-9]","",dia$`Palabra clave`,perl=T)
}
# Se regresa cada valor a la palabra clave correspondiente
for (c in 5:1) {
  dia$`Palabra clave`<-sub(c,Palabra5[c],dia$`Palabra clave`,perl=T)  
}
dia$`Palabra clave`<-as.factor(dia$"Palabra clave")
write_xlsx(dia,"DIA5.xlsx")