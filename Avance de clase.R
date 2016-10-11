#Clase del 25/08/2016

#Crear VEctores con la función vector
x <- vector(mode="numeric",length = 5L)
x

#Crear vectores con la función C
x <- c(0.5,0.6)
x
class(x)

x <- c(TRUE,FALSE,T,F)
x
class(x)

x <- 5:10
x
class(x)

x <- 10:0
x
class(x)

x <- c(1+2i,5,3+9i,4-5i)
x
class(x)

x <- c("a","b","c","d","e")
x
class(x)

#Mezcla los objetos de un vector

y <- c(1.7,"a")   #caracter
y
class(y)
y <- c(TRUE,2)    #numerico
y
class(y)
y <- c("a",TRUE)  #caracter
y
class(y)

y <- c(TRUE)
y
class(y)

#Orden de coacción7coerción explicita
# 1 Character
# 2 complex
# 3 numeric
# 4 integer
# 5 logical


#Coerción explícita
z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <- c(1+2i,3+4i,8,0+3i,0)
as.logical(z)


z <- c("programación","Actuarial","III")
as.numeric(z)
as.logical(z)
as.complex(z)

#LISTAS (es como un vector... pero de vectores y c/u tiene su propia clase)
x <- list(1,"a",TRUE,1+4i)
x
class(x)

# MATRICES
m <- matrix(nrow = 2,ncol = 3)
m
dim(m)
attributes(m)
# Cambio de dimensiones de 2x3 a 3x2
dim(m) <- c(3,2)
m

#Crear una matriz con datos
m <- matrix(1:6,3,2)
m

m <- matrix(1:6,3,3,T)
m
class(m)

dim(m) <- c(2,5)
# lo de arriba marca error porque los tamaños de los elementos no coinciden
# como arregrarlo?

#redimension de vectores es fácil
x <- c(1,2,3)
y <- c("a","b","c")
z <- c(x,y)
z

#Como hacerlo en matrices?
m1 <- rbind(m,x)
m1

m2 <- cbind(m,x)
m2

m1 <- rbind(m,y)
m1

m2 <- cbind(m,y)
m2


#Factores
x <- factor(c("si","no","si","si","no","si","no"))
x
table(x)
unclass(x)
x <- factor(c("si","no","si","si","no","si","no"),levels = c("si","no"))
x
unclass(x)


x <- factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)



#Valores Faltantes
x <- c(1,2,NA,10,3)
is.na(x)
is.nan(x)

x <- c(1,2,NaN,10,3)
is.na(x)
is.nan(x)


#Data Frames
#Se utilizan para almacenar datos tabulares con distinta clase

x <- data.frame(Erick =1:4, Lori = c(T,T,F,F))
row.names(x) <- c("Primero","segundo","tercero","cuarto")
x
nrow(x)
ncol(x)
attributes(x)

#cambiar nombres de columna
names(x) <- c("Yarely","Karen")
x

#Los nombres no son exclusivos de los data frames
x <- 1:3
names(x)
names(x) <- c("Hugo","Paco","Luis")
x
names(x)


x <- list(a=1:10,b=100:91,c=51:60)
x
names(x) <- c("Seq1","SEQ2","sEq3")
x


m <- matrix(1:4,2,2)
m
attributes(m)
dimnames(m) <- list(c("fil1","fil2"),c("col1","col2"))
m


m <- matrix(nrow=5,ncol=6)
dimnames(m) <- list(c(1:5),c("A","B","C","D","E","F"))
m



#LEctura de datos
getwd()
setwd("~/Actuaria/Tercer Semestre/GitHub/Programacion_Actuarial_III_OT16")
data <- read.csv("Datos_S&P.csv")
data <- read.table("Datos_S&P.csv",T,",")


data <- read.table("Datos_S&P.csv",T,",",nrows = 100,skip = 5)
clases <- sapply(data,class)
data <- read.table("Datos_S&P.csv",T,",",colClasses = clases)
data



