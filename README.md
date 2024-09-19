# Casa de Pepe y Julián (Con colecciones)

Pepe y Julián viven juntos, y nos pidieron que les ayudemos con un sistema para administrar los gastos de la casa.

> **Aclaración**: Para este enunciado se pide tanto la implementación de los objetos que resuelven los requerimientos planteados, como los tests descriptos en los _casos de prueba_ como mínimo (si quieren hacer más tests también son bienvenidos).



## Sobre las cosas que se compran

De cada cosa nos interesa el precio y su categoría, que puede ser electrodoméstico, comida o mueble (pero podría haber otras).

En este modelo reducido, vamos a considerar las siguientes cosas que podrían ser interesantes para comprar: 
- una heladera que vale 20000 pesos y es un electrodoméstico 
- una cama que sale 8000 y es un mueble
- una tira de asado que sale 350 pesos y es comida
- un paquete de fideos que sale 50 pesos y es comida
- una plancha que vale 1200 pesos y es un electrodoméstico

Implementar, además de los objetos que representan cada cosa, un objeto que represente a la casa, que entienda los siguientes mensajes:
- `comprar(cosa)`: registra que se ha comprado una cosa.
- `cantidadDeCosasCompradas()`: indica ... eso.
- `tieneAlgun(categoria)`: indica si compró algo que es corresponde a esa categoría alguna vez.
- `vieneDeComprar(categoria)`: indica si la _última_ cosa que se compró es de la categoría indicada.
- `esDerrochona()`: indica si el importe total de las cosas compradas es de 9000 pesos o más.
- `compraMasCara()`: retorna la cosa comprada de mayor valor.
- `comprados(categoría)`: devuelve un objeto que contiene todas las cosas compradas que de esa categoría. 
- `malaEpoca()`: indica si todas las cosas compradas son comida.
- `queFaltaComprar(lista)`: recibe una lista de cosas y devuelve las cosas de esa lista que aún no se han comprado. <br>
  **Atención**: es una pregunta. No se pide que se compren. 
- `faltaComida()`: indica si se han comprado menos de 2 cosas que son comida.
-  `categoriasCompradas()`: indica todas las categorías para las cuales se ha realizado al menos una compra

### Ejemplo

Hacer que se compre una heladera, una cama y una placha.
verificar que:
- la lista de las cosas compradas es heladera, cama y plancha
- cantidad de cosas compradas es 3
- tiene algún electrodoméstico
- tiene algún mueble
- no tiene alguna comida
- Si le preguntan si viene de comprar un electrodoméstico dice que sí, pero si le preguntan si viene de comprar un mueble dice que no
- Es derrochona (ya que gastó 29200)
- los electrodomésticos compramos son la heladera y la plancha
- los muebles comprados son: la cama y nada más
- no hay comida comprada
- no es una mala época
- si le preguntamos que falta comprar de una tira de asado, una plancha y un paquete de fideos debe contestar que falta la tira de asado y el paquete de fideos.
- falta comida
- las categorías compradas son electrodoméstico y mueble

## Cuentas bancarias
Pepe y Julián poseen varios tipos de cuentas bancarias, de las cuales pueden conocer su saldo y extraer y depositar dinero:

1. Una **cuenta corriente**, al depositar suma el saldo, al extraer resta.
2. Una **cuenta con gastos**, también mantiene un saldo y, además, un costo por operación. Al depositar suma el importe indicado menos el costo por operación. Al extraer resta el saldo normalmente.
    > **Caso de Prueba**: para una cuenta vacía con 20 pesos de costo por operación, si se deposita 1000 pesos, el saldo queda en 980 pesos.
3. Una **cuenta combinada** que tiene dos cuentas, una _primaria_ y una _secundaria_. Si se deposita, el importe pasa a la primaria. Cuando se extrae es así: si la cuenta primaria tiene saldo suficiente se extrae de esa, y si no de la secundaria (vale suponer que la secundaria siempre tiene saldo). El saldo de la combinada es la suma del saldo de las dos.
    > **Caso de Prueba**: suponiendo que configuramos la cuenta combinada así: la primaria es la cuenta con gastos con 50 pesos de costo de operación y la secundaria es la cuenta corriente, ya con 500 pesos de saldo. Luego,
    > - Se _depositan_ 100 pesos en la cuenta combinada (van a la cuenta con gastos, porque es la primaria, depositándose 50 pesos efectivos). 
    > - Si se _extraen_ 200 pesos (salen de la cuenta corriente, ya que a la primaria no le alcanza, dejándola en 300 pesos).
    > - _Verificar_ que el saldo de la cuenta con gastos queda en 50 pesos, la cuenta corriente con 300 pesos y la combindada con 350 pesos.

Ellos asignan una de esas cuentas para gestionar los gastos de la casa. Cada vez que se preduce un gasto en la casa, se extrae de la cuenta asignada el importe correspondiente.

#### Se pide que al comprar una cosa  eso se vea afectado en la cuenta elegida previamente.
 Ejemplo: Si la casa tiene configurada una cuenta corriente con saldo 1000, se compra una tira de asado implica  y un paquete de fideos, entonces la cuenta corriente queda con saldo 600.
 
### Segunda etapa:
Modificar la **cuenta corriente** para que el saldo nunca pueda ser negativo, si el valor que se desea extraer mayor al disponible, entonces la extracción no se puede realizar, es decir, si tengo $500, y necesito extraer $600, entonces la extracción no se puede realizar.

## Tests 
1. Realizar un test para verficar que si tengo $1000 y quiero sacar $900, lo puedo hacer.
1. Realizar un test con un saldo de $1000 e intentar sacar $1200.
1. Testear que si tengo $1000 de saldo, puedo comprar un tira de asado, tengo una cosa en la lista de cosas compradas y al saldo se le restó el precio de la tira de asado.
1. Testear que si tengo $1000 de saldo, no puedo comprar una plancha, por lo tanto la lista de cosas compradas queda vacío, y el el saldo no se modificó.








