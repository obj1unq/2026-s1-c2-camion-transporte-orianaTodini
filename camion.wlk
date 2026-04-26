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
// PESO Y EXCESO DE PESO
	method pesoTotalDelCamion (){
		if (self.pesoActualDeCamion() < 2500){ 
		return self.pesoActualDeCamion()
		} else 
		self.error("el peso del camion esta excedido")
	}
	method pesoActualDeCamion() {
	  return cosas.sum({cosa => cosa.peso()}) + tara
	}

    method cargaDelCamion() {
	  return cosas
	}
// PESO PAR 
	method contieneElPeso() {
	  return cosas.all({cosa => cosa.peso() % 2 == 0})
	}
// EL DE NIVEL 
	method cargaConNivelDePeligrosidad(nivel) {
	  return cosas.find({cosa => cosa.nivelDePeligrosidad() == nivel })
	}
}
// COSAS PELIGROSAS 
   