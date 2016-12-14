#### CASO 3 ####
getwd()
setwd("~/Actuaria/Tercer Semestre/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
library("dplyr")

# Lectura de datos
     subject_test <- read.table("./test/subject_test.txt")
     x_test <- read.table("./test/X_test.txt")
     y_test <- read.table("./test/y_test.txt")

     subject_train <- read.table("./train/subject_train.txt")
     x_train <- read.table("./train/X_train.txt")
     y_train <- read.table("./train/y_train.txt")

     features <- read.table("./features.txt")[,2]
     actividades <- read.table("./activity_labels.txt")[,2]

#Unimos los datos
unionx <- rbind(x_test,x_train)
uniony <- rbind(y_test,y_train)
unionsubject <- rbind(subject_test,subject_train)

#Cambiar nombres de variables y actividades
colnames(unionx)<- features
colnames(uniony)<- "Actividades"
colnames(unionsubject) <- "Sujetos"

#Seleccionar laos nombres de columnas que necesitamos(mean,std)
featmean <- features[grep("-mean\\(",features)]
featstd <- features[grep("-std\\(",features)]
featmean2 <- as.character(featmean)
featstd2 <- as.character(featstd)

features2 <- c(featmean2,featstd2)

purge <- unionx[,features2]

tabla <- cbind(purge,uniony,unionsubject)
tabla2 <- arrange(tabla,Sujetos)
tabla3 <- split(tabla2,tabla2$Sujetos)

prom <- vector("numeric")   
datos2<-data.frame(features2)
colnames(datos2)<- "caracteristicas"

for (i in 1:30) {
     
     tf <- filter(tabla2,Sujetos==i)
     su<- paste(i)
     datos<- data.frame(su)
     nom<-paste("sujeto",i)
     colnames(datos)<- nom
     for (j in 1:6) {
          nom <- actividades[j]
          tablaff <-  filter(tf,Actividades==j)
          tablaff<- select(tablaff,-(Actividades:Sujetos))
          promedios <- colMeans(tablaff)
          prom<-data.frame(promedios[])
          colnames(prom)<- nom
          datos<-cbind(datos,prom)
     }
     datos2<-data.frame(datos2,datos)
}

datosfinal <- select(datos2,-(caracteristicas))

write.table(datosfinal,row.names = TRUE,file="datos_limpios.txt")
