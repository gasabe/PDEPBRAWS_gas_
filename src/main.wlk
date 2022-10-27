class Personaje{
	var property cantidadDeCopas
	
	method ganarCopas(copasEnJuego){
		cantidadDeCopas+=copasEnJuego
	}
	method perderCopas(copasEnJuego){
		if(copasEnJuego>=cantidadDeCopas){cantidadDeCopas= 0} else {cantidadDeCopas-=copasEnJuego}
	}
}


class Arquero inherits Personaje{
	const property rango
	const property agilidad 
	
	method destreza(){
		return agilidad*rango
	}
	
	method estrategia()	= return rango >100
	
}

class Guerrero inherits Personaje{
	const property estrategia
	const property fuerza
	
	method destreza()= fuerza*1.5 //fuerza +la mitad de fuerza

}

class Ballestero inherits Arquero{
	override method destreza(){
		return super()*2	// trae el contenido de destreza y lo duplica	
	}
	
}

class Mision   {
	method copasEnJuego()
	
	method validoCopas() {
		if (self.cumploRequisitos()){
			throw new Exception(message="Mision no puede comenzar")
		}
	}
	method cumploRequisitos() 
}
class MisionIndividual inherits Mision  {
	const property dificultad
	const property personaje
	
	//copas en juego = 2*dificultad
	//se supera si : el personaje tiene estrategia o si su destreza es mayor a la de la dificultad
	
	override method copasEnJuego()=  dificultad *2
	 
	 method iniciarMision(){
	 	self.validoCopas()
	 	if(self.puedeSerSuperada()){
	 		return personaje.ganarCopas(self.copasEnJuego())
	 	}
	 	else{
	 		return personaje.perderCopas(  self.copasEnJuego()  )
	 	}
	 }
	 
	 method puedeSerSuperada()= self.tieneEstrategia() or self.destrezaMayorQueDificultad()
	 
	 method tieneEstrategia()= personaje.estrategia()
	 
	 method destrezaMayorQueDificultad()= personaje.destreza() > dificultad
	
	override method cumploRequisitos() =  personaje.cantidadDeCopas()<10

	
	 
}

class MisionEnEquipo inherits Mision {
	const property personajes 
	
	
	override method copasEnJuego()= 50 / (self.cantidadDePersonajes())
	
	method cantidadDePersonajes() = personajes.size()
	
	method laMitadDePersonajes()= (self.cantidadDePersonajes())/2
	
	method iniciarMision(){	
		self.validoCopas()
		if( self.puedeSerSuperada() ){ 
			return personajes.forEach({pj=>pj.ganarCopas(self.copasEnJuego())	})
		}
		else{
			return personajes.forEach({pj=>pj.perderCopas(self.copasEnJuego())	})
		}
	}
	
	method puedeSerSuperada() =  self.masDeLaMitadConEstrategia() or  not self.DestrezaMenorQue400()//en vez de preguntar si mi destreza es mayor a 400 pregunto la negacion si almenos hay 1
	
	method masDeLaMitadConEstrategia(){
		return (self.personajesConEstrategia()).size() > self.laMitadDePersonajes()
	}
	
	method personajesConEstrategia()= personajes.filter({pj=>pj.estrategia()})
	
	method DestrezaMenorQue400()= personajes.any({pj=>pj.destreza()<400})
	
	override method cumploRequisitos() =  self.cantidadTotalDeCopas()<60
	
	method cantidadTotalDeCopas()=personajes.sum({pj=>pj.cantidadDeCopas()})
	
}


class MisionIndividualBoost inherits MisionIndividual{
	const property multiplicador
	override method copasEnJuego(){
		return super() * multiplicador
	}
}
class MisionIndividualBonus inherits MisionIndividual{
	override method copasEnJuego(){
		return super()+1 
	
	}
}
class MisionEnEquipoBoost inherits MisionEnEquipo{
	const property multiplicador
	override method copasEnJuego(){
		return super() * multiplicador
	}
}
class MisionEnEquipoBonus inherits MisionEnEquipo{
	override method copasEnJuego(){
	return super() + personajes.size()
	}

}


