################# Funciónes binomiales #################
lbinomial <-function(y,n,p,imprimir){       #P(x<y)
  leqbinomial(y-1,n,p,imprimir)
}

gbinomial <-function(y,n,p,imprimir){       #P(x>y)
  geqbinomial(y+1,n,p,imprimir)
}

lgbinomial <-function(y1,y2,n,p,imprimir){  #P(y1<x<y2)
  lgqbinomial(y1-1,y2+1,n,p,imprimir)
}

leqbinomial <-function(y,n,p,imprimir){     #P(x<=y)
  a=0
  for(i in 0:y){
    a<-a+dbinom(i,n,p)
  }
  if(imprimir==0){
    print(a)
  }else{a}
}
geqbinomial <-function(y,n,p,imprimir){     #P(x>=y)
  a=0
  for(i in y:n){
    a<-a+dbinom(i,n,p)
  }
  if(imprimir==0){
    print(a)
  }else{a}
}
lgqbinomial <-function(y1,y2,n,p,imprimir){ #P(y1<=x<=y2)
  a=0
  for(i in y1:y2){
    a<-a+dbinom(i,n,p)
  }
  if(imprimir==0){
    print(a)
  }else{a}
}