#Uso de dput y dget
y <- data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
# asi guardamos un objeto en el HDD en lugar de en la memoria RAM
nueva.y <- dget("y.R")
nueva.y

x <- "Programacion Actuarial III"
y <- data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
# rm remueve
x
source("data.R")
x
y


bla2 <- head(airquality)
bla <- data.frame(bla2)
bla
dump("bla",file="air.R")




# Analizar URL
con <- url("http://www.fcfm.buap.mx/","r")
x <- readLines(con,7) # con esto le decimos cuantas lineas de la variable quermeos ver
x


#Creamos un vector
x <- c("a","b","c","d","e")
#Veamos el vector
x

#extraemos elementos con []
x[1]
x[2]
#Tambien podemos extraer una secuencia de elementos
x[1:4]
#Es posible extraer los elementos que cumplen una restriccion
x[x>"b"]
#de manera equivalente se puede obtener un vector logico
u <- x == "c"
u
x[u]


# Creamos una lista
x <- list(foo =1:4,bar=0.6)
# Extraemos el primer elemento de la lista,
# este elemento es la secuencia en si
x[1]

# Extraemos nuevamente el primer elemento de la lista, 
# ahora el elemento es la secuencia en si
x [[1]]

# Extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]


# Clase 07-09-2016

# Extraer un elemento de la primera lista
x$foo[2]

# Creamos una lista de 3 elementos
x <- list(foo=1:4,bar=0.6,baz="Hola")
# Extraemos el primer y tercer elemento de la lista
x[c(1,3)]

x <- list(foo =1:4,bar=0.6,baz="Hola")
name <- "foo"
x[[name]]
x$name
x$foo

# Se pueden extraer elementos de los elementos extraidos
x <- list(a=list(10,12,14),b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]

# Extraccion de elementos de una matriz
x <- matrix(1:6,2,3)
x
# El resultado de un vector
x[1,2]
x[2,1]
x[1,]
x[,2]

# Con drop= FALSE, se mantiene la dimension y el resultado será una matriz
x[1,2, drop = FALSE]

# se puede extraer toda la fila en forma de matriz
x[1,,drop = FALSE]

# R puede encontrar el nombre de algunos objetos de manera parcial con $
x <- list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]

# Valores Faltantes
airquality[1:6,]

completos <- complete.cases(airquality)
completos

airquality[completos,]
airquality[completos,][1:6,]
airquality[1:6,][completos,]


x <- 1:4; y <- 6:9
x+y
x>2
x>=2
y==8
x*y
x/y

x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x
y
x*y
x/y
x%*%y     # Multiplicacion de matrices    x % * % Y    #


########### Estructuras de control #############################

x <- c("a","b","c","d")
for (i in 1:4){print(x[i])}

for (i in seq_along(x)) {
  print(x[i])
}

for (letra in x) {
  print(letra)
}

for (i in 1:4) print(x[i])



# Los ciclos for pueden ser anidados
x <- matrix(1:6,2,3)
x

for (i in 1:nrow(x)) {
  for (j in 1:ncol(x) ) {
    print(x[i,j])
  }
}

for (i in seq_len(nrow(x))){
    for(j in seq_len(ncol(x))){
      print(x[i,j])
    }
}


############ clase 12/09/1  ###########  

# Ciclo While
z <- 5
while (z >= 3 && z <= 10) { print(z)
  moneda <- rbinom(1,1,0.5)
  if (moneda == 1){#caminata Aleatoria
    z <- z + 1
  } else {
      z <- z - 1
    }
}

# Ejercicio Clase

z <- 5
caminata <- vector("numeric")
while (z >= 3 && z <= 10) { print(z)
  moneda <- rbinom(1,1,0.5)
  caminata <- c(caminata,z)
  if (moneda == 1){#caminata Aleatoria
    z <- z + 0.5
  } else {
    z <- z - 0.5
  }
}
caminata
plot(caminata,type ="l")


################## Ciclo Repeat   19/09/16  #############################

# La instruccion repeat inicia un ciclo infinito que no parara hasta que se llame un break

