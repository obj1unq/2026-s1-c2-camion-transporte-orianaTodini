import cosas.*
import camion.* 

object almacen {
  const inventario = #{knightRider,residuosRadiactivos} 
  method guardarCosas(cosas) {
    inventario.addAll(cosas)
  }
  method inventario() {
   return inventario  
  }
}

object ruta9  {
  method permiteViaje(camion) {
    return camion.puedeCircularEnRuta(20)
}
}

object caminosVecinales {
 var pesoMaximo= 0 
 method permiteViaje(camion) {
   return camion.pesoActualDeCamion() <= pesoMaximo
 } 
 method pesoPermitido(_pesoPermitido) {
   pesoMaximo = _pesoPermitido
 }
}