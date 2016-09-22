#Crear función completos
completos <- function(directorio="~/Actuaria/Tercer Semestre/Programacion III/specdata",id=1:332){
compmonitor <- vector("numeric")

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
    getwd()
    setwd(directorio)
    data <- read.csv(j)
    
    comp <- complete.cases(data)
    cuenta <- comp [comp== TRUE]
    num <- length(cuenta)  
    
    compmonitor <- c(compmonitor,num)
  }

  resultado <- data.frame(id=id,nobs=compmonitor)
  resultado
}