# ¡NO CORRER! #
x0 <- 
  tol <- 1e-8
repeat {
  x1 <- CalculaEstimado(x0)
  if (abs(x1-x0) < tol){
      break
  } else{
    x0 <- x1
  }
}

# Creación de funciones
## Estoy creando una funcion llamada suma2
suma2 <- function(x,y){
    x + y
}

mayor10 <- function(x){
    x[x>10]
}

mayor10(runif(100,5,15))

mayorque <- function(x,n){
  x[x>n]
}

promedioCol <- function(x,quitar.NA = TRUE){
    nc <- ncol(x)
    medias <- vector("numeric",nc)
    for (i in 1:nc) {
      medias[i] <- mean(x[,i],na.rm = quitar.NA)
    }
    medias
}

promedioCol(as.matrix(c(1,2,3,NA)))


# Evaluacion perezosa
f <- function(a,b){
  a^2
}

f(2)

f <- function(a,b){
  print(a)
  print(b)
}


myplot <- funtion(x,y,type="l", ...){
    plot(x,y,type=type, ...)
}


###### Clase 26/09/2016    Despues del Caso 1 ############
lm
lm <- function(x){x*x}
lm
rm(lm)
lm
#¿Como saber si es lm (regresion lineal) o lm (la funcion que acabamos de inventar)
# Para saber donde va a buscar la funcion se usa la funcion search que nos da el orden de 
# busqueda de R

search()

# subir de lugar el paquete stats

library(ggplot2)
search()


# Ambito Lexicologico
f <- function (x,y){
  x^2 + y/z  
}

hacer.potencia <- function(n){
  potencia <- function(x){
    x^n
  }
  potencia
}

## cubica y cuadrada guardan una funcion que al darle despues un valor a cubica o cuadrada
## te da el valor elevado a la potencia que se habia escrito
cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)
cubica(3)
cuadrada(3)

ls(environment(cubica))
get("n",environment(cubica))
ls(environment(cuadrada))
get("n",environment(cuadrada))

y <- 10
f <- function(x) {
    y <-2
    y^2 +g(x)
}

g <- function(x){
    x*y
}

#Dates and Times
x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))

date()

############ Clase 28/09/2016   ############## Lapply,Sapply,apply, etc

# Se aplica en una lista y te lo muestra como una lista, lapply aplica una misma
# funcion a todos los elementos de una lista y nos da como resultado una lista 
# con los resultados que queremos obtener
lapply()

x <- list(a=1:5,b= rnorm(10000))
lapply(x, mean)

x <- list(a=1:5,b= rnorm(10000),c=rnorm(10,1),d=rnorm(10,2))
lapply(x, mean)

x<- 1:4
lapply(x,runif,min=5,max=15)


# Sapply , intentara mejorar lapply (solo si es posible), ya que el resultado
# lo devolvera como un vector o una matriz si es posible, en caso contrario 
# nos dará el mismo resultado que lapply
x <- list(a=1:5,b= rnorm(10000))
sapply(x, mean)

x <- list(a=1:5,b= rnorm(10000),c=rnorm(10,1),d=rnorm(10,2))
sapply(x, mean)

x<- 1:4
sapply(x,runif,min=5,max=15)

# apply, similar a las funciones lapply y sapply pero requiere mas argumentos

apply

x <- matrix(rnorm(200),20,10)
apply(x,2,mean)

x <- matrix (rnorm(200),20,10)
apply(x,1,quantile,probs=c(0.25,0.75))

a <- array(rnorm(2*2*10),c(2,2,10))
apply(a,c(1,2),mean)
rowMeans(a,dims=2)

# mapply, un ejemplo donde pude ocuparse es para verificar un promedio con y sin 
# valores faltantes
# mapply sirve para aplicar de manera vectorizada los argumentos de una funcion

list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
# la lista de arriba y el mapply de abajo hacen lo mismo
mapply(rep,1:4,4:1)

noise <- function(n,mean,sd){
     rnorm(n,mean,sd)
}

