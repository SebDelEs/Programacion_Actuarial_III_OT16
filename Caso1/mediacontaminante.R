mediacontaminante <- function(directorio="~/Actuaria/Tercer Semestre/Programacion III/specdata",contaminante="sulfato",id=1:332){
sumaProm <- 0  
restar <- 0
  if (contaminante == "sulfato"){
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
        sumaProm <- sumaProm + prom
    }
  } else {
    if (contaminante == "nitrato"){
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
          restar <- restar + 1
        }
        sumaProm <- sumaProm + prom
      }
    }else {
      TotalProm <- c("NA")
    }
    
  }
  TotalProm<- sumaProm/(length(id) - restar)
  TotalProm
}
