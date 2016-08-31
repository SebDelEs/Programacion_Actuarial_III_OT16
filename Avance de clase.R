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
data