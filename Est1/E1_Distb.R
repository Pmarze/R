################ funciones dist. binom #################
# datos como vector
datoss <- c(5,6,9,1,3)
# media
mean(datoss)
# varianza
var(datoss)
# deviación estándar
sd(datoss)
# histograma
hist(datoss)
# ordenar
sort(datoss)
################# funciones dist. geom #################
# Probabilidad y=3
dgeom(3,0.5)

# Probabilidades desde y=0 hasta y=9
dgeom((0:9),0.5)
#a<-dgeom((0:9),0.5)

# gráfica de puntos dist. anterior
plot(dgeom((0:9),0.5))
#plot(a)

# gráfica de barras dist. anterior
barplot(dgeom((0:9),0.5))
#barplot(a)
########################################################