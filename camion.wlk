import cosas.*
import almacenYCaminos.* 
object camion {
	const property cosas = #{}
	const tara = 1000

	method cargar(cosa) {
  if (cosas.contains(cosa)) {
    self.error("la cosa ya está cargada")
  } else {
    cosas.add(cosa)
  }
}

method descargar(cosa) {
  if (!cosas.contains(cosa)) {
    self.error("la cosa no está en el camión")
  } else {
    cosas.remove(cosa)
  }
}
	method carga() {
	  return cosas
	}
// PESO Y EXCESO DE PESO
	method pesoActualDeCamion() {
	  return cosas.sum({cosa => cosa.peso()}) + tara 
	}
	method excedePesoMaximo(){
		return self.pesoActualDeCamion() > 2500
	}
// PESO PAR 
	method todosLosPesosSonPares() {
	  return cosas.all({cosa => cosa.peso() % 2 == 0})
	}
// EL DE NIVEL 
	method cosaConNivelDePeligrosidad(nivel) {
	  return cosas.find({cosa => cosa.nivelDePeligrosidad() == nivel })
	}
// COSAS PELIGROSAS 
   method cosasPeligrosasCargadasQueSuperanElNivel(nivel){
	return cosas.filter({cosa => cosa.nivelDePeligrosidad() > nivel })
   }
   method cosaCargadaMasPeligrosaQue(cosaPeligrosa) {
	 return  self.cosasPeligrosasCargadasQueSuperanElNivel(cosaPeligrosa.nivelDePeligrosidad())
   }

// PUEDE CIRCULAR EN RUTA 
 method puedeCircularEnRuta(nivel){
	return !self.excedePesoMaximo() and self.cosasPeligrosasCargadasQueSuperanElNivel(nivel).isEmpty()
 }
// PESO ENTRE DOS VALORES 
method tieneAlgoEntreLosValores(minimo,maximo){
   return cosas.any({cosa => cosa.peso() >= minimo and cosa.peso() <= maximo})
}
// COSA MAS PESADA
method cosaMasPesada() {
  if (cosas.isEmpty()){  
    self.error ("no se puede calcular la cosa mas pesada") // es lo que pide(?)
} else {
	return cosas.max({cosa => cosa.peso()})
}
}
// PESO DE LAS COSAS QUE TIENE EL CAMION 
method pesoDeTodasLasCosasCargadas() {
 return cosas.map({cosa => cosa.peso()}) 
}
// TOTAL BULTOS 
method cantidadTotalDeBultos(){
	return cosas.sum({cosa => cosa.cantidadDeBultos()})
}
// ACCIDENTE 
method accidente() {
  cosas.forEach({cosa => cosa.efectoDelAccidente()})
}
// TRANSPORTE 
method transportar(destino,camino) {
	self.validarViaje(camino)
	self.descargarEn(destino)
}


method descargarEn(destino){
		destino.guardarCosas(cosas)
        cosas.clear()
}
method validarViaje(camino) {
  if (!camino.permiteViaje(self)) {
    self.error("no se puede circular por ese camino")
  }
}
}
