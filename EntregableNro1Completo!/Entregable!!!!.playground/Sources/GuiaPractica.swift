import Foundation

public class GuiaPractica: Guia {
    private var cantidadDeEjercicios: Int
    
    public init(codigoGuia: Int, paginas: Int, costo: Double, titulo: String, nroEjercicios: Int) {
        self.cantidadDeEjercicios = nroEjercicios
        super.init(codigoGuia: codigoGuia, paginas: paginas, costo: costo, titulo: titulo)
    }
    
    
}
