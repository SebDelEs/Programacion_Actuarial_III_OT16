mediacontaminante <- function(directorio="~/Actuaria/Tercer Semestre/Programacion III/specdata",contaminante="sulfate",id=1:332){
sumaProm <- 0  
restar <- 0
totaldatos <-0
  if (contaminante == "sulfate"){
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
        prom <- mean(data[,2],na.rm = TRUE)
        contar <- complete.cases(data[,2])
        contar1 <- contar[contar==TRUE]
        numdatos <- length(contar1)
        suma <-prom*numdatos
        totaldatos <-totaldatos+numdatos  
        sumaProm <- sumaProm + suma
    }
  } else {
    if (contaminante == "nitrate"){
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
        prom <- mean(data[,3],na.rm = TRUE)
        if (is.nan(prom)){prom <- 0
        }
        contar <- complete.cases(data[,3])
        contar1 <- contar[contar==TRUE]
        if (is.nan(prom)){
          numdatos <-0
          suma <- 0
        }else{
        numdatos <- length(contar1)
        suma <- prom*numdatos
        }
        
        totaldatos <-totaldatos+numdatos  
        sumaProm <- sumaProm + suma
        
      }
    }else {
      TotalProm <- c("NA")
    }
    
  }
  TotalProm<- sumaProm/totaldatos
  TotalProm
}
