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

