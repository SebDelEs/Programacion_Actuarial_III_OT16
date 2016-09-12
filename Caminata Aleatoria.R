Abajo <- 0
Arriba <- 0
for(i in 1:100){
  z <- 5
while (z >= 3 && z <= 10) {
  
  moneda <- rbinom(1,1,0.5)
  
  if (moneda == 1){#caminata Aleatoria
    z <- z + 0.5
  } else {
    z <- z - 0.5
  }
  
  if (z==2.5){
    Abajo <- Abajo + 1
  } else { if( z==10.5){
    Arriba <- Arriba + 1
  }
  }
}
}

Arriba
Abajo
