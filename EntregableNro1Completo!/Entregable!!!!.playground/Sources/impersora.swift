import Foundation


public class Impresora {

private var todasLasGuias: [Int: Guia] = [:]

  public init(){

  }

  public func imprimirGuia(codigoGuia: Int) {
   if let laGuiaQueBuscaba = todasLasGuias[codigoGuia] {
    print("se imprimio la guia llamada: \(laGuiaQueBuscaba.getTituloGuia())")
   } else {
    print("La guia con el codigo \(codigoGuia) NO existe")
    }
  }
 
  public func agregarAlDicionario(codigoGuia: Int, guia: Guia ) {
    todasLasGuias[codigoGuia] = guia
  }
  public func quitarDelDiccionario(codigoGuia: Int) {
    todasLasGuias.removeValue(forKey: codigoGuia)
  }

}