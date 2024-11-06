class Personaje{
  const inteligencia
  const fuerza
  var rol

  method cambioDeRol(unRol) {
    rol = unRol
  }
  method potencialOfencivo() = fuerza * 10 + rol.extraQueOfrece() 
  method esGroso() = self.esInteligente() || rol.cumpleExigencia(self) 
  method esInteligente()
}

class Mascota{
  const property fuerza
  const property edad
  const property tieneGarras
}

class Orco inherits Personaje(){
  override method potencialOfencivo() = super() + super()*0.1
  override method esInteligente() = false
}

class Humanos inherits Personaje{
  override method esInteligente() = inteligencia > 50 
}
object guerrero {
  method extraQueOfrece() = 100 
  method cumpleExigencia(unPersonaje) = unPersonaje.fuerza() > 50 
}
object cazador {
  var mascota = null 
  method extraQueOfrece() = if(mascota.tieneGarras()) mascota.fuerza() * 2 else mascota.fuerza() 
  method cumpleExigencia(unPersonaje) = mascota.edad() > 10 

}
object brujo {
  method extraQueOfrece() = 0
  method cumpleExigencia(unPersonaje) = true 
  
}