import Foundation

public class Guia {
    private var codigoIdentificacionGuia: Int
    private var cantidadDePaginas: Int
    private var costoGuia: Double
    private var tituloGuia: String
    
    public init(codigoGuia: Int, paginas: Int, costo: Double, titulo: String) {
        self.codigoIdentificacionGuia = codigoGuia
        self.cantidadDePaginas = paginas
        self.costoGuia = costo
        self.tituloGuia = titulo
    }


    public func getCodigoGuia() -> Int{
    return codigoIdentificacionGuia
    }
    public func getTituloGuia() -> String{
    return tituloGuia
    }

}