noise(5,1,2)
noise(1:5,1:5,2)

mapply (noise,1:5,1:5,2)


# tapply (para aplicar a tablas)

x <- c(rnorm(10),runif(10),rnorm(10,1))
f<- gl(3,10)
f
tapply(x,f,mean)


#################   Clase 29/09/2016    split   #################

str(split)

x <- c(rnorm(10),runif(10),rexp(10))
f <- gl(3,10)
f
split(x,f)

lapply(split(x,f),mean)

library(datasets)
head(airquality)

head(airquality)


### Ejercicio agrupar datos por mes de airquality

x <- airquality
f <- x[,5]
split(x,f)

g <- airquality[,5]
split(airquality,g)


# Correcto
s <- split(airquality,airquality$Month)
lapply(s, function(x) colMeans(x[,1:3]))

sapply(s, function(x) colMeans(x[,1:4],na.rm=T))


# interpretar lo siguiente
x <- rnorm(10)
f1 <- gl(2,5)
f1
f2 <- gl(5,2)
f2
interaction(f1,f2)
x
str(split(x,list(f1,f2)))

####### Clase 03/10/2016 ###### Busqueda de errores

install.packages("swirl")
library("swirl")
swirl()






##########  Clase 05/10/2016  ###############

str(str)
str(lm)
str(ls)
x <- rnorm (100)
str(x)
summary(x)

# Crear una lista de factores
 f <- gl(40,10)
 f
summary(f)

str(airquality)

y <- matrix(rnorm(100),10,10)
y
str(y)

s <- split(airquality, airquality$Month)
s



###### Generar numeros aleatorios  #########

# d -- densidad
# r -- generar variable aleatoria
# p -- para la distribucion acumulativa
# q -- para el cuantil de una funcion

x <- rnorm (10)
y <- rnorm(10,50,5)
summary(x)
summary(y)


# la semilla (seed) es para generar los mismos numeros aleatorios (porque la
# base es la semilla)
set.seed(1)
rnorm(5)
set.seed(2)
rnorm(5)
set.seed(1)
rnorm(5)

normal1 <- rnorm(10000)
normal2 <- rnorm(10000,10,5)
# la funcion hist grafica un histograma de frecuencias
hist(normal1)
# si no tuvuera la funcion hist para ver de donde a donde van los datos puedo usar
summary(normal1)

hist(normal2)
summary(normal2)

# distribucion llamada Poisson
rpois(10,1)
poisson1 <- rpois(10000,1)
poisson2 <- rpois(10000,10)
hist(poisson1)
hist(poisson2)

ppois(2,2)
ppois(4,2)
hist(rpois(10000,2))


x <- 1:8
sapply(ppois(x,2))

frec <- vector("numeric")
resta <-0
a <-0
for(i in 0:13){
     resta <- a
     a <- ppois(i,2)
     bla <- (a-resta)
     frec <- c(frec,bla)
}
frec

for (i in 0:13) { print(dpois(i,2))}

# genera numeros aleatorios para una distribucion uniforme
hist(runif(10000,10,20))

set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- (0.5+ 2*x + e)
plot(x,y)


z <- 0.5 +2*x
plot(x,z)
plot(z,y)


set.seed(10)
x <- rbinom(100,1,0.5)
e <- rnorm(100,0,2)
y <- 0.5 +2*x +e
summary(y)
plot(x,y,main="Modelo Lineal",col="dark red")


set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <-rpois(100,exp(log.mu))
summary(y)
plot(x,y,main = "Modelo Poisson",col="forestgreen")



######## Clase 10/10/16 ########## MUESTREO #######
#¿Como llevarlo a cabo? Tomar al azar dentro de un grupo de valores
set.seed(1)
sample(1:10,4)
sample(letters,5)
sample(1:10,replace= TRUE)


# Crear una funcion
hilbert <- function(n){
     i <- 1:n
     1/outer(i-1,i,"+")
}

x <- hilbert(1000)
system.time(svd(x))



traceback(lm())



























