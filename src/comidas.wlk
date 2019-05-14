import wollok.game.*

class Manzana {
	
	method image() = "manzana.png"
	
	method energia() = 80
	
	method position() = game.at(5,1)
	
	method collideAve(ave){
		ave.come(self)
		game.removeVisual(self)
	}
		method saludar(){}
}

object manzana {
	method image() = "manzana.png"
	
	method energia() = 80
	
	method position() = game.at(5,1)
	
	//method collideWith(persona){
	//	persona.LevantarComida(self)
	//}
	method collideAve(ave){
		ave.come(self)
		game.removeVisual(self)
	}
		method saludar(){}
}

object alpiste {
	method image() = "alpiste.png"
	
	method energia() = 5
	
	method position() = game.at(5,5)
	
	//method collideWith(persona){
	//	persona.LevantarComida(self)
	//}
	method collideAve(ave){
		ave.come(self)
		game.removeVisual(self)
	}
	method saludar(){}
}
