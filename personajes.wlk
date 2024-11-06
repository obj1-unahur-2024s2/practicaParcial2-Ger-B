// Personajes
class Personaje{
  // const inteligencia para que asignar inteligencia a personaje si solo los humanos lo son...
  const property fuerza
  var property rol

  method potencialOfencivo() = fuerza * 10 + rol.extraQueOfrece() 
  method esGroso() = self.esInteligente() || rol.cumpleExigencia(self) 
  method esInteligente()
}

class Orco inherits Personaje(){
  override method potencialOfencivo() = super() + super()*0.1
  override method esInteligente() = false
}

class Humano inherits Personaje{
  const inteligencia
  override method esInteligente() = inteligencia > 50 
}

class Mascota{
  const property fuerza
  const property edad
  const property tieneGarras
}
object guerrero {
  method extraQueOfrece() = 100 
  method cumpleExigencia(unPersonaje) = unPersonaje.fuerza() > 50 
}
class Cazador { 
  //Es una classe porque necesito varios cazadores segun la mascota que tenga cada personaje con el rol cazador
  const mascota = null 
  method extraQueOfrece() = if(mascota.tieneGarras()) mascota.fuerza() * 2 else mascota.fuerza() 
  method cumpleExigencia(unPersonaje) = mascota.edad() > 10 

}
object brujo {
  method extraQueOfrece() = 0
  method cumpleExigencia(unPersonaje) = true 
}

// Localidades(aca hago agua, ve la solucion hecha en clase)

class Localidad{
  var ejercitoDefensor  // un ejercito
  method potencialTotal() = ejercitoDefensor.potencialTotal()

  method esAtacada(unEjercito) {
    if(unEjercito.potencialTotal() > self.potencialTotal())
      ejercitoDefensor = unEjercito
  }

}

class Ejercito{
  const tropas // una coleccion

  method potencialTotal() = tropas.sum({ocupantes => ocupantes.potencialOfencivo()}) 
}

class Aldea inherits Localidad{
  
}

// era un ejercito.sortBy({a, b => a.potencialOfencivo() > b.potencialOfencivo()}).take(10)
// ".take(n)" devuelve al menos 10. Si no hay 10, devuelve los que haya.

