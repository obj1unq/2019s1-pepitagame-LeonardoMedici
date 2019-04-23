import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var amiga
	var property position = game.at(3,3)
	
	method image() = if( energia > 100 ){ "pepita-gorda-raw" } else { "pepita.png" }
	
	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad){
			game.say(self, "Ya estoy en!")
		}
		else{
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		 }
	}
	
	method volaA(unaComida) {
			self.move(unaComida.position())		
	}
	

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}	
	
	method nuevaAmiga(ave){
		game.say(self, "Hola" + ave.nombre()+ "!")
		amiga = ave
	}
}

object pepona {
	method image() = "pepona.png"
	method position() = game.at(2,2)
}

object pipa {
	method image() = "pepitaCanchera.png"
	method position() = game.at(2,4)
}

object roque {
	var property comida = "nada" 
	var property position = game.at(2,7)
	
	method image() = "roque.png"                   
    method move(nuevaPosicion) { position.distance(nuevaPosicion)
		                         self.position(nuevaPosicion)
	}	
	method levantarComida(nuevaComida) { self.comida = nuevaComida }
	
}	
