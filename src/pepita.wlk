import ciudades.*
import wollok.game.*

object pepita {

	var property energia = 150
	var property ciudad = buenosAires
	var amiga
	var property position = game.at(3, 3)

	method image() = if (energia > 100) {
		"pepita-gorda-raw.png"
	} else {
		"pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energia()
	}

	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad) {
			game.say(self, "Ya estoy en!")
		} else {
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

	method nuevaAmiga(ave) {
		game.say(self, "Hola" + ave.nombre() + "!")
		amiga = ave
	}

	method collideWith(comida){
		self.come(comida)
		game.removeVisual(comida)
	}
	method saludar(){
		game.say(self, "Hola Roque!")
		game.say(roque, "Hola Pepita!")
	}

}

object pepona {

	method image() = "pepona.png"

	method position() = game.at(2, 2)

    method saludar(){}
}

object pipa {

	method image() = "pepitaCanchera.png"

	method position() = game.at(2, 4)

	method saludar(){}
}

object roque {

	var property mochila = null
	var property position = game.at(2, 7)

	method image() = "jugador.png"

	method move(nuevaPosicion) {
		position.distance(nuevaPosicion)
		self.position(nuevaPosicion)
	}

	method levantarComida(nuevaComida) {
		var x = 0.randomUpTo(10).truncate(0)
		var y = 0.randomUpTo(10).truncate(0)
		var posicionRandom = game.at(x, y)
		if (mochila == null) {
			mochila = nuevaComida
			game.removeVisual(mochila)
		} else { 
			game.addVisualIn(mochila, posicionRandom)
		}
	}
	method dejaComida(comida){
		game.addVisualIn(comida, position)
	}
	method collideWith(algo){
		
	}
	method saludar(){

	}

}



