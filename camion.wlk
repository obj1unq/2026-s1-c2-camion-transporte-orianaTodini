import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
		
	method cargar(unaCosa) {
		if (!cosas.contains(unaCosa)){ // saber si la cosa ya esta cargada
		cosas.add(unaCosa)
		} 

	}
	method descargar(unaCosa) {
  if (cosas.contains(unaCosa)) {
    cosas.remove(unaCosa)
  } 
	}
	method carga() {
	  return cosas
	}
// PESO Y EXCESO DE PESO
	method pesoActualDeCamion() {
	  return cosas.sum({cosa => cosa.peso()}) + tara <= 2500
	}
// PESO PAR 
	method contieneElPeso() {
	  return cosas.all({cosa => cosa.peso() % 2 == 0})
	}
// EL DE NIVEL 
	method cargaConNivelDePeligrosidad(nivel) {
	  return cosas.find({cosa => cosa.nivelDePeligrosidad() == nivel })
	}
// COSAS PELIGROSAS 
   method cosasPeligrosasCargadas(nivel){
	return cosas.filter({cosa => cosa.nivelDePeligrosidad() > nivel })
   }
   method cosaMasPeligrosaQue(cosaPeligrosa) {
	 return self.cosasPeligrosasCargadas(cosaPeligrosa.nivelDePeligrosidad())
   }

// PUEDE CIRCULAR EN RUTA 
 method puedeCircularEnRuta(nivel){
	return self.pesoActualDeCamion() and self.cosasPeligrosasCargadas(nivel).isEmpty()
 }
// PESO ENTRE DOS VALORES 
method tieneAlgoEntreLosValores(minimo,maximo){
   return cosas.any({cosa => cosa.peso() >= minimo and cosa.peso() <= maximo})
}
// COSA MAS PESADA
method cosaMasPesada() {
  if (cosas.isEmpty()){  
    self.error ("no se puede calcular lo mas pesado") // es lo que pide(?)
} else {
	return cosas.max({cosa => cosa.peso()})
}
}
// PESOS DE CARGA DE CAMION 
method pesoDeTodasLasCosas() {
 return cosas.map({cosa => cosa.peso()}) // ES CORRECTO(?)
}
// TOTAL BULTOS 

}