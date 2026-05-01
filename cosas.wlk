import camion.* 
import almacenYCaminos.*


object knightRider {
	method peso() {
		return 500 
	}
	method nivelDePeligrosidad() { 
		return 10 
	}
  method cantidadDeBultos() {
    return 1
  }
  method efectoDelAccidente() {
    // no hace nada 
  }
}

object arenaAGranel {
	var peso = 0
  method peso() {
	return peso
  }
  method pesoNuevo(_peso) {
	peso= _peso
  }
  method nivelDePeligrosidad() {
	return 1 
  }
  method cantidadDeBultos() {
    return 1
  }
  method efectoDelAccidente() {
    peso=  peso + 20
  }
}

object bumblebee {
	var formaActual= auto
  method peso() {
	return 800
  }
  method forma() {
    return formaActual
  }
  method nivelDePeligrosidad() {
	return formaActual.nivelDePeligrosidad()
  }
  method formaActual(_formaActual) {
	formaActual= _formaActual
  }
  method cantidadDeBultos() {
    return 2
  }
 method efectoDelAccidente() {
  formaActual= formaActual.tranformarse()
  }
  }

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 0
  method peso(){
	return cantidadDeLadrillos * 2
  }
  method cantidadLadrillos() {
    return cantidadDeLadrillos
  }
  method nivelDePeligrosidad() {
	return 2 
  }
  method cantidad(_cantidadDeLadrillos) {
	cantidadDeLadrillos = _cantidadDeLadrillos
  }
  method cantidadDeBultos() {
  if (cantidadDeLadrillos <= 100) {
    return 1
  } else if (cantidadDeLadrillos <= 300) {
    return 2
  } else {
    return 3
  }
}
  method efectoDelAccidente() {
    if(cantidadDeLadrillos > 12){
      cantidadDeLadrillos= cantidadDeLadrillos - 12
    } else {
      cantidadDeLadrillos= 0
    }
  }
  }

object bateriaAntiaerea {
  var tieneMisiles = false

  method peso() {
    if (self.tieneMisiles()) {
      return 300
    } else {
      return 200
    }
  }

  method tieneMisiles() {
    return tieneMisiles
  }

  method cargarConMisiles() {
    tieneMisiles = true
  }

  method nivelDePeligrosidad() {
    if (self.tieneMisiles()) {
      return 100
    } else {
      return 0
    }
  }
  method cantidadDeBultos() {
    if(!tieneMisiles){
      return 1
    } else {
      return 2 
    }
  }
  method efectoDelAccidente(){
    tieneMisiles= false 
    }
  } 


object residuosRadiactivos {
	var peso = 0
  method peso() {
	return peso
  }
  method pesoNuevo(_peso) {
	peso= _peso
  }
  method nivelDePeligrosidad() {
	return 200
  }
  method cantidadDeBultos() {
    return 1
  }
  method efectoDelAccidente(){
    peso = peso + 15 
  }
}

object auto {
  method nivelDePeligrosidad() {
	return 15
  }
   method tranformarse() {
    return robot 
  }
}

object robot {
  method nivelDePeligrosidad() {
	return 30
  }
  method tranformarse() {
    return auto 
  }
}
// MAS COSAS 
object contenedorPortuario {
  const cosas = #{}
  method carga() {
    return cosas 
  }
  method cargar(unaCosa) {
    cosas.add(unaCosa)
  } 
  method peso(){
    return 100 + cosas.sum({cosa => cosa.peso()})

  }
  method nivelDePeligrosidad() {
    if(!cosas.isEmpty()){ 
    return cosas.map({cosa => cosa.nivelDePeligrosidad()}).max()
  } else 
   return 0
  }
  method cantidadDeBultos(){
    return 1 + cosas.sum({cosa => cosa.cantidadDeBultos()}) 
  }
  method efectoDelAccidente() {
    cosas.forEach({cosa => cosa.efectoDelAccidente()})
  }
}

object embalajeDeSeguridad {
  const cosas = #{}
   method carga() {
    return cosas 
  }

  method cargar(unaCosa) {
    cosas.add(unaCosa)
  }
  method peso() {
    return cosas.sum({cosa => cosa.peso()})
  }   
  method nivelDePeligrosidad() {
    return cosas.map({cosa => cosa.nivelDePeligrosidad()}).max() / 2
  }
  method cantidadDeBultos() {
    return 2 + cosas.sum({cosa => cosa.cantidadDeBultos()})
  }
  method efectoDelAccidente() {
    // no hace nada 
  }
}
