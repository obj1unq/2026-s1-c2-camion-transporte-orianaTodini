import camion.* 
object knightRider {
	method peso() {
		return 500 
	}
	method nivelPeligrosidad() { 
		return 10 
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
  method nivelPeligrosidad() {
	return 1 
  }
}

object bumblebee {
	var formaActual= auto
  method peso() {
	return 800
  }
  method nivelDePeligrosidad() {
	return formaActual.nivelDePeligrosidad()
  }
  method formaActual(_formaActual) {
	formaActual= _formaActual
  }
}
object auto {
  method nivelDePeligrosidad() {
	return 15
  }
}

object robot {
  method nivelDePeligrosidad() {
	return 30
  }
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 0
  method peso(){
	return cantidadDeLadrillos * 2
  }
  method nivelDePeligrosidad() {
	return 2 
  }
  method cantidad(_cantidadDeLadrillos) {
	cantidadDeLadrillos = _cantidadDeLadrillos
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
}