rankhospital <- function(estado,resultado,num="mejor"){
     getwd()
     setwd("~/Actuaria/Tercer Semestre/Programacion III/Caso2/Calidad de Hospitales - data")
     dat <- read.csv("outcome-of-care-measures.csv")
     
     if (resultado=="ataque"){columna <- 11} else{
          if (resultado=="falla"){columna <- 17} else{
               if (resultado=="neumonia"){columna <- 23} else{ 
                    stop("Resultado inválido")}
          }
     }
     
     num2<-num[1]
     if(num2=="mejor"){num <-1}
     
     valida <- dat$State
     a<- sapply(valida,function(x){x!=estado})
     checa <- all(a)
     
     if(checa==FALSE){
          final <- vector("character")
          datos <- data.frame(dat$Hospital.Name,dat$State,dat[,columna])
          y<-subset(datos,datos$dat.State==estado)
          z <- y
          
          for (i in 1:length(z[,3])) {
               if(z[i,3]=="Not Available"){z[i,3]<-NA}
          }
          
          Mortalidad<- as.numeric(as.character(z[,3]))
          x<-data.frame(z$dat.Hospital.Name,Mortalidad)
          
          if(num2=="peor"){
               maxi<- max(x[,2],na.rm = TRUE)
               x2 <- subset(x,x[,2]==maxi)
               x3 <- rev(sort.default(x2[,1]))
               resul <- as.character(x3[1])
               resul
          }else{
               for (j in num){
               ordenar<- sort.default(x[,2],na.last = TRUE)
               head(ordenar,10)
               selec<-ordenar[j]
               x2 <- subset(x,x[,2]==selec)
               x4 <- subset(x,x[,2]<selec)
               resta <- nrow(x4)
               selec2 <- j-resta
               x3 <- sort.default(x2[,1])
               resul <- as.character(x3[selec2])
               final<- c(final,resul)
               }
          final
          }
          
     }else{ stop("Estado inválido")}
}