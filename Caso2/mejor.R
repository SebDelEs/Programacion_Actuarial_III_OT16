mejor <- function(estado,resultado){
     getwd()
     setwd("~/Actuaria/Tercer Semestre/Programacion III/Caso2/Calidad de Hospitales - data")
     dat <- read.csv("outcome-of-care-measures.csv")
     
     if (resultado=="ataque"){columna <- 11} else{
          if (resultado=="falla"){columna <- 17} else{
               if (resultado=="neumonia"){columna <- 23} else{ 
                    stop("Resultado inválido")}
               }
          }
     
     valida <- dat$State
     a<- sapply(valida,function(x){x!=estado})
     checa <- all(a)
     
     if(checa==FALSE){
          datos <- data.frame(dat$Hospital.Name,dat$State,dat[,columna])
          y<-subset(datos,datos$dat.State==estado)
          z <- y
          for (i in 1:length(z[,3])) {
               if(z[i,3]=="Not Available"){z[i,3]<-NA}
          }
          Mortalidad<- as.numeric(as.character(z[,3]))
          x<-data.frame(z$dat.Hospital.Name,z$dat.State,Mortalidad)
          minimo<- min(x[,3],na.rm = TRUE)
          x2 <- subset(x,x[,3]==minimo)
          x3 <- sort.default(x2[,1])
          resul <- as.character(x3[1])
          resul
     }else{ stop("Estado inválido")}

}