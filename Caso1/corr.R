corr <- function(directorio="~/Actuaria/Tercer Semestre/Programacion III/specdata",horizonte=0) {
  id <- 1:332
  Correlaciones <- vector("numeric")
  for (i in id) {
    if (i < 10){
      j <- paste("00",i,".csv",sep = "")
    }else{ 
      if ((i>=10)&(i < 100)) {
        j <- paste("0",i,".csv",sep="")
      }else{
        j <- paste(i,".csv",sep = "")
      }
    }
  
    #Leeremos cada documento de datos
    getwd()
    setwd(directorio)
    data <- read.csv(j)
    #Veremos si se cumple el horizonte requerido por el usuario
    comp <- complete.cases(data)
    cuenta <- comp [comp== TRUE]
    num <- length(cuenta)
    
    if (num >= horizonte){
      sul <- data[comp,2]
      nit <- data[comp,3]
      PromSul <- mean(sul)
      PromNit <- mean(nit)
      sul2 <-0
      nit2 <-0
      SulNit <-0
      for (l in 1:num){
        sul2 <- sul2 + (sul[l]^2)
        nit2 <- nit2 + (nit[l]^2)
        SulNit <-SulNit+(sul[l]*nit[l])
      }
      CovarSul <- ((sul2/num)-(PromSul^2))^(1/2)
      CovarNit <- ((nit2/num)-(PromNit^2))^(1/2)
      CovSulNit <-((SulNit/num)-(PromSul*PromNit))
      
      rCoe <- CovSulNit/(CovarSul*CovarNit)
      Correlaciones <- c(Correlaciones,rCoe)
    }
    
  }
  Correlaciones
}
  