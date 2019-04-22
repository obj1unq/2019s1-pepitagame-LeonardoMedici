import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	method image() = "pepita.png"
	
	method pepitaEstaGorda(){
		if( energia > 100 ){
			game.removeVisual("pepita.png")
			game.addVisual("pepita-gorda-raw")
		}
		else { game.addVisual("pepita.png") }
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		if (ciudad == unaCiudad){
			game.say(self, "Ya estoy en!")
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
}
