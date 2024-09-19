import cosas.*
import cuenta.*


object casa {
	const cosas = [] //lista -> tienen que tener el mismo orden
	var property cuenta = cuentaCorriente

	method comprar(cosa) {
		cuenta.extraer(cosa.precio())
	  	cosas.add(cosa)
	}

	method cosasCompradas() {
	  return cosas.asSet() //para comparar los eementos no importa el orden entonces es mejor pasarlo a set
	}

	method cantidadDeCosasCompradas() {
	  return cosas.size()
	}

	method tieneAlgun(categoria) {
	  return cosas.any({cosa => cosa.categoria() == categoria})
	}

	method vieneDeComprar(categoria) {
	  return not cosas.isEmpty() and self.ultimaCompra().categoria() == categoria 
	}

	method ultimaCompra() {
	  return cosas.last()
	}

	method esDerrochona() {
	  return self.totalDeCompras() >= 9000
	}

	method totalDeCompras() {
	  return cosas.sum({cosa => cosa.precio()})
	}

	method compraMasCara() {
	  return cosas.max({cosa => cosa.precio()})
	}
	
	method comprados(categoria) {
		//filtro es cuando se tiene una colleccion y se quiere quedar con un subconjutno de esa coleccion
	  return cosas.filter( {cosa => cosa.categoria() == categoria}).asSet() //porque no importa el orden
	}

	method malaEpoca() {
	  //return cosas.all({cosa => cosa.categoria() == comida})
	  	//pero no es bueno comparar objetos (la categoría es un objeto)
	  return cosas.all({cosa => cosa.categoria().esComestible()})

	}

	method queFaltaComprar(lista) {
		//devuelve una nueva lista con las cosas que no fueron compradas de la lista dada 
				//deja pasar solo las cosas NO comparadas
	  return lista.filter({ cosa => not self.fueComprada(cosa)  })
	}

	method fueComprada(cosa) {
		//cosa comprada -> esta en la lista de cosas compradas
	  return cosas.contains(cosa)
	}

	method faltaComida() {
	  return self.cantidadDeComida() < 2
	} 

	method cantidadDeComida() {
		//cuenta solo las cosas que son comida
	  return cosas.count({cosa => cosa.categoria().esComestible()})
	}

	method categoriasCompradas() {
	  return cosas.map({cosa => cosa.categoria()}).asSet()
	} //con map -> el map siempre devuelve lista -> no repetidos, entonces podes ver todas las categorías compradas
}