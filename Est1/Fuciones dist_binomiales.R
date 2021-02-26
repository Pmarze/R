################# Funciónes binomiales #################
lbinomial <-function(y,n,p,imprimir){
  leqbinomial(y-1,n,p,imprimir)
}

gbinomial <-function(y,n,p,imprimir){
  geqbinomial(y+1,n,p,imprimir)
}

leqbinomial <-function(y,n,p,imprimir){
  a=0
  for(i in 0:y){
    a<-a+dbinom(i,n,p)
  }
  if(imprimir==0){
    print(a)
  }else{a}
}
geqbinomial <-function(y,n,p,imprimir){
  a=0
  for(i in y:n){
    a<-a+dbinom(i,n,p)
  }
  if(imprimir==0){
    print(a)
  }else{a}
}
lgqbinomial <-function(y1,y2,n,p,imprimir){
  a=0
  for(i in y1:y2){
    a<-a+dbinom(i,n,p)
  }
  if(imprimir==0){
    print(a)
  }else{a}
}