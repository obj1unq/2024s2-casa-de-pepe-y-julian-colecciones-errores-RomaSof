object cuentaCorriente {

    var property saldo = 0

    method depositar(plata) {
      saldo = saldo + plata
    }

    method extraer(plata) {
      self.validarExtraccion(plata)
      saldo = saldo - plata
    }

    method validarExtraccion(plata) {
      if (saldo < plata ){ 
        self.error("el saldo" + saldo + "es insuficiente para el monto" + plata)
        //self.error("el saldo es insuficiente")
      }
    }
}

object cuentaConGastos {

    var property saldo = 0
    var property costoOperacion = 0

    method depositar(plata) {
      saldo = saldo  + plata - costoOperacion
    } 

    method extraer(plata) {
      saldo = saldo - plata
    }
}

object cuentaCombinada {

    var property principal = cuentaConGastos
    var property secundaria = cuentaCorriente

    method depositar(plata) {
      principal.depositar(plata)
    }

    method extraer(plata) {
      const cuenta = if (principal.saldo() >= plata ) principal else secundaria 
      cuenta.extraer(plata)
    }

    //El saldo de la combinada es la suma del saldo de las dos.
    method saldo() {
      return principal.saldo() + secundaria.saldo()
    }
}